---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Pallet.lua (stub généré, atlas Lua FS25)

---@class Pallet
Pallet = {}

---@param specializations table
---@return boolean
function Pallet.prerequisitesPresent(specializations) end

function Pallet.initSpecialization() end

---@param vehicleType any
function Pallet.registerFunctions(vehicleType) end

---@param vehicleType any
function Pallet.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Pallet.registerEventListeners(vehicleType) end

---@param savegame any
function Pallet:onPreLoad(savegame) end

---@param savegame table
function Pallet:onLoad(savegame) end

---@param savegame any
function Pallet:onPostLoad(savegame) end

function Pallet:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function Pallet:saveToXMLFile(xmlFile, key, usedModNames) end

---@param superFunc any
---@param component any
---@param xmlFile any
---@param key any
---@param rootPosition any
---@param i any
function Pallet:loadComponentFromXML(superFunc, component, xmlFile, key, rootPosition, i) end

---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Pallet:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

---@param superFunc any
function Pallet:getMeshNodes(superFunc) end

---@param nodes any
function Pallet:collectPalletTensionBeltNodes(nodes) end

function Pallet:setPalletTensionBeltNodesDirty() end

function Pallet:getInfoBoxTitle() end

---@param superFunc any
function Pallet:getAutoLoadSize(superFunc) end

---@param superFunc any
---@param autoLoader any
---@param node any
---@param posX any
---@param posZ any
---@param sizeX any
---@param sizeZ any
function Pallet:autoLoad(superFunc, autoLoader, node, posX, posZ, sizeX, sizeZ) end

---@param superFunc any
function Pallet:getShowInVehiclesOverview(superFunc) end

---@param superFunc any
function Pallet:getCanBeReset(superFunc) end

---@param superFunc any
function Pallet:getIsMapHotspotVisible(superFunc) end

---@param superFunc any
function Pallet:getFillUnitEmptyOnReset(superFunc) end
