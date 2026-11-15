---@meta
-- FS25 1.25.1.0 : vehicles/specializations/HeadlandAnimation.lua (stub généré, atlas Lua FS25)

---@class HeadlandAnimation
HeadlandAnimation = {}

---@param specializations table
---@return boolean
function HeadlandAnimation.prerequisitesPresent(specializations) end

function HeadlandAnimation.initSpecialization() end

---@param vehicleType any
function HeadlandAnimation.registerFunctions(vehicleType) end

---@param vehicleType any
function HeadlandAnimation.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function HeadlandAnimation.registerEventListeners(vehicleType) end

---@param savegame table
function HeadlandAnimation:onLoad(savegame) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function HeadlandAnimation:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end
