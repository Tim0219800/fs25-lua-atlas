---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ConnectedAttributes.lua (stub généré, atlas Lua FS25)

---@class LocalOffset
LocalOffset = {}

---@param specializations table
---@return boolean
function ConnectedAttributes.prerequisitesPresent(specializations) end

function ConnectedAttributes.initSpecialization() end

---@param vehicleType any
function ConnectedAttributes.registerFunctions(vehicleType) end

---@param vehicleType any
function ConnectedAttributes.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function ConnectedAttributes.registerEventListeners(vehicleType) end

---@param savegame any
function ConnectedAttributes:onLoad(savegame) end

---@param savegame any
function ConnectedAttributes:onLoadFinished(savegame) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ConnectedAttributes:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ConnectedAttributes:onUpdateEnd(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param animationName any
function ConnectedAttributes:onPlayAnimation(animationName) end

---@param animationName any
function ConnectedAttributes:onUpdateAnimation(animationName) end

---@param animationName any
function ConnectedAttributes:onFinishAnimation(animationName) end

---@param attribute any
---@param forceUpdate any
function ConnectedAttributes.updateAttribute(attribute, forceUpdate) end

---@param superFunc any
---@param xmlFile any
---@param baseName any
---@param entry any
function ConnectedAttributes:loadExtraDependentParts(superFunc, xmlFile, baseName, entry) end

---@param superFunc any
---@param part any
---@param dt any
function ConnectedAttributes:updateExtraDependentParts(superFunc, part, dt) end

---@param values any
function ConnectedAttributes:updateDebugValues(values) end
