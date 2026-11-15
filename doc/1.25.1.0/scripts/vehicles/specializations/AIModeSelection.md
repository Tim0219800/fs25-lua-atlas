# vehicles/specializations/AIModeSelection.lua

Source : `dataS/scripts/vehicles/specializations/AIModeSelection.lua` — FS25 1.25.1.0

- **AIModeSelection** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIModeSelection.prerequisitesPresent(specializations: table) → boolean` | 35 |  |
| `AIModeSelection.initSpecialization()` | 42 |  |
| `AIModeSelection.registerEvents(vehicleType: any)` | 50 |  |
| `AIModeSelection.registerFunctions(vehicleType: any)` | 57 |  |
| `AIModeSelection.registerOverwrittenFunctions(vehicleType: any)` | 70 |  |
| `AIModeSelection.registerEventListeners(vehicleType: any)` | 75 |  |
| `AIModeSelection:onLoad(savegame: table)` | 89 |  |
| `AIModeSelection:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 122 |  |
| `AIModeSelection:onReadStream(streamId: integer, connection: Connection)` | 135 |  |
| `AIModeSelection:onWriteStream(streamId: integer, connection: Connection)` | 148 |  |
| `AIModeSelection:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 159 |  |
| `AIModeSelection:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 186 |  |
| `AIModeSelection:onStateChange(state: any, data: any)` | 198 |  |
| `AIModeSelection:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 208 |  |
| `AIModeSelection.actionEventToggleAIState(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any, deviceCategory: any, binding: any, isReset: any)` | 224 |  |
| `AIModeSelection:setAIModeSelection(aiMode: any, noEventSend: any)` | 294 |  |
| `AIModeSelection:getAIModeSelection()` | 318 |  |
| `AIModeSelection:aiModeSettingsChanged(aiMode: any, fieldCourseSettings: any)` | 324 |  |
| `AIModeSelection:initializeLoadedAIModeUserSettings()` | 337 |  |
| `AIModeSelection:getAIModeFieldCourseSettings()` | 355 |  |
| `AIModeSelection:setAIModeFieldCourseSettings(fieldCourseSettings: any)` | 361 |  |
| `AIModeSelection.readAIModeSettingsFromStream(streamId: any, connection: any)` | 379 |  |
| `AIModeSelection:applyReadAIModeSettingsFromStream(data: any)` | 391 |  |
| `AIModeSelection:writeAIModeSettingsToStream(streamId: any, connection: any)` | 403 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onAIModeChanged` | 51 |
| registerEvent | `onAIModeSettingsChanged` | 52 |
| registerFunction | `setAIModeSelection` | 58 |
| registerFunction | `getAIModeSelection` | 59 |
| registerFunction | `aiModeSettingsChanged` | 60 |
| registerFunction | `initializeLoadedAIModeUserSettings` | 61 |
| registerFunction | `getAIModeFieldCourseSettings` | 62 |
| registerFunction | `setAIModeFieldCourseSettings` | 63 |
| registerFunction | `applyReadAIModeSettingsFromStream` | 64 |
| registerFunction | `writeAIModeSettingsToStream` | 65 |
| registerEventListener | `onLoad` | 76 |
| registerEventListener | `onDelete` | 77 |
| registerEventListener | `onReadStream` | 78 |
| registerEventListener | `onWriteStream` | 79 |
| registerEventListener | `onUpdateTick` | 80 |
| registerEventListener | `onDraw` | 81 |
| registerEventListener | `onStateChange` | 82 |
| registerEventListener | `onRegisterActionEvents` | 83 |
