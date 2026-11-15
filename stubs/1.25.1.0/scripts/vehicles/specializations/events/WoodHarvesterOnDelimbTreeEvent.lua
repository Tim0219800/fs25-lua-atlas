---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WoodHarvesterOnDelimbTreeEvent.lua (stub généré, atlas Lua FS25)

---@class WoodHarvesterOnDelimbTreeEvent : Event
WoodHarvesterOnDelimbTreeEvent = {}

---@return table
function WoodHarvesterOnDelimbTreeEvent.emptyNew() end

---@param object table
---@param state boolean
function WoodHarvesterOnDelimbTreeEvent.new(object, state) end

---@param streamId integer
---@param connection Connection
function WoodHarvesterOnDelimbTreeEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function WoodHarvesterOnDelimbTreeEvent:writeStream(streamId, connection) end

---@param connection Connection
function WoodHarvesterOnDelimbTreeEvent:run(connection) end
