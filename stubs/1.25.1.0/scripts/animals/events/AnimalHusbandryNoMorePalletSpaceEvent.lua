---@meta
-- FS25 1.25.1.0 : animals/events/AnimalHusbandryNoMorePalletSpaceEvent.lua (generated stub, FS25 Lua Atlas)

--- Server-to-client network event that tells clients a husbandry could not spawn a pallet because there is no room. On a client it makes the husbandry show its pallet-blocked warning for the given fill type.
---@class AnimalHusbandryNoMorePalletSpaceEvent : Event
AnimalHusbandryNoMorePalletSpaceEvent = {}

--- Creates an empty event instance, used before reading from a stream.
---@return table
function AnimalHusbandryNoMorePalletSpaceEvent.emptyNew() end

--- Creates the event for a husbandry and a fill type index.
---@param animalHusbandry table
---@param fillTypeIndex integer
---@return AnimalHusbandryNoMorePalletSpaceEvent
function AnimalHusbandryNoMorePalletSpaceEvent.new(animalHusbandry, fillTypeIndex) end

--- Reads the husbandry and the fill type (FillTypeManager.SEND_NUM_BITS bits), then runs the event.
---@param streamId integer
---@param connection table
function AnimalHusbandryNoMorePalletSpaceEvent:readStream(streamId, connection) end

--- Writes the husbandry and the fill type index to the stream.
---@param streamId integer
---@param connection table
function AnimalHusbandryNoMorePalletSpaceEvent:writeStream(streamId, connection) end

--- Only when received from the server (client side): calls showPalletBlockedWarning on the husbandry with the fill type, if the husbandry exists.
---@param connection table
function AnimalHusbandryNoMorePalletSpaceEvent:run(connection) end
