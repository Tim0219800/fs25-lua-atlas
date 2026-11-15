---@meta
-- FS25 1.25.1.0 : animals/events/DogFollowEvent.lua (generated stub, FS25 Lua Atlas)

---@class DogFollowEvent : Event
DogFollowEvent = {}

function DogFollowEvent.emptyNew() end

---@param dog any
---@param player any
function DogFollowEvent.new(dog, player) end

---@param streamId any
---@param connection any
function DogFollowEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function DogFollowEvent:writeStream(streamId, connection) end

---@param connection any
function DogFollowEvent:run(connection) end
