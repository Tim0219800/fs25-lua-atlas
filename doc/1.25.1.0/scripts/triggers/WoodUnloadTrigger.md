# triggers/WoodUnloadTrigger.lua

Source : `dataS/scripts/triggers/WoodUnloadTrigger.lua` — FS25 1.25.1.0

- **WoodUnloadTrigger** hérite de `UnloadTrigger` (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WoodUnloadTrigger.registerXMLPaths(schema: any, basePath: any)` | 24 |  |
| `WoodUnloadTrigger.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 38 |  |
| `WoodUnloadTrigger:load(components: table, xmlFile: table, xmlNode: string, target: table, extraAttributes: table, i3dMappings: table) → boolean` | 61 |  |
| `WoodUnloadTrigger:delete()` | 106 |  |
| `WoodUnloadTrigger:processWood(farmId: any, noEventSend: any)` | 124 |  |
| `WoodUnloadTrigger:calculateWoodBaseValue(objectId: any)` | 199 |  |
| `WoodUnloadTrigger:calculateWoodBaseValueForData(volume: any, splitType: any, sizeX: any, sizeY: any, sizeZ: any, numConvexes: any, numAttachments: any)` | 209 |  |
| `WoodUnloadTrigger:update(dt: any)` | 247 |  |
| `WoodUnloadTrigger:woodTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 292 |  |
| `WoodUnloadTrigger:getWoodLogs()` | 332 |  |
| `WoodUnloadTrigger:woodSellTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 338 |  |
