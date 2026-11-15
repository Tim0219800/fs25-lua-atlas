---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TreePlanterLoadPalletEvent.lua (stub généré, atlas Lua FS25)

---@class TreePlanterLoadPalletEvent : Event
TreePlanterLoadPalletEvent = {}

---@return table
function TreePlanterLoadPalletEvent.emptyNew() end

---@param object table
---@param palletObjectId integer
function TreePlanterLoadPalletEvent.new(object, palletObjectId) end

---@param streamId integer
---@param connection Connection
function TreePlanterLoadPalletEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TreePlanterLoadPalletEvent:writeStream(streamId, connection) end

---@param connection Connection
function TreePlanterLoadPalletEvent:run(connection) end

---@param object table
---@param palletObjectId integer
---@param noEventSend boolean
function TreePlanterLoadPalletEvent.sendEvent(object, palletObjectId, noEventSend) end
