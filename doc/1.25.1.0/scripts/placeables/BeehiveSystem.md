# placeables/BeehiveSystem.lua

*[Version française](../../fr/scripts/placeables/BeehiveSystem.md)*

Source: `dataS/scripts/placeables/BeehiveSystem.lua` — FS25 1.25.1.0

✍ Mission-level manager for beehive placeables: it keeps the beehives sorted by action radius, per-farm honey pallet spawners, and the global production and effect state (off in winter, at night or in rain). It computes the combined beehive influence at a world position (capped at 1, used for crop yield bonus), distributes honey to pallet spawners each hour on the server and warns the owner when no pallet spawner is available. Beehive methods such as `getHoneyAmountToSpawn` and `getBeehiveInfluenceFactor` live in the beehive placeable spec (not in this file, UNVERIFIED).

- **BeehiveSystem** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `BeehiveSystem.new(mission: any, customMt: any)` | 18 | ✍ Constructor: stores the mission, initializes empty beehive and spawner lists, inactive states and counters, and on the server registers the `gsBeehiveDebug` console command if test commands are enabled. `COOLDOWN_DURATION` is not defined in this file (UNVERIFIED). |
| `BeehiveSystem:delete()` | 45 | ✍ Removes the `gsBeehiveDebug` console command. |
| `BeehiveSystem:addBeehive(beehiveToAdd: any)` | 51 | ✍ Adds a beehive: on the first one updates the state and subscribes to hour and day/night changes, shows the no-spawner warning once the mission has started, and re-sorts the list by action radius, largest first, so influence loops can stop early. |
| `BeehiveSystem:removeBeehive(beehive: any)` | 71 | ✍ Removes a beehive and, when the list becomes empty, unsubscribes from the hour and day/night messages. |
| `BeehiveSystem:onHourChanged()` | 83 | ✍ Hourly message handler: updates honey output then the beehive state. |
| `BeehiveSystem:update()` | 90 | ✍ Server only, when spawners exist: after a cooldown counted in calls, updates one pallet spawner per call in round-robin order, then restarts the cooldown at the end of the list. |
| `BeehiveSystem:updateBeehivesOutput(farmId: integer?)` | 112 | ✍ Server only: for each beehive (optionally filtered by farm) with a pallet spawner for its owner, adds the honey amount returned by `getHoneyAmountToSpawn` to that spawner's fill level. |
| `BeehiveSystem:updateState()` | 132 | ✍ Recomputes the global flags: production is active outside winter, and effects are active only if production is active, the sun is on and it is not raining. Uses the mission environment (class not in the dump, UNVERIFIED). |
| `BeehiveSystem:updateBeehivesState()` | 144 | ✍ Refreshes the global state and then calls `updateBeehiveState` on every beehive. |
| `BeehiveSystem:getFarmHasBeehive(farmId: any)` | 154 | ✍ Returns true if the farm owns at least one beehive. |
| `BeehiveSystem:getBeehives()` | 166 | ✍ Returns the internal list of beehives sorted by radius (not a copy). |
| `BeehiveSystem:getBeehiveInfluenceFactorAt(wx: any, wz: any)` | 173 | ✍ Returns the summed influence of all beehives at world position (x, z), regardless of farm, stopping early and capped at 1. Includes a debug-only text overlay. |
| `BeehiveSystem:addBeehivePalletSpawner(beehivePalletSpawner: any)` | 194 | ✍ Registers a pallet spawner and immediately updates honey output for its owner farm. |
| `BeehiveSystem:removeBeehivePalletSpawner(beehivePalletSpawner: any)` | 202 | ✍ Unregisters a pallet spawner and shows the no-spawner warning for it. |
| `BeehiveSystem:showNoSpawnerWarning(placeable: any)` | 210 | ✍ Client side, at most every 5 seconds: if the local farm owns the placeable and has beehives but no pallet spawner, adds a critical in-game notification about a missing pallet location. |
| `BeehiveSystem:getFarmBeehivePalletSpawner(farmId: any)` | 224 | ✍ Returns the pallet spawner owned by the given farm, or nil. |
| `BeehiveSystem:consoleCommandBeehiveDebug()` | 235 | ✍ Console command: toggles `BeehiveSystem.DEBUG_ENABLED` and returns its new value as text. |

## Messages

- subscribes `MessageType.HOUR_CHANGED` (l.55)
- subscribes `MessageType.DAY_NIGHT_CHANGED` (l.56)
