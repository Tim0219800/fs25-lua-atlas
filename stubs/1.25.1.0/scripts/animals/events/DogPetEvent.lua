---@meta
-- FS25 1.25.1.0 : animals/events/DogPetEvent.lua (generated stub, FS25 Lua Atlas)

---@class DogPetEvent : Event
DogPetEvent = {}

function DogPetEvent.emptyNew() end

---@param dog any
function DogPetEvent.new(dog) end

---@param streamId any
---@param connection any
function DogPetEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function DogPetEvent:writeStream(streamId, connection) end

---@param connection any
function DogPetEvent:run(connection) end
