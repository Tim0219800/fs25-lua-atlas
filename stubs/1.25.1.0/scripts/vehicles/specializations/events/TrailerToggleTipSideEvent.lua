---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TrailerToggleTipSideEvent.lua (stub généré, atlas Lua FS25)

---@class TrailerToggleTipSideEvent : Event
TrailerToggleTipSideEvent = {}

---@return table
function TrailerToggleTipSideEvent.emptyNew() end

---@param object table
---@param tipSideIndex integer
function TrailerToggleTipSideEvent.new(object, tipSideIndex) end

---@param streamId integer
---@param connection Connection
function TrailerToggleTipSideEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TrailerToggleTipSideEvent:writeStream(streamId, connection) end

---@param connection Connection
function TrailerToggleTipSideEvent:run(connection) end
