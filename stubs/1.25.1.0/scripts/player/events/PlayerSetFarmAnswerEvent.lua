---@meta
-- FS25 1.25.1.0 : player/events/PlayerSetFarmAnswerEvent.lua (stub généré, atlas Lua FS25)

---@class PlayerSetFarmAnswerEvent : Event
PlayerSetFarmAnswerEvent = {}

---@return table
function PlayerSetFarmAnswerEvent.emptyNew() end

---@param answerState integer
---@param farmId integer
---@param password string?
---@return table
function PlayerSetFarmAnswerEvent.new(answerState, farmId, password) end

---@param streamId integer
---@param connection table
function PlayerSetFarmAnswerEvent:writeStream(streamId, connection) end

---@param streamId integer
---@param connection table
function PlayerSetFarmAnswerEvent:readStream(streamId, connection) end

---@param connection table
function PlayerSetFarmAnswerEvent:run(connection) end
