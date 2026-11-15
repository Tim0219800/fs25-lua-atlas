---@meta
-- FS25 1.25.1.0 : vehicles/specializations/BunkerSiloCompacter.lua (generated stub, FS25 Lua Atlas)

---@class BunkerSiloCompacter
BunkerSiloCompacter = {}

---@param specializations any
function BunkerSiloCompacter.prerequisitesPresent(specializations) end

function BunkerSiloCompacter.initSpecialization() end

---@param vehicleType any
function BunkerSiloCompacter.registerFunctions(vehicleType) end

---@param vehicleType any
function BunkerSiloCompacter.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function BunkerSiloCompacter.registerEventListeners(vehicleType) end

---@param savegame any
function BunkerSiloCompacter:onLoad(savegame) end

function BunkerSiloCompacter:onDelete() end

---@param xmlFile any
---@param key any
function BunkerSiloCompacter:loadBunkerSiloCompactorFromXML(xmlFile, key) end

function BunkerSiloCompacter:getBunkerSiloCompacterScale() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function BunkerSiloCompacter:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param superFunc any
---@return boolean
function BunkerSiloCompacter:doCheckSpeedLimit(superFunc) end

---@return number
function BunkerSiloCompacter.getDefaultSpeedLimit() end
