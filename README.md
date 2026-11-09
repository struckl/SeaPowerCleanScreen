# Sea Power: R.A.T.S. Clean Screen

A tiny mod for [Sea Power: Naval Combat in the Missile Age](https://store.steampowered.com/app/1286220/) that keeps the game's own
**version label** ("Sea Power v0.8.7-261107", shown on the Steam beta branch) off the screen. The game draws it above everything,
so it lay over the title bars of every window - the map's buttons, pop-out windows, any mod's windows.

- One setting, `Hide version label` (on by default), in `BepInEx\config\dev.sewerlabs.seapowercleanscreen.cfg`. Off = the game's label stays.
- It does nothing else.
- On the Steam Workshop: https://steamcommunity.com/sharedfiles/filedetails/?id=3836386468
- Loaded by [R.A.T.S. Keel](https://steamcommunity.com/sharedfiles/filedetails/?id=3835527459). Manual install: put `SeaPowerCleanScreen.dll` and `_info.ini` into
  `<Sea Power>\Sea Power_Data\StreamingAssets\SeaPowerCleanScreen\`.

How it works: once a second it looks up the game's `VersionWatermark` object and switches it off if it is on.

## Build

`powershell -File tools\package.ps1 [-Install]` (set `AnchorChainDir` to a folder with `AnchorChain.dll` when the game folder has none).

MIT licence. *R.A.T.S. - Ratte's Assorted Tactical Systems*
