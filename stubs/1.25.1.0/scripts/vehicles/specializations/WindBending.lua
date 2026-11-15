---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WindBending.lua (stub généré, atlas Lua FS25)

---@class WindBending
WindBending = {}

---@param specializations table
---@return boolean
function WindBending.prerequisitesPresent(specializations) end

function WindBending.initSpecialization() end

---@param vehicleType any
function WindBending.registerFunctions(vehicleType) end

---@param vehicleType any
function WindBending.registerEventListeners(vehicleType) end

---@param savegame table
function WindBending:onLoad(savegame) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function WindBending:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end
