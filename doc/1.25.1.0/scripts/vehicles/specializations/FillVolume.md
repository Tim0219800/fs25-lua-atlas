# vehicles/specializations/FillVolume.lua

Source : `dataS/scripts/vehicles/specializations/FillVolume.lua` — FS25 1.25.1.0

- **FillVolume** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FillVolume.prerequisitesPresent(specializations: any)` | 31 |  |
| `FillVolume.initSpecialization()` | 37 |  |
| `FillVolume.registerInfoNodeXMLPaths(schema: any, basePath: any)` | 94 |  |
| `FillVolume.registerFunctions(vehicleType: any)` | 111 |  |
| `FillVolume.registerOverwrittenFunctions(vehicleType: any)` | 125 |  |
| `FillVolume.registerEventListeners(vehicleType: any)` | 133 |  |
| `FillVolume:onLoad(savegame: any)` | 144 |  |
| `FillVolume:onDelete()` | 252 |  |
| `FillVolume:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 266 |  |
| `FillVolume:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 279 |  |
| `FillVolume:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 292 |  |
| `FillVolume:loadFillVolume(xmlFile: any, key: any, entry: any)` | 433 |  |
| `FillVolume:loadFillVolumeInfo(xmlFile: any, key: any, entry: any)` | 532 |  |
| `FillVolume:loadFillVolumeHeightNode(xmlFile: any, key: any, entry: any)` | 578 |  |
| `FillVolume:getFillVolumeLoadInfo(loadInfoIndex: any)` | 644 |  |
| `FillVolume:getFillVolumeUnloadInfo(unloadInfoIndex: any)` | 651 |  |
| `FillVolume:getFillVolumeIndicesByFillUnitIndex(fillUnitIndex: any)` | 658 |  |
| `FillVolume:setFillVolumeForcedFillTypeByFillUnitIndex(fillUnitIndex: any, forcedFillType: any)` | 672 |  |
| `FillVolume:setFillVolumeForcedFillType(fillVolumeIndex: any, forcedFillType: any)` | 683 |  |
| `FillVolume:getFillVolumeUVScrollSpeed()` | 692 |  |
| `FillVolume:setMovingToolDirty(superFunc: function, node: integer, forceUpdate: boolean, dt: number)` | 702 |  |
| `FillVolume:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 716 |  |
| `FillVolume:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 738 |  |
| `FillVolume:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, _: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 767 |  |
| `FillVolume:updateDebugValues(values: any)` | 962 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadFillVolume` | 112 |
| registerFunction | `loadFillVolumeInfo` | 113 |
| registerFunction | `loadFillVolumeHeightNode` | 114 |
| registerFunction | `getFillVolumeLoadInfo` | 115 |
| registerFunction | `getFillVolumeUnloadInfo` | 116 |
| registerFunction | `getFillVolumeIndicesByFillUnitIndex` | 117 |
| registerFunction | `setFillVolumeForcedFillTypeByFillUnitIndex` | 118 |
| registerFunction | `setFillVolumeForcedFillType` | 119 |
| registerFunction | `getFillVolumeUVScrollSpeed` | 120 |
| registerOverwrittenFunction | `setMovingToolDirty` | 126 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 127 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 128 |
| registerEventListener | `onLoad` | 134 |
| registerEventListener | `onDelete` | 135 |
| registerEventListener | `onReadUpdateStream` | 136 |
| registerEventListener | `onWriteUpdateStream` | 137 |
| registerEventListener | `onUpdate` | 138 |
| registerEventListener | `onFillUnitFillLevelChanged` | 139 |
