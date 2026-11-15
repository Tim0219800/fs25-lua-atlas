# player/PlayerTargeter.lua

Source: `dataS/scripts/player/PlayerTargeter.lua` — FS25 1.25.1.0

- **PlayerTargeter** (l.13)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlayerTargeter.new(player: Player) → PlayerTargeter` | 19 |  |
| `PlayerTargeter:getLastLookRay() → number, number, number, number, number, number` | 62 |  |
| `PlayerTargeter:getHasTargetedKey(targetKey: CollisionFlag) → boolean` | 70 |  |
| `PlayerTargeter:addTargetType(targetKey: any, targetMask: CollisionFlag, minDistance: number?, maxDistance: number)` | 80 |  |
| `PlayerTargeter:addFilterToTargetType(targetKey: any, filterFunction: function)` | 104 |  |
| `PlayerTargeter:removeTargetType(targetKey: any)` | 117 |  |
| `PlayerTargeter:recalculateCombinedTargetMask()` | 132 |  |
| `PlayerTargeter:getClosestTargetedNodeFromType(targetKey: any) → integer?` | 143 |  |
| `PlayerTargeter:update(dt: number)` | 151 |  |
| `PlayerTargeter:tryAddTargetWithMask(hitNode: integer, x: number, y: number, z: number, targetedMask: table, distance: number)` | 195 |  |
| `PlayerTargeter:debugDraw(x: number, y: number, textSize: number) → number` | 229 |  |
