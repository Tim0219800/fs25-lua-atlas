# vehicles/specializations/TreeSaplingPallet.lua

Source : `dataS/scripts/vehicles/specializations/TreeSaplingPallet.lua` — FS25 1.25.1.0

- **TreeSaplingPallet** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TreeSaplingPallet.prerequisitesPresent(specializations: any)` | 15 |  |
| `TreeSaplingPallet.initSpecialization()` | 21 |  |
| `TreeSaplingPallet.registerFunctions(vehicleType: any)` | 46 |  |
| `TreeSaplingPallet.registerOverwrittenFunctions(vehicleType: any)` | 56 |  |
| `TreeSaplingPallet.registerEventListeners(vehicleType: any)` | 62 |  |
| `TreeSaplingPallet:onLoad(savegame: any)` | 70 |  |
| `TreeSaplingPallet:onDelete()` | 148 |  |
| `TreeSaplingPallet:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 168 |  |
| `TreeSaplingPallet:getTreeSaplingPalletType() → string` | 182 |  |
| `TreeSaplingPallet:setTreeSaplingPalletType(treeTypeName: any, variationName: any) → string` | 190 |  |
| `TreeSaplingPallet:updateTreeSaplingVisuals() → string` | 201 |  |
| `TreeSaplingPallet:onTreeSaplingLoaded(i3dNode: any, failedReason: any, args: any) → integer, table` | 222 |  |
| `TreeSaplingPallet:updateTreeSaplingPalletNodes()` | 244 |  |
| `TreeSaplingPallet:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 259 |  |
| `TreeSaplingPallet:showInfo(superFunc: any, box: any)` | 265 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onTreeSaplingLoaded` | 47 |
| registerFunction | `getTreeSaplingPalletType` | 48 |
| registerFunction | `setTreeSaplingPalletType` | 49 |
| registerFunction | `updateTreeSaplingVisuals` | 50 |
| registerFunction | `updateTreeSaplingPalletNodes` | 51 |
| registerOverwrittenFunction | `showInfo` | 57 |
| registerEventListener | `onLoad` | 63 |
| registerEventListener | `onDelete` | 64 |
| registerEventListener | `onFillUnitFillLevelChanged` | 65 |
