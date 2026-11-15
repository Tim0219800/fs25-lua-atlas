---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SmartAttach.lua (stub généré, atlas Lua FS25)

---@class SmartAttachActivatable
SmartAttachActivatable = {}

---@class SmartAttachEvent : Event
SmartAttachEvent = {}

---@param specializations any
function SmartAttach.prerequisitesPresent(specializations) end

function SmartAttach.initSpecialization() end

---@param vehicleType any
function SmartAttach.registerFunctions(vehicleType) end

---@param vehicleType any
function SmartAttach.registerEventListeners(vehicleType) end

---@param savegame any
function SmartAttach:onLoad(savegame) end

function SmartAttach:onDelete() end

---@param targetVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param noEventSend any
function SmartAttach:doSmartAttach(targetVehicle, inputJointDescIndex, jointDescIndex, noEventSend) end

function SmartAttach:getCanBeSmartAttached() end

function SmartAttach:onPreAttach() end

---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function SmartAttach:smartAttachCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

---@param smartAttachVehicle table
---@return table
function SmartAttachActivatable.new(smartAttachVehicle) end

---@return boolean
function SmartAttachActivatable:getIsActivatable() end

function SmartAttachActivatable:run() end

function SmartAttachEvent.emptyNew() end

---@param vehicle any
---@param targetVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
function SmartAttachEvent.new(vehicle, targetVehicle, inputJointDescIndex, jointDescIndex) end

---@param streamId any
---@param connection any
function SmartAttachEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function SmartAttachEvent:writeStream(streamId, connection) end

---@param connection any
function SmartAttachEvent:run(connection) end

---@param vehicle any
---@param targetVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param noEventSend any
function SmartAttachEvent.sendEvent(vehicle, targetVehicle, inputJointDescIndex, jointDescIndex, noEventSend) end
