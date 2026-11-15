---@meta
-- FS25 1.25.1.0 : vehicles/specializations/CropRowAdjustedNodes.lua (stub généré, atlas Lua FS25)

---@class CropRowAdjustedNodes
CropRowAdjustedNodes = {}

---@param specializations any
function CropRowAdjustedNodes.prerequisitesPresent(specializations) end

function CropRowAdjustedNodes.initSpecialization() end

---@param vehicleType any
function CropRowAdjustedNodes.registerFunctions(vehicleType) end

---@param vehicleType any
function CropRowAdjustedNodes.registerEventListeners(vehicleType) end

---@param savegame any
function CropRowAdjustedNodes:onLoad(savegame) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function CropRowAdjustedNodes:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param xmlFile any
---@param key any
---@param adjustedNode any
function CropRowAdjustedNodes:loadCropRowAdjustedNodeFromXML(xmlFile, key, adjustedNode) end

---@param adjustedNode any
---@param dt any
function CropRowAdjustedNodes:updateCropRowAdjustedNode(adjustedNode, dt) end

---@param adjustedNode any
function CropRowAdjustedNodes:getIsCropRowAdjustedNodeActive(adjustedNode) end
