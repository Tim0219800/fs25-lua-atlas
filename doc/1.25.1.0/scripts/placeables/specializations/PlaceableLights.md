# placeables/specializations/PlaceableLights.lua

Source : `dataS/scripts/placeables/specializations/PlaceableLights.lua` — FS25 1.25.1.0

- **PlaceableLights** (l.11)
- **PlaceableLightsActivatable** (l.535)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableLights.prerequisitesPresent(specializations: table) → boolean` | 22 |  |
| `PlaceableLights.registerFunctions(placeableType: any)` | 28 |  |
| `PlaceableLights.registerEventListeners(placeableType: any)` | 39 |  |
| `PlaceableLights.registerXMLPaths(schema: any, basePath: any)` | 49 |  |
| `PlaceableLights:onLoad(savegame: table)` | 86 |  |
| `PlaceableLights:onFinalizePlacement()` | 288 |  |
| `PlaceableLights:sharedLightLoaded(i3dNode: any, failedReason: any, args: any)` | 294 |  |
| `PlaceableLights:onDelete()` | 365 |  |
| `PlaceableLights:onReadStream(streamId: integer, connection: table)` | 402 |  |
| `PlaceableLights:onWriteStream(streamId: integer, connection: table)` | 415 |  |
| `PlaceableLights:getUseHighProfile()` | 426 |  |
| `PlaceableLights:setGroupIsActive(groupIndex: any, isActive: any, noEventSend: any)` | 435 |  |
| `PlaceableLights:updateLightState(groupIndex: any, isActive: any)` | 454 |  |
| `PlaceableLights:lightsTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 498 |  |
| `PlaceableLights:lightSetupChanged()` | 527 |  |
| `PlaceableLightsActivatable.new(placeable: any)` | 539 |  |
| `PlaceableLightsActivatable:setGroupIndex(groupIndex: any)` | 551 |  |
| `PlaceableLightsActivatable:run()` | 558 |  |
| `PlaceableLightsActivatable:updateActivateText()` | 566 |  |
| `PlaceableLightsActivatable:getDistance(x: any, y: any, z: any)` | 579 |  |

## Spécialisation

| Type | Nom | Ligne |
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

- écoute `MessageType.SETTING_CHANGED` (l.98)
