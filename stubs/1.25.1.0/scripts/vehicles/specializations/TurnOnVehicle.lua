---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TurnOnVehicle.lua (generated stub, FS25 Lua Atlas)

--- Specialization for implements and machines that have an on/off state (PTO-driven tools, conveyors, etc.). It keeps `spec_turnOnVehicle.isTurnedOn`, syncs it through `SetTurnedOnEvent`, raises `onTurnedOn`/`onTurnedOff`, and plays sounds, effects, animation nodes and animations on the client. It also overwrites many functions of other specializations (work areas, discharge nodes, alarm triggers, shovel nodes, AI) so that they depend on the turned-on state. No prerequisites; it uses AnimatedVehicle only if present.
---@class TurnOnVehicle
TurnOnVehicle = {}

--- Always returns true: the specialization has no prerequisites.
---@param specializations any
function TurnOnVehicle.prerequisitesPresent(specializations) end

--- Registers the XML schema paths under `vehicle.turnOnVehicle` (toggle button, texts, always-on flags, animation nodes, effects, sounds, animations, turned-on speed, dashboards) and the extra attributes added on attacher joints, work areas, alarm triggers, shovel and discharge nodes.
function TurnOnVehicle.initSpecialization() end

--- Registers the two vehicle events `onTurnedOn` and `onTurnedOff`.
---@param vehicleType any
function TurnOnVehicle.registerEvents(vehicleType) end

--- Adds the public functions of this specialization to the vehicle type (setIsTurnedOn, getIsTurnedOn, getCanBeTurnedOn, getTurnedOnSpeedFactor, and so on).
---@param vehicleType any
function TurnOnVehicle.registerFunctions(vehicleType) end

--- Registers the overrides of functions owned by other specializations (work area, discharge node, alarm trigger, shovel, AI continuation, power take-off, bunker silo compacter, work mode, and others).
---@param vehicleType any
function TurnOnVehicle.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to the vehicle lifecycle events (load, delete, streams, update, action events, attach/detach, root vehicle change) and to its own turn on/off events.
---@param vehicleType any
function TurnOnVehicle.registerEventListeners(vehicleType) end

--- Reads the XML settings (toggle input, texts, always-on, turn-off rules, AI flags). On the client it also loads animation nodes, turn-on animations, activatable fill units, effects, sounds and the turned-on speed simulation. Removes the onDelete/onUpdate listeners on a pure server. Note: the default of `varianceSpeed` is 0.01 in code while the schema documents 1.
---@param savegame table
function TurnOnVehicle:onLoad(savegame) end

--- Registers the two dashboard value types `turnOnVehicle.turnedOn` (boolean state) and `turnOnVehicle.rpm` (turned-on speed mapped between minRpm and maxRpm).
function TurnOnVehicle:onRegisterDashboardValueTypes() end

--- Client only: deletes the sound samples, animation nodes and effects created on load.
function TurnOnVehicle:onDelete() end

--- Client join: reads the turned-on boolean sent by the server and applies it with `setIsTurnedOn` without re-sending an event.
---@param streamId integer
---@param connection Connection
function TurnOnVehicle:onReadStream(streamId, connection) end

--- Server side on join: writes the current `isTurnedOn` boolean into the stream.
---@param streamId integer
---@param connection Connection
function TurnOnVehicle:onWriteStream(streamId, connection) end

--- Drives the fade of each turned-on animation (speed ramps up or down by dt and the animation is stopped at zero speed). On the client it also simulates the turned-on speed (`alpha`) with a small time-based variance, used for sound and rpm dashboards.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TurnOnVehicle:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client: refreshes the toggle action event text/state unless always on or driven by the attacher. Server: when `turnOffIfNotAllowed` is set and the vehicle cannot be turned on, turns it off, or else turns off a turned-on attacher vehicle.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TurnOnVehicle:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Changes the turned-on state. When the value changes it sends `SetTurnedOnEvent` (unless `noEventSend`), raises onTurnedOn/onTurnedOff, notifies the root vehicle with a TURN_ON/TURN_OFF state change and updates the dashboard value.
---@param isTurnedOn boolean
---@param noEventSend boolean
function TurnOnVehicle:setIsTurnedOn(isTurnedOn, noEventSend) end

--- Client: plays the turn-on animation, start sample and work samples, and starts animation nodes and effects. Also switches to the discharge node flagged `turnOnActivateNode`, remembering the previous one.
function TurnOnVehicle:onTurnedOn() end

--- Client: plays the turn-off animation and stop sample, stops work sounds, animation nodes and effects. Restores the discharge node that was current before turn-on, if one was saved.
function TurnOnVehicle:onTurnedOff() end

--- Returns true if the vehicle is always turned on or currently switched on.
---@return boolean
function TurnOnVehicle:getIsTurnedOn() end

--- Returns false for always-on vehicles, when the input attacher joint forbids turn on, or when the vehicle is not powered (`getIsPowered`); true otherwise.
---@return boolean
function TurnOnVehicle:getCanBeTurnedOn() end

