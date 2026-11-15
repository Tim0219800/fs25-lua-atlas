# vehicles/specializations/CCTDrivable.lua

Source : `dataS/scripts/vehicles/specializations/CCTDrivable.lua` — FS25 1.25.1.0

- **CCTDrivable** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CCTDrivable.prerequisitesPresent(specializations: table) → boolean` | 20 |  |
| `CCTDrivable.initSpecialization()` | 26 |  |
| `CCTDrivable.registerFunctions(vehicleType: table)` | 41 |  |
| `CCTDrivable.registerOverwrittenFunctions(vehicleType: any)` | 53 |  |
| `CCTDrivable.registerEventListeners(vehicleType: table)` | 63 |  |
| `CCTDrivable:onLoad(savegame: table)` | 71 |  |
| `CCTDrivable:onDelete()` | 119 |  |
| `CCTDrivable:moveCCT(moveX: any, moveY: any, moveZ: any)` | 135 |  |
| `CCTDrivable:getIsCCTOnGround() → integer` | 167 |  |
| `CCTDrivable:getCCTCollisionMask() → integer` | 179 |  |
| `CCTDrivable:getCCTWorldTranslation() → number, number, number` | 189 |  |
| `CCTDrivable:getIsAIMovingObstacle() → boolean` | 199 |  |
| `CCTDrivable:setWorldPosition(superFunc: number, x: number, y: number, z: number, xRot: number, yRot: number, zRot: number, i: integer, changeInterp: boolean)` | 213 |  |
| `CCTDrivable:setWorldPositionQuaternion(superFunc: number, x: number, y: number, z: number, qx: number, qy: number, qz: number, qw: number, i: integer, changeInterp: boolean)` | 232 |  |
| `CCTDrivable:removeFromPhysics(superFunc: function) → boolean` | 265 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getTouchingNode` | 42 |
| registerFunction | `moveCCTExternal` | 43 |
| registerFunction | `moveCCT` | 44 |
| registerFunction | `getIsCCTOnGround` | 45 |
| registerFunction | `getCCTCollisionMask` | 46 |
| registerFunction | `getCCTWorldTranslation` | 47 |
| registerFunction | `getIsAIMovingObstacle` | 48 |
| registerOverwrittenFunction | `addToPhysics` | 54 |
| registerOverwrittenFunction | `removeFromPhysics` | 55 |
| registerOverwrittenFunction | `setWorldPosition` | 56 |
| registerOverwrittenFunction | `setWorldPositionQuaternion` | 57 |
| registerEventListener | `onLoad` | 64 |
| registerEventListener | `onDelete` | 65 |
