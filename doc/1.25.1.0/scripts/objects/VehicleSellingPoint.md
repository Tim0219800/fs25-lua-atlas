# objects/VehicleSellingPoint.lua

Source : `dataS/scripts/objects/VehicleSellingPoint.lua` — FS25 1.25.1.0

- **VehicleSellingPoint** (l.9)
- **VehicleSellingPointActivatable** (l.211)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleSellingPoint.registerXMLPaths(schema: any, basePath: any)` | 14 |  |
| `VehicleSellingPoint.new() → table` | 26 |  |
| `VehicleSellingPoint:load(components: any, xmlFile: any, key: any, i3dMappings: any)` | 40 |  |
| `VehicleSellingPoint:delete()` | 67 |  |
| `VehicleSellingPoint:openMenu()` | 86 |  |
| `VehicleSellingPoint:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 101 |  |
| `VehicleSellingPoint:sellAreaTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: any)` | 123 |  |
| `VehicleSellingPoint:determineCurrentVehicles()` | 137 |  |
| `VehicleSellingPoint:updateIconVisibility()` | 175 |  |
| `VehicleSellingPoint:playerFarmChanged(player: any)` | 187 |  |
| `VehicleSellingPoint:setOwnerFarmId(ownerFarmId: any)` | 195 |  |
| `VehicleSellingPoint:getOwnerFarmId()` | 202 |  |
| `VehicleSellingPointActivatable.new(sellingPoint: any, ownWorkshop: any)` | 215 |  |
| `VehicleSellingPointActivatable:getIsActivatable()` | 231 |  |
| `VehicleSellingPointActivatable:run()` | 252 |  |
| `VehicleSellingPointActivatable:getDistance(x: any, y: any, z: any)` | 263 |  |

## Messages

- écoute `MessageType.PLAYER_FARM_CHANGED` (l.59)
- écoute `MessageType.PLAYER_CREATED` (l.60)
