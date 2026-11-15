---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/EnterablePassengerEnterRequestEvent.lua (generated stub, FS25 Lua Atlas)

---@class EnterablePassengerEnterRequestEvent : Event
EnterablePassengerEnterRequestEvent = {}

---@return table
function EnterablePassengerEnterRequestEvent.emptyNew() end

---@param object table
---@param seatIndex table
---@return table
function EnterablePassengerEnterRequestEvent.new(object, seatIndex) end

---@param streamId integer
---@param connection Connection
function EnterablePassengerEnterRequestEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function EnterablePassengerEnterRequestEvent:writeStream(streamId, connection) end

---@param connection Connection
function EnterablePassengerEnterRequestEvent:run(connection) end
