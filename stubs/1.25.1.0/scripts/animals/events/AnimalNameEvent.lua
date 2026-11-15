---@meta
-- FS25 1.25.1.0 : animals/events/AnimalNameEvent.lua (generated stub, FS25 Lua Atlas)

---@class AnimalNameEvent : Event
AnimalNameEvent = {}

function AnimalNameEvent.emptyNew() end

---@param husbandry any
---@param clusterId any
---@param name any
function AnimalNameEvent.new(husbandry, clusterId, name) end

---@param streamId any
---@param connection any
function AnimalNameEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AnimalNameEvent:writeStream(streamId, connection) end

---@param connection any
function AnimalNameEvent:run(connection) end

---@param husbandry any
---@param clusterId any
---@param name any
---@param noEventSend any
function AnimalNameEvent.sendEvent(husbandry, clusterId, name, noEventSend) end
