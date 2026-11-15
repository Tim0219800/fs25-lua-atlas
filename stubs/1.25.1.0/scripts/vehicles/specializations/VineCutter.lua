---@meta
-- FS25 1.25.1.0 : vehicles/specializations/VineCutter.lua (stub généré, atlas Lua FS25)

---@class VineCutter
VineCutter = {}

function VineCutter.initSpecialization() end

---@param specializations any
function VineCutter.prerequisitesPresent(specializations) end

---@param vehicleType any
function VineCutter.registerFunctions(vehicleType) end

---@param vehicleType any
function VineCutter.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function VineCutter.registerEventListeners(vehicleType) end

---@param savegame any
function VineCutter:onLoad(savegame) end

---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function VineCutter:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end
