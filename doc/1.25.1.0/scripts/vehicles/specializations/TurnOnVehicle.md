# vehicles/specializations/TurnOnVehicle.lua

Source: `dataS/scripts/vehicles/specializations/TurnOnVehicle.lua` — FS25 1.25.1.0

- **TurnOnVehicle** (l.13)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `TurnOnVehicle.prerequisitesPresent(specializations: any)` | 19 |  |
| `TurnOnVehicle.initSpecialization()` | 25 |  |
| `TurnOnVehicle.registerEvents(vehicleType: any)` | 93 |  |
| `TurnOnVehicle.registerFunctions(vehicleType: any)` | 100 |  |
| `TurnOnVehicle.registerOverwrittenFunctions(vehicleType: any)` | 117 |  |
| `TurnOnVehicle.registerEventListeners(vehicleType: any)` | 141 |  |
| `TurnOnVehicle:onLoad(savegame: table)` | 165 |  |
| `TurnOnVehicle:onRegisterDashboardValueTypes()` | 262 |  |
| `TurnOnVehicle:onDelete()` | 278 |  |
| `TurnOnVehicle:onReadStream(streamId: integer, connection: Connection)` | 295 |  |
| `TurnOnVehicle:onWriteStream(streamId: integer, connection: Connection)` | 304 |  |
| `TurnOnVehicle:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 314 |  |
| `TurnOnVehicle:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 373 |  |
| `TurnOnVehicle:setIsTurnedOn(isTurnedOn: boolean, noEventSend: boolean)` | 406 |  |
| `TurnOnVehicle:onTurnedOn()` | 431 |  |
| `TurnOnVehicle:onTurnedOff()` | 461 |  |
| `TurnOnVehicle:getIsTurnedOn() → boolean` | 488 |  |
| `TurnOnVehicle:getCanBeTurnedOn() → boolean` | 497 |  |
| `TurnOnVehicle:getCanBeTurnedOnAll() → boolean` | 522 |  |
| `TurnOnVehicle:getCanToggleTurnedOn() → boolean` | 539 |  |
| `TurnOnVehicle:getTurnedOnNotAllowedWarning() → string` | 556 |  |
| `TurnOnVehicle:getAIRequiresTurnOn()` | 566 |  |
| `TurnOnVehicle:getRequiresTurnOn()` | 572 |  |
| `TurnOnVehicle:getAIRequiresTurnOffOnHeadland()` | 578 |  |
| `TurnOnVehicle:loadTurnedOnAnimationFromXML(xmlFile: any, key: any, turnedOnAnimation: any)` | 584 |  |
| `TurnOnVehicle:getIsTurnedOnAnimationActive(turnedOnAnimation: any)` | 605 |  |
| `TurnOnVehicle:getUseTurnedOnSchema(superFunc: any)` | 615 |  |
| `TurnOnVehicle:loadInputAttacherJoint(superFunc: table, xmlFile: any, key: any, inputAttacherJoint: any, i: any)` | 622 |  |
| `TurnOnVehicle:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: XMLFile, key: string)` | 637 |  |
| `TurnOnVehicle:getIsWorkAreaActive(superFunc: table, workArea: table) → boolean` | 649 |  |
| `TurnOnVehicle:getCanAIImplementContinueWork(superFunc: any, isTurning: any) → boolean` | 660 |  |
| `TurnOnVehicle:getIsOperating(superFunc: any) → boolean` | 687 |  |
| `TurnOnVehicle:getAlarmTriggerIsActive(superFunc: any, alarmTrigger: any)` | 697 |  |
| `TurnOnVehicle:loadAlarmTrigger(superFunc: any, xmlFile: any, key: any, alarmTrigger: any, fillUnit: any)` | 711 |  |
| `TurnOnVehicle:getIsFillUnitActive(superFunc: any, fillUnitIndex: any)` | 721 |  |
| `TurnOnVehicle:loadShovelNode(superFunc: any, xmlFile: any, key: any, shovelNode: any)` | 734 |  |
| `TurnOnVehicle:getShovelNodeIsActive(superFunc: any, shovelNode: any)` | 744 |  |
| `TurnOnVehicle:getIsSeedChangeAllowed(superFunc: any)` | 756 |  |
| `TurnOnVehicle:getCanBeSelected(superFunc: any)` | 762 |  |
| `TurnOnVehicle:getIsPowerTakeOffActive(superFunc: any)` | 768 |  |
| `TurnOnVehicle:loadDischargeNode(superFunc: any, xmlFile: any, key: any, entry: any)` | 774 |  |
| `TurnOnVehicle:getIsDischargeNodeActive(superFunc: any, dischargeNode: any)` | 791 |  |
| `TurnOnVehicle:loadBunkerSiloCompactorFromXML(superFunc: any, xmlFile: any, key: any)` | 803 |  |
| `TurnOnVehicle:getBunkerSiloCompacterScale(superFunc: any)` | 812 |  |
| `TurnOnVehicle:getIsWorkModeChangeAllowed(superFunc: any)` | 825 |  |
| `TurnOnVehicle:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 838 |  |
| `TurnOnVehicle:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 856 |  |
| `TurnOnVehicle:onAlarmTriggerChanged(alarmTrigger: any, state: any)` | 864 |  |
| `TurnOnVehicle:onSetBroken()` | 874 |  |
| `TurnOnVehicle:onStateChange(state: any, data: any)` | 880 |  |
| `TurnOnVehicle:onDeactivate()` | 890 |  |
| `TurnOnVehicle:onPostAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 899 |  |
| `TurnOnVehicle:onPreDetach(attacherVehicle: table, implement: table)` | 912 |  |
| `TurnOnVehicle:onRootVehicleChanged(rootVehicle: table)` | 919 |  |
| `TurnOnVehicle.actionControllerTurnOnEvent(self: any, direction: any)` | 972 |  |
| `TurnOnVehicle.actionEventTurnOn(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 988 |  |
| `TurnOnVehicle.actionEventTurnOnAll(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1003 |  |
| `TurnOnVehicle.updateActionEvents(self: any)` | 1026 |  |
| `TurnOnVehicle.externalActionEventRegister(data: any, vehicle: any)` | 1050 |  |
| `TurnOnVehicle.externalActionEventUpdate(data: any, vehicle: any)` | 1065 |  |
| `TurnOnVehicle:getTurnedOnSpeedFactor()` | 1085 |  |
| `TurnOnVehicle.dashboardRpmAttributes(self: any, xmlFile: any, key: any, dashboard: any, isActive: any)` | 1093 |  |
| `TurnOnVehicle.dashboardRpmValue(self: any, dashboard: any)` | 1102 |  |

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
