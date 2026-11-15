---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/ExtendedSowingMachineRateEvent.lua (generated stub, FS25 Lua Atlas)

---@class ExtendedSowingMachineRateEvent : Event
ExtendedSowingMachineRateEvent = {}

---@return table
function ExtendedSowingMachineRateEvent.emptyNew() end

---@param object table
---@param automaticMode boolean
---@param manualValue integer
function ExtendedSowingMachineRateEvent.new(object, automaticMode, manualValue) end

---@param streamId integer
---@param connection Connection
function ExtendedSowingMachineRateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function ExtendedSowingMachineRateEvent:writeStream(streamId, connection) end

---@param connection Connection
function ExtendedSowingMachineRateEvent:run(connection) end

---@param object table
---@param automaticMode boolean
---@param manualValue any
---@param noEventSend boolean
function ExtendedSowingMachineRateEvent.sendEvent(object, automaticMode, manualValue, noEventSend) end
