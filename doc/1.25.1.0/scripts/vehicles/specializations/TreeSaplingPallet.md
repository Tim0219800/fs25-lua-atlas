# vehicles/specializations/TreeSaplingPallet.lua

*[Version française](../../../fr/scripts/vehicles/specializations/TreeSaplingPallet.md)*

Source: `dataS/scripts/vehicles/specializations/TreeSaplingPallet.lua` — FS25 1.25.1.0

✍ Specialization for sapling pallets. It stores which tree type and variation the pallet carries, loads the matching sapling I3D model and clones it onto the sapling link nodes, and shows or hides those nodes according to the fill level. TreePlanter reads and writes the type through `getTreeSaplingPalletType` and `setTreeSaplingPalletType`. It has no prerequisites and adds a `treeSaplingType` vehicle configuration.

- **TreeSaplingPallet** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `TreeSaplingPallet.prerequisitesPresent(specializations: any)` | 15 | ✍ Always returns true: no other specialization is required. |
| `TreeSaplingPallet.initSpecialization()` | 21 | ✍ Registers the `treeSaplingType` configuration type and the `vehicle.treeSaplingPallet` XML keys (fill unit index, tree type, variation, custom I3D file, sapling nodes, per-configuration sapling nodes), plus savegame keys for tree type and variation. |
| `TreeSaplingPallet.registerFunctions(vehicleType: any)` | 46 | ✍ Registers the sapling load callback, the tree type getter and setter, and the two visual update functions. |
| `TreeSaplingPallet.registerOverwrittenFunctions(vehicleType: any)` | 56 | ✍ Registers an override of `showInfo`. |
| `TreeSaplingPallet.registerEventListeners(vehicleType: any)` | 62 | ✍ Subscribes to onLoad, onDelete and onFillUnitFillLevelChanged. |
| `TreeSaplingPallet:onLoad(savegame: any)` | 70 | ✍ Resolves tree type, variation, fill unit and I3D file from XML, the selected configuration item and the savegame, finds the sapling file from the tree plant manager, collects the sapling nodes (optionally randomising rotation and scale) and starts loading the visuals. Note: the code default type is "spruce" while the schema documents "spruce1". |
| `TreeSaplingPallet:onDelete()` | 148 | ✍ Releases the shared sapling I3D request and deletes the cloned sapling shapes. |
| `TreeSaplingPallet:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 168 | ✍ Saves the current tree type name and variation name. |
| `TreeSaplingPallet:getTreeSaplingPalletType() → string` | 182 | ✍ Returns the current tree type name and variation name (two values). |
| `TreeSaplingPallet:setTreeSaplingPalletType(treeTypeName: any, variationName: any) → string` | 190 | ✍ Stores a new tree type and variation and reloads the sapling visuals if either changed. Unlike `onLoad`, it does not look up a new I3D filename, so the file used stays the one resolved at load time. |
| `TreeSaplingPallet:updateTreeSaplingVisuals() → string` | 201 | ✍ Releases any previous shared I3D request and starts loading the sapling file, as a sub-file while the vehicle is still loading or asynchronously afterwards. |
| `TreeSaplingPallet:onTreeSaplingLoaded(i3dNode: any, failedReason: any, args: any) → integer, table` | 222 | ✍ Load callback: clones the loaded sapling shape onto every sapling node (replacing earlier clones), deletes the loaded I3D root and refreshes node visibility. |
| `TreeSaplingPallet:updateTreeSaplingPalletNodes()` | 244 | ✍ Shows as many sapling nodes as the rounded fill level and sets the `hideByIndex` shader parameter from capacity minus fill level. |
| `TreeSaplingPallet:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 259 | ✍ Refreshes the sapling node visibility on any fill unit level change. |
| `TreeSaplingPallet:showInfo(superFunc: any, box: any)` | 265 | ✍ Override: adds a tree type line to the info box when a tree type description was found, then calls the parent. |

## Specialization

| Type | Name | Line |
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
