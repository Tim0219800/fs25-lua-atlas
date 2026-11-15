# objects/ProductionPoint.lua

Source: `dataS/scripts/objects/ProductionPoint.lua` — FS25 1.25.1.0

- **ProductionPoint** inherits from `Object` (l.45)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ProductionPoint.registerXMLPaths(schema: any, basePath: any)` | 49 |  |
| `ProductionPoint.registerSavegameXMLPaths(schema: any, basePath: any)` | 88 |  |
| `ProductionPoint:readStream(streamId: integer, connection: table)` | 531 |  |
| `ProductionPoint:writeStream(streamId: integer, connection: table)` | 591 |  |
| `ProductionPoint:readUpdateStream(streamId: any, timestamp: any, connection: any)` | 638 |  |
| `ProductionPoint:writeUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 646 |  |
| `ProductionPoint:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 987 |  |
| `ProductionPoint.loadSpecValueInputFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 1260 |  |
| `ProductionPoint.getSpecValueInputFillTypes(storeItem: any, realItem: any)` | 1283 |  |
| `ProductionPoint.loadSpecValueOutputFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 1293 |  |
| `ProductionPoint.getSpecValueOutputFillTypes(storeItem: any, realItem: any)` | 1316 |  |
| `ProductionPoint:interactionTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1326 |  |
| `ProductionPoint:openMenu()` | 1350 |  |
| `ProductionPoint:buyRequest(requestCallback: any, target: any)` | 1357 |  |

## Messages

- publishes `MessageType.GUI_INGAME_OPEN_PRODUCTION_SCREEN` (l.1352)
