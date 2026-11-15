---@meta
-- FS25 1.25.1.0 : animals/events/AnimalRidingEvent.lua (stub généré, atlas Lua FS25)

---@class AnimalRidingEvent : Event
AnimalRidingEvent = {}

function AnimalRidingEvent.emptyNew() end

---@param husbandry any
---@param clusterId any
---@param player any
function AnimalRidingEvent.new(husbandry, clusterId, player) end

---@param streamId any
---@param connection any
function AnimalRidingEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AnimalRidingEvent:writeStream(streamId, connection) end

---@param connection any
function AnimalRidingEvent:run(connection) end
