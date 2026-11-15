---@meta
-- FS25 1.25.1.0 : placeables/specializations/rollercoaster/RollercoasterPassengerEnterResponseEvent.lua (stub généré, atlas Lua FS25)

---@class RollercoasterPassengerEnterResponseEvent : Event
RollercoasterPassengerEnterResponseEvent = {}

---@return table
function RollercoasterPassengerEnterResponseEvent.emptyNew() end

---@param rollercoaster table
---@param userId integer
---@param seatIndex integer
---@return table
function RollercoasterPassengerEnterResponseEvent.new(rollercoaster, userId, seatIndex) end

---@param streamId integer
---@param connection Connection
function RollercoasterPassengerEnterResponseEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function RollercoasterPassengerEnterResponseEvent:writeStream(streamId, connection) end

---@param connection Connection
function RollercoasterPassengerEnterResponseEvent:run(connection) end
