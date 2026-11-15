---@meta
-- FS25 1.25.1.0 : vehicles/specializations/HookLiftTrailer.lua (generated stub, FS25 Lua Atlas)

---@class HookLiftTrailer
HookLiftTrailer = {}

---@param specializations table
---@return boolean
function HookLiftTrailer.prerequisitesPresent(specializations) end

function HookLiftTrailer.initSpecialization() end

---@param vehicleType any
function HookLiftTrailer.registerFunctions(vehicleType) end

---@param vehicleType any
function HookLiftTrailer.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function HookLiftTrailer.registerEventListeners(vehicleType) end

---@param savegame table
function HookLiftTrailer:onLoad(savegame) end

---@param savegame table
function HookLiftTrailer:onPostLoad(savegame) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function HookLiftTrailer:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param attachable table
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function HookLiftTrailer:onPostAttachImplement(attachable, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

---@param implement integer
function HookLiftTrailer:onPreDetachImplement(implement) end

---@param name any
function HookLiftTrailer:onUpdateAnimation(name) end

function HookLiftTrailer:startTipping() end

function HookLiftTrailer:stopTipping() end

---@return boolean
function HookLiftTrailer:getIsTippingAllowed() end

function HookLiftTrailer:getCanDetachContainer() end

function HookLiftTrailer:updateHookLiftContainerLockState() end

function HookLiftTrailer:updateAdditionalHookLiftContainerJoint() end

---@param container any
---@param state any
function HookLiftTrailer:setHookLiftContainerPhysicsState(container, state) end

---@param superFunc any
---@return boolean
function HookLiftTrailer:addToPhysics(superFunc) end

---@param superFunc any
function HookLiftTrailer:removeFromPhysics(superFunc) end

---@param superFunc any
---@param direction any
---@param onAiTurnOn any
---@return boolean
function HookLiftTrailer:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

---@param superFunc any
---@return boolean
function HookLiftTrailer:isDetachAllowed(superFunc) end

---@param superFunc any
---@return boolean
function HookLiftTrailer:getDoConsumePtoPower(superFunc) end

---@param superFunc any
---@return number
function HookLiftTrailer:getPtoRpm(superFunc) end