--- Returns true only if every child vehicle of the root vehicle that has `getCanBeTurnedOn` reports it can be turned on.
---@return boolean
function TurnOnVehicle:getCanBeTurnedOnAll() end

--- Returns whether the player may toggle the state: false when always on or when turned on by the attacher vehicle.
---@return boolean
function TurnOnVehicle:getCanToggleTurnedOn() end

--- Returns the localized warning text `warning_attachToPower` when the vehicle is not powered, otherwise nil.
---@return string
function TurnOnVehicle:getTurnedOnNotAllowedWarning() end

--- Returns the `aiRequiresTurnOn` XML flag (whether the AI must switch this implement on).
function TurnOnVehicle:getAIRequiresTurnOn() end

--- Returns the `requiresTurnOn` XML flag (documented in the schema as mobile-only).
function TurnOnVehicle:getRequiresTurnOn() end

--- Returns false by default; other specializations can overwrite it to force a turn-off on the headland.
function TurnOnVehicle:getAIRequiresTurnOffOnHeadland() end

--- Reads one `turnedOnAnimation` entry (name, fade times converted to ms, speed scale) into the given table. Returns false with a warning if the name is missing.
---@param xmlFile any
---@param key any
---@param turnedOnAnimation any
function TurnOnVehicle:loadTurnedOnAnimationFromXML(xmlFile, key, turnedOnAnimation) end

--- Returns true when the vehicle is turned on; the animation argument is not used here, so subclasses can refine the condition.
---@param turnedOnAnimation any
function TurnOnVehicle:getIsTurnedOnAnimationActive(turnedOnAnimation) end

--- Override: also returns true when the vehicle is turned on.
---@param superFunc any
function TurnOnVehicle:getUseTurnedOnSchema(superFunc) end

--- Override: after the base loading, reads `#canBeTurnedOn` (default true) onto the input attacher joint.
---@param superFunc table
---@param xmlFile any
---@param key any
---@param inputAttacherJoint any
---@param i any
function TurnOnVehicle:loadInputAttacherJoint(superFunc, xmlFile, key, inputAttacherJoint, i) end

--- Override: reads `#needsSetIsTurnedOn` (default true) for each work area.
---@param superFunc table
---@param workArea table
---@param xmlFile XMLFile
---@param key string
function TurnOnVehicle:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Override: a work area flagged `needsSetIsTurnedOn` is inactive while the vehicle is off; otherwise defers to the previous implementation.
---@param superFunc table
---@param workArea table
---@return boolean
function TurnOnVehicle:getIsWorkAreaActive(superFunc, workArea) end

--- Override: the AI may continue only if the base check passes and, when the implement needs turn on, is in line and can be turned on, the implement is actually on. On the headland it always allows continuing.
---@param superFunc any
---@param isTurning any
---@return boolean
function TurnOnVehicle:getCanAIImplementContinueWork(superFunc, isTurning) end

--- Override: returns true whenever the vehicle is turned on, else the previous result.
---@param superFunc any
---@return boolean
function TurnOnVehicle:getIsOperating(superFunc) end

--- Override: an alarm trigger flagged `needsTurnOn` is forced inactive while the vehicle is off.
---@param superFunc any
---@param alarmTrigger any
function TurnOnVehicle:getAlarmTriggerIsActive(superFunc, alarmTrigger) end

--- Override: after base loading, reads `#needsTurnOn` and `#turnOffInTrigger` (both default false) on the alarm trigger.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param alarmTrigger any
---@param fillUnit any
function TurnOnVehicle:loadAlarmTrigger(superFunc, xmlFile, key, alarmTrigger, fillUnit) end

--- Override: fill units listed as activatable are inactive while the vehicle is off.
---@param superFunc any
---@param fillUnitIndex any
function TurnOnVehicle:getIsFillUnitActive(superFunc, fillUnitIndex) end

--- Override: after base loading, reads `#needsActivation` into `shovelNode.needsActiveVehicle`. Always returns true.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param shovelNode any
function TurnOnVehicle:loadShovelNode(superFunc, xmlFile, key, shovelNode) end

--- Override: a shovel node that needs activation is inactive while the vehicle is off.
---@param superFunc any
---@param shovelNode any
function TurnOnVehicle:getShovelNodeIsActive(superFunc, shovelNode) end

--- Override: changing the seed is allowed only while the vehicle is turned off (and the base rule allows it).
---@param superFunc any
function TurnOnVehicle:getIsSeedChangeAllowed(superFunc) end

--- Override: always returns true, so these implements can be selected regardless of base rules.
---@param superFunc any
function TurnOnVehicle:getCanBeSelected(superFunc) end

--- Override: the power take-off counts as active when the vehicle is turned on or the base says so.
---@param superFunc any
function TurnOnVehicle:getIsPowerTakeOffActive(superFunc) end

--- Override: after base loading, reads `#needsSetIsTurnedOn` and `#turnOnActivateNode` (both default false); a node with the latter flag becomes `activateableDischargeNode`.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function TurnOnVehicle:loadDischargeNode(superFunc, xmlFile, key, entry) end

