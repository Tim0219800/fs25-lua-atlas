---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SaltSpreader.lua (generated stub, FS25 Lua Atlas)

---@class SaltSpreader
SaltSpreader = {}

function SaltSpreader.initSpecialization() end

---@param specializations table
---@return boolean
function SaltSpreader.prerequisitesPresent(specializations) end

---@param vehicleType any
function SaltSpreader.registerFunctions(vehicleType) end

---@param vehicleType any
function SaltSpreader.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function SaltSpreader.registerEventListeners(vehicleType) end

---@param savegame table
function SaltSpreader:onLoad(savegame) end

function SaltSpreader:onDelete() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function SaltSpreader:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function SaltSpreader:onTurnedOn() end

function SaltSpreader:onTurnedOff() end

---@param superFunc any
---@return boolean
function SaltSpreader:doCheckSpeedLimit(superFunc) end

---@param superFunc any
function SaltSpreader:getDirtMultiplier(superFunc) end

---@param superFunc any
function SaltSpreader:getWearMultiplier(superFunc) end

---@param superFunc any
---@return boolean
---@return string
function SaltSpreader:getAreControlledActionsAllowed(superFunc) end

---@param superFunc any
function SaltSpreader:getCanBeTurnedOn(superFunc) end

---@param superFunc any
function SaltSpreader:getTurnedOnNotAllowedWarning(superFunc) end

---@param superFunc any
---@return number
function SaltSpreader:getVariableWorkWidthUsage(superFunc) end

---@return number
function SaltSpreader.getDefaultSpeedLimit() end

---@param workArea any
function SaltSpreader:processSaltSpreaderArea(workArea) end
