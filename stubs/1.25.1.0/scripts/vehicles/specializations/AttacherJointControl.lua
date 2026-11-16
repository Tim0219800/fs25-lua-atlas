---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AttacherJointControl.lua (generated stub, FS25 Lua Atlas)

--- Specialization for implements whose attacher joint height and tilt can be adjusted continuously by the player (analog axis or lift/lower key) instead of a simple up/down toggle. It requires Attachable and reads its settings from vehicle.attacherJointControl in the XML (max tilt angle, optional Y damping, one control entry per axis, hydraulic sound). It changes the tractor-side joint while attached, backs up and restores the joint's values on detach, and synchronises the control values in multiplayer with 0..1 alpha values compressed into a stream. The ALPHA_NUM_BITS and ALPHA_MAX_VALUE constants are not visible in this dump (UNVERIFIED).
---@class AttacherJointControl
AttacherJointControl = {}

--- Prerequisite check: returns true only if the vehicle type already includes the Attachable specialization.
---@param specializations table
---@return boolean
function AttacherJointControl.prerequisitesPresent(specializations) end

--- Declares the XML schema for vehicle.attacherJointControl (tilt angle, damping, control entries with function, axis, icon, invert and mouse factor, hydraulic sound) and the isControllable flag on input attacher joints and their configurations.
function AttacherJointControl.initSpecialization() end

--- Registers the functions added by this specialization: controlAttacherJoint, controlAttacherJointHeight, controlAttacherJointTilt, getControlAttacherJointDirection and getIsAttacherJointControlDampingAllowed.
---@param vehicleType any
function AttacherJointControl.registerFunctions(vehicleType) end

--- Registers overrides of Attachable functions: loadInputAttacherJoint, registerLoweringActionEvent, getLoweringActionEventState and getCanBeSelected.
---@param vehicleType any
function AttacherJointControl.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, delete, stream read/write, update, action event registration, post-attach and pre-detach events.
---@param vehicleType any
function AttacherJointControl.registerEventListeners(vehicleType) end

--- Loads the max tilt angle, damping options and each control entry (function name, input action, icon, invert, mouse factor). An unknown function or axis logs a warning and stops loading further controls. Loads the hydraulic sound on the client, creates two dirty flags, and removes most listeners when no control exists.
---@param savegame table
function AttacherJointControl:onLoad(savegame) end

--- Deletes the hydraulic sound sample on the client.
function AttacherJointControl:onDelete() end

--- Client side on join: when the server flag is set, reads the stored alpha of every control and applies it with controlAttacherJoint without sending events.
---@param streamId integer
---@param connection Connection
function AttacherJointControl:onReadStream(streamId, connection) end

--- Server side on join: writes whether a joint is currently controlled and, if so, the alpha of each control.
---@param streamId integer
---@param connection Connection
function AttacherJointControl:onWriteStream(streamId, connection) end

--- Reads incoming alpha values of every control from the update stream, from client to server or from server to client, and applies them without re-sending events.
---@param streamId integer
---@param timestamp integer
---@param connection table
function AttacherJointControl:onReadUpdateStream(streamId, timestamp, connection) end

--- Writes the alpha of every control when the dirty flag matching the direction is set: the client flag when sending to the server, the server flag (damping changes) when sending to clients.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function AttacherJointControl:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Per-frame update. Moves the height alpha toward its target at the joint's move speed. On the server, with damping enabled, it also compensates vertical velocity at the damping reference point and can nudge the tilt. Plays the hydraulic sound for a short time after the last move. Note: spec.samples and spec.lastMoveTime are only set on the client, so a server without a client part may fail here (UNVERIFIED).
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AttacherJointControl:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Sets a control's alpha. On the server it calls the control function, updates the joint rotation and joint frame. It stores the clamped 0..1 value, records the manual time for damping, and raises a client or server dirty flag when the change is large enough, unless noEventSend is set.
---@param control table
---@param moveAlpha number
---@param automaticControl any
---@param noEventSend any
function AttacherJointControl:controlAttacherJoint(control, moveAlpha, automaticControl, noEventSend) end

--- Height control function: clamps the alpha between the joint's upper and lower alpha, updates the attacher joint rotation nodes and rotation, and returns the limited alpha. Uses the joint's current alpha when called with nil.
---@param moveAlpha number
---@return number
function AttacherJointControl:controlAttacherJointHeight(moveAlpha) end

--- Tilt control function: clamps the alpha to 0..1 (0.5 when nil), converts it to an angle around neutral using the max tilt angle, and offsets the joint's upper and lower rotation offsets from their backups. Returns the limited alpha.
---@param moveAlpha number
---@return number
function AttacherJointControl:controlAttacherJointTilt(moveAlpha) end

--- Returns true when the next lift/lower press should lower the implement: based on the current target if one is set, else on whether the height is closer to the upper position.
---@return boolean
function AttacherJointControl:getControlAttacherJointDirection() end

--- Returns whether Y damping may run: false if the attacher vehicle's last speed is below 0.5 or the implement is not moving forward.
---@return boolean
function AttacherJointControl:getIsAttacherJointControlDampingAllowed() end

--- Override: after the base loads an input attacher joint, also reads its isControllable flag. Returns false if the base fails.
---@param superFunc table
---@param xmlFile any
---@param key any
---@param inputAttacherJoint any
---@param i any
function AttacherJointControl:loadInputAttacherJoint(superFunc, xmlFile, key, inputAttacherJoint, i) end

--- Override: when a height controller exists, registers the lift/lower action with the set-point callback and high text priority, and stops there if the requested action is the lowering action. Otherwise defers to the base.
---@param superFunc any
---@param actionEventsTable any
---@param inputAction any
---@param target any
---@param callback any
---@param triggerUp any
---@param triggerDown any
---@param triggerAlways any
---@param startActive any
---@param callbackState any
---@param customIconName any
function AttacherJointControl:registerLoweringActionEvent(superFunc, actionEventsTable, inputAction, target, callback, triggerUp, triggerDown, triggerAlways, startActive, callbackState, customIconName) end

--- Override: with a height controller, the action is shown only while a joint is controlled and its text says lower or lift according to the control direction; otherwise defers to the base.
---@param superFunc any
function AttacherJointControl:getLoweringActionEventState(superFunc) end

--- Override: the vehicle can always be selected; returns true.
---@param superFunc any
function AttacherJointControl:getCanBeSelected(superFunc) end

--- Client only: clears the action events and, when the vehicle is active for input and a joint is controlled, registers one powered analog action event per control using its input action and axis icon.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function AttacherJointControl:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- If the active input joint is controllable and the tractor joint has a height range, disables its normal lowering, backs up its rotation offsets, stores it as the controlled joint and resets the controls. It then lifts the implement (targets upper alpha, or applies it at once when loaded from a savegame).
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
---@param loadFromSavegame any
function AttacherJointControl:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- Before detaching, restores the tractor joint's allowsLowering flag and rotation offsets from their backups and clears the controlled joint.
---@param attacherVehicle table
---@param implement table
function AttacherJointControl:onPreDetach(attacherVehicle, implement) end

--- Input callback for an analog control axis: scales the input by the mouse factor (and a fixed 0.025), inverts it if configured, applies it to the control's alpha as a manual change and cancels any height target.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AttacherJointControl.actionEventAttacherJointControl(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback for the lift/lower key: sets the height target to the lower or upper alpha depending on the current direction and delays damping updates by the joint's move time.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AttacherJointControl.actionEventAttacherJointControlSetPoint(self, actionName, inputValue, callbackState, isAnalog) end
