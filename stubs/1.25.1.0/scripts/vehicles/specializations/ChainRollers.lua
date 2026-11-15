---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ChainRollers.lua (generated stub, FS25 Lua Atlas)

---@class ChainRollers
ChainRollers = {}

---@param specializations any
function ChainRollers.prerequisitesPresent(specializations) end

function ChainRollers.initSpecialization() end

---@param vehicleType any
function ChainRollers.registerFunctions(vehicleType) end

---@param vehicleType any
function ChainRollers.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function ChainRollers.registerEventListeners(vehicleType) end

---@param savegame any
function ChainRollers:onLoad(savegame) end

---@param savegame any
function ChainRollers:onLoadFinished(savegame) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ChainRollers:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param xmlFile any
---@param key any
---@param chainRoller any
function ChainRollers:loadChainRollerFromXML(xmlFile, key, chainRoller) end

---@param chainRoller any
---@param dt any
function ChainRollers:updateChainRoller(chainRoller, dt) end

---@param superFunc any
---@param xmlFile any
---@param baseName any
---@param entry any
function ChainRollers:loadExtraDependentParts(superFunc, xmlFile, baseName, entry) end

---@param superFunc any
---@param part any
---@param dt any
function ChainRollers:updateExtraDependentParts(superFunc, part, dt) end
