---@meta
-- FS25 1.25.1.0 : vehicles/specializations/HUDInfoTrigger.lua (generated stub, FS25 Lua Atlas)

--- Always returns true: no prerequisite on other specializations.
---@param specializations table
---@return boolean
function HUDInfoTrigger.prerequisitesPresent(specializations) end

--- Registers the XML key vehicle.hudInfoTrigger#triggerNode, the node used as trigger.
function HUDInfoTrigger.initSpecialization() end

--- Registers getIsPlayerInHudInfoTrigger and getAllowHudInfoTrigger on the vehicle type.
---@param vehicleType table
function HUDInfoTrigger.registerFunctions(vehicleType) end

--- Empty: nothing is overridden.
---@param vehicleType table
function HUDInfoTrigger.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to onLoad, onDelete and onUpdate.
---@param vehicleType table
function HUDInfoTrigger.registerEventListeners(vehicleType) end

--- Reads the trigger node and registers a trigger callback on it. Without a trigger node, removes the onDelete and onUpdate listeners.
---@param savegame table
function HUDInfoTrigger:onLoad(savegame) end

--- Removes the trigger registered in onLoad, if any.
function HUDInfoTrigger:onDelete() end

--- When the vehicle is not the one controlled and the local player is in the trigger, draws the root vehicle's HUD and keeps the vehicle awake with raiseActive.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function HUDInfoTrigger:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Trigger callback. Resolves the entering node to a game object or the local player and keeps a counter per network id: incremented on enter, decremented on leave and removed at zero. Ignores the vehicle itself.
---@param self integer
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function HUDInfoTrigger.onHudInfoTriggerCallback(self, triggerId, otherId, onEnter, onLeave, onStay) end

--- Returns true by default; other specializations can override it to forbid the HUD display.
function HUDInfoTrigger:getAllowHudInfoTrigger() end

--- Returns true if the local player is inside the trigger: directly on foot, or through any vehicle of the player's current vehicle chain. Returns false when display is not allowed or there is no local player.
function HUDInfoTrigger:getIsPlayerInHudInfoTrigger() end
