---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Shovel.lua (generated stub, FS25 Lua Atlas)

---@class Shovel
Shovel = {}

---@param specializations any
function Shovel.prerequisitesPresent(specializations) end

function Shovel.initSpecialization() end

---@param vehicleType any
function Shovel.registerFunctions(vehicleType) end

---@param vehicleType any
function Shovel.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Shovel.registerEventListeners(vehicleType) end

---@param savegame any
function Shovel:onLoad(savegame) end

function Shovel:onDelete() end

---@param streamId any
---@param connection any
function Shovel:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function Shovel:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function Shovel:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function Shovel:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Shovel:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Shovel:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

---@param xmlFile any
---@param key any
---@param shovelNode any
function Shovel:loadShovelNode(xmlFile, key, shovelNode) end

---@param shovelNode any
function Shovel:getShovelNodeIsActive(shovelNode) end

---@param superFunc any
---@param dischargeNode any
function Shovel:getIsDischargeNodeActive(superFunc, dischargeNode) end

---@param superFunc any
---@param dischargeNode any
function Shovel:getDischargeNodeEmptyFactor(superFunc, dischargeNode) end

---@param superFunc any
---@param dischargeNode any
---@param dischargedLiters any
---@param minDropReached any
---@param hasMinDropFillLevel any
function Shovel:handleDischarge(superFunc, dischargeNode, dischargedLiters, minDropReached, hasMinDropFillLevel) end

---@param superFunc any
---@param dischargedLiters any
---@param minDropReached any
---@param hasMinDropFillLevel any
function Shovel:handleDischargeOnEmpty(superFunc, dischargedLiters, minDropReached, hasMinDropFillLevel) end

---@param superFunc any
---@param dischargeNode any
---@param hitObject any
---@param hitShape any
---@param hitDistance any
---@param hitFillUnitIndex any
---@param hitTerrain any
function Shovel:handleDischargeRaycast(superFunc, dischargeNode, hitObject, hitShape, hitDistance, hitFillUnitIndex, hitTerrain) end

---@param superFunc any
function Shovel:getCanToggleDischargeToObject(superFunc) end

---@param superFunc any
function Shovel:getCanToggleDischargeToGround(superFunc) end

function Shovel:getShovelTipFactor() end

---@return boolean
function Shovel:getIsShovelEffectState() end

---@param superFunc any
---@return number
function Shovel:getWearMultiplier(superFunc) end

---@param superFunc any
---@return boolean
function Shovel:doCheckSpeedLimit(superFunc) end

---@param shovelNode any
function Shovel:getCanShovelAtPosition(shovelNode) end

---@param values any
function Shovel:updateDebugValues(values) end
