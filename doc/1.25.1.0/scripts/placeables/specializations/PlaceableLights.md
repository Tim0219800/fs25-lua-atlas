# placeables/specializations/PlaceableLights.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableLights.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableLights.lua` — FS25 1.25.1.0

✍ Placeable specialization that drives light groups on buildings: shared light i3d models, self-illuminated shapes and real light nodes (low/high profile). Groups can be switched manually via a trigger and an activatable, or automatically through time-of-day and weather visibility conditions. State is synchronised through PlaceableLightsStateEvent; it depends on the environment mask system of the current mission (class not in the dump).

- **PlaceableLights** (l.11)
- **PlaceableLightsActivatable** (l.535)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableLights.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ Always returns true: this specialization has no prerequisite on other specializations. |
| `PlaceableLights.registerFunctions(placeableType: any)` | 28 | ✍ Registers the placeable functions lightSetupChanged, getUseHighProfile, setGroupIsActive, lightsTriggerCallback, sharedLightLoaded and updateLightState on the placeable type. |
| `PlaceableLights.registerEventListeners(placeableType: any)` | 39 | ✍ Subscribes the specialization to onLoad, onDelete, onWriteStream, onReadStream and onFinalizePlacement. |
| `PlaceableLights.registerXMLPaths(schema: any, basePath: any)` | 49 | ✍ Declares the XML schema under lights: sharedLight, lightShape, realLights.low/high, and group entries (trigger, input action, texts, activate/deactivate time, weather flags, toggle sound). |
| `PlaceableLights:onLoad(savegame: table)` | 86 | ✍ Reads light groups, shared lights (loaded asynchronously), light shapes and real lights from the XML, and applies time/weather visibility conditions to non-manual groups. Subscribes to the lightsProfile setting change; max group count is PlaceableLights.MAX_NUM_GROUPS. Note: the incomplete-time check on line 143 only warns when activateTime is set without deactivateTime, not the reverse. |
| `PlaceableLights:onFinalizePlacement()` | 288 | ✍ Once the placement is final, applies the current light setup by calling lightSetupChanged. |
| `PlaceableLights:sharedLightLoaded(i3dNode: any, failedReason: any, args: any)` | 294 | ✍ Async callback for a shared light i3d: configures its lightControl shapes (manual or visibility-condition mode), colour scale and rotation nodes, links it to the link node, then frees the temporary i3d root and XML and finishes the loading task. |
| `PlaceableLights:onDelete()` | 365 | ✍ Releases shared light XML files and i3d requests, unsubscribes from messages, removes the activatable, removes the group triggers and deletes the toggle sound samples. |
| `PlaceableLights:onReadStream(streamId: integer, connection: table)` | 402 | ✍ Client side on join: reads one bool per manually controlled group and applies it with setGroupIsActive without re-sending an event. |
| `PlaceableLights:onWriteStream(streamId: integer, connection: table)` | 415 | ✍ Server side on join: writes the active state of each manually controlled group, in the order read by onReadStream. |
| `PlaceableLights:getUseHighProfile()` | 426 | ✍ Returns true if the lights profile (platform override if present, otherwise the game setting) is at least GS_PROFILE_HIGH. |
| `PlaceableLights:setGroupIsActive(groupIndex: any, isActive: any, noEventSend: any)` | 435 | ✍ Sets or toggles (isActive nil) a group's state, refreshes the lights, sends PlaceableLightsStateEvent unless noEventSend is set, and plays the toggle sound on clients. |
| `PlaceableLights:updateLightState(groupIndex: any, isActive: any)` | 454 | ✍ Applies a group's state: sets lightControl on shared lights and shapes for manual groups, then shows the real lights of the profile in use and hides those of the other profile. |
| `PlaceableLights:lightsTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 498 | ✍ Trigger callback: when the local player enters a group trigger, registers the activatable for that group; on leave, removes it if the player is in no other group's range. |
| `PlaceableLights:lightSetupChanged()` | 527 | ✍ Re-applies the state of every group, for example after the lights profile setting changed. |
| `PlaceableLightsActivatable.new(placeable: any)` | 539 | ✍ Creates the activatable object linked to a placeable, with group index 1 and empty text. |
| `PlaceableLightsActivatable:setGroupIndex(groupIndex: any)` | 551 | ✍ Selects which light group the activatable controls (defaults to 1) and refreshes its prompt text. |
| `PlaceableLightsActivatable:run()` | 558 | ✍ Called when the player triggers the action: toggles the selected group on the placeable and refreshes the text. |
| `PlaceableLightsActivatable:updateActivateText()` | 566 | ✍ Builds the prompt from the group's activate or deactivate text and name, depending on whether the group is currently active. |
| `PlaceableLightsActivatable:getDistance(x: any, y: any, z: any)` | 579 | ✍ Returns the distance from the given point to the group's trigger node, or math.huge if the group has no trigger node. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `lightSetupChanged` | 29 |
| registerFunction | `getUseHighProfile` | 30 |
| registerFunction | `setGroupIsActive` | 31 |
| registerFunction | `lightsTriggerCallback` | 32 |
| registerFunction | `sharedLightLoaded` | 33 |
| registerFunction | `updateLightState` | 34 |
| registerEventListener | `onLoad` | 40 |
| registerEventListener | `onDelete` | 41 |
| registerEventListener | `onWriteStream` | 42 |
| registerEventListener | `onReadStream` | 43 |
| registerEventListener | `onFinalizePlacement` | 44 |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.98)
