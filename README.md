# Sea Power: R.A.T.S. Clean Screen

**Bugs, ideas, questions:** [R.A.T.S. feedback board](https://hub.sewerlabs.dev/s/cleanscreen)

> **Sea Power 0.9.1 (12 November 2026):** 0.2.2 shows as "R.A.T.S. Clean Screen" in the game and declares 0.8.7 up to every 0.9.x in its `_info.ini`. 0.2.1 was run in the game on 0.9.1 (build 261112) on 12 November 2026; checked offline against 0.9.1.

A tiny mod for [Sea Power: Naval Combat in the Missile Age](https://store.steampowered.com/app/1286220/) that keeps the game's own
**version label** ("Sea Power v0.8.7-261107", shown on the Steam beta branch) off the screen. The game draws it above everything,
so it lay over the title bars of every window - the map's buttons, pop-out windows, any mod's windows.

- No code: the mod is two ini files. `config_patch.ini` extends the game's own `config.ini` with `[Debug] ShowVersionWatermark=False`,
  the switch the game itself reads before it draws the label. Nothing is loaded, no mod loader is needed.
- To get the label back, switch the mod off in the game's Mod Manager (or set the value to `True`).
- It does nothing else.
- On the Steam Workshop: https://steamcommunity.com/sharedfiles/filedetails/?id=3836386468
- Manual install: put the folder `SeaPowerCleanScreen` (with `_info.ini` and `config_patch.ini`) into
  `<Sea Power>\Sea Power_Data\StreamingAssets\` and switch the mod on in the Mod Manager.

Version 0.1.0 was a plugin that switched the label off once a second; since 0.2.0 the game's own config patch does it.

## Package

`powershell -File tools\package.ps1 [-Install]` stages `dist\SeaPowerCleanScreen` (no build); `-Install` also puts it into the game folder.

MIT licence. *R.A.T.S. - Ratte's Assorted Tactical Systems*
