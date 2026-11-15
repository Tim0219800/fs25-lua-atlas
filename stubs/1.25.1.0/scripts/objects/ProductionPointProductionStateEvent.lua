---@meta
-- FS25 1.25.1.0 : objects/ProductionPointProductionStateEvent.lua (stub généré, atlas Lua FS25)

---@class ProductionPointProductionStateEvent : Event
ProductionPointProductionStateEvent = {}

---@return table
function ProductionPointProductionStateEvent.emptyNew() end

---@param productionPoint any
---@param productionId any
---@param isEnabled any
function ProductionPointProductionStateEvent.new(productionPoint, productionId, isEnabled) end

---@param streamId any
---@param connection any
function ProductionPointProductionStateEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function ProductionPointProductionStateEvent:writeStream(streamId, connection) end

---@param connection any
function ProductionPointProductionStateEvent:run(connection) end

---@param productionPoint any
---@param productionId any
---@param isEnabled any
---@param noEventSend any
function ProductionPointProductionStateEvent.sendEvent(productionPoint, productionId, isEnabled, noEventSend) end
