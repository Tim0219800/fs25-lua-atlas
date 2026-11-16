# player/PlayerCCT.lua

*[Version française](../../fr/scripts/player/PlayerCCT.md)*

Source: `dataS/scripts/player/PlayerCCT.lua` — FS25 1.25.1.0

✍ Thin wrapper around the engine character controller (CCT) capsule of a player, covering creation, removal, movement, position and grounded checks, with debug output. It stores capsule size, slope and step limits and collision groups/masks; `rootNode`, `getSkinWidth`, `getBottomOffsetY`, `setMass` and similar accessors are not defined in this file (UNVERIFIED where they come from). Used by Player as `capsuleController`.

- **PlayerCCT** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerCCT.new() → PlayerCCT` | 45 | ✍ Creates the CCT wrapper with default radius 0.35, slope limit 60, step offset 0.4, mass 0 and the default collision groups and masks. No engine capsule exists until `rebuild` is called. |
| `PlayerCCT:delete()` | 116 | ✍ Removes the engine CCT with `removeCCT` if one exists and clears its id. |
| `PlayerCCT:rebuild()` | 226 | ✍ Removes any existing capsule and creates a new one with `createCCT` on the root node using the stored size, limits, groups and mass. The current height becomes the desired height. |
| `PlayerCCT:move(movementX: number, movementY: number, movementZ: number)` | 247 | ✍ Moves the capsule by a displacement in metres per axis with `moveCCT`, using the movement collision group and mask. |
| `PlayerCCT:getPosition() → number, number, number` | 271 | ✍ Returns the world position of the player's feet: root node x and z, with y shifted by the bottom offset. |
| `PlayerCCT:setPosition(x: number, y: number, z: number, setNodeTranslation: boolean?)` | 282 | ✍ Sets the capsule position from a foot position with `setCCTPosition`; if the last argument is true, the root node is also moved to the matching position. |
| `PlayerCCT:calculateIfBottomTouchesGround() → boolean` | 294 | ✍ Returns the third value of `getCCTCollisionFlags`, i.e. whether the capsule bottom touches the ground. |
| `PlayerCCT:debugDraw(x: number, y: number, textSize: number) → number` | 331 | ✍ Draws debug text lines for the capsule height, the physics height and the desired height, and returns the next y screen position. |
