---@meta
-- FS25 1.25.1.0 : placeables/PlaceableNameEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableNameEvent : Event
PlaceableNameEvent = {}

function PlaceableNameEvent.emptyNew() end

---@param placeable any
---@param name any
function PlaceableNameEvent.new(placeable, name) end

---@param streamId any
---@param connection any
function PlaceableNameEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableNameEvent:writeStream(streamId, connection) end

---@param connection any
function PlaceableNameEvent:run(connection) end

---@param placeable any
---@param name any
---@param noEventSend any
function PlaceableNameEvent.sendEvent(placeable, name, noEventSend) end