--- Override: a discharge node that needs turn on is inactive while the vehicle is off.
---@param superFunc any
---@param dischargeNode any
function TurnOnVehicle:getIsDischargeNodeActive(superFunc, dischargeNode) end

--- Override: after base loading, reads `#turnedOnCompactingScale` into the bunker silo compacter spec (nil if absent).
---@param superFunc any
---@param xmlFile any
---@param key any
function TurnOnVehicle:loadBunkerSiloCompactorFromXML(superFunc, xmlFile, key) end

--- Override: returns the turned-on compacting scale while the vehicle is on and the value is defined, otherwise the base scale.
---@param superFunc any
function TurnOnVehicle:getBunkerSiloCompacterScale(superFunc) end

--- Override: refuses a work mode change while turned on if the work mode spec has `allowChangeWhileTurnedOn` set to false.
---@param superFunc any
function TurnOnVehicle:getIsWorkModeChangeAllowed(superFunc) end

--- Client: when active for input and toggling is allowed, registers the toggle action (high text priority) and the hidden `TURN_ON_ALL_IMPLEMENTS` action, both as powered action events.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function TurnOnVehicle:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Registers the external (outside-vehicle trigger) action named `turnOn` with its register and update callbacks.
---@param trigger any
---@param name any
---@param xmlFile any
---@param key any
function TurnOnVehicle:onRegisterExternalActionEvents(trigger, name, xmlFile, key) end

--- When an alarm trigger becomes active and has `turnOffInTrigger`, turns the vehicle off locally without sending an event.
---@param alarmTrigger any
---@param state any
function TurnOnVehicle:onAlarmTriggerChanged(alarmTrigger, state) end

--- Turns the vehicle off (no event sent) when it breaks.
function TurnOnVehicle:onSetBroken() end

--- On MOTOR_TURN_OFF, turns the vehicle off locally if it can no longer be turned on (for example lost power).
---@param state any
---@param data any
function TurnOnVehicle:onStateChange(state, data) end

--- Turns the vehicle off locally when it is deactivated and `turnOffOnDeactivate` is set (default true except on mobile).
function TurnOnVehicle:onDeactivate() end

--- If `turnedOnByAttacherVehicle` is set, copies the attacher vehicle's turned-on state onto this implement, without an event.
---@param attacherVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
function TurnOnVehicle:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Turns the implement off locally just before it is detached.
---@param attacherVehicle table
---@param implement table
function TurnOnVehicle:onPreDetach(attacherVehicle, implement) end

--- Registers or re-parents the `turnOn` action in the root vehicle's action controller (saved, with AI event listeners to turn on at line start and off at end/block/transport). Removes the action if there is no controller or toggling is not allowed.
---@param rootVehicle table
function TurnOnVehicle:onRootVehicleChanged(rootVehicle) end

--- Action controller callback: direction above 0 turns on if allowed and returns whether it worked; otherwise turns off and returns true if now off.
---@param self any
---@param direction any
function TurnOnVehicle.actionControllerTurnOnEvent(self, direction) end

--- Input callback for the toggle key: flips the state if toggling and turning on are allowed, otherwise shows the blinking not-allowed warning (2 s) when the vehicle is off.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function TurnOnVehicle.actionEventTurnOn(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback for turn-on-all: if every child vehicle can be turned on, flips the state of each child that has `setIsTurnedOn`; otherwise shows the warning if this vehicle is off.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function TurnOnVehicle.actionEventTurnOnAll(self, actionName, inputValue, callbackState, isAnalog) end

--- Updates the toggle action event: sets the turn-on or turn-off text and its active state from `getCanToggleTurnedOn`.
---@param self any
function TurnOnVehicle.updateActionEvents(self) end

--- Registers the external toggle action; when pressed it first tries to start the motor via `Motorized.tryStartMotor`, then runs the normal toggle callback.
---@param data any
---@param vehicle any
function TurnOnVehicle.externalActionEventRegister(data, vehicle) end

--- Updates the external toggle action's text and active state according to whether the vehicle is on and can be toggled.
---@param data any
---@param vehicle any
function TurnOnVehicle.externalActionEventUpdate(data, vehicle) end

--- Returns the simulated turned-on speed factor (`alpha`, around 0 to 1 with slight variance). Client only: the table is not created on a pure server.
function TurnOnVehicle:getTurnedOnSpeedFactor() end

--- Dashboard attribute loader: reads `#minRpm` (default 0) and `#maxRpm` (default 1000) onto the dashboard entry. Returns true.
---@param self any
---@param xmlFile any
---@param key any
---@param dashboard any
---@param isActive any
function TurnOnVehicle.dashboardRpmAttributes(self, xmlFile, key, dashboard, isActive) end

--- Dashboard value: interpolates between minRpm and maxRpm using the turned-on speed factor.
---@param self any
---@param dashboard any
function TurnOnVehicle.dashboardRpmValue(self, dashboard) end
