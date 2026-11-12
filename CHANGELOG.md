# Changelog

## Unreleased

- The mod folder carries this CHANGELOG.md, so R.A.T.S. Keel's What's new can show what changed when there are no Workshop notes (a local copy, the GitHub zip).

## 0.2.2 – 2026-11-12 – in-game name R.A.T.S. Clean Screen

Run in the game on 0.9.1 (build 261112) on 2026-11-12: the new name shows in Keel's list, the mod works in Red Sea Breakout.

- **Shows as just "R.A.T.S. Clean Screen" in the game.** The game's mod list and the mod loader's list (Keel or Anchor Chain) now both say R.A.T.S. Clean Screen, without "Sea Power".

## 0.2.1 - 2026-11-11 - declared for game 0.9.0

- **Declared for game 0.9.0.** The mod's `_info.ini` now says it fits 0.8.7 up to every 0.9.x, so the game no longer lists it as "not declared to be compatible", and Steam hands this and later updates to 0.9.0 players (the game skips Workshop updates whose declaration does not fit its version). Checked offline against 0.9.0 (build 261111): the game still reads `[Debug] ShowVersionWatermark` from config.ini; not run in the game on 0.9.0 yet.

## 0.2.0 - 2026-11-09 - no code any more

The mod is now two ini files: `config_patch.ini` extends the game's `config.ini` with `[Debug] ShowVersionWatermark=False`, which the game reads
before it draws its version label. No DLL, no mod loader (Keel or Anchor Chain) needed, no config file of its own: switch the mod off in the Mod
Manager to get the label back. Run in the game on the globe beta (build 261107) on 2026-11-09: Red Sea Breakout shows no version label with the mod on. 0.8.7 not run.

## 0.1.0 - 2026-11-08

Run in the game on the globe beta (build 261107) on 2026-11-09: ticked in the Mod Manager, started under Keel, and a mission (Red Sea Breakout) shows no version label. The version text in the main menu's corner is the game's own and stays. 0.8.7 not run.

- First version: switches off the game's version label (setting `Hide version label`). Moved out of R.A.T.S. Pop-Out Windows, where it started as a setting.
