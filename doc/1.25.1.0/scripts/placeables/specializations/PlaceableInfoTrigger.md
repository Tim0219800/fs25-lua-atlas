# placeables/specializations/PlaceableInfoTrigger.lua

Source: `dataS/scripts/placeables/specializations/PlaceableInfoTrigger.lua` — FS25 1.25.1.0

- **PlaceableInfoTrigger** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableInfoTrigger.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableInfoTrigger.registerEvents(placeableType: any)` | 24 |  |
| `PlaceableInfoTrigger.registerEventListeners(placeableType: any)` | 31 |  |
| `PlaceableInfoTrigger.registerFunctions(placeableType: any)` | 40 |  |
| `PlaceableInfoTrigger.registerXMLPaths(schema: any, basePath: any)` | 47 |  |
| `PlaceableInfoTrigger:onLoad(savegame: table)` | 57 |  |
| `PlaceableInfoTrigger:onDelete()` | 77 |  |
| `PlaceableInfoTrigger:onFinalizePlacement()` | 95 |  |
| `PlaceableInfoTrigger:onDraw()` | 104 |  |
| `PlaceableInfoTrigger:onInfoTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 134 |  |
| `PlaceableInfoTrigger:updateInfo(info: any)` | 156 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onInfoTriggerEnter` | 25 |
| registerEvent | `onInfoTriggerLeave` | 26 |
| registerEventListener | `onLoad` | 32 |
| registerEventListener | `onDelete` | 33 |
| registerEventListener | `onFinalizePlacement` | 34 |
| registerEventListener | `onDraw` | 35 |
| registerFunction | `updateInfo` | 41 |
| registerFunction | `onInfoTriggerCallback` | 42 |
