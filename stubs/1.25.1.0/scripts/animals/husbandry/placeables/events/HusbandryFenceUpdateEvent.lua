---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/events/HusbandryFenceUpdateEvent.lua (generated stub, FS25 Lua Atlas)

---@class HusbandryFenceUpdateEvent : Event
HusbandryFenceUpdateEvent = {}

function HusbandryFenceUpdateEvent.emptyNew() end

---@param placeable any
---@param deleteCustomizableSegments any
function HusbandryFenceUpdateEvent.new(placeable, deleteCustomizableSegments) end

---@param streamId any
---@param connection any
function HusbandryFenceUpdateEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function HusbandryFenceUpdateEvent:writeStream(streamId, connection) end

---@param connection any
function HusbandryFenceUpdateEvent:run(connection) end
