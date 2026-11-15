---@meta
-- FS25 1.25.1.0 : animals/events/AnimalCleanEvent.lua (generated stub, FS25 Lua Atlas)

---@class AnimalCleanEvent : Event
AnimalCleanEvent = {}

function AnimalCleanEvent.emptyNew() end

---@param husbandry any
---@param clusterId any
---@param delta any
function AnimalCleanEvent.new(husbandry, clusterId, delta) end

---@param streamId any
---@param connection any
function AnimalCleanEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AnimalCleanEvent:writeStream(streamId, connection) end

---@param connection any
function AnimalCleanEvent:run(connection) end
