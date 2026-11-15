---@meta
-- FS25 1.25.1.0 : animals/events/DogFetchItemEvent.lua (generated stub, FS25 Lua Atlas)

---@class DogFetchItemEvent : Event
DogFetchItemEvent = {}

function DogFetchItemEvent.emptyNew() end

---@param dog any
---@param player any
---@param item any
function DogFetchItemEvent.new(dog, player, item) end

---@param streamId any
---@param connection any
function DogFetchItemEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function DogFetchItemEvent:writeStream(streamId, connection) end

---@param connection any
function DogFetchItemEvent:run(connection) end
