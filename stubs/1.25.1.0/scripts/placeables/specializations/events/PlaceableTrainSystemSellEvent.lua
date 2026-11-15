---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableTrainSystemSellEvent.lua (stub généré, atlas Lua FS25)

---@class PlaceableTrainSystemSellEvent : Event
PlaceableTrainSystemSellEvent = {}

---@return table
function PlaceableTrainSystemSellEvent.emptyNew() end

---@param object table
---@return PlaceableTrainSystemSellEvent
function PlaceableTrainSystemSellEvent.new(object) end

---@param streamId integer
---@param connection Connection
function PlaceableTrainSystemSellEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableTrainSystemSellEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlaceableTrainSystemSellEvent:run(connection) end
