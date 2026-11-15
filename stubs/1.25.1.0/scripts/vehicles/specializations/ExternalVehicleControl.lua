---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ExternalVehicleControl.lua (generated stub, FS25 Lua Atlas)

---@class ExternalVehicleControlActivatable
ExternalVehicleControlActivatable = {}

---@param specializations table
---@return boolean
function ExternalVehicleControl.prerequisitesPresent(specializations) end

function ExternalVehicleControl.initSpecialization() end

---@param vehicleType table
function ExternalVehicleControl.registerEvents(vehicleType) end

---@param vehicleType table
function ExternalVehicleControl.registerFunctions(vehicleType) end

---@param vehicleType table
function ExternalVehicleControl.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType table
function ExternalVehicleControl.registerEventListeners(vehicleType) end

---@param savegame table
function ExternalVehicleControl:onLoadFinished(savegame) end

function ExternalVehicleControl:onDelete() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function ExternalVehicleControl:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param trigger any
---@param name any
---@param registerFunc any
---@param updateFunc any
function ExternalVehicleControl:registerExternalActionEvent(trigger, name, registerFunc, updateFunc) end

---@param trigger integer
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function ExternalVehicleControl.onExternalVehicleControlTriggerCallback(trigger, triggerId, otherId, onEnter, onLeave, onStay) end

---@param vehicle any
---@param trigger any
function ExternalVehicleControlActivatable.new(vehicle, trigger) end

---@param inputContext any
function ExternalVehicleControlActivatable:registerCustomInput(inputContext) end

---@param inputContext any
function ExternalVehicleControlActivatable:removeCustomInput(inputContext) end

function ExternalVehicleControlActivatable:getIsActivatable() end

function ExternalVehicleControlActivatable:run() end

---@param x any
---@param y any
---@param z any
function ExternalVehicleControlActivatable:getDistance(x, y, z) end

function ExternalVehicleControlActivatable:updateText() end
