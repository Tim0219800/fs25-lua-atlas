---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/VehicleSettingsChangeEvent.lua (stub généré, atlas Lua FS25)

---@class VehicleSettingsChangeEvent : Event
VehicleSettingsChangeEvent = {}

---@return table
function VehicleSettingsChangeEvent.emptyNew() end

---@param vehicle table
---@param settings boolean
---@param state any
function VehicleSettingsChangeEvent.new(vehicle, settings, state) end

---@param streamId integer
---@param connection Connection
function VehicleSettingsChangeEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function VehicleSettingsChangeEvent:writeStream(streamId, connection) end

---@param connection Connection
function VehicleSettingsChangeEvent:run(connection) end
