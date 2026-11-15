---@meta
-- FS25 1.25.1.0 : vehicles/specializations/MixerWagon.lua (generated stub, FS25 Lua Atlas)

---@class MixerWagon
MixerWagon = {}

---@param specializations table
---@return boolean
function MixerWagon.prerequisitesPresent(specializations) end

function MixerWagon.initSpecialization() end

---@param vehicleType any
function MixerWagon.registerFunctions(vehicleType) end

---@param vehicleType any
function MixerWagon.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function MixerWagon.registerEventListeners(vehicleType) end

---@param savegame table
function MixerWagon:onLoad(savegame) end

---@param savegame table
function MixerWagon:onPostLoad(savegame) end

function MixerWagon:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function MixerWagon:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function MixerWagon:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function MixerWagon:onWriteStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function MixerWagon:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function MixerWagon:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function MixerWagon:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function MixerWagon:mixerWagonBaleTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

---@param bale any
function MixerWagon:onMixerWagonBaleDeleted(bale) end

---@param superFunc any
---@param farmId any
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
function MixerWagon:addFillUnitFillLevel(superFunc, farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData) end

---@param superFunc any
---@param fillUnitIndex any
---@param fillTypeIndex any
function MixerWagon:getFillUnitAllowsFillType(superFunc, fillUnitIndex, fillTypeIndex) end

---@param superFunc any
---@param dischargeNode any
function MixerWagon:getDischargeFillType(superFunc, dischargeNode) end

---@param superFunc any
---@param bale any
function MixerWagon:getIsBaleAutoLoadable(superFunc, bale) end

---@param superFunc any
---@return boolean
function MixerWagon:getDoConsumePtoPower(superFunc) end

---@param superFunc any
function MixerWagon:getConsumingLoad(superFunc) end

---@param superFunc any
function MixerWagon:getIsPowerTakeOffActive(superFunc) end

---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function MixerWagon:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

function MixerWagon:onTurnedOn() end

function MixerWagon:onTurnedOff() end

---@param values any
function MixerWagon:updateDebugValues(values) end
