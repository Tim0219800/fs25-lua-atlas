---@meta
-- FS25 1.25.1.0 : vehicles/specializations/activatables/YarderTowerSetupActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable used to set up and remove a yarder tower's main rope: start or cancel setup mode and confirm the target tree. Selected when the player is in range of the tower. The actual state is held in `spec_yarderTower` (defined elsewhere, UNVERIFIED).
---@class YarderTowerSetupActivatable
YarderTowerSetupActivatable = {}

--- Creates the setup activatable for a yarder tower vehicle with an empty prompt text.
---@param vehicle table
---@return table
function YarderTowerSetupActivatable.new(vehicle) end

--- Registers the `ACTIVATE_OBJECT` toggle and `YARDER_SETUP_ROPE` set-target action events at very high priority, then updates their texts.
---@param inputContext any
function YarderTowerSetupActivatable:registerCustomInput(inputContext) end

--- Removes every input action event registered by this object (all events bound to it as target).
---@param inputContext any
function YarderTowerSetupActivatable:removeCustomInput(inputContext) end

--- Input callback: if the main rope is active it deactivates the target; otherwise, when allowed, enters setup mode, else shows the returned warning for 2000 ms.
function YarderTowerSetupActivatable:onToggleSetupMode() end

--- Input callback: calls `setYarderTargetActive(true)` to confirm the target tree and activate the main rope.
function YarderTowerSetupActivatable:onSetTarget() end

--- Sets the toggle text (cancel, remove or start setup) from the yarder state, and enables the set-target action only in setup mode with a valid main rope.
function YarderTowerSetupActivatable:updateActionEventTexts() end

--- Returns whether the player is within the yarder setup range, via `getIsPlayerInYarderRange`.
function YarderTowerSetupActivatable:getIsActivatable() end

--- Empty hook; nothing happens when the activatable becomes the selected one.
function YarderTowerSetupActivatable:activate() end

--- Empty hook; nothing happens when the activatable stops being the selected one.
function YarderTowerSetupActivatable:deactivate() end

--- Returns the 3D distance to `controlTriggerNode`, or `math.huge` if that node is nil.
---@param x any
---@param y any
---@param z any
function YarderTowerSetupActivatable:getDistance(x, y, z) end

--- Empty hook; this activatable draws nothing on screen.
function YarderTowerSetupActivatable:draw() end
