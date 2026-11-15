---@meta
-- FS25 1.25.1.0 : objects/ProductionPointProductionStatusEvent.lua (stub généré, atlas Lua FS25)

---@class ProductionPointProductionStatusEvent : Event
ProductionPointProductionStatusEvent = {}

---@return table
function ProductionPointProductionStatusEvent.emptyNew() end

---@param productionPoint ProductionPoint
---@param productionIndex integer
---@param status integer
---@return ProductionPointProductionStatusEvent
function ProductionPointProductionStatusEvent.new(productionPoint, productionIndex, status) end

---@param streamId any
---@param connection any
function ProductionPointProductionStatusEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function ProductionPointProductionStatusEvent:writeStream(streamId, connection) end

---@param connection any
function ProductionPointProductionStatusEvent:run(connection) end

---@param productionPoint any
---@param productionIndex any
---@param status any
---@param noEventSend any
function ProductionPointProductionStatusEvent.sendEvent(productionPoint, productionIndex, status, noEventSend) end
