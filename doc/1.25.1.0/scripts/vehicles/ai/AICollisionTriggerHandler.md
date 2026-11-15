# vehicles/ai/AICollisionTriggerHandler.lua

Source : `dataS/scripts/vehicles/ai/AICollisionTriggerHandler.lua` — FS25 1.25.1.0

- **AICollisionTriggerHandler** (l.8)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AICollisionTriggerHandler.new(customMt: any)` | 20 |  |
| `AICollisionTriggerHandler:init(vehicle: any, strategy: any)` | 40 |  |
| `AICollisionTriggerHandler:update(dt: any, movingDirection: any)` | 97 |  |
| `AICollisionTriggerHandler:setStaticCollisionCallback(callback: any)` | 151 |  |
| `AICollisionTriggerHandler:updateStaticCollisionCallback()` | 157 |  |
| `AICollisionTriggerHandler:setIsBlockedCallback(callback: any)` | 177 |  |
| `AICollisionTriggerHandler:updateBlockedCallback()` | 183 |  |
| `AICollisionTriggerHandler:setCollisionDistanceCallback(callback: any)` | 203 |  |
| `AICollisionTriggerHandler:generateTriggerPath(vehicle: any, trigger: any, movingDirection: any)` | 209 |  |
| `AICollisionTriggerHandler:countHitObject(objectId: integer, trigger: table)` | 227 |  |
| `AICollisionTriggerHandler:onVehicleCollisionDistanceCallback(distance: any, objectId: any, subShapeIndex: any, isLast: any, trigger: any)` | 268 |  |
