# animals/husbandry/placeables/PlaceableHusbandryMeadow.lua

Source : `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryMeadow.lua` — FS25 1.25.1.0

- **PlaceableHusbandryMeadow** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryMeadow.prerequisitesPresent(specializations: table) → boolean` | 22 |  |
| `PlaceableHusbandryMeadow.registerOverwrittenFunctions(placeableType: any)` | 41 |  |
| `PlaceableHusbandryMeadow.registerEventListeners(placeableType: any)` | 50 |  |
| `PlaceableHusbandryMeadow.registerXMLPaths(schema: any, basePath: any)` | 66 |  |
| `PlaceableHusbandryMeadow.registerSavegameXMLPaths(schema: any, basePath: any)` | 81 |  |
| `PlaceableHusbandryMeadow:onLoad(savegame: any)` | 93 |  |
| `PlaceableHusbandryMeadow:onReadStream(streamId: any, connection: any)` | 268 |  |
| `PlaceableHusbandryMeadow:onWriteStream(streamId: any, connection: any)` | 280 |  |
| `PlaceableHusbandryMeadow:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 291 |  |
| `PlaceableHusbandryMeadow:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 307 |  |
| `PlaceableHusbandryMeadow:loadFromXMLFile(xmlFile: any, key: any)` | 322 |  |
| `PlaceableHusbandryMeadow:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 370 |  |
| `PlaceableHusbandryMeadow:getFoodInfos(superFunc: any)` | 704 |  |
| `PlaceableHusbandryMeadow:updateInfo(superFunc: any, infoTable: any)` | 717 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `updateInfo` | 42 |
| registerOverwrittenFunction | `getFoodInfos` | 43 |
| registerOverwrittenFunction | `getAvailableFood` | 44 |
| registerOverwrittenFunction | `removeFood` | 45 |
| registerEventListener | `onLoad` | 51 |
| registerEventListener | `onPostLoad` | 52 |
| registerEventListener | `onDelete` | 53 |
| registerEventListener | `onUpdate` | 54 |
| registerEventListener | `onReadStream` | 55 |
| registerEventListener | `onWriteStream` | 56 |
| registerEventListener | `onReadUpdateStream` | 57 |
| registerEventListener | `onWriteUpdateStream` | 58 |
| registerEventListener | `onFinishedFeeding` | 59 |
| registerEventListener | `onHusbandryAnimalsCreated` | 60 |
| registerEventListener | `onHusbandryFenceCustomizingUserLeft` | 61 |

## Messages

- écoute `MessageType.START_GROWTH_PERIOD` (l.363)
- écoute `MessageType.FINISHED_GROWTH_PERIOD` (l.364)
