---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BalerCreateBaleEvent.lua (stub généré, atlas Lua FS25)

---@class BalerCreateBaleEvent : Event
BalerCreateBaleEvent = {}

---@return table
function BalerCreateBaleEvent.emptyNew() end

---@param object table
---@param baleFillType integer
---@param baleTime number
---@param baleServerId any
function BalerCreateBaleEvent.new(object, baleFillType, baleTime, baleServerId) end

---@param streamId integer
---@param connection Connection
function BalerCreateBaleEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BalerCreateBaleEvent:writeStream(streamId, connection) end

---@param connection Connection
function BalerCreateBaleEvent:run(connection) end
