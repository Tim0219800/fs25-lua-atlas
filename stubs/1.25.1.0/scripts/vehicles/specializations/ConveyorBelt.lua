---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ConveyorBelt.lua (generated stub, FS25 Lua Atlas)

---@class ConveyorBelt
ConveyorBelt = {}

---@param specializations table
---@return boolean
function ConveyorBelt.prerequisitesPresent(specializations) end

function ConveyorBelt.initSpecialization() end

---@param vehicleType any
function ConveyorBelt.registerFunctions(vehicleType) end

---@param vehicleType any
function ConveyorBelt.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function ConveyorBelt.registerEventListeners(vehicleType) end

---@param savegame table
function ConveyorBelt:onLoad(savegame) end

---@param savegame any
function ConveyorBelt:onPostLoad(savegame) end

function ConveyorBelt:onDelete() end

---@param streamId integer
---@param timestamp integer
---@param connection table
function ConveyorBelt:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function ConveyorBelt:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function ConveyorBelt:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function ConveyorBelt:getConveyorBeltFillLevel() end

function ConveyorBelt:getConveyorBeltTargetObject() end

function ConveyorBelt:getLoadTriggerMaxFillSpeed() end

---@param superFunc any
---@param dischargeNode any
function ConveyorBelt:getDischargeNodeEmptyFactor(superFunc, dischargeNode) end

---@param superFunc any
---@param dischargeNode any
function ConveyorBelt:handleDischargeOnEmpty(superFunc, dischargeNode) end

---@param superFunc any
---@param dischargeNode any
---@param dischargedLiters any
---@param minDropReached any
---@param hasMinDropFillLevel any
function ConveyorBelt:handleDischarge(superFunc, dischargeNode, dischargedLiters, minDropReached, hasMinDropFillLevel) end

---@param superFunc any
function ConveyorBelt:getIsEnterable(superFunc) end

---@param rootVehicle any
---@param vehicle any
---@param fillUnitIndex any
function ConveyorBelt.getHasConveyorBeltLoop(rootVehicle, vehicle, fillUnitIndex) end

---@param superFunc any
---@param fillUnitIndex any
---@param fillType any
function ConveyorBelt:getFillUnitAllowsFillType(superFunc, fillUnitIndex, fillType) end

---@param superFunc any
---@param fillUnitIndex any
---@param fillTypeIndex any
---@param farmId any
function ConveyorBelt:getFillUnitFreeCapacity(superFunc, fillUnitIndex, fillTypeIndex, farmId) end

---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function ConveyorBelt:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

---@param movingTool any
---@param speed any
---@param dt any
function ConveyorBelt:onMovingToolChanged(movingTool, speed, dt) end

---@param values any
function ConveyorBelt:updateDebugValues(values) end
