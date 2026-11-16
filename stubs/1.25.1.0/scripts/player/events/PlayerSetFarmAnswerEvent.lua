---@meta
-- FS25 1.25.1.0 : player/events/PlayerSetFarmAnswerEvent.lua (generated stub, FS25 Lua Atlas)

--- Server-to-client answer to a `PlayerSetFarmEvent`. It carries a result state (the `STATE` table, defined elsewhere, e.g. OK or PASSWORD_REQUIRED), the farm id and, on success, the password used. On the client it is republished through the message center.
---@class PlayerSetFarmAnswerEvent : Event
PlayerSetFarmAnswerEvent = {}

--- Creates an empty event instance for stream reading.
---@return table
function PlayerSetFarmAnswerEvent.emptyNew() end

--- Builds an answer with the state, farm id and optional password that was used in the request.
---@param answerState integer
---@param farmId integer
---@param password string?
---@return table
function PlayerSetFarmAnswerEvent.new(answerState, farmId, password) end

--- Writes the state and farm id as fixed-width integers. The password is written (behind a boolean flag) only when the state is OK and a password is set.
---@param streamId integer
---@param connection table
function PlayerSetFarmAnswerEvent:writeStream(streamId, connection) end

--- Reads state, farm id and the optional password, then runs the event.
---@param streamId integer
---@param connection table
function PlayerSetFarmAnswerEvent:readStream(streamId, connection) end

--- Client only: for OK or PASSWORD_REQUIRED, publishes the `PlayerSetFarmAnswerEvent` message on `g_messageCenter` (the password is passed only for OK). On the server it only logs a dev warning.
---@param connection table
function PlayerSetFarmAnswerEvent:run(connection) end
