---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/events/HusbandryFenceCustomizeFinishEvent.lua (generated stub, FS25 Lua Atlas)

---@class HusbandryFenceCustomizeFinishEvent : Event
HusbandryFenceCustomizeFinishEvent = {}

function HusbandryFenceCustomizeFinishEvent.emptyNew() end

---@param placeable any
---@param success any
function HusbandryFenceCustomizeFinishEvent.new(placeable, success) end

---@param streamId any
---@param connection any
function HusbandryFenceCustomizeFinishEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function HusbandryFenceCustomizeFinishEvent:writeStream(streamId, connection) end

---@param connection any
function HusbandryFenceCustomizeFinishEvent:run(connection) end
