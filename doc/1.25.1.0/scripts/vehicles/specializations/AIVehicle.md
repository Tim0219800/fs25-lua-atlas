# vehicles/specializations/AIVehicle.lua

Source: `dataS/scripts/vehicles/specializations/AIVehicle.lua` — FS25 1.25.1.0

- **AIVehicle** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AIVehicle.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `AIVehicle.initSpecialization()` | 23 |  |
| `AIVehicle.registerAgentAttachmentPaths(schema: any, basePath: any, includeSubAttachments: any)` | 34 |  |
| `AIVehicle.registerEvents(vehicleType: any)` | 58 |  |
| `AIVehicle.registerFunctions(vehicleType: any)` | 65 |  |
| `AIVehicle.registerOverwrittenFunctions(vehicleType: any)` | 80 |  |
| `AIVehicle.registerEventListeners(vehicleType: any)` | 85 |  |
| `AIVehicle:onLoad(savegame: table)` | 93 |  |
| `AIVehicle:onPostLoad(savegame: table)` | 111 |  |
| `AIVehicle:collectAIAgentAttachments(aiDrivableVehicle: any)` | 121 |  |
| `AIVehicle:registerAIAgentAttachment(aiDrivableVehicle: any, agentAttachment: any)` | 163 |  |
| `AIVehicle:loadAIAgentAttachmentsFromXML(xmlFile: any, baseKey: any, agentAttachments: any, loadSubAttachments: any, requiresJointNode: any)` | 174 |  |
| `AIVehicle:validateAIAgentAttachments(agentAttachments: any, inputAttacherJoints: any)` | 232 |  |
| `AIVehicle:drawAIAgentAttachments(agentAttachments: any)` | 315 |  |
| `AIVehicle:raiseAIEvent(eventName: any, implementName: any, ...: any)` | 336 |  |
| `AIVehicle:safeRaiseAIEvent(vehicle: any, eventName: any, ...: any)` | 361 |  |
| `AIVehicle:getIsAIReadyToDrive()` | 369 |  |
| `AIVehicle:getIsAIPreparingToDrive()` | 375 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onAIFieldCourseSettingsInitialized` | 59 |
| registerEvent | `onPostAIFieldCourseSettingsInitialized` | 60 |
| registerFunction | `collectAIAgentAttachments` | 66 |
| registerFunction | `registerAIAgentAttachment` | 67 |
| registerFunction | `loadAIAgentAttachmentsFromXML` | 68 |
| registerFunction | `validateAIAgentAttachments` | 69 |
| registerFunction | `drawAIAgentAttachments` | 70 |
| registerFunction | `raiseAIEvent` | 72 |
| registerFunction | `safeRaiseAIEvent` | 73 |
| registerFunction | `getIsAIReadyToDrive` | 74 |
| registerFunction | `getIsAIPreparingToDrive` | 75 |
| registerEventListener | `onLoad` | 86 |
| registerEventListener | `onPostLoad` | 87 |
