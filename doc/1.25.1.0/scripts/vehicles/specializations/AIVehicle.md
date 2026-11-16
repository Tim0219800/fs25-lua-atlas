# vehicles/specializations/AIVehicle.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AIVehicle.md)*

Source: `dataS/scripts/vehicles/specializations/AIVehicle.lua` — FS25 1.25.1.0

✍ Base AI specialization present on all vehicles (no prerequisites). It loads optional vehicle.ai.agentAttachment definitions that describe the footprint (size, rotation centre, joint) the AI path planner should use for an attached tool. It also provides AI event dispatch across the whole vehicle combination and default ready/preparing answers that other specializations can override.

- **AIVehicle** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIVehicle.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Always returns true: this specialization has no prerequisites. |
| `AIVehicle.initSpecialization()` | 23 | ✍ Registers the agent attachment XML paths under vehicle.ai, including nested sub-attachments. |
| `AIVehicle.registerAgentAttachmentPaths(schema: any, basePath: any, includeSubAttachments: any)` | 34 | ✍ Registers the agentAttachment XML keys (jointNode, rotation centre by wheels/node/position, width, height, length, offsets, hasCollision, useSize) and recurses once for sub-attachments if requested. |
| `AIVehicle.registerEvents(vehicleType: any)` | 58 | ✍ Registers the events onAIFieldCourseSettingsInitialized and onPostAIFieldCourseSettingsInitialized. |
| `AIVehicle.registerFunctions(vehicleType: any)` | 65 | ✍ Registers the agent attachment helpers, the AI event raisers and the ready/preparing queries on the vehicle type. |
| `AIVehicle.registerOverwrittenFunctions(vehicleType: any)` | 80 | ✍ Empty: no base function is overridden. |
| `AIVehicle.registerEventListeners(vehicleType: any)` | 85 | ✍ Subscribes to onLoad and onPostLoad. |
| `AIVehicle:onLoad(savegame: table)` | 93 | ✍ For vehicles with input attacher joints, loads the agent attachments from the XML, and creates a debug box used to visualise them. |
| `AIVehicle:onPostLoad(savegame: table)` | 111 | ✍ If agent attachments exist, validates them against the vehicle's input attacher joints. |
| `AIVehicle:collectAIAgentAttachments(aiDrivableVehicle: any)` | 121 | ✍ Called on an attached tool to register its attachments with the AI vehicle: those bound to the active input joint first, else the first direct attachment, then all non-direct ones. |
| `AIVehicle:registerAIAgentAttachment(aiDrivableVehicle: any, agentAttachment: any)` | 163 | ✍ Adds an attachment and all its sub-attachments to the AI drivable vehicle through addAIAgentAttachment. |
| `AIVehicle:loadAIAgentAttachmentsFromXML(xmlFile: any, baseKey: any, agentAttachments: any, loadSubAttachments: any, requiresJointNode: any)` | 174 | ✍ Reads agentAttachment entries (joint, rotation centre, size, collision flag, optional sub-attachments) into a table, with 3 m defaults or the vehicle size when useSize is set. Warns when an attachable has no definition. |
| `AIVehicle:validateAIAgentAttachments(agentAttachments: any, inputAttacherJoints: any)` | 232 | ✍ Marks direct attachments and builds the rotation centre transform nodes from a position or from the average of listed wheels. It then computes hitch offsets, recursing into sub-attachments. Creates scene nodes. |
| `AIVehicle:drawAIAgentAttachments(agentAttachments: any)` | 315 | ✍ Debug drawing: renders a box per agent attachment (green when it has a rotation centre, blue otherwise), recursively. |
| `AIVehicle:raiseAIEvent(eventName: any, implementName: any, ...: any)` | 336 | ✍ Raises an AI event on the whole root vehicle combination: the implement-specific event on every other child vehicle, then on this vehicle, then the main event, notifying the action controller for each. |
| `AIVehicle:safeRaiseAIEvent(vehicle: any, eventName: any, ...: any)` | 361 | ✍ Raises the event on the vehicle only if it has listeners for that event name, avoiding errors for unknown events. |
| `AIVehicle:getIsAIReadyToDrive()` | 369 | ✍ Default answer: always true. Other specializations may override it to delay the AI start. |
| `AIVehicle:getIsAIPreparingToDrive()` | 375 | ✍ Default answer: always false. Meant to be overridden by vehicles that need a preparation phase. |

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
