---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TreeSaplingPallet.lua (stub généré, atlas Lua FS25)

---@class TreeSaplingPallet
TreeSaplingPallet = {}

---@param specializations any
function TreeSaplingPallet.prerequisitesPresent(specializations) end

function TreeSaplingPallet.initSpecialization() end

---@param vehicleType any
function TreeSaplingPallet.registerFunctions(vehicleType) end

---@param vehicleType any
function TreeSaplingPallet.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function TreeSaplingPallet.registerEventListeners(vehicleType) end

---@param savegame any
function TreeSaplingPallet:onLoad(savegame) end

function TreeSaplingPallet:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function TreeSaplingPallet:saveToXMLFile(xmlFile, key, usedModNames) end

---@return string
function TreeSaplingPallet:getTreeSaplingPalletType() end

---@param treeTypeName any
---@param variationName any
---@return string
function TreeSaplingPallet:setTreeSaplingPalletType(treeTypeName, variationName) end

---@return string
function TreeSaplingPallet:updateTreeSaplingVisuals() end

---@param i3dNode any
---@param failedReason any
---@param args any
---@return integer
---@return table
function TreeSaplingPallet:onTreeSaplingLoaded(i3dNode, failedReason, args) end

function TreeSaplingPallet:updateTreeSaplingPalletNodes() end

---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function TreeSaplingPallet:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

---@param superFunc any
---@param box any
function TreeSaplingPallet:showInfo(superFunc, box) end
