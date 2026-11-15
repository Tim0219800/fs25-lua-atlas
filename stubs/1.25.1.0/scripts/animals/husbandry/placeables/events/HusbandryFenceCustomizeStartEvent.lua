---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/events/HusbandryFenceCustomizeStartEvent.lua (generated stub, FS25 Lua Atlas)

---@class HusbandryFenceCustomizeStartEvent : Event
HusbandryFenceCustomizeStartEvent = {}

function HusbandryFenceCustomizeStartEvent.emptyNew() end

---@param placeable any
function HusbandryFenceCustomizeStartEvent.new(placeable) end

---@param streamId any
---@param connection any
function HusbandryFenceCustomizeStartEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function HusbandryFenceCustomizeStartEvent:writeStream(streamId, connection) end

---@param connection any
function HusbandryFenceCustomizeStartEvent:run(connection) end
