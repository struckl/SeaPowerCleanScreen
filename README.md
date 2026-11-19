# Sea Power: R.A.T.S. Clean Screen

Hides the game's own version label ("Sea Power v0.8.7-261107", drawn on the Steam beta branch). The label sits above every
window and covers their title bars: the map's buttons, pop-out windows, any mod's windows.

- Needs no mod loader and no code.
- Workshop: [R.A.T.S. Clean Screen](https://steamcommunity.com/sharedfiles/filedetails/?id=3836386468)
- Bugs, ideas, questions: [R.A.T.S. feedback board](https://hub.sewerlabs.dev/s/cleanscreen)

## What it does

- `config_patch.ini` extends the game's `config.ini` with `[Debug] ShowVersionWatermark=False`.
- The game reads that switch before it draws the label.
- It does nothing else.
- The version text in the main menu's corner is the game's own and stays.

## Install

- Workshop: subscribe, then switch the mod on in the game's Mod Manager.
- By hand: put the folder `SeaPowerCleanScreen` (with `_info.ini` and `config_patch.ini`) into
  `<Sea Power>\Sea Power_Data\StreamingAssets\` and switch it on in the Mod Manager.

## Settings

- There are none. To get the label back, switch the mod off in the Mod Manager.

## Compatibility

- `_info.ini` declares game 0.8.7 up to (not including) 0.10.0.
- Run in the game on the 3D-globe build: 0.9.1 (build 261112) under Keel, in Red Sea Breakout.
- 0.8.7 was not run.
- Nothing is loaded, so it does not depend on Keel or Anchor Chain.

## Feedback

- [R.A.T.S. feedback board](https://hub.sewerlabs.dev/s/cleanscreen)

## Building

- No build step. `powershell -File tools\package.ps1 [-Install]` stages `dist\SeaPowerCleanScreen`; `-Install` also copies it into the game folder.

## Layout

| Path | What |
|---|---|
| `mod/_info.ini` | The mod's name, description and game range |
| `mod/config_patch.ini` | The config patch |
| `tools/package.ps1` | Stages the package |
| `workshop/` | Workshop page text and pictures |

## Licenses and credits

- [R.A.T.S. Source License](LICENSE): read it, fork it, send fixes; no re-uploads, no reuse in other projects.

*R.A.T.S. - Ratte's Assorted Tactical Systems*
