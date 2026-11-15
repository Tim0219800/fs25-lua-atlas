---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/EnterablePassengerEnterResponseEvent.lua (stub généré, atlas Lua FS25)

---@class EnterablePassengerEnterResponseEvent : Event
EnterablePassengerEnterResponseEvent = {}

---@return table
function EnterablePassengerEnterResponseEvent.emptyNew() end

---@param id table
---@param isOwner boolean
---@param seatIndex table
---@param userId any
---@return table
function EnterablePassengerEnterResponseEvent.new(id, isOwner, seatIndex, userId) end

---@param streamId integer
---@param connection Connection
function EnterablePassengerEnterResponseEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function EnterablePassengerEnterResponseEvent:writeStream(streamId, connection) end

---@param connection Connection
function EnterablePassengerEnterResponseEvent:run(connection) end
