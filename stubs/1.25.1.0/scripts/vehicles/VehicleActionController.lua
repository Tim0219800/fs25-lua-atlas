---@meta
-- FS25 1.25.1.0 : vehicles/VehicleActionController.lua (generated stub, FS25 Lua Atlas)

--- Per-vehicle controller for "controlled actions": a set of prioritized actions (fold, lower, turn on...) that the player triggers together with one key (`InputAction.VEHICLE_ACTION_CONTROL`). It keeps the list of `VehicleActionControllerAction` objects, runs them as an ordered sequence (reversed when going back), saves/restores the last direction in the savegame and offers a debug overlay. Only the root vehicle of a vehicle chain registers the input.
---@class VehicleActionController
VehicleActionController = {}

--- Creates the controller for a vehicle with empty action lists, `lastDirection` = -1 and no pending reactivation. Accepts an optional custom metatable.
---@param vehicle any
---@param customMt any
function VehicleActionController.new(vehicle, customMt) end

--- Writes `#lastDirection`, `#numActions` and, for each action whose `getIsSaved()` is true, its name, identifier and last direction under `action(i)`. Writes nothing when there are no actions.
---@param xmlFile any
---@param key any
---@param usedModNames any
function VehicleActionController:saveToXMLFile(xmlFile, key, usedModNames) end

--- Reads the saved direction and action list from the savegame XML (skipped if `resetVehicles`) and stores the load time. If no saved action has a positive direction, the loaded list is discarded.
---@param savegame any
function VehicleActionController:load(savegame) end

--- Creates a `VehicleActionControllerAction` with name, input action and priority, adds it to the controller and returns it so the caller can configure callbacks.
---@param name any
---@param inputAction any
---@param prio any
function VehicleActionController:registerAction(name, inputAction, prio) end

--- Appends an action, rebuilds the priority-sorted lists, flags the actions as dirty (so they get aligned with the controller direction in `update`) and requests an action-event refresh on the vehicle.
---@param action any
function VehicleActionController:addAction(action) end

--- Removes an action. If automatic vehicle control is enabled on the platform and the action was on, it is first toggled back when it resets on deactivation. Resets the direction when the last action is gone.
---@param action any
function VehicleActionController:removeAction(action) end

--- Groups actions into buckets by identical priority and builds two sorted copies: highest priority first (`sortedActions`) and lowest first (`sortedActionsRev`).
function VehicleActionController:updateSortedActions() end

--- Called when the vehicle becomes active. For the root vehicle with a pending reactivation, flips the direction and replays the sequence so actions switched off by deactivation (e.g. turn on) are restored.
function VehicleActionController:activate() end

--- Called when the vehicle is deactivated. For the root vehicle, if the last direction was positive it marks a pending reactivation instead of undoing the actions, to keep folding and lowered states.
function VehicleActionController:deactivate() end

--- For the root vehicle with actions, clears and re-registers the per-action events and registers the `VEHICLE_ACTION_CONTROL` input event with `actionSequenceEvent`, replacing any previous one.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function VehicleActionController:registerActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback that triggers the actions at index `actionIndex` through `doAction`. Other parameters are unused.
---@param actionName any
---@param inputValue any
---@param actionIndex any
---@param isAnalog any
function VehicleActionController:actionEvent(actionName, inputValue, actionIndex, isAnalog) end

--- Executes every action in one priority bucket (from the optional custom table or the default one) with the given direction. Returns true if at least one succeeded.
---@param actionIndex any
---@param customTable any
---@param direction any
function VehicleActionController:doAction(actionIndex, customTable, direction) end

--- Input handler for the controlled-actions key. Does nothing right after loading, when actions are not accessible, not available or not allowed (a blinking warning may be shown); otherwise starts the sequence.
function VehicleActionController:actionSequenceEvent() end

--- Starts a sequence in the direction opposite to the last one (high to low priority when positive). Unless `force`, if all actions already sit in the target state it flips direction. Mid-sequence calls reverse the index. Stops if nothing could run.
---@param force any
function VehicleActionController:startActionSequence(force) end

--- Advances to the next priority bucket and executes it; ends the sequence after the last one, and recurses immediately if the bucket executed nothing.
function VehicleActionController:continueActionSequence() end

--- Clears the current sequence state (actions list, index and max index).
function VehicleActionController:stopActionSequence() end

--- Returns the action bucket at the given index, from the custom table if provided, otherwise from the controller's priority list.
---@param actionIndex any
---@param customTable any
function VehicleActionController:getActionsByIndex(actionIndex, customTable) end

--- True only if there is at least one action and every action reports `isAvailable()`.
function VehicleActionController:getAreControlledActionsAvailable() end

--- True only if there is at least one action and every action reports `isAccessible()`. Note: `VehicleActionControllerAction:isAccessible` is not defined in this dump (only the setter exists), UNVERIFIED elsewhere.
function VehicleActionController:getAreControlledActionsAccessible() end

--- Returns the icons (positive, negative, change-colour flag) of the first action that defines them, or nil.
function VehicleActionController:getControlledActionIcons() end

--- Starts the action sequence, unless savegame actions are still being re-applied.
function VehicleActionController:playControlledActions() end

--- Resets the stored direction to -1 (off state) without running any action.
function VehicleActionController:resetCurrentState() end

--- Returns the direction the next sequence would take, i.e. the negation of the last direction.
function VehicleActionController:getActionControllerDirection() end

--- Per-frame update: advances the running sequence when the current bucket is finished, updates each action, re-applies the savegame state about 500 ms after load once the motor is started, and aligns newly added actions with the controller direction.
---@param dt any
function VehicleActionController:update(dt) end

--- Forwards the AI update to every action.
---@param dt any
function VehicleActionController:updateForAI(dt) end

--- Forwards an AI event name to the actions whose source vehicle matches `sourceVehicle`.
---@param sourceVehicle any
---@param eventName any
function VehicleActionController:onAIEvent(sourceVehicle, eventName) end

--- Draws debug text lists of all actions and of the current sequence, highlighting the running step (green done, orange current). Uses `renderText` directly.
function VehicleActionController:drawDebugRendering() end

--- Registers the savegame XML schema paths: `#lastDirection`, `#numActions` and `action(?)` with `#name`, `#identifier`, `#lastDirection` under the given base path.
---@param schema any
---@param basePath any
function VehicleActionController.registerXMLPaths(schema, basePath) end
