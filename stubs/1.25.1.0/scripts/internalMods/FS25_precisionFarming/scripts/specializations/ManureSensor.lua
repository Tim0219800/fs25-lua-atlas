---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/ManureSensor.lua (generated stub, FS25 Lua Atlas)

---@class ManureSensor
ManureSensor = {}

---@param specializations table
---@return boolean
function ManureSensor.prerequisitesPresent(specializations) end

function ManureSensor.initSpecialization() end

---@param savegame any
function ManureSensor:onLoad(savegame) end

---@param linkData any
function ManureSensor:linkManureSensor(linkData) end

---@param lastChangeLevels any
function ManureSensor:getManureSensorNitrogenOffset(lastChangeLevels) end

---@param superFunc any
---@param lastChangeLevels any
function ManureSensor:getCurrentNitrogenLevelOffset(superFunc, lastChangeLevels) end

---@param superFunc any
---@param lastChangeLevels any
function ManureSensor:getCurrentNitrogenUsageLevelOffset(superFunc, lastChangeLevels) end

---@param superFunc any
function ManureSensor:getIsUsingExactNitrogenAmount(superFunc) end
