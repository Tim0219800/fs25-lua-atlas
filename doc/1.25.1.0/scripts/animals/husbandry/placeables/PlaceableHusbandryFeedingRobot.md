# animals/husbandry/placeables/PlaceableHusbandryFeedingRobot.lua

Source : `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryFeedingRobot.lua` — FS25 1.25.1.0

- **PlaceableHusbandryFeedingRobot** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryFeedingRobot.prerequisitesPresent(specializations: table) → boolean` | 29 |  |
| `PlaceableHusbandryFeedingRobot.registerFunctions(placeableType: any)` | 35 |  |
| `PlaceableHusbandryFeedingRobot.registerOverwrittenFunctions(placeableType: any)` | 41 |  |
| `PlaceableHusbandryFeedingRobot.registerEventListeners(placeableType: any)` | 50 |  |
| `PlaceableHusbandryFeedingRobot.registerXMLPaths(schema: any, basePath: any)` | 61 |  |
| `PlaceableHusbandryFeedingRobot.registerSavegameXMLPaths(schema: any, basePath: any)` | 79 |  |
| `PlaceableHusbandryFeedingRobot:onLoad(savegame: any)` | 87 |  |
| `PlaceableHusbandryFeedingRobot:onPostLoad(savegame: any)` | 159 |  |
| `PlaceableHusbandryFeedingRobot:onFeedingRobotLoaded(robot: any, args: any)` | 189 |  |
| `PlaceableHusbandryFeedingRobot:onDelete()` | 195 |  |
| `PlaceableHusbandryFeedingRobot:onFinalizePlacement()` | 205 |  |
| `PlaceableHusbandryFeedingRobot:onReadStream(streamId: any, connection: any)` | 214 |  |
| `PlaceableHusbandryFeedingRobot:onWriteStream(streamId: any, connection: any)` | 225 |  |
| `PlaceableHusbandryFeedingRobot:loadFromXMLFile(xmlFile: any, key: any)` | 236 |  |
| `PlaceableHusbandryFeedingRobot:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 245 |  |
| `PlaceableHusbandryFeedingRobot:setOwnerFarmId(superFunc: any, farmId: any)` | 254 |  |
| `PlaceableHusbandryFeedingRobot:updateFeeding(superFunc: any)` | 265 |  |
| `PlaceableHusbandryFeedingRobot:collectPickObjects(superFunc: any, node: any)` | 279 |  |
| `PlaceableHusbandryFeedingRobot:updateInfo(superFunc: any, infoTable: any)` | 292 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onFeedingRobotLoaded` | 36 |
| registerOverwrittenFunction | `setOwnerFarmId` | 42 |
| registerOverwrittenFunction | `updateFeeding` | 43 |
| registerOverwrittenFunction | `collectPickObjects` | 44 |
| registerOverwrittenFunction | `updateInfo` | 45 |
| registerEventListener | `onLoad` | 51 |
| registerEventListener | `onPostLoad` | 52 |
| registerEventListener | `onDelete` | 53 |
| registerEventListener | `onFinalizePlacement` | 54 |
| registerEventListener | `onReadStream` | 55 |
| registerEventListener | `onWriteStream` | 56 |
