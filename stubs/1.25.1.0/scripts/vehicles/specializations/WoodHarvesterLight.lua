---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WoodHarvesterLight.lua (generated stub, FS25 Lua Atlas)

--- Returns true only if the vehicle type has both TurnOnVehicle and AutomaticArmControlHarvester.
---@param specializations table
---@return boolean
function WoodHarvesterLight.prerequisitesPresent(specializations) end

--- Adds the `woodHarvesterLight` configuration type and registers XML paths: cut node, cut and grab animations, log spawner settings, cut effects and sound.
function WoodHarvesterLight.initSpecialization() end

--- Registers `updateLogSpawner`, `onWoodHarversterLogSpawnerCallback`, `spawnLogHeap` and `spawnTreeStump` on the vehicle type.
---@param vehicleType any
function WoodHarvesterLight.registerFunctions(vehicleType) end

--- Overrides `getSupportsAutoTreeAlignment`, `getAutoAlignHasValidTree` and `getAreControlledActionsAllowed`.
---@param vehicleType any
function WoodHarvesterLight.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onUpdate, onTurnedOn and onTurnedOff.
---@param vehicleType any
function WoodHarvesterLight.registerEventListeners(vehicleType) end

--- Reads cut node, animations and log spawner settings; the log model is fixed to `data/maps/trees/logs/pineLog.i3d` (size 0.4 x 5, volume 0.66). Loads effects and sound on clients. Removes update and turn on/off listeners if no cut node exists.
---@param savegame any
function WoodHarvesterLight:onLoad(savegame) end

--- Client: deletes the cut effects and sound samples.
function WoodHarvesterLight:onDelete() end

--- While on, finds a non-stump tree in the cut node and, unless arm alignment is running, plays the cut animation; at half progress it deletes the tree, spawns the log heap and stump (if volume is nonzero), updates cut-count stats, achievements and hints, and replays controlled actions when available. Always feeds the log spawner with the current alignment target. Note: there is no server check in the cut branch (UNVERIFIED whether the vehicle update only runs where expected).
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function WoodHarvesterLight:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Plays the grab animation forward.
function WoodHarvesterLight:onTurnedOn() end

--- Plays the grab animation backward and, on clients, stops effects and sounds.
function WoodHarvesterLight:onTurnedOff() end

--- Always returns true.
---@param superFunc any
function WoodHarvesterLight:getSupportsAutoTreeAlignment(superFunc) end

--- Returns two booleans: whether a tree is currently in the cut node, and whether the radius fits the configured maximum.
---@param superFunc any
---@param radius any
function WoodHarvesterLight:getAutoAlignHasValidTree(superFunc, radius) end

--- When starting the action sequence, returns false with a warning if the tree is invalid (no access, wrong type, too thick), out of range, or no free spawn box exists. Turning off is always allowed; otherwise defers to the parent.
---@param superFunc any
---@return boolean
---@return string
function WoodHarvesterLight:getAreControlledActionsAllowed(superFunc) end

--- Each call, resolves the previous async overlap test and searches for a free box next to the tree (sides, then behind, widening in steps of 2 up to `maxSpawnWidth`). Starts the next `overlapBoxAsync` test and keeps the last valid box and its heading.
---@param tx any
---@param ty any
---@param tz any
---@param radius any
function WoodHarvesterLight:updateLogSpawner(tx, ty, tz, radius) end

--- Overlap callback: any hit that is not a terrain transform group marks the tested box as blocked and advances to the next candidate. Always clears the pending flag.
---@param nodeId any
function WoodHarvesterLight:onWoodHarversterLogSpawnerCallback(nodeId, ...) end

--- If a valid box exists, spawns logs for a tree: count is tree volume divided by the log volume (at least 1), owned by the vehicle's farm. `splitTypeIndex` is not used.
---@param splitTypeIndex any
---@param treeVolume any
function WoodHarvesterLight:spawnLogHeap(splitTypeIndex, treeVolume) end

--- Computes positions for a stack of logs in a box (a base row on the terrain plus a top row nested between them) and creates a `ForestryLog` per position from the given file with the given farm as owner.
---@param filename any
---@param numTrees any
---@param bx any
---@param by any
---@param bz any
---@param bry any
---@param lDiameter any
---@param lLength any
---@param farmId any
function WoodHarvesterLight.spawnLogs(filename, numTrees, bx, by, bz, bry, lDiameter, lLength, farmId) end

--- Plants a `pineStump` tree at the given position through `g_treePlantManager` if that tree type exists.
---@param x any
---@param y any
---@param z any
function WoodHarvesterLight:spawnTreeStump(x, y, z) end
