# player/networking/PlayerPositionalInterpolator.lua

*[Version française](../../../fr/scripts/player/networking/PlayerPositionalInterpolator.md)*

Source: `dataS/scripts/player/networking/PlayerPositionalInterpolator.lua` — FS25 1.25.1.0

✍ Smooths the player's position, yaw, speed and velocity between network or physics updates using time, position, angle and value interpolators. It can drive either the player's root node (mover) or only a graphical node whose interpolated position is queried by others. Some methods used here (such as startNetworkNewPhase and setTargetPhysicsIndex) are absent from the dump.

- **PlayerPositionalInterpolator** (l.22)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerPositionalInterpolator.new(player: Player, targetNodeType: integer) → PlayerPositionalInterpolator` | 38 | ✍ Creates the interpolator for a player and a target node type (root or graphical), initialised on the player's current position, yaw, speed and vertical velocity. Registers a listener on the mover's teleport event. |
| `PlayerPositionalInterpolator:update(dt: number)` | 85 | ✍ Per-frame step: advances the time interpolator with the unclamped physics delta, computes interpolated position, yaw, speed (output x1000) and velocity. In root-node mode it also pushes them into the player's mover. |
| `PlayerPositionalInterpolator:updateTick(dt: number)` | 131 | ✍ Per-tick step, graphical-node mode only: takes the mover position as new target (snapping to the old target when within 0.001), starts a new 75 ms phase and updates the target yaw. For non-owners it waits for the physics index to be simulated. |
| `PlayerPositionalInterpolator:setTargetPosition(targetPositionX: number, targetPositionY: number, targetPositionZ: number)` | 183 | ✍ Sets the position the interpolator moves toward. |
| `PlayerPositionalInterpolator:getInterpolatedPosition() → number, number, number` | 210 | ✍ Returns the last computed interpolated x, y, z position. |
| `PlayerPositionalInterpolator:setTargetYaw(targetYaw: number)` | 217 | ✍ Sets the target yaw, first clamped to a valid angle range with MathUtil.getValidLimit. |
