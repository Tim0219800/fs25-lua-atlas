---@meta
-- FS25 1.25.1.0 : vehicles/specializations/HookLiftContainer.lua (stub généré, atlas Lua FS25)

---@class HookLiftContainer
HookLiftContainer = {}

---@param specializations table
---@return boolean
function HookLiftContainer.prerequisitesPresent(specializations) end

function HookLiftContainer.initSpecialization() end

---@param vehicleType any
function HookLiftContainer.registerFunctions(vehicleType) end

---@param vehicleType any
function HookLiftContainer.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function HookLiftContainer.registerEventListeners(vehicleType) end

---@param savegame table
function HookLiftContainer:onLoad(savegame) end

---@param superFunc any
---@param dischargeNode any
function HookLiftContainer:getCanDischargeToObject(superFunc, dischargeNode) end

---@param superFunc any
---@param dischargeNode any
function HookLiftContainer:getCanDischargeToGround(superFunc, dischargeNode) end

---@param superFunc any
function HookLiftContainer:isDetachAllowed(superFunc) end

---@param tipSideIndex any
function HookLiftContainer:onStartTipping(tipSideIndex) end

function HookLiftContainer:onStopTipping() end

---@param state any
function HookLiftContainer:onHookLiftContainerLockChanged(state) end

---@param superFunc any
function HookLiftContainer:addToPhysics(superFunc) end

---@param superFunc any
---@return boolean
function HookLiftContainer:removeFromPhysics(superFunc) end

---@param superFunc any
function HookLiftContainer:getBrakeForce(superFunc) end
