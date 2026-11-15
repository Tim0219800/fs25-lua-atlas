# misc/ConnectionHoseManager.lua

Source : `dataS/scripts/misc/ConnectionHoseManager.lua` — FS25 1.25.1.0

- **ConnectionHoseManager** hérite de `AbstractManager` (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ConnectionHoseManager.new(customMt: any) → table` | 22 |  |
| `ConnectionHoseManager:initDataStructures()` | 35 |  |
| `ConnectionHoseManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 48 |  |
| `ConnectionHoseManager:unloadMapData() → boolean` | 63 |  |
| `ConnectionHoseManager:addModConnectionHoses(xmlFilename: string, customEnvironment: string, baseDirectory: string)` | 100 |  |
| `ConnectionHoseManager:loadConnectionHosesFromXML(xmlFilename: string, customEnvironment: string, baseDirectory: string)` | 111 |  |
| `ConnectionHoseManager:basicHoseI3DFileLoaded(i3dNode: string, failedReason: any, args: any)` | 270 |  |
| `ConnectionHoseManager:adapterI3DFileLoaded(i3dNode: string, failedReason: any, args: any)` | 320 |  |
| `ConnectionHoseManager:materialI3DFileLoaded(i3dNode: string, failedReason: any, args: any)` | 359 |  |
| `ConnectionHoseManager:socketI3DFileLoaded(i3dNode: string, failedReason: any, args: any)` | 393 |  |
| `ConnectionHoseManager:getHoseTypeByName(typeName: any, customEnvironment: any)` | 450 |  |
| `ConnectionHoseManager:getHoseAdapterByName(hoseType: any, adapterName: any, customEnvironment: any)` | 467 |  |
| `ConnectionHoseManager:getHoseMaterialByName(hoseType: any, materialName: any, customEnvironment: any)` | 484 |  |
| `ConnectionHoseManager:getSocketByName(socketName: any, customEnvironment: any)` | 501 |  |
| `ConnectionHoseManager:getClonedAdapterNode(typeName: any, adapterName: any, customEnvironment: any, detached: any)` | 518 |  |
| `ConnectionHoseManager:getClonedHoseNode(typeName: any, hoseName: any, length: any, diameter: any, vehicleMaterial: any, customEnvironment: any)` | 546 |  |
| `ConnectionHoseManager:getClonedBasicHose(length: any, diameter: any)` | 594 |  |
| `ConnectionHoseManager:linkSocketToNode(socketName: any, node: any, customEnvironment: any, socketMaterial: any)` | 635 |  |
| `ConnectionHoseManager:getSocketTarget(socket: any, defaultTarget: any)` | 671 |  |
| `ConnectionHoseManager:openSocket(socket: any)` | 683 |  |
| `ConnectionHoseManager:closeSocket(socket: any)` | 698 |  |
| `ConnectionHoseManager:registerXMLPaths(schema: any)` | 713 |  |
