---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/events/HusbandryMeadowCreateEvent.lua (generated stub, FS25 Lua Atlas)

---@class HusbandryMeadowCreateEvent : Event
HusbandryMeadowCreateEvent = {}

function HusbandryMeadowCreateEvent.emptyNew() end

---@param placeable any
---@param createMeadow any
function HusbandryMeadowCreateEvent.new(placeable, createMeadow) end

---@param streamId any
---@param connection any
function HusbandryMeadowCreateEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function HusbandryMeadowCreateEvent:writeStream(streamId, connection) end

---@param connection any
function HusbandryMeadowCreateEvent:run(connection) end
