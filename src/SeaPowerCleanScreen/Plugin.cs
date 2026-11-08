using System;
using System.IO;
using AnchorChain;
using BepInEx;
using BepInEx.Configuration;
using BepInEx.Logging;
using SeaPower;
using UnityEngine;

namespace SeaPowerCleanScreen;

/// <summary>
/// Entry point (loaded by Keel or Anchor Chain). Keeps the game's own version label ("Sea Power v..." - shown on the Steam beta
/// branch) off the screen: it is drawn above every window, over their title bars. One DLL for both game versions.
/// </summary>
[ACPlugin(Guid, Name, Version)]
public class Plugin : IAnchorChainMod
{
    public const string Guid = "dev.sewerlabs.seapowercleanscreen";
    public const string Name = "Sea Power Clean Screen";
    public const string Version = "0.1.0";

    internal static ManualLogSource Log;
    internal static ConfigEntry<bool> HideVersionLabel;
    private const string LoadedMarker = Guid + ".loaded";

    public void TriggerEntryPoint()
    {
        if (AppDomain.CurrentDomain.GetData(LoadedMarker) != null) return;     // the same DLL found in two folders: start once
        AppDomain.CurrentDomain.SetData(LoadedMarker, true);
        try
        {
            Log = BepInEx.Logging.Logger.CreateLogSource("SeaPowerCleanScreen");
            var file = new ConfigFile(Path.Combine(Paths.ConfigPath, Guid + ".cfg"), saveOnInit: true);
            HideVersionLabel = file.Bind("1. General", "Hide version label", true,
                "On the Steam beta branch the game draws its version (\"Sea Power v...\") above everything, over the title bars of " +
                "windows. On = it is switched off. Off = the game's own label stays.");
            var host = new GameObject("SeaPowerCleanScreen");
            UnityEngine.Object.DontDestroyOnLoad(host);
            host.hideFlags = HideFlags.HideAndDontSave;
            host.AddComponent<Cleaner>();
            Log.LogInfo($"{Name} {Version} loaded.");
        }
        catch (Exception ex)
        {
            BepInEx.Logging.Logger.CreateLogSource("SeaPowerCleanScreen").LogError($"Startup failed, mod inactive: {ex}");
        }
    }
}

/// <summary>Once a second: switches the game's version label off if it is on (the game builds it when a view loads).</summary>
internal sealed class Cleaner : MonoBehaviour
{
    private float next;

    private void Update()
    {
        if (Time.unscaledTime < next) return;
        next = Time.unscaledTime + 1f;
        if (!Plugin.HideVersionLabel.Value) return;
        try
        {
            if (!Singleton<VersionWatermark>.InstanceExists()) return;
            GameObject label = Singleton<VersionWatermark>.Instance.gameObject;
            if (label.activeSelf) label.SetActive(false);
        }
        catch (Exception ex) { Plugin.Log.LogDebug("version label: " + ex.Message); }
    }
}
