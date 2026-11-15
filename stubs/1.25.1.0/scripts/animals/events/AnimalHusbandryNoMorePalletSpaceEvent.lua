---@meta
-- FS25 1.25.1.0 : animals/events/AnimalHusbandryNoMorePalletSpaceEvent.lua (generated stub, FS25 Lua Atlas)

---@class AnimalHusbandryNoMorePalletSpaceEvent : Event
AnimalHusbandryNoMorePalletSpaceEvent = {}

---@return table
function AnimalHusbandryNoMorePalletSpaceEvent.emptyNew() end

---@param animalHusbandry table
---@param fillTypeIndex integer
---@return AnimalHusbandryNoMorePalletSpaceEvent
function AnimalHusbandryNoMorePalletSpaceEvent.new(animalHusbandry, fillTypeIndex) end

---@param streamId integer
---@param connection table
function AnimalHusbandryNoMorePalletSpaceEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function AnimalHusbandryNoMorePalletSpaceEvent:writeStream(streamId, connection) end

---@param connection table
function AnimalHusbandryNoMorePalletSpaceEvent:run(connection) end
