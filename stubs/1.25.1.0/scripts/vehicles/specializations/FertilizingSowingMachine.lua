---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FertilizingSowingMachine.lua (generated stub, FS25 Lua Atlas)

---@class FertilizingSowingMachine
FertilizingSowingMachine = {}

---@param specializations table
---@return boolean
function FertilizingSowingMachine.prerequisitesPresent(specializations) end

function FertilizingSowingMachine.initSpecialization() end

---@param vehicleType any
function FertilizingSowingMachine.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function FertilizingSowingMachine.registerEventListeners(vehicleType) end

---@param savegame any
function FertilizingSowingMachine:onLoad(savegame) end

---@param superFunc any
---@param workArea any
---@param dt any
function FertilizingSowingMachine:processSowingMachineArea(superFunc, workArea, dt) end

---@param superFunc any
function FertilizingSowingMachine:getUseSprayerAIRequirements(superFunc) end

---@param superFunc any
function FertilizingSowingMachine:getAreEffectsVisible(superFunc) end
