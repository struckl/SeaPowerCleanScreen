# Sea Power: R.A.T.S. Clean Screen

Hides the game's own version label, which sits above every window and covers their title bars.

| | |
| --- | --- |
| Version | `0.2.2` (2026-11-12) |
| Game | Sea Power 0.9.1 (build 261112) run in the game, under Keel; 0.8.7 not run |
| Needs | nothing: no code, no mod loader |
| Get it | [Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3836386468) |
| Settings | none; switch the mod off in the Mod Manager to get the label back |
| Feedback | [R.A.T.S. feedback board](https://hub.sewerlabs.dev/s/cleanscreen) |
| Source | R.A.T.S. Source License, see `LICENSE` |

## Features

- Hides the label ("Sea Power v0.8.7-261107", drawn on the Steam beta branch) over the map's buttons, pop-out windows and any mod's windows.
- Two ini files, nothing loaded: `config_patch.ini` adds `[Debug] ShowVersionWatermark=False` to the game's `config.ini`.
- The version text in the main menu's corner is the game's own and stays.

## Install

1. Workshop: subscribe, then switch the mod on in the game's Mod Manager.
2. By hand: put the folder `SeaPowerCleanScreen` (with `_info.ini` and `config_patch.ini`) into `<Sea Power>\Sea Power_Data\StreamingAssets\` and switch it on in the Mod Manager.

## Building

- No build step; `_info.ini` declares game 0.8.7 up to (not including) 0.10.0.

```powershell
powershell -File tools\package.ps1 [-Install]
```

It stages `dist\SeaPowerCleanScreen`; `-Install` also copies it into the game folder.

| Path | What |
|---|---|
| `mod/_info.ini` | The mod's name, description and game range |
| `mod/config_patch.ini` | The config patch |
| `tools/package.ps1` | Stages the package |
| `workshop/` | Workshop page text and pictures |

## Credits and license

- [R.A.T.S. Source License](LICENSE): read it, fork it, send fixes; no re-uploads, no reuse in other projects.

*R.A.T.S. - Ratte's Assorted Tactical Systems*
