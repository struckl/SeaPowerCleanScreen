# Changelog

## 0.2.0 - 2026-11-09 - no code any more

The mod is now two ini files: `config_patch.ini` extends the game's `config.ini` with `[Debug] ShowVersionWatermark=False`, which the game reads
before it draws its version label. No DLL, no mod loader (Keel or Anchor Chain) needed, no config file of its own: switch the mod off in the Mod
Manager to get the label back. Run in the game on the globe beta (build 261107) on 2026-11-09: Red Sea Breakout shows no version label with the mod on. 0.8.7 not run.

## 0.1.0 - 2026-11-08

Run in the game on the globe beta (build 261107) on 2026-11-09: ticked in the Mod Manager, started under Keel, and a mission (Red Sea Breakout) shows no version label. The version text in the main menu's corner is the game's own and stays. 0.8.7 not run.

- First version: switches off the game's version label (setting `Hide version label`). Moved out of R.A.T.S. Pop-Out Windows, where it started as a setting.
