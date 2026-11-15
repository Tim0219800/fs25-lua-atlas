---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SeedTreater.lua (stub généré, atlas Lua FS25)

---@class SeedTreater
SeedTreater = {}

---@param specializations table
---@return boolean
function SeedTreater.prerequisitesPresent(specializations) end

function SeedTreater.initSpecialization() end

---@param vehicleType any
function SeedTreater.registerFunctions(vehicleType) end

---@param vehicleType any
function SeedTreater.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function SeedTreater.registerEventListeners(vehicleType) end

---@param savegame any
function SeedTreater:onLoad(savegame) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function SeedTreater:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param superFunc any
---@param dischargeNode any
---@param emptyLiters any
function SeedTreater:discharge(superFunc, dischargeNode, emptyLiters) end

---@param superFunc any
---@param dischargeNode any
function SeedTreater:getDischargeFillType(superFunc, dischargeNode) end

---@param superFunc any
---@param dischargeNode any
function SeedTreater:getDischargeNodeEmptyFactor(superFunc, dischargeNode) end
