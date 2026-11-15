---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryPallets.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableHusbandryPallets
PlaceableHusbandryPallets = {}

---@param specializations table
---@return boolean
function PlaceableHusbandryPallets.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableHusbandryPallets.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryPallets.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryPallets.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableHusbandryPallets.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableHusbandryPallets.registerSavegameXMLPaths(schema, basePath) end

---@param savegame any
function PlaceableHusbandryPallets:onLoad(savegame) end

function PlaceableHusbandryPallets:onDelete() end

function PlaceableHusbandryPallets:onFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableHusbandryPallets:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableHusbandryPallets:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function PlaceableHusbandryPallets:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function PlaceableHusbandryPallets:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param xmlFile any
---@param key any
function PlaceableHusbandryPallets:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableHusbandryPallets:saveToXMLFile(xmlFile, key, usedModNames) end

---@param clusters any
function PlaceableHusbandryPallets:onHusbandryAnimalsUpdate(clusters) end

---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function PlaceableHusbandryPallets:onPalletTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

function PlaceableHusbandryPallets:updatePalletInfo() end

---@param pallets any
---@param fillTypeIndex any
function PlaceableHusbandryPallets:getAllPalletsCallback(pallets, fillTypeIndex) end

function PlaceableHusbandryPallets:updatePallets() end

---@param fillTypeIndex integer
---@param liters number
---@return number
function PlaceableHusbandryPallets:addPendingLiters(fillTypeIndex, liters) end

---@param pallet any
---@param result any
---@param fillTypeIndex any
function PlaceableHusbandryPallets:getPalletCallback(pallet, result, fillTypeIndex) end

---@param fillTypeIndex any
function PlaceableHusbandryPallets:showSpawnerBlockedWarning(fillTypeIndex) end

---@param fillTypeIndex any
function PlaceableHusbandryPallets:showPalletBlockedWarning(fillTypeIndex) end

---@param superFunc any
---@param infoTable any
function PlaceableHusbandryPallets:updateInfo(superFunc, infoTable) end

---@param superFunc any
function PlaceableHusbandryPallets:getConditionInfos(superFunc) end

---@param superFunc any
---@param foodFactor any
---@param productionFactor any
---@param globalProductionFactor any
function PlaceableHusbandryPallets:updateOutput(superFunc, foodFactor, productionFactor, globalProductionFactor) end
