# objects/Rotator.lua

*[Version française](../../fr/scripts/objects/Rotator.md)*

Source: `dataS/scripts/objects/Rotator.lua` — FS25 1.25.1.0

✍ Updateable attached to an i3D node (through the onCreate user-attribute) that spins the node continuously around one axis. It reads the user attributes rpm or speed (rad/ms) and axis from the node and rotates it every frame by speed times dt, so the rotation is frame-rate independent.

- **Rotator** (l.9)

## Functions

| Function | Line | Description |
|---|---|---|
| `Rotator:onCreate(id: integer)` | 14 | ✍ i3D onCreate hook: creates a Rotator for the node and adds it to the mission's updateables. |
| `Rotator.new(node: integer) → table` | 22 | ✍ Reads the 'rpm' user attribute (converted to rad/ms) or else 'speed' (default 0.0012 rad/ms) and the 'axis' attribute (default 3), which selects the rotated axis. Note: if the attribute is read as a string, indexing the axis table with it is UNVERIFIED. |
| `Rotator:update(dt: number)` | 46 | ✍ Rotates the node by speed times dt around the configured axis each frame. |
