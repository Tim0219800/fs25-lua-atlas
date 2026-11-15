# vehicles/specializations/ReverseDriving.lua

Source: `dataS/scripts/vehicles/specializations/ReverseDriving.lua` — FS25 1.25.1.0

- **ReverseDriving** (l.13)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ReverseDriving.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `ReverseDriving.initSpecialization()` | 27 |  |
| `ReverseDriving.postInitSpecialization()` | 63 |  |
| `ReverseDriving.registerEvents(vehicleType: any)` | 76 |  |
| `ReverseDriving.registerFunctions(vehicleType: any)` | 83 |  |
| `ReverseDriving.registerOverwrittenFunctions(vehicleType: any)` | 91 |  |
| `ReverseDriving.registerEventListeners(vehicleType: any)` | 108 |  |
| `ReverseDriving:onLoad(savegame: table)` | 121 |  |
| `ReverseDriving:onPostLoad(savegame: table)` | 182 |  |
| `ReverseDriving:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 201 |  |
| `ReverseDriving:onReadStream(streamId: integer, connection: Connection)` | 212 |  |
| `ReverseDriving:onWriteStream(streamId: integer, connection: Connection)` | 223 |  |
| `ReverseDriving:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 232 |  |
| `ReverseDriving:reverseDirectionChanged(direction: number)` | 262 |  |
| `ReverseDriving:setIsReverseDriving(isReverseDriving: boolean, noEventSend: boolean, forceUpdate: any)` | 300 |  |
| `ReverseDriving:getIsReverseDrivingAllowed(newState: any)` | 335 |  |
| `ReverseDriving:updateSteeringWheel(superFunc: any, steeringWheel: any, dt: any, direction: any)` | 352 |  |
| `ReverseDriving:getSteeringDirection(superFunc: any)` | 368 |  |
| `ReverseDriving:getAllowCharacterVisibilityUpdate(superFunc: any)` | 379 |  |
| `ReverseDriving:getCanStartAIVehicle(superFunc: any, jobClass: any)` | 386 |  |
| `ReverseDriving:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 406 |  |
| `ReverseDriving:getIsDashboardGroupActive(superFunc: any, group: any)` | 418 |  |
| `ReverseDriving:getCanBeSelected(superFunc: any)` | 430 |  |
| `ReverseDriving:loadAdditionalLightAttributesFromXML(superFunc: any, xmlFile: any, key: any, light: any)` | 436 |  |
| `ReverseDriving:getIsLightActive(superFunc: any, light: any)` | 448 |  |
| `ReverseDriving:getAIDirectionNode(superFunc: any)` | 460 |  |
| `ReverseDriving:getAIRootNode(superFunc: any)` | 471 |  |
| `ReverseDriving:getAIImplementCollisionTrigger(superFunc: any)` | 482 |  |
| `ReverseDriving:onVehicleCharacterChanged(character: any)` | 493 |  |
| `ReverseDriving:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 512 |  |
| `ReverseDriving.actionEventToggleReverseDriving(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 526 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onStartReverseDirectionChange` | 77 |
| registerEvent | `onReverseDirectionChanged` | 78 |
| registerFunction | `reverseDirectionChanged` | 84 |
| registerFunction | `setIsReverseDriving` | 85 |
| registerFunction | `getIsReverseDrivingAllowed` | 86 |
| registerOverwrittenFunction | `updateSteeringWheel` | 92 |
| registerOverwrittenFunction | `getSteeringDirection` | 93 |
| registerOverwrittenFunction | `getAllowCharacterVisibilityUpdate` | 94 |
| registerOverwrittenFunction | `getCanStartAIVehicle` | 95 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 96 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 97 |
| registerOverwrittenFunction | `getCanBeSelected` | 98 |
| registerOverwrittenFunction | `loadAdditionalLightAttributesFromXML` | 99 |
| registerOverwrittenFunction | `getIsLightActive` | 100 |
| registerOverwrittenFunction | `getAIDirectionNode` | 101 |
| registerOverwrittenFunction | `getAIRootNode` | 102 |
| registerOverwrittenFunction | `getAIImplementCollisionTrigger` | 103 |
| registerEventListener | `onLoad` | 109 |
| registerEventListener | `onPostLoad` | 110 |
| registerEventListener | `onReadStream` | 111 |
| registerEventListener | `onWriteStream` | 112 |
| registerEventListener | `onUpdate` | 113 |
| registerEventListener | `onVehicleCharacterChanged` | 114 |
| registerEventListener | `onRegisterActionEvents` | 115 |
