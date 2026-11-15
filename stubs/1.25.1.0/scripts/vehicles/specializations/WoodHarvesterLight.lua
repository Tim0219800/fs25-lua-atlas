---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WoodHarvesterLight.lua (stub généré, atlas Lua FS25)

---@param specializations table
---@return boolean
function WoodHarvesterLight.prerequisitesPresent(specializations) end

function WoodHarvesterLight.initSpecialization() end

---@param vehicleType any
function WoodHarvesterLight.registerFunctions(vehicleType) end

---@param vehicleType any
function WoodHarvesterLight.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function WoodHarvesterLight.registerEventListeners(vehicleType) end

---@param savegame any
function WoodHarvesterLight:onLoad(savegame) end

function WoodHarvesterLight:onDelete() end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function WoodHarvesterLight:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function WoodHarvesterLight:onTurnedOn() end

function WoodHarvesterLight:onTurnedOff() end

---@param superFunc any
function WoodHarvesterLight:getSupportsAutoTreeAlignment(superFunc) end

---@param superFunc any
---@param radius any
function WoodHarvesterLight:getAutoAlignHasValidTree(superFunc, radius) end

---@param superFunc any
---@return boolean
---@return string
function WoodHarvesterLight:getAreControlledActionsAllowed(superFunc) end

---@param tx any
---@param ty any
---@param tz any
---@param radius any
function WoodHarvesterLight:updateLogSpawner(tx, ty, tz, radius) end

---@param nodeId any
function WoodHarvesterLight:onWoodHarversterLogSpawnerCallback(nodeId, ...) end

---@param splitTypeIndex any
---@param treeVolume any
function WoodHarvesterLight:spawnLogHeap(splitTypeIndex, treeVolume) end

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

---@param x any
---@param y any
---@param z any
function WoodHarvesterLight:spawnTreeStump(x, y, z) end
