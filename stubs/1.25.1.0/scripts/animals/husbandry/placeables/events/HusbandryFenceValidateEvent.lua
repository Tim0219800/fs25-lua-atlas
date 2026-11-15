---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/events/HusbandryFenceValidateEvent.lua (generated stub, FS25 Lua Atlas)

---@class HusbandryFenceValidateEvent : Event
HusbandryFenceValidateEvent = {}

function HusbandryFenceValidateEvent.emptyNew() end

---@param placeable any
function HusbandryFenceValidateEvent.new(placeable) end

---@param streamId any
---@param connection any
function HusbandryFenceValidateEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function HusbandryFenceValidateEvent:writeStream(streamId, connection) end

---@param connection any
function HusbandryFenceValidateEvent:run(connection) end
