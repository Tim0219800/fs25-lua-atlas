---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableBeehive.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for a beehive. It reads the action radius and daily honey production from the XML, registers itself with `g_currentMission.beehiveSystem`, plays optional effects and an idle sound while the system reports its FX as active, and produces honey that the system hands to a pallet spawner. It also counts owned beehives for an achievement when bought.
---@class PlaceableBeehive
PlaceableBeehive = {}

--- Always returns true: this specialization has no prerequisite specializations.
---@param specializations table
---@return boolean
function PlaceableBeehive.prerequisitesPresent(specializations) end

--- Registers the placeable functions `getBeehiveInfluenceFactor`, `updateBeehiveState` and `getHoneyAmountToSpawn`.
---@param placeableType any
function PlaceableBeehive.registerFunctions(placeableType) end

--- Overrides the placeable `updateInfo` function to add beehive lines to the info HUD.
---@param placeableType any
function PlaceableBeehive.registerOverwrittenFunctions(placeableType) end

--- Subscribes to the `onLoad`, `onDelete`, `onFinalizePlacement` and `onBuy` events.
---@param placeableType any
function PlaceableBeehive.registerEventListeners(placeableType) end

--- Declares the XML keys `beehive#actionRadius` and `beehive#litersHoneyPerDay`, plus the effect and `idle` sound sample paths under `beehive`.
---@param schema any
---@param basePath any
function PlaceableBeehive.registerXMLPaths(schema, basePath) end

--- Reads the action radius (default 25) and honey per day (default 10, stored per hour), caches the squared radius and world position, and prepares info HUD entries. On clients it also loads the effects and the idle sound.
---@param savegame table
function PlaceableBeehive:onLoad(savegame) end

--- Deletes the effects and sound samples and removes this beehive from `beehiveSystem`.
function PlaceableBeehive:onDelete() end

--- Records the current day time as the last honey spawn time, adds the beehive to `beehiveSystem` and refreshes its state.
function PlaceableBeehive:onFinalizePlacement() end

--- Returns a factor between 0 and 1 for a world position (wx, wz): 0 outside the action radius, otherwise a value falling off with the squared distance (at the edge it stays about 0.15).
---@param wx any
---@param wz any
function PlaceableBeehive:getBeehiveInfluenceFactor(wx, wz) end

--- Copies the production flag from `beehiveSystem` and, when the FX flag changes, starts or stops the effects and idle sound on clients.
function PlaceableBeehive:updateBeehiveState() end

--- Returns the liters of honey produced since the last call (elapsed hours capped at 1, scaled by `environment.timeAdjustment`) and resets the timer; returns 0 if production is inactive.
function PlaceableBeehive:getHoneyAmountToSpawn() end

--- Adds the range line to the info HUD and, for the local farm owner, shows either a warning that no pallet location exists or a note that honey appears at the pallet location.
---@param superFunc any
---@param infoTable any
function PlaceableBeehive:updateInfo(superFunc, infoTable) end

--- Counts the beehives owned by the local farm and reports the number to the achievement manager (`NumBeehives`). Note: it compares against the local farm id, named `serverFarmId` in the code.
function PlaceableBeehive:onBuy() end
