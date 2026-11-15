---@meta
-- FS25 1.25.1.0 : objects/WashingStationEvent.lua (stub généré, atlas Lua FS25)

---@class WashingStationEvent : Event
WashingStationEvent = {}

---@return table
function WashingStationEvent.emptyNew() end

---@param washingStation table
---@return table
function WashingStationEvent.new(washingStation) end

---@param streamId integer
---@param connection Connection
function WashingStationEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function WashingStationEvent:writeStream(streamId, connection) end

---@param connection Connection
function WashingStationEvent:run(connection) end
