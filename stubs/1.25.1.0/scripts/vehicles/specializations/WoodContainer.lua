---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WoodContainer.lua (stub généré, atlas Lua FS25)

---@param specializations table
---@return boolean
function WoodContainer.prerequisitesPresent(specializations) end

function WoodContainer.initSpecialization() end

---@param schema any
---@param baseKey any
function WoodContainer.registerXMLPaths(schema, baseKey) end

---@param vehicleType any
function WoodContainer.registerFunctions(vehicleType) end

---@param vehicleType any
function WoodContainer.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function WoodContainer.registerEventListeners(vehicleType) end

---@param savegame any
function WoodContainer:onLoad(savegame) end

function WoodContainer:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function WoodContainer:saveToXMLFile(xmlFile, key, usedModNames) end

---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function WoodContainer:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

function WoodContainer:getPalletUnloadTriggerExtraSellPrice() end

function WoodContainer:getIsWoodContainerFillingAllowed() end

---@param superFunc any
function WoodContainer:getInfoBoxTitle(superFunc) end

---@param superFunc any
---@param farmId any
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
function WoodContainer:addFillUnitFillLevel(superFunc, farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData) end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function WoodContainer:onWoodContainerTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

---@param objectId any
---@param targetLength any
function WoodContainer.getSplitShapeInfo(objectId, targetLength) end
