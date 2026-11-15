---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/VehiclePlayerStyleChangedEvent.lua (stub généré, atlas Lua FS25)

---@class VehiclePlayerStyleChangedEvent : Event
VehiclePlayerStyleChangedEvent = {}

---@return table
function VehiclePlayerStyleChangedEvent.emptyNew() end

---@param vehicle table
---@param playerStyle table
---@return table
function VehiclePlayerStyleChangedEvent.new(vehicle, playerStyle) end

---@param streamId integer
---@param connection Connection
function VehiclePlayerStyleChangedEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function VehiclePlayerStyleChangedEvent:writeStream(streamId, connection) end

---@param connection Connection
function VehiclePlayerStyleChangedEvent:run(connection) end
