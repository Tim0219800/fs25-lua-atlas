---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FertilizingCultivator.lua (stub généré, atlas Lua FS25)

---@class FertilizingCultivator
FertilizingCultivator = {}

---@param specializations table
---@return boolean
function FertilizingCultivator.prerequisitesPresent(specializations) end

function FertilizingCultivator.initSpecialization() end

---@param vehicleType any
function FertilizingCultivator.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function FertilizingCultivator.registerEventListeners(vehicleType) end

---@param savegame any
function FertilizingCultivator:onLoad(savegame) end

---@param superFunc any
---@param workArea any
---@param dt any
function FertilizingCultivator:processCultivatorArea(superFunc, workArea, dt) end

---@param superFunc any
---@param fillType any
function FertilizingCultivator:setSprayerAITerrainDetailProhibitedRange(superFunc, fillType) end
