---@meta
-- FS25 1.25.1.0 : placeables/specializations/rollercoaster/RollercoasterPassengerEnterRequestEvent.lua (generated stub, FS25 Lua Atlas)

---@class RollercoasterPassengerEnterRequestEvent : Event
RollercoasterPassengerEnterRequestEvent = {}

---@return table
function RollercoasterPassengerEnterRequestEvent.emptyNew() end

---@param rollercoaster table
---@param player table
---@return table
function RollercoasterPassengerEnterRequestEvent.new(rollercoaster, player) end

---@param streamId integer
---@param connection Connection
function RollercoasterPassengerEnterRequestEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function RollercoasterPassengerEnterRequestEvent:writeStream(streamId, connection) end

---@param connection Connection
function RollercoasterPassengerEnterRequestEvent:run(connection) end
