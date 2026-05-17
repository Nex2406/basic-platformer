# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Godot 4.4 2D platformer (Forward Plus renderer set, mobile rendering method). Engine version is pinned in `project.godot` (`config/features=PackedStringArray("4.4", "Forward Plus")`); opening with an older editor will silently rewrite resources.

Main scene is `main.tscn` (referenced by UID `uid://hv4f7okct38a` in `project.godot`, not by path).

## Running

There is no CLI build system — work happens through the Godot editor.

- Open project: launch Godot 4.4+ and "Import" the folder (or open `project.godot`).
- Run the game: F5 in the editor (runs `main.tscn`).
- Run current scene: F6.
- Export builds: Project → Export (no presets are checked in).

Headless run, if Godot is on PATH: `godot --path . --main-scene res://main.tscn`.

## Architecture

Three scenes total — the structure is shallow on purpose:

- `main.tscn` — root scene. Holds a `TileMapLayer` built from `Terrain (16x16).png` (tile atlas with per-tile physics polygons defined inline in the .tscn), one instance of the player, and instances of the collectable. Tile collision is configured per-cell in the `TileSetAtlasSource` block at the top of the file; edits there should be done via the editor's TileSet panel rather than by hand.
- `scenes/main_character.tscn` + `main_character.gd` — `CharacterBody2D` with an `AnimatedSprite2D` (`default`/`running`/`jumping` animations sourced from `Idle/Run/Jump (32x32).png`) and a `RectangleShape2D` collider. The script drives movement, gravity, jump, and animation selection in `_physics_process`.
- `scenes/collectable.tscn` — `Area2D` (cherry sprite). Currently has no script; pickup behavior is not yet wired up.

### Physics / movement gotchas

`project.godot` sets `physics/2d/default_gravity = 100.0`, but `main_character.gd` ignores it and applies its own `GRAVITY = 980.0` constant in `_physics_process`. If gravity feels wrong, change the constant in the script — the project setting only affects nodes that read `ProjectSettings` (e.g. `RigidBody2D`), not this hand-rolled integration.

Input uses the built-in `ui_left` / `ui_right` / `ui_accept` actions — no custom InputMap is defined, so rebinding requires either adding a custom action in Project Settings or switching the script to one.

## Assets

PNGs at the repo root are the source textures; each has a sibling `.png.import` that Godot generates — do not edit `.import` files by hand and do not delete them without also removing the references from the `.tscn` files (the scenes link textures by the UID stored in the `.import`, not by path).

## Ignored / generated

`.godot/` is the editor's cache (already gitignored) and will be regenerated on first open. If scenes fail to load with missing UID errors, deleting `.godot/` and reopening the project usually fixes it.
