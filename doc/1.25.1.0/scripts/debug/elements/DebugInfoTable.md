# debug/elements/DebugInfoTable.lua

*[Version française](../../../fr/scripts/debug/elements/DebugInfoTable.md)*

Source: `dataS/scripts/debug/elements/DebugInfoTable.lua` — FS25 1.25.1.0

✍ DebugInfoTable renders a titled name/value information table as 3D text in the world, facing the camera by default. Derived from DebugElement but only this static function is present here.

- **DebugInfoTable** inherits from `DebugElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugInfoTable.renderAtPosition(x: number, y: number, z: number, information: array, rx: number?, ry: number?, rz: number?, size: number?, color: table?)` | 46 | ✍ Renders groups of rows ({title, content={{name, value, color?, sizeFactor?}}}) as 3D text stacked upward from a world position, last group first, with right-aligned names, 4-decimal numbers and bold centred titles. Without rotation it faces the camera via `DebugUtil.getYRotatationToCamera` (not in this dump). |
