---@meta
-- FS25 1.25.1.0 : vehicles/specializations/PushHandTool.lua (generated stub, FS25 Lua Atlas)

--- Registers the XML schema under vehicle.pushHandTool (raycast nodes and smoothing, wheels, handle limits, spine, IK chains, effects, drive mode, custom chain limits, conditional animation) and the savegame driveModeIsActive key.
function PushHandTool.initSpecialization() end

--- Returns true only if the Enterable specialization is present.
---@param specializations table
---@return boolean
function PushHandTool.prerequisitesPresent(specializations) end

--- Registers getRaycastPosition, playerRaycastCallback, postAnimationUpdate, customVehicleCharacterLoaded and setPushHandToolDriveMode on the vehicle type.
---@param vehicleType any
function PushHandTool.registerFunctions(vehicleType) end

--- Overrides setVehicleCharacter, deleteVehicleCharacter, getAllowCharacterVisibilityUpdate, setActiveCameraIndex and getIsFoldAllowed.
---@param vehicleType any
function PushHandTool.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, post load, delete, stream read/write, update stream read/write, update, action events, enter vehicle, camera changed and vehicle character changed events.
---@param vehicleType any
function PushHandTool.registerEventListeners(vehicleType) end

--- Reads all XML settings, builds animation parameters, the player target node, wheel lists, handle, spine, IK targets, cutter effects (client), custom chain limits and drive mode (stores base motor speed and gear ratio). Sets a grass test area requirement and registers a post animation callback.
---@param savegame any
function PushHandTool:onLoad(savegame) end

--- If the savegame says drive mode was active, re-enables it without an event and fast-forwards its animation.
---@param savegame any
function PushHandTool:onPostLoad(savegame) end

--- Deletes the cutter effects and removes the post animation callback.
function PushHandTool:onDelete() end

--- Saves the drive mode state, only when a drive mode animation name is configured.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PushHandTool:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client on join: reads the drive mode bool, applies it without an event and fast-forwards the animation.
---@param streamId integer
---@param connection Connection
function PushHandTool:onReadStream(streamId, connection) end

--- Server on join: writes the drive mode state.
---@param streamId integer
---@param connection Connection
function PushHandTool:onWriteStream(streamId, connection) end

--- Client: reads whether cutter effects run, plus fruit type and growth state when they do, and stops the effects when they ended.
---@param streamId integer
---@param timestamp integer
---@param connection table
function PushHandTool:onReadUpdateStream(streamId, timestamp, connection) end

--- Server: writes the effects-running flag, with fruit growth state (4 bits) and fruit type when running.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function PushHandTool:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Per frame: drives cutter effects (server decides from the mower's last cut, client follows the stream), computes smoothed wheel speed for conditional animation parameters and updates the character animation, adjusts the spine target by direction, and moves the player node behind the tool using the two raycasts, wheel slope and smoothing. If raycasts fail while entered, hides the character and forces an outside camera.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function PushHandTool:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- On clients with a drive mode character, registers the IMPLEMENT_EXTRA4 powered action to toggle drive mode when active for input.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function PushHandTool:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback that toggles drive mode by calling setPushHandToolDriveMode without argument.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function PushHandTool.actionEventToggleDriveMode(self, actionName, inputValue, callbackState, isAnalog) end

--- Overridden: reloads the normal vehicle character with customVehicleCharacterLoaded as callback, and loads the drive mode character when a player style is given. Note: the parent function is never called.
---@param superFunc any
---@param playerStyle any
function PushHandTool:setVehicleCharacter(superFunc, playerStyle) end

--- Overridden: calls the parent, then also unloads the drive mode character.
---@param superFunc any
function PushHandTool:deleteVehicleCharacter(superFunc) end

--- Character load callback. On success it raises onVehicleCharacterChanged, duplicates the IK chain nodes into helper transform groups, applies custom joint limits, assigns the IK targets and solvers (40 iterations), registers the conditional animation parameters and initialises the animation from vehicle.pushHandTool.playerConditionalAnimation.
---@param loadingState any
---@param arguments any
function PushHandTool:customVehicleCharacterLoaded(loadingState, arguments) end

--- Callback for the drive mode character: on success, shows it unless the camera is inside and updates its IK chains.
---@param self any
---@param loadingState any
---@param arguments any
function PushHandTool.driveModeVehicleCharacterLoaded(self, loadingState, arguments) end

--- Sets or toggles (nil) drive mode. On change: swaps motor max forward speed and min gear ratio, updates cruise control limits, plays the animation, folds the tool and hides the normal character. Always sends PushHandToolDriveModeEvent unless noEventSend, even if unchanged.
---@param driveModeState any
---@param noEventSend any
function PushHandTool:setPushHandToolDriveMode(driveModeState, noEventSend) end

--- Overridden: false when the parent refuses, when entered with an inside camera, when raycasts are invalid, or while drive mode is active or animating with its own character. Otherwise true.
---@param superFunc any
function PushHandTool:getAllowCharacterVisibilityUpdate(superFunc) end

--- Overridden: while raycasts are invalid, replaces an inside camera index by the first outside camera before calling the parent.
---@param superFunc any
---@param index any
function PushHandTool:setActiveCameraIndex(superFunc, index) end

--- Overridden: returns false while drive mode is active, else the parent result.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function PushHandTool:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Hides the character when controlling with an inside camera or when the raycasts are invalid.
---@param isControlling any
function PushHandTool:onEnterVehicle(isControlling) end

--- When entered, hides the normal character for an inside camera and sets the drive mode character visible only for outside cameras.
---@param activeCamera any
---@param camIndex any
function PushHandTool:onCameraChanged(activeCamera, camIndex) end

--- When entered with an inside camera, hides the new character. When the character is removed, clears the IK node copies and the spine node.
---@param character any
function PushHandTool:onVehicleCharacterChanged(character) end

--- Callback run after animations while active: tilts the handle from the hand-to-target distance within its limits, applies the spine rotation split by ratio over three spine nodes, then (outside drive mode) updates the IK chains, copies the duplicated IK node transforms back and applies the chain poses.
---@param dt any
function PushHandTool:postAnimationUpdate(dt) end

--- Casts a 2 m ray down from the node (slightly steepened along world Y) against the player collision mask. Returns the hit x, y, z and distance, or nil when nothing valid is hit (distance above 0.35 and hit lower than 0.25 below the node).
---@param node any
function PushHandTool:getRaycastPosition(node) end

--- Raycast callback: ignores hits on this vehicle (returns true to continue), otherwise stores the hit position and distance and stops the ray by returning false.
---@param hitObjectId any
---@param x any
---@param y any
---@param z any
---@param distance any
function PushHandTool:playerRaycastCallback(hitObjectId, x, y, z, distance) end
