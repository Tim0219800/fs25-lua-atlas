---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/events/HusbandryCancelCreationEvent.lua (stub généré, atlas Lua FS25)

---@class HusbandryCancelCreationEvent : Event
HusbandryCancelCreationEvent = {}

function HusbandryCancelCreationEvent.emptyNew() end

---@param placeableId any
function HusbandryCancelCreationEvent.new(placeableId) end

---@param streamId any
---@param connection any
function HusbandryCancelCreationEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function HusbandryCancelCreationEvent:writeStream(streamId, connection) end

---@param connection any
function HusbandryCancelCreationEvent:run(connection) end
