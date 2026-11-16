# player/PlayerTargeter.lua

*[Version française](../../fr/scripts/player/PlayerTargeter.md)*

Source: `dataS/scripts/player/PlayerTargeter.lua` — FS25 1.25.1.0

✍ Client-side helper owned by the local player that casts a ray from the player's look direction and records the closest hit for each registered target type (a key, a collision mask and a distance range, with optional filter functions). Other player code asks it which node is targeted for a given key. Target tables are recycled through an `ObjectPool`.

- **PlayerTargeter** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerTargeter.new(player: Player) → PlayerTargeter` | 19 | ✍ Creates a targeter for the given player, with empty target tables, a target pool and no stored ray yet. |
| `PlayerTargeter:getLastLookRay() → number, number, number, number, number, number` | 62 | ✍ Returns the origin (x, y, z) and direction (x, y, z) of the last ray fired; values are nil before the first valid ray. |
| `PlayerTargeter:getHasTargetedKey(targetKey: CollisionFlag) → boolean` | 70 | ✍ Returns true if a target type is registered under this key. |
| `PlayerTargeter:addTargetType(targetKey: any, targetMask: CollisionFlag, minDistance: number?, maxDistance: number)` | 80 | ✍ Registers a target type with a key, collision mask and distance range. Ignored if the key already exists; raises the ray length to the largest max distance and rebuilds the combined mask. |
| `PlayerTargeter:addFilterToTargetType(targetKey: any, filterFunction: function)` | 104 | ✍ Adds a filter function called as `filter(hitNode, x, y, z)` to a target type; all filters must return true for a hit to be kept. The key must already exist. |
| `PlayerTargeter:removeTargetType(targetKey: any)` | 117 | ✍ Removes a target type, then rebuilds the combined mask and recomputes the highest max distance from the remaining types. |
| `PlayerTargeter:recalculateCombinedTargetMask()` | 132 | ✍ Rebuilds the combined collision mask by OR-ing the masks of all registered target types. |
| `PlayerTargeter:getClosestTargetedNodeFromType(targetKey: any) → integer?` | 143 | ✍ Returns the node of the closest hit found for this key, or nil if none. How and when that table is filled from the raycast results is not shown in this file (UNVERIFIED). |
| `PlayerTargeter:update(dt: number)` | 151 | ✍ Reads the player's look ray (does nothing if invalid), clears the state through `resetState` (not in this file, UNVERIFIED) and starts an asynchronous raycast with the combined mask. Hits come back to a `raycastCallback` method not shown in this file. |
| `PlayerTargeter:tryAddTargetWithMask(hitNode: integer, x: number, y: number, z: number, targetedMask: table, distance: number)` | 195 | ✍ Keeps a hit as the current target of a mask if it is inside the distance range, has the mask's collision group, is closer than the existing one and passes every filter. The hit data is stored in a pooled table. |
| `PlayerTargeter:debugDraw(x: number, y: number, textSize: number) → number` | 229 | ✍ Draws the targeter debug text: combined mask name and, for each registered mask, the name of its current target node. Returns the next y position. |
