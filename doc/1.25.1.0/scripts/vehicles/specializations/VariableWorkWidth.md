# vehicles/specializations/VariableWorkWidth.lua

Source : `dataS/scripts/vehicles/specializations/VariableWorkWidth.lua` — FS25 1.25.1.0

- **VariableWorkWidth** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VariableWorkWidth.prerequisitesPresent(specializations: any)` | 22 |  |
| `VariableWorkWidth.initSpecialization()` | 28 |  |
| `VariableWorkWidth.registerSectionPaths(schema: any, basePath: any)` | 57 |  |
| `VariableWorkWidth.registerEvents(vehicleType: any)` | 77 |  |
| `VariableWorkWidth.registerFunctions(vehicleType: any)` | 83 |  |
| `VariableWorkWidth.registerOverwrittenFunctions(vehicleType: any)` | 96 |  |
| `VariableWorkWidth.registerEventListeners(vehicleType: any)` | 103 |  |
| `VariableWorkWidth:onPostLoad(savegame: any)` | 116 |  |
| `VariableWorkWidth:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 294 |  |
| `VariableWorkWidth:onReadStream(streamId: integer, connection: Connection)` | 306 |  |
| `VariableWorkWidth:onWriteStream(streamId: integer, connection: Connection)` | 316 |  |
| `VariableWorkWidth:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 331 |  |
| `VariableWorkWidth.actionEventWorkWidthLeft(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 355 |  |
| `VariableWorkWidth.actionEventWorkWidthRight(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 362 |  |
| `VariableWorkWidth.actionEventWorkWidthToggle(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 369 |  |
| `VariableWorkWidth:onAIFieldWorkerStart()` | 383 |  |
| `VariableWorkWidth:onAIImplementStart()` | 394 |  |
| `VariableWorkWidth:setVariableWorkWidthActive(isActive: any)` | 405 |  |
| `VariableWorkWidth:setSectionsActive(leftSide: any, rightSide: any, noEventSend: any)` | 420 |  |
| `VariableWorkWidth:setSectionNodePercentage(sectionNodes: any, percentage: any)` | 437 |  |
| `VariableWorkWidth:updateSections()` | 464 |  |
| `VariableWorkWidth:updateSectionStates(sections: any, state: any)` | 481 |  |
| `VariableWorkWidth:getEffectByNode(node: integer)` | 501 |  |
| `VariableWorkWidth:getVariableWorkWidth(isLeft: boolean) → number, number, boolean` | 511 |  |
| `VariableWorkWidth:getVariableWorkWidthUsage() → number` | 533 |  |
| `VariableWorkWidth:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 539 |  |
| `VariableWorkWidth:getIsWorkAreaActive(superFunc: any, workArea: any)` | 547 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onVariableWorkWidthSectionChanged` | 78 |
| registerFunction | `setVariableWorkWidthActive` | 84 |
| registerFunction | `setSectionsActive` | 85 |
| registerFunction | `setSectionNodePercentage` | 86 |
| registerFunction | `updateSections` | 87 |
| registerFunction | `updateSectionStates` | 88 |
| registerFunction | `getEffectByNode` | 89 |
| registerFunction | `getVariableWorkWidth` | 90 |
| registerFunction | `getVariableWorkWidthUsage` | 91 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 97 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 98 |
| registerEventListener | `onPostLoad` | 104 |
| registerEventListener | `onReadStream` | 105 |
| registerEventListener | `onWriteStream` | 106 |
| registerEventListener | `onRegisterActionEvents` | 107 |
| registerEventListener | `onAIFieldWorkerStart` | 108 |
| registerEventListener | `onAIImplementStart` | 109 |
| registerEventListener | `onDraw` | 110 |
| registerEventListener | `onDelete` | 111 |
