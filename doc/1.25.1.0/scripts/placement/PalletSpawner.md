# placement/PalletSpawner.lua

Source : `dataS/scripts/placement/PalletSpawner.lua` — FS25 1.25.1.0

- **PalletSpawner** (l.19)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PalletSpawner.new(baseDirectory: any, customMt: any)` | 23 |  |
| `PalletSpawner:load(components: table, xmlFile: table, key: string, customEnv: string, i3dMappings: table) → boolean` | 42 |  |
| `PalletSpawner:delete()` | 98 |  |
| `PalletSpawner:loadPalletFromFilename(palletFilename: any, limitFillTypeId: any)` | 103 |  |
| `PalletSpawner:getSupportedFillTypes()` | 140 |  |
| `PalletSpawner:spawnPallet(farmId: integer, fillTypeId: integer, callback: function, callbackTarget: table)` | 149 |  |
| `PalletSpawner:getOrSpawnPallet(farmId: integer, fillTypeId: integer, callback: function, callbackTarget: table)` | 170 |  |
| `PalletSpawner:getAllPallets(fillTypeId: integer, callbackFunc: function, callbackTarget: table)` | 196 |  |
| `PalletSpawner:update(dt: any)` | 214 |  |
| `PalletSpawner:onSpawnSearchFinished(location: any)` | 233 |  |
| `PalletSpawner:onFinishLoadingPallet(vehicles: any, vehicleLoadState: any)` | 261 |  |
| `PalletSpawner:onFindExistingPallet(node: any)` | 271 |  |
| `PalletSpawner:onFindPallet(node: any)` | 285 |  |
| `PalletSpawner.registerXMLPaths(schema: any, basePath: any)` | 297 |  |
