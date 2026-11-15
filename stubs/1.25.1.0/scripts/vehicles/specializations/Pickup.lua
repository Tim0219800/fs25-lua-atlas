---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Pickup.lua (generated stub, FS25 Lua Atlas)

---@class Pickup
Pickup = {}

---@param specializations any
function Pickup.prerequisitesPresent(specializations) end

function Pickup.initSpecialization() end

---@param vehicleType any
function Pickup.registerFunctions(vehicleType) end

---@param vehicleType any
function Pickup.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Pickup.registerEventListeners(vehicleType) end

---@param savegame any
function Pickup:onLoad(savegame) end

---@param savegame any
function Pickup:onPostLoad(savegame) end

---@param streamId any
---@param connection any
function Pickup:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function Pickup:onWriteStream(streamId, connection) end

---@param doLowering any
---@param jointDescIndex any
function Pickup:onSetLoweredAll(doLowering, jointDescIndex) end

---@param rootVehicle table
function Pickup:onRootVehicleChanged(rootVehicle) end

---@param foldAnimTime number
function Pickup:onFoldTimeChanged(foldAnimTime) end

---@param direction any
function Pickup:actionControllerLowerPickupEvent(direction) end

---@param isPickupLowered any
---@param noEventSend any
function Pickup:setPickupState(isPickupLowered, noEventSend) end

function Pickup:allowPickingUp() end

---@param superFunc any
---@param default any
function Pickup:getIsLowered(superFunc, default) end

---@param xmlFile any
---@param key any
---@param spec any
function Pickup:loadPickupFromXML(xmlFile, key, spec) end

---@param spec any
---@param newState any
function Pickup:getCanChangePickupState(spec, newState) end

---@param superFunc any
function Pickup:getDirtMultiplier(superFunc) end

---@param superFunc any
function Pickup:getWearMultiplier(superFunc) end

---@param superFunc any
---@param actionEventsTable any
---@param inputAction any
---@param target any
---@param callback any
---@param triggerUp any
---@param triggerDown any
---@param triggerAlways any
---@param startActive any
---@param callbackState any
---@param customIconName any
function Pickup:registerLoweringActionEvent(superFunc, actionEventsTable, inputAction, target, callback, triggerUp, triggerDown, triggerAlways, startActive, callbackState, customIconName) end

---@param superFunc any
---@param actionEventsTable any
---@param inputAction any
---@param target any
---@param callback any
---@param triggerUp any
---@param triggerDown any
---@param triggerAlways any
---@param startActive any
---@param callbackState any
---@param customIconName any
---@param ignoreCollisions any
function Pickup:registerSelfLoweringActionEvent(superFunc, actionEventsTable, inputAction, target, callback, triggerUp, triggerDown, triggerAlways, startActive, callbackState, customIconName, ignoreCollisions) end

---@param superFunc any
---@param dischargeNode any
function Pickup:getCanDischargeToGround(superFunc, dischargeNode) end

---@param superFunc any
---@param dischargeNode any
function Pickup:getCanDischargeToObject(superFunc, dischargeNode) end

---@param self any
function Pickup.updateActionEvents(self) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Pickup.actionEventTogglePickup(self, actionName, inputValue, callbackState, isAnalog) end
