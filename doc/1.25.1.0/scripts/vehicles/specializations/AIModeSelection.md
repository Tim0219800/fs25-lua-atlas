# vehicles/specializations/AIModeSelection.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AIModeSelection.md)*

Source: `dataS/scripts/vehicles/specializations/AIModeSelection.lua` — FS25 1.25.1.0

✍ Specialization that lets the player switch a vehicle between the regular AI helper (WORKER) mode and the steering assist mode (STEERING_ASSIST). It requires AIDrivable and AIAutomaticSteering. It keeps the current mode, the field course settings and the user settings, saves them in the savegame, syncs them on join, and handles the TOGGLE_AI input (short press starts, long press opens the AI settings dialog). The MODE constants and NUM_BITS are defined outside this dump (UNVERIFIED).

- **AIModeSelection** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIModeSelection.prerequisitesPresent(specializations: table) → boolean` | 35 | ✍ Returns true only if the vehicle type also has the AIDrivable and AIAutomaticSteering specializations. |
| `AIModeSelection.initSpecialization()` | 42 | ✍ Registers the savegame keys for the current AI mode and for the AI user settings under vehicles.vehicle(?).aiModeSelection. |
| `AIModeSelection.registerEvents(vehicleType: any)` | 50 | ✍ Registers the vehicle events onAIModeChanged and onAIModeSettingsChanged. |
| `AIModeSelection.registerFunctions(vehicleType: any)` | 57 | ✍ Registers the mode getter/setter, the settings-changed handler, the field course settings accessors and the stream apply/write helpers on the vehicle type. |
| `AIModeSelection.registerOverwrittenFunctions(vehicleType: any)` | 70 | ✍ Empty: this specialization overrides no base vehicle function. |
| `AIModeSelection.registerEventListeners(vehicleType: any)` | 75 | ✍ Subscribes to onLoad, onDelete, onReadStream, onWriteStream, onUpdateTick, onDraw, onStateChange and onRegisterActionEvents. |
| `AIModeSelection:onLoad(savegame: table)` | 89 | ✍ Defaults the mode to WORKER, creates the HUD extension and loads the saved mode name and user settings from the savegame (skipped when vehicles are reset). |
| `AIModeSelection:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 122 | ✍ Writes the current mode name and, if present, the user settings into the savegame XML. |
| `AIModeSelection:onReadStream(streamId: integer, connection: Connection)` | 135 | ✍ Client side on join: reads the current mode (stored zero-based, so +1) and optionally the field course attributes, kept for later application in onUpdateTick. |
| `AIModeSelection:onWriteStream(streamId: integer, connection: Connection)` | 148 | ✍ Server side on join: writes the current mode and, if they exist, the field course settings. Mirror of onReadStream. |
| `AIModeSelection:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 159 | ✍ On clients refreshes the action events. Unless a vehicle reload is running, it finalises loaded user settings and builds settings from field course attributes received from the server. |
| `AIModeSelection:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 186 | ✍ Adds this vehicle's AI mode HUD extension to the HUD help panel every frame it is drawn. |
| `AIModeSelection:onStateChange(state: any, data: any)` | 198 | ✍ On attach or detach (outside a vehicle reload), clears the cached field course and user settings so they are regenerated for the new vehicle combination. |
| `AIModeSelection:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 208 | ✍ Client only: when the vehicle is active for input, registers the TOGGLE_AI action with high text priority and updates the action event state. |
| `AIModeSelection.actionEventToggleAIState(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any, deviceCategory: any, binding: any, isReset: any)` | 224 | ✍ Handles TOGGLE_AI. Holding past MODE_CHANGE_DURATION opens the AI settings dialog. A short press in WORKER mode toggles the helper (permission hireAssistant needed), in STEERING_ASSIST mode it enables steering assist if allowed, else shows a warning. |
| `AIModeSelection:setAIModeSelection(aiMode: any, noEventSend: any)` | 294 | ✍ Sets the AI mode, or cycles to the next one when aiMode is nil. On a change it raises onAIModeChanged, refreshes the action events and sends an AISetModeEvent (unless noEventSend). |
| `AIModeSelection:getAIModeSelection()` | 318 | ✍ Returns the current AI mode value. |
| `AIModeSelection:aiModeSettingsChanged(aiMode: any, fieldCourseSettings: any)` | 324 | ✍ Callback of the settings dialog: stores the new field course settings, sends AIModeSelectionSettingsEvent, applies the chosen mode and raises onAIModeSettingsChanged. |
| `AIModeSelection:initializeLoadedAIModeUserSettings()` | 337 | ✍ Turns settings loaded from the savegame into active user settings: generates field course settings from the root vehicle if missing, reinitialises and applies them for the current mode. |
| `AIModeSelection:getAIModeFieldCourseSettings()` | 355 | ✍ Returns the stored field course settings object, or nil if none has been generated yet. |
| `AIModeSelection:setAIModeFieldCourseSettings(fieldCourseSettings: any)` | 361 | ✍ Replaces the field course settings, creates default user settings if needed, reapplies them for the current mode and raises onAIModeSettingsChanged. Sends no network event itself. |
| `AIModeSelection.readAIModeSettingsFromStream(streamId: any, connection: any)` | 379 | ✍ Static helper: reads a flag and, if set, the field course attributes from the stream; returns a table with attributes or nil. |
| `AIModeSelection:applyReadAIModeSettingsFromStream(data: any)` | 391 | ✍ Applies data from readAIModeSettingsFromStream: generates field course settings for this vehicle, applies the attributes and discards pending loaded user settings. Does nothing for nil. |
| `AIModeSelection:writeAIModeSettingsToStream(streamId: any, connection: any)` | 403 | ✍ Finalises any loaded user settings, then writes a flag and the field course settings to the stream if they exist. |

## Specialization

| Type | Name | Line |
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
