# vehicles/specializations/WorkMode.lua

Source: `dataS/scripts/vehicles/specializations/WorkMode.lua` — FS25 1.25.1.0

- **WorkMode** (l.13)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `WorkMode.prerequisitesPresent(specializations: table) → boolean` | 23 |  |
| `WorkMode.initSpecialization()` | 30 |  |
| `WorkMode.registerWorkModeXMLPaths(schema: any, basePath: any)` | 48 |  |
| `WorkMode.registerEvents(vehicleType: table)` | 98 |  |
| `WorkMode.registerFunctions(vehicleType: any)` | 104 |  |
| `WorkMode.registerOverwrittenFunctions(vehicleType: any)` | 114 |  |
| `WorkMode.registerEventListeners(vehicleType: any)` | 127 |  |
| `WorkMode:onLoad(savegame: table)` | 149 |  |
| `WorkMode:onPostLoad(savegame: any)` | 219 |  |
| `WorkMode:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 251 |  |
| `WorkMode:onDelete()` | 260 |  |
| `WorkMode:onReadStream(streamId: integer, connection: Connection)` | 278 |  |
| `WorkMode:onWriteStream(streamId: integer, connection: Connection)` | 287 |  |
| `WorkMode:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 298 |  |
| `WorkMode:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 320 |  |
| `WorkMode:onUpdate(dt: number, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 338 |  |
| `WorkMode:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 440 |  |
| `WorkMode:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 481 |  |
| `WorkMode:onDeactivate()` | 492 |  |
| `WorkMode:deactivateWindrowerEffects()` | 498 |  |
| `WorkMode:loadWorkModeFromXML(xmlFile: any, key: any, workMode: any)` | 511 |  |
| `WorkMode:setWorkMode(state: integer, noEventSend: boolean)` | 603 |  |
| `WorkMode:getIsWorkAreaActive(superFunc: any, workArea: any)` | 741 |  |
| `WorkMode:getCanBeSelected(superFunc: any)` | 758 |  |
| `WorkMode:getAllowsLowering(superFunc: any)` | 764 |  |
| `WorkMode:loadSprayTypeFromXML(superFunc: any, xmlFile: any, key: any, sprayType: any)` | 778 |  |
| `WorkMode:getIsSprayTypeActive(superFunc: any, sprayType: any)` | 786 |  |
| `WorkMode:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 798 |  |
| `WorkMode:getIsMovingToolActive(superFunc: any, movingTool: any)` | 810 |  |
| `WorkMode:getAreEffectsVisible(superFunc: any)` | 831 |  |
| `WorkMode:getIsWorkModeChangeAllowed() → boolean` | 857 |  |
| `WorkMode:onTurnedOff()` | 884 |  |
| `WorkMode:onTurnedOn()` | 901 |  |
| `WorkMode:onSetLowered(lowered: boolean)` | 918 |  |
| `WorkMode:onFoldStateChanged(direction: integer, moveToMiddle: any)` | 947 |  |
| `WorkMode:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 973 |  |
| `WorkMode.actionEventWorkModeChange(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 998 |  |
| `WorkMode.actionEventWorkModeChangeDirect(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1012 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onWorkModeChanged` | 99 |
| registerFunction | `loadWorkModeFromXML` | 105 |
| registerFunction | `setWorkMode` | 106 |
| registerFunction | `getWorkMode` | 107 |
| registerFunction | `getIsWorkModeChangeAllowed` | 108 |
| registerFunction | `deactivateWindrowerEffects` | 109 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 115 |
| registerOverwrittenFunction | `getCanBeSelected` | 116 |
| registerOverwrittenFunction | `getAllowsLowering` | 117 |
| registerOverwrittenFunction | `loadSprayTypeFromXML` | 118 |
| registerOverwrittenFunction | `getIsSprayTypeActive` | 119 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 120 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 121 |
| registerOverwrittenFunction | `getAreEffectsVisible` | 122 |
| registerEventListener | `onLoad` | 128 |
| registerEventListener | `onPostLoad` | 129 |
| registerEventListener | `onDelete` | 130 |
| registerEventListener | `onReadStream` | 131 |
| registerEventListener | `onWriteStream` | 132 |
| registerEventListener | `onReadUpdateStream` | 133 |
| registerEventListener | `onWriteUpdateStream` | 134 |
| registerEventListener | `onUpdate` | 135 |
| registerEventListener | `onUpdateTick` | 136 |
| registerEventListener | `onDraw` | 137 |
| registerEventListener | `onTurnedOn` | 138 |
| registerEventListener | `onTurnedOff` | 139 |
| registerEventListener | `onDeactivate` | 140 |
| registerEventListener | `onSetLowered` | 141 |
| registerEventListener | `onFoldStateChanged` | 142 |
| registerEventListener | `onRegisterActionEvents` | 143 |
