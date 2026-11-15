# objects/BunkerSilo.lua

Source : `dataS/scripts/objects/BunkerSilo.lua` — FS25 1.25.1.0

- **BunkerSilo** hérite de `Object` (l.7)
- **BunkerSiloActivatable** (l.1005)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BunkerSilo:onCreate(id: integer)` | 24 |  |
| `BunkerSilo.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 34 |  |
| `BunkerSilo:load(components: table, xmlFile: table, key: string, i3dMappings: table) → boolean` | 87 |  |
| `BunkerSilo:delete()` | 181 |  |
| `BunkerSilo:readStream(streamId: integer, connection: table)` | 199 |  |
| `BunkerSilo:writeStream(streamId: integer, connection: table)` | 216 |  |
| `BunkerSilo:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 233 |  |
| `BunkerSilo:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 260 |  |
| `BunkerSilo:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 285 |  |
| `BunkerSilo:saveToXMLFile(xmlFile: XMLFile, key: string, usedModNames: table)` | 379 |  |
| `BunkerSilo:update(dt: number)` | 391 |  |
| `BunkerSilo:updateTick(dt: number)` | 481 |  |
| `BunkerSilo:updateFillLevel()` | 508 |  |
| `BunkerSilo:setState(state: boolean, showNotification: boolean)` | 541 |  |
| `BunkerSilo:openSilo(px: number, py: number, pz: number)` | 631 |  |
| `BunkerSilo:getBunkerAreaOffset(updateAtFront: boolean, offset: number, fillType: integer) → number` | 656 |  |
| `BunkerSilo:switchFillTypeAtOffset(switchAtFront: boolean, offset: number, length: number)` | 689 |  |
| `BunkerSilo:getIsCloserToFront(ix: number, iy: number, iz: number) → boolean` | 720 |  |
| `BunkerSilo:getCanInteract(showInformationOnly: boolean) → boolean` | 740 |  |
| `BunkerSilo:getCanCloseSilo() → boolean` | 772 |  |
| `BunkerSilo:getCanOpenSilo() → boolean` | 779 |  |
| `BunkerSilo:clearSiloArea()` | 798 |  |
| `BunkerSilo:getInteractionPosition() → number, number, number` | 849 |  |
| `BunkerSilo:interactionTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 875 |  |
| `BunkerSilo.onChangedFillLevelCallback(self: table, vehicle: table, fillDelta: integer, fillType: integer, x: any, y: any, z: any)` | 927 |  |
| `BunkerSilo.registerXMLPaths(schema: any, basePath: any)` | 967 |  |
| `BunkerSilo.registerSavegameXMLPaths(schema: any, basePath: any)` | 992 |  |

## Messages

- écoute `MessageType.HOUR_CHANGED` (l.75)
