---@meta
-- FS25 1.25.1.0 : placeables/BeehiveSystem.lua (generated stub, FS25 Lua Atlas)

--- Mission-level manager for beehive placeables: it keeps the beehives sorted by action radius, per-farm honey pallet spawners, and the global production and effect state (off in winter, at night or in rain). It computes the combined beehive influence at a world position (capped at 1, used for crop yield bonus), distributes honey to pallet spawners each hour on the server and warns the owner when no pallet spawner is available. Beehive methods such as `getHoneyAmountToSpawn` and `getBeehiveInfluenceFactor` live in the beehive placeable spec (not in this file, UNVERIFIED).
---@class BeehiveSystem
BeehiveSystem = {}

--- Constructor: stores the mission, initializes empty beehive and spawner lists, inactive states and counters, and on the server registers the `gsBeehiveDebug` console command if test commands are enabled. `COOLDOWN_DURATION` is not defined in this file (UNVERIFIED).
---@param mission any
---@param customMt any
function BeehiveSystem.new(mission, customMt) end

--- Removes the `gsBeehiveDebug` console command.
function BeehiveSystem:delete() end

--- Adds a beehive: on the first one updates the state and subscribes to hour and day/night changes, shows the no-spawner warning once the mission has started, and re-sorts the list by action radius, largest first, so influence loops can stop early.
---@param beehiveToAdd any
function BeehiveSystem:addBeehive(beehiveToAdd) end

--- Removes a beehive and, when the list becomes empty, unsubscribes from the hour and day/night messages.
---@param beehive any
function BeehiveSystem:removeBeehive(beehive) end

--- Hourly message handler: updates honey output then the beehive state.
function BeehiveSystem:onHourChanged() end

--- Server only, when spawners exist: after a cooldown counted in calls, updates one pallet spawner per call in round-robin order, then restarts the cooldown at the end of the list.
function BeehiveSystem:update() end

--- Server only: for each beehive (optionally filtered by farm) with a pallet spawner for its owner, adds the honey amount returned by `getHoneyAmountToSpawn` to that spawner's fill level.
---@param farmId integer?
function BeehiveSystem:updateBeehivesOutput(farmId) end

--- Recomputes the global flags: production is active outside winter, and effects are active only if production is active, the sun is on and it is not raining. Uses the mission environment (class not in the dump, UNVERIFIED).
function BeehiveSystem:updateState() end

--- Refreshes the global state and then calls `updateBeehiveState` on every beehive.
function BeehiveSystem:updateBeehivesState() end

--- Returns true if the farm owns at least one beehive.
---@param farmId any
function BeehiveSystem:getFarmHasBeehive(farmId) end

--- Returns the internal list of beehives sorted by radius (not a copy).
function BeehiveSystem:getBeehives() end

--- Returns the summed influence of all beehives at world position (x, z), regardless of farm, stopping early and capped at 1. Includes a debug-only text overlay.
---@param wx any
---@param wz any
function BeehiveSystem:getBeehiveInfluenceFactorAt(wx, wz) end

--- Registers a pallet spawner and immediately updates honey output for its owner farm.
---@param beehivePalletSpawner any
function BeehiveSystem:addBeehivePalletSpawner(beehivePalletSpawner) end

--- Unregisters a pallet spawner and shows the no-spawner warning for it.
---@param beehivePalletSpawner any
function BeehiveSystem:removeBeehivePalletSpawner(beehivePalletSpawner) end

--- Client side, at most every 5 seconds: if the local farm owns the placeable and has beehives but no pallet spawner, adds a critical in-game notification about a missing pallet location.
---@param placeable any
function BeehiveSystem:showNoSpawnerWarning(placeable) end

--- Returns the pallet spawner owned by the given farm, or nil.
---@param farmId any
function BeehiveSystem:getFarmBeehivePalletSpawner(farmId) end

--- Console command: toggles `BeehiveSystem.DEBUG_ENABLED` and returns its new value as text.
function BeehiveSystem:consoleCommandBeehiveDebug() end
