# vehicles/specializations/WoodCrusher.lua

Source : `dataS/scripts/vehicles/specializations/WoodCrusher.lua` — FS25 1.25.1.0

- **WoodCrusher** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WoodCrusher.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `WoodCrusher.initSpecialization()` | 25 |  |
| `WoodCrusher.registerWoodCrusherXMLPaths(schema: any, key: any)` | 39 |  |
| `WoodCrusher.registerFunctions(vehicleType: any)` | 72 |  |
| `WoodCrusher.registerOverwrittenFunctions(vehicleType: any)` | 78 |  |
| `WoodCrusher.registerEventListeners(vehicleType: any)` | 88 |  |
| `WoodCrusher:onLoad(savegame: table)` | 102 |  |
| `WoodCrusher:onDelete()` | 121 |  |
| `WoodCrusher:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 130 |  |
| `WoodCrusher:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 146 |  |
| `WoodCrusher:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 158 |  |
| `WoodCrusher:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 167 |  |
| `WoodCrusher:onTurnedOn()` | 224 |  |
| `WoodCrusher:onTurnedOff()` | 231 |  |
| `WoodCrusher:getCanBeTurnedOn(superFunc: any) → boolean` | 238 |  |
| `WoodCrusher:getConsumingLoad(superFunc: any)` | 249 |  |
| `WoodCrusher:getRequiresPower(superFunc: any)` | 262 |  |
| `WoodCrusher:getDirtMultiplier(superFunc: any) → number` | 273 |  |
| `WoodCrusher:getWearMultiplier(superFunc: any) → number` | 287 |  |
| `WoodCrusher:onCrushedSplitShape(splitType: table, volume: number)` | 302 |  |
| `WoodCrusher.loadWoodCrusher(self: table, woodCrusher: table, xmlFile: XMLFile, rootNode: integer, i3dMappings: table)` | 319 |  |
| `WoodCrusher.deleteWoodCrusher(self: any, woodCrusher: any)` | 453 |  |
| `WoodCrusher.updateWoodCrusher(self: number, woodCrusher: any, dt: number, isTurnedOn: any)` | 474 |  |
| `WoodCrusher.updateTickWoodCrusher(self: number, woodCrusher: any, dt: number, isTurnedOn: any)` | 541 |  |
| `WoodCrusher.turnOnWoodCrusher(self: any, woodCrusher: any)` | 608 |  |
| `WoodCrusher.turnOffWoodCrusher(self: any, woodCrusher: any)` | 629 |  |
| `WoodCrusher.crushSplitShape(self: integer, woodCrusher: any, shape: integer)` | 657 |  |
| `WoodCrusher.woodCrusherSplitShapeCallback(self: integer, shape: integer, isBelow: boolean, isAbove: boolean, minY: number, maxY: number, minZ: number, maxZ: number)` | 676 |  |
| `WoodCrusher.woodCrusherMoveTriggerCallback(self: integer, triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 691 |  |
| `WoodCrusher.woodCrusherDownForceTriggerCallback(self: integer, triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 722 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onCrushedSplitShape` | 73 |
| registerOverwrittenFunction | `getDirtMultiplier` | 79 |
| registerOverwrittenFunction | `getWearMultiplier` | 80 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 81 |
| registerOverwrittenFunction | `getConsumingLoad` | 82 |
| registerOverwrittenFunction | `getRequiresPower` | 83 |
| registerEventListener | `onLoad` | 89 |
| registerEventListener | `onDelete` | 90 |
| registerEventListener | `onReadUpdateStream` | 91 |
| registerEventListener | `onWriteUpdateStream` | 92 |
| registerEventListener | `onUpdate` | 93 |
| registerEventListener | `onUpdateTick` | 94 |
| registerEventListener | `onTurnedOn` | 95 |
| registerEventListener | `onTurnedOff` | 96 |
