---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BalerSetBaleTimeEvent.lua (generated stub, FS25 Lua Atlas)

---@return table
function BalerSetBaleTimeEvent.emptyNew() end

---@param object table
---@param bale integer
---@param baleTime number
function BalerSetBaleTimeEvent.new(object, bale, baleTime) end

---@param streamId integer
---@param connection Connection
function BalerSetBaleTimeEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BalerSetBaleTimeEvent:writeStream(streamId, connection) end

---@param connection Connection
function BalerSetBaleTimeEvent:run(connection) end
