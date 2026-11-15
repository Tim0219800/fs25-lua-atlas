---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Wearable.lua (stub généré, atlas Lua FS25)

---@class Wearable
Wearable = {}

---@param specializations any
function Wearable.prerequisitesPresent(specializations) end

function Wearable.initSpecialization() end

---@param vehicleType any
function Wearable.registerFunctions(vehicleType) end

---@param vehicleType any
function Wearable.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Wearable.registerEventListeners(vehicleType) end

---@param savegame any
function Wearable:onLoad(savegame) end

---@param savegame any
function Wearable:onLoadFinished(savegame) end

---@param saleItem any
function Wearable:onSaleItemSet(saleItem) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function Wearable:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId any
---@param connection any
function Wearable:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function Wearable:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function Wearable:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function Wearable:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Wearable:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param amount any
---@param force any
function Wearable:setDamageAmount(amount, force) end

---@param nodeData any
---@param dt any
function Wearable:updateWearAmount(nodeData, dt) end

---@param dt any
function Wearable:updateDamageAmount(dt) end

function Wearable:getUsageCausesWear() end

function Wearable:getUsageCausesDamage() end

---@param wearAmount any
---@param force any
function Wearable:addWearAmount(wearAmount, force) end

---@param amount any
---@param force any
function Wearable:addDamageAmount(amount, force) end

---@param nodeData any
---@param wearAmount any
---@param force any
function Wearable:setNodeWearAmount(nodeData, wearAmount, force) end

---@param nodeData any
function Wearable:getNodeWearAmount(nodeData) end

---@return number
function Wearable:getWearTotalAmount() end

---@return number
function Wearable:getDamageAmount() end

---@return boolean
function Wearable:getDamageShowOnHud() end

function Wearable:repairVehicle() end

---@param superFunc any
function Wearable:getRepairPrice(superFunc) end

---@param price any
---@param damage any
function Wearable.calculateRepairPrice(price, damage) end

---@param superFunc any
function Wearable:getRepaintPrice(superFunc) end

---@param superFunc any
---@param box any
function Wearable:showInfo(superFunc, box) end

---@param price any
---@param wear any
function Wearable.calculateRepaintPrice(price, wear) end

---@param superFunc any
function Wearable:getVehicleDamage(superFunc) end

---@param rootNode any
function Wearable:addAllSubWearableNodes(rootNode) end

---@param node any
function Wearable:addWearableNode(node) end

---@param node any
function Wearable:validateWearableNode(node) end

---@param node any
function Wearable:addToGlobalWearableNode(node) end

---@param node any
---@param updateFunc any
---@param customIndex any
---@param extraParams any
function Wearable:addToLocalWearableNode(node, updateFunc, customIndex, extraParams) end

---@param rootNode any
function Wearable:removeAllSubWearableNodes(rootNode) end

---@param node node
function Wearable:removeWearableNode(node) end

---@return number
function Wearable:getWearMultiplier() end

---@return number
function Wearable:getWorkWearMultiplier() end

---@param values any
function Wearable:updateDebugValues(values) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Wearable.loadSpecValueCondition(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
function Wearable.getSpecValueCondition(storeItem, realItem) end
