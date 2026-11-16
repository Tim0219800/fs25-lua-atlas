---@meta
-- FS25 1.25.1.0 : vehicles/specializations/activatables/YarderTowerControlActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable for operating the carriage of a yarder tower (cable logging): follow modes, manual move and lift, attach and detach trees. Selected when the player is within the vehicle's control range. Behaviour of the called methods lives in the YarderTower specialization (UNVERIFIED, not in this file).
---@class YarderTowerControlActivatable
YarderTowerControlActivatable = {}

--- Creates the activatable for a yarder tower vehicle with an empty prompt text.
---@param vehicle table
---@return table
function YarderTowerControlActivatable.new(vehicle) end

--- Registers the yarder carriage action events (follow me, follow home, follow pickup, left/right move, up/down lift, attach, detach) at very high priority, sets their texts, then calls `updateActionEventTexts`.
---@param inputContext any
function YarderTowerControlActivatable:registerCustomInput(inputContext) end

--- Removes every input action event registered by this object (all events bound to it as target).
---@param inputContext any
function YarderTowerControlActivatable:removeCustomInput(inputContext) end

--- Input callback: toggles the carriage follow-me mode; sets `FOLLOW_MODE_NONE` if already following the player, otherwise `FOLLOW_MODE_ME`.
function YarderTowerControlActivatable:onToggleFollowMeMode() end

--- Input callback: sets the carriage follow mode to `FOLLOW_MODE_HOME` (return toward the tower).
function YarderTowerControlActivatable:onToggleFollowHome() end

--- Input callback: sets the carriage follow mode to `FOLLOW_MODE_PICKUP` (move to the stored pickup position).
function YarderTowerControlActivatable:onToggleFollowPickup() end

--- Input callback: passes the input value to `setYarderCarriageMoveInput` for manual carriage movement along the rope.
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function YarderTowerControlActivatable:onManualControlLeftRight(actionName, inputValue, callbackState, isAnalog, isMouse) end

--- Input callback: passes the input value to `setYarderCarriageLiftInput` to raise or lower the carriage load.
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function YarderTowerControlActivatable:onManualControlUpDown(actionName, inputValue, callbackState, isAnalog, isMouse) end

--- Input callback: calls `onYarderCarriageAttach` on the vehicle to hook trees near the carriage.
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function YarderTowerControlActivatable:onTreeAttach(actionName, inputValue, callbackState, isAnalog, isMouse) end

--- Input callback: calls `onYarderCarriageDetach` with the input value to release the attached trees.
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function YarderTowerControlActivatable:onTreeDetach(actionName, inputValue, callbackState, isAnalog, isMouse) end

--- Per frame, if a carriage vehicle exists: enables attach only with a tree in mount range, and detach and lift/lower only when trees are attached.
---@param dt any
function YarderTowerControlActivatable:update(dt) end

--- Refreshes the follow-me text, and enables follow-home/follow-pickup only when no follow mode is active and the carriage is more than 5 (rope-length units, metres presumably) from the target.
function YarderTowerControlActivatable:updateActionEventTexts() end

--- Returns whether the player is inside the yarder control range, via `getIsPlayerInYarderControlRange`.
function YarderTowerControlActivatable:getIsActivatable() end

--- Empty hook; nothing happens when the activatable becomes the selected one.
function YarderTowerControlActivatable:activate() end

--- Empty hook; nothing happens when the activatable stops being the selected one.
function YarderTowerControlActivatable:deactivate() end

--- Returns the distance computed by `getIsPlayerInYarderControlRange` (the point argument is ignored).
---@param x any
---@param y any
---@param z any
function YarderTowerControlActivatable:getDistance(x, y, z) end

--- Empty hook; this activatable draws nothing on screen.
function YarderTowerControlActivatable:draw() end
