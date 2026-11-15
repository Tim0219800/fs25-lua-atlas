---@meta
-- FS25 1.25.1.0 : objects/ProductionPointOutputModeEvent.lua (generated stub, FS25 Lua Atlas)

---@class ProductionPointOutputModeEvent : Event
ProductionPointOutputModeEvent = {}

---@return table
function ProductionPointOutputModeEvent.emptyNew() end

---@param productionPoint any
---@param outputFillTypeId any
---@param outputMode any
function ProductionPointOutputModeEvent.new(productionPoint, outputFillTypeId, outputMode) end

---@param streamId any
---@param connection any
function ProductionPointOutputModeEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function ProductionPointOutputModeEvent:writeStream(streamId, connection) end

---@param connection any
function ProductionPointOutputModeEvent:run(connection) end

---@param productionPoint any
---@param outputFillTypeId any
---@param outputMode any
---@param noEventSend any
function ProductionPointOutputModeEvent.sendEvent(productionPoint, outputFillTypeId, outputMode, noEventSend) end
