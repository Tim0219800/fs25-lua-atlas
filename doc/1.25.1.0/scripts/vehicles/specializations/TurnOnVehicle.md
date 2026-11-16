# vehicles/specializations/TurnOnVehicle.lua

*[Version française](../../../fr/scripts/vehicles/specializations/TurnOnVehicle.md)*

Source: `dataS/scripts/vehicles/specializations/TurnOnVehicle.lua` — FS25 1.25.1.0

✍ Specialization for implements and machines that have an on/off state (PTO-driven tools, conveyors, etc.). It keeps `spec_turnOnVehicle.isTurnedOn`, syncs it through `SetTurnedOnEvent`, raises `onTurnedOn`/`onTurnedOff`, and plays sounds, effects, animation nodes and animations on the client. It also overwrites many functions of other specializations (work areas, discharge nodes, alarm triggers, shovel nodes, AI) so that they depend on the turned-on state. No prerequisites; it uses AnimatedVehicle only if present.

- **TurnOnVehicle** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `TurnOnVehicle.prerequisitesPresent(specializations: any)` | 19 | ✍ Always returns true: the specialization has no prerequisites. |
| `TurnOnVehicle.initSpecialization()` | 25 | ✍ Registers the XML schema paths under `vehicle.turnOnVehicle` (toggle button, texts, always-on flags, animation nodes, effects, sounds, animations, turned-on speed, dashboards) and the extra attributes added on attacher joints, work areas, alarm triggers, shovel and discharge nodes. |
| `TurnOnVehicle.registerEvents(vehicleType: any)` | 93 | ✍ Registers the two vehicle events `onTurnedOn` and `onTurnedOff`. |
| `TurnOnVehicle.registerFunctions(vehicleType: any)` | 100 | ✍ Adds the public functions of this specialization to the vehicle type (setIsTurnedOn, getIsTurnedOn, getCanBeTurnedOn, getTurnedOnSpeedFactor, and so on). |
| `TurnOnVehicle.registerOverwrittenFunctions(vehicleType: any)` | 117 | ✍ Registers the overrides of functions owned by other specializations (work area, discharge node, alarm trigger, shovel, AI continuation, power take-off, bunker silo compacter, work mode, and others). |
| `TurnOnVehicle.registerEventListeners(vehicleType: any)` | 141 | ✍ Subscribes the specialization to the vehicle lifecycle events (load, delete, streams, update, action events, attach/detach, root vehicle change) and to its own turn on/off events. |
| `TurnOnVehicle:onLoad(savegame: table)` | 165 | ✍ Reads the XML settings (toggle input, texts, always-on, turn-off rules, AI flags). On the client it also loads animation nodes, turn-on animations, activatable fill units, effects, sounds and the turned-on speed simulation. Removes the onDelete/onUpdate listeners on a pure server. Note: the default of `varianceSpeed` is 0.01 in code while the schema documents 1. |
| `TurnOnVehicle:onRegisterDashboardValueTypes()` | 262 | ✍ Registers the two dashboard value types `turnOnVehicle.turnedOn` (boolean state) and `turnOnVehicle.rpm` (turned-on speed mapped between minRpm and maxRpm). |
| `TurnOnVehicle:onDelete()` | 278 | ✍ Client only: deletes the sound samples, animation nodes and effects created on load. |
| `TurnOnVehicle:onReadStream(streamId: integer, connection: Connection)` | 295 | ✍ Client join: reads the turned-on boolean sent by the server and applies it with `setIsTurnedOn` without re-sending an event. |
| `TurnOnVehicle:onWriteStream(streamId: integer, connection: Connection)` | 304 | ✍ Server side on join: writes the current `isTurnedOn` boolean into the stream. |
| `TurnOnVehicle:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 314 | ✍ Drives the fade of each turned-on animation (speed ramps up or down by dt and the animation is stopped at zero speed). On the client it also simulates the turned-on speed (`alpha`) with a small time-based variance, used for sound and rpm dashboards. |
| `TurnOnVehicle:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 373 | ✍ Client: refreshes the toggle action event text/state unless always on or driven by the attacher. Server: when `turnOffIfNotAllowed` is set and the vehicle cannot be turned on, turns it off, or else turns off a turned-on attacher vehicle. |
| `TurnOnVehicle:setIsTurnedOn(isTurnedOn: boolean, noEventSend: boolean)` | 406 | ✍ Changes the turned-on state. When the value changes it sends `SetTurnedOnEvent` (unless `noEventSend`), raises onTurnedOn/onTurnedOff, notifies the root vehicle with a TURN_ON/TURN_OFF state change and updates the dashboard value. |
| `TurnOnVehicle:onTurnedOn()` | 431 | ✍ Client: plays the turn-on animation, start sample and work samples, and starts animation nodes and effects. Also switches to the discharge node flagged `turnOnActivateNode`, remembering the previous one. |
| `TurnOnVehicle:onTurnedOff()` | 461 | ✍ Client: plays the turn-off animation and stop sample, stops work sounds, animation nodes and effects. Restores the discharge node that was current before turn-on, if one was saved. |
| `TurnOnVehicle:getIsTurnedOn() → boolean` | 488 | ✍ Returns true if the vehicle is always turned on or currently switched on. |
| `TurnOnVehicle:getCanBeTurnedOn() → boolean` | 497 | ✍ Returns false for always-on vehicles, when the input attacher joint forbids turn on, or when the vehicle is not powered (`getIsPowered`); true otherwise. |
| `TurnOnVehicle:getCanBeTurnedOnAll() → boolean` | 522 | ✍ Returns true only if every child vehicle of the root vehicle that has `getCanBeTurnedOn` reports it can be turned on. |
| `TurnOnVehicle:getCanToggleTurnedOn() → boolean` | 539 | ✍ Returns whether the player may toggle the state: false when always on or when turned on by the attacher vehicle. |
| `TurnOnVehicle:getTurnedOnNotAllowedWarning() → string` | 556 | ✍ Returns the localized warning text `warning_attachToPower` when the vehicle is not powered, otherwise nil. |
| `TurnOnVehicle:getAIRequiresTurnOn()` | 566 | ✍ Returns the `aiRequiresTurnOn` XML flag (whether the AI must switch this implement on). |
| `TurnOnVehicle:getRequiresTurnOn()` | 572 | ✍ Returns the `requiresTurnOn` XML flag (documented in the schema as mobile-only). |
| `TurnOnVehicle:getAIRequiresTurnOffOnHeadland()` | 578 | ✍ Returns false by default; other specializations can overwrite it to force a turn-off on the headland. |
| `TurnOnVehicle:loadTurnedOnAnimationFromXML(xmlFile: any, key: any, turnedOnAnimation: any)` | 584 | ✍ Reads one `turnedOnAnimation` entry (name, fade times converted to ms, speed scale) into the given table. Returns false with a warning if the name is missing. |
| `TurnOnVehicle:getIsTurnedOnAnimationActive(turnedOnAnimation: any)` | 605 | ✍ Returns true when the vehicle is turned on; the animation argument is not used here, so subclasses can refine the condition. |
| `TurnOnVehicle:getUseTurnedOnSchema(superFunc: any)` | 615 | ✍ Override: also returns true when the vehicle is turned on. |
| `TurnOnVehicle:loadInputAttacherJoint(superFunc: table, xmlFile: any, key: any, inputAttacherJoint: any, i: any)` | 622 | ✍ Override: after the base loading, reads `#canBeTurnedOn` (default true) onto the input attacher joint. |
| `TurnOnVehicle:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: XMLFile, key: string)` | 637 | ✍ Override: reads `#needsSetIsTurnedOn` (default true) for each work area. |
| `TurnOnVehicle:getIsWorkAreaActive(superFunc: table, workArea: table) → boolean` | 649 | ✍ Override: a work area flagged `needsSetIsTurnedOn` is inactive while the vehicle is off; otherwise defers to the previous implementation. |
| `TurnOnVehicle:getCanAIImplementContinueWork(superFunc: any, isTurning: any) → boolean` | 660 | ✍ Override: the AI may continue only if the base check passes and, when the implement needs turn on, is in line and can be turned on, the implement is actually on. On the headland it always allows continuing. |
| `TurnOnVehicle:getIsOperating(superFunc: any) → boolean` | 687 | ✍ Override: returns true whenever the vehicle is turned on, else the previous result. |
| `TurnOnVehicle:getAlarmTriggerIsActive(superFunc: any, alarmTrigger: any)` | 697 | ✍ Override: an alarm trigger flagged `needsTurnOn` is forced inactive while the vehicle is off. |
| `TurnOnVehicle:loadAlarmTrigger(superFunc: any, xmlFile: any, key: any, alarmTrigger: any, fillUnit: any)` | 711 | ✍ Override: after base loading, reads `#needsTurnOn` and `#turnOffInTrigger` (both default false) on the alarm trigger. |
| `TurnOnVehicle:getIsFillUnitActive(superFunc: any, fillUnitIndex: any)` | 721 | ✍ Override: fill units listed as activatable are inactive while the vehicle is off. |
| `TurnOnVehicle:loadShovelNode(superFunc: any, xmlFile: any, key: any, shovelNode: any)` | 734 | ✍ Override: after base loading, reads `#needsActivation` into `shovelNode.needsActiveVehicle`. Always returns true. |
| `TurnOnVehicle:getShovelNodeIsActive(superFunc: any, shovelNode: any)` | 744 | ✍ Override: a shovel node that needs activation is inactive while the vehicle is off. |
| `TurnOnVehicle:getIsSeedChangeAllowed(superFunc: any)` | 756 | ✍ Override: changing the seed is allowed only while the vehicle is turned off (and the base rule allows it). |
| `TurnOnVehicle:getCanBeSelected(superFunc: any)` | 762 | ✍ Override: always returns true, so these implements can be selected regardless of base rules. |
| `TurnOnVehicle:getIsPowerTakeOffActive(superFunc: any)` | 768 | ✍ Override: the power take-off counts as active when the vehicle is turned on or the base says so. |
| `TurnOnVehicle:loadDischargeNode(superFunc: any, xmlFile: any, key: any, entry: any)` | 774 | ✍ Override: after base loading, reads `#needsSetIsTurnedOn` and `#turnOnActivateNode` (both default false); a node with the latter flag becomes `activateableDischargeNode`. |
| `TurnOnVehicle:getIsDischargeNodeActive(superFunc: any, dischargeNode: any)` | 791 | ✍ Override: a discharge node that needs turn on is inactive while the vehicle is off. |
| `TurnOnVehicle:loadBunkerSiloCompactorFromXML(superFunc: any, xmlFile: any, key: any)` | 803 | ✍ Override: after base loading, reads `#turnedOnCompactingScale` into the bunker silo compacter spec (nil if absent). |
| `TurnOnVehicle:getBunkerSiloCompacterScale(superFunc: any)` | 812 | ✍ Override: returns the turned-on compacting scale while the vehicle is on and the value is defined, otherwise the base scale. |
| `TurnOnVehicle:getIsWorkModeChangeAllowed(superFunc: any)` | 825 | ✍ Override: refuses a work mode change while turned on if the work mode spec has `allowChangeWhileTurnedOn` set to false. |
| `TurnOnVehicle:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 838 | ✍ Client: when active for input and toggling is allowed, registers the toggle action (high text priority) and the hidden `TURN_ON_ALL_IMPLEMENTS` action, both as powered action events. |
| `TurnOnVehicle:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 856 | ✍ Registers the external (outside-vehicle trigger) action named `turnOn` with its register and update callbacks. |
| `TurnOnVehicle:onAlarmTriggerChanged(alarmTrigger: any, state: any)` | 864 | ✍ When an alarm trigger becomes active and has `turnOffInTrigger`, turns the vehicle off locally without sending an event. |
| `TurnOnVehicle:onSetBroken()` | 874 | ✍ Turns the vehicle off (no event sent) when it breaks. |
| `TurnOnVehicle:onStateChange(state: any, data: any)` | 880 | ✍ On MOTOR_TURN_OFF, turns the vehicle off locally if it can no longer be turned on (for example lost power). |
| `TurnOnVehicle:onDeactivate()` | 890 | ✍ Turns the vehicle off locally when it is deactivated and `turnOffOnDeactivate` is set (default true except on mobile). |
| `TurnOnVehicle:onPostAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 899 | ✍ If `turnedOnByAttacherVehicle` is set, copies the attacher vehicle's turned-on state onto this implement, without an event. |
| `TurnOnVehicle:onPreDetach(attacherVehicle: table, implement: table)` | 912 | ✍ Turns the implement off locally just before it is detached. |
| `TurnOnVehicle:onRootVehicleChanged(rootVehicle: table)` | 919 | ✍ Registers or re-parents the `turnOn` action in the root vehicle's action controller (saved, with AI event listeners to turn on at line start and off at end/block/transport). Removes the action if there is no controller or toggling is not allowed. |
| `TurnOnVehicle.actionControllerTurnOnEvent(self: any, direction: any)` | 972 | ✍ Action controller callback: direction above 0 turns on if allowed and returns whether it worked; otherwise turns off and returns true if now off. |
| `TurnOnVehicle.actionEventTurnOn(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 988 | ✍ Input callback for the toggle key: flips the state if toggling and turning on are allowed, otherwise shows the blinking not-allowed warning (2 s) when the vehicle is off. |
| `TurnOnVehicle.actionEventTurnOnAll(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1003 | ✍ Input callback for turn-on-all: if every child vehicle can be turned on, flips the state of each child that has `setIsTurnedOn`; otherwise shows the warning if this vehicle is off. |
| `TurnOnVehicle.updateActionEvents(self: any)` | 1026 | ✍ Updates the toggle action event: sets the turn-on or turn-off text and its active state from `getCanToggleTurnedOn`. |
| `TurnOnVehicle.externalActionEventRegister(data: any, vehicle: any)` | 1050 | ✍ Registers the external toggle action; when pressed it first tries to start the motor via `Motorized.tryStartMotor`, then runs the normal toggle callback. |
| `TurnOnVehicle.externalActionEventUpdate(data: any, vehicle: any)` | 1065 | ✍ Updates the external toggle action's text and active state according to whether the vehicle is on and can be toggled. |
| `TurnOnVehicle:getTurnedOnSpeedFactor()` | 1085 | ✍ Returns the simulated turned-on speed factor (`alpha`, around 0 to 1 with slight variance). Client only: the table is not created on a pure server. |
| `TurnOnVehicle.dashboardRpmAttributes(self: any, xmlFile: any, key: any, dashboard: any, isActive: any)` | 1093 | ✍ Dashboard attribute loader: reads `#minRpm` (default 0) and `#maxRpm` (default 1000) onto the dashboard entry. Returns true. |
| `TurnOnVehicle.dashboardRpmValue(self: any, dashboard: any)` | 1102 | ✍ Dashboard value: interpolates between minRpm and maxRpm using the turned-on speed factor. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onTurnedOn` | 94 |
| registerEvent | `onTurnedOff` | 95 |
| registerFunction | `setIsTurnedOn` | 101 |
| registerFunction | `getIsTurnedOn` | 102 |
| registerFunction | `getCanBeTurnedOn` | 103 |
| registerFunction | `getCanBeTurnedOnAll` | 104 |
| registerFunction | `getCanToggleTurnedOn` | 105 |
| registerFunction | `getTurnedOnNotAllowedWarning` | 106 |
| registerFunction | `getAIRequiresTurnOn` | 107 |
| registerFunction | `getRequiresTurnOn` | 108 |
| registerFunction | `getAIRequiresTurnOffOnHeadland` | 109 |
| registerFunction | `loadTurnedOnAnimationFromXML` | 110 |
| registerFunction | `getIsTurnedOnAnimationActive` | 111 |
| registerFunction | `getTurnedOnSpeedFactor` | 112 |
| registerOverwrittenFunction | `getUseTurnedOnSchema` | 118 |
| registerOverwrittenFunction | `loadInputAttacherJoint` | 119 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 120 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 121 |
| registerOverwrittenFunction | `getCanAIImplementContinueWork` | 122 |
| registerOverwrittenFunction | `getIsOperating` | 123 |
| registerOverwrittenFunction | `getAlarmTriggerIsActive` | 124 |
| registerOverwrittenFunction | `loadAlarmTrigger` | 125 |
| registerOverwrittenFunction | `getIsFillUnitActive` | 126 |
| registerOverwrittenFunction | `loadShovelNode` | 127 |
| registerOverwrittenFunction | `getShovelNodeIsActive` | 128 |
| registerOverwrittenFunction | `getIsSeedChangeAllowed` | 129 |
| registerOverwrittenFunction | `getCanBeSelected` | 130 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 131 |
| registerOverwrittenFunction | `loadDischargeNode` | 132 |
| registerOverwrittenFunction | `getIsDischargeNodeActive` | 133 |
| registerOverwrittenFunction | `loadBunkerSiloCompactorFromXML` | 134 |
| registerOverwrittenFunction | `getBunkerSiloCompacterScale` | 135 |
| registerOverwrittenFunction | `getIsWorkModeChangeAllowed` | 136 |
| registerEventListener | `onLoad` | 142 |
| registerEventListener | `onRegisterDashboardValueTypes` | 143 |
| registerEventListener | `onDelete` | 144 |
| registerEventListener | `onReadStream` | 145 |
| registerEventListener | `onWriteStream` | 146 |
| registerEventListener | `onUpdate` | 147 |
| registerEventListener | `onUpdateTick` | 148 |
| registerEventListener | `onRegisterActionEvents` | 149 |
| registerEventListener | `onRegisterExternalActionEvents` | 150 |
| registerEventListener | `onDeactivate` | 151 |
| registerEventListener | `onPostAttach` | 152 |
| registerEventListener | `onPreDetach` | 153 |
| registerEventListener | `onRootVehicleChanged` | 154 |
| registerEventListener | `onTurnedOn` | 155 |
| registerEventListener | `onTurnedOff` | 156 |
| registerEventListener | `onAlarmTriggerChanged` | 157 |
| registerEventListener | `onSetBroken` | 158 |
| registerEventListener | `onStateChange` | 159 |
