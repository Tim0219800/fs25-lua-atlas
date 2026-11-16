# vehicles/specializations/FillVolume.lua

*[Version française](../../../fr/scripts/vehicles/specializations/FillVolume.md)*

Source: `dataS/scripts/vehicles/specializations/FillVolume.lua` — FS25 1.25.1.0

✍ Vehicle specialization that renders the content of a FillUnit as a visible, deformable 3D heap (fill plane shape) inside trailers, hoppers and similar tanks. It requires FillUnit, reads the fillVolume configuration in the vehicle XML (volumes, load and unload info nodes, height nodes, deformer nodes), creates engine fill plane shapes, and adds material to them whenever a fill unit level changes. Also drives height-dependent node scaling and translation, deformers moved by moving tools, and syncs the last fill position to clients. Created shapes and updates are client-oriented but the fill position is sent by the server.

- **FillVolume** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `FillVolume.prerequisitesPresent(specializations: any)` | 31 | ✍ Returns true only if the vehicle type also has the FillUnit specialization. |
| `FillVolume.initSpecialization()` | 37 | ✍ Registers the fillVolume vehicle configuration and the XML schema for volumes (node, fill unit index and factor, heap limits, deformer nodes), load/unload info nodes, height nodes, and the fillVolume extras on moving tools and moving parts. |
| `FillVolume.registerInfoNodeXMLPaths(schema: any, basePath: any)` | 94 | ✍ Registers the XML attributes of an info node list (node, width, length, height index, priority, min and max height or fill percentage, translation start and end), shared by load and unload infos. |
| `FillVolume.registerFunctions(vehicleType: any)` | 111 | ✍ Registers the fill volume functions on the vehicle type: loaders, load and unload info getters, fill volume index lookup, forced fill type setters and UV scroll speed. |
| `FillVolume.registerOverwrittenFunctions(vehicleType: any)` | 125 | ✍ Overrides setMovingToolDirty, loadExtraDependentParts and updateExtraDependentParts so moving tools and parts can mark deformer nodes as dirty. |
| `FillVolume.registerEventListeners(vehicleType: any)` | 133 | ✍ Subscribes to load, delete, read and write update stream, update, and onFillUnitFillLevelChanged events. |
| `FillVolume:onLoad(savegame: any)` | 144 | ✍ Loads the configured fill volumes, normalizes fill unit factors, creates a fill plane shape per volume (with material and texture arrays, measuring the base height offset), finds deformer polylines, then loads load, unload and height infos. Removes the update listener on servers or when nothing is configured. |
| `FillVolume:onDelete()` | 252 | ✍ Deletes the engine fill plane shapes created for each volume and clears the references. |
| `FillVolume:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 266 | ✍ Client side: when flagged, reads the compressed last fill position (two values) sent by the server. |
| `FillVolume:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 279 | ✍ Server side: when the dirty flag is set, writes the last sent fill position (two compressed values) to the clients. |
| `FillVolume:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 292 | ✍ Client only. Applies pending deformer translations to the shape polylines, scrolls the UV offset using getFillVolumeUVScrollSpeed, and recomputes height node values by sampling the heap at reference nodes and then scaling, translating or orienting the linked nodes. |
| `FillVolume:loadFillVolume(xmlFile: any, key: any, entry: any)` | 433 | ✍ Reads one volume: node (must be a shape), required valid fillUnitIndex, factor, side plane and heap options, default and forced fill types, slope and error limits, and deformer nodes. Returns false on invalid data. Note: the maximum physical angle is fixed at 35 degrees at load. |
| `FillVolume:loadFillVolumeInfo(xmlFile: any, key: any, entry: any)` | 532 | ✍ Reads a list of fill position info nodes (node, width, length, height and fill percentage conditions, translation range) and sorts them by descending priority. Always returns true. |
| `FillVolume:loadFillVolumeHeightNode(xmlFile: any, key: any, entry: any)` | 578 | ✍ Reads one height node: required fill volume index (fails if no such volume), reference nodes sampled for height, and affected nodes with scale and translation axes, maxima, offset and orientation option. |
| `FillVolume:getFillVolumeLoadInfo(loadInfoIndex: any)` | 644 | ✍ Returns the load info entry (list of fill position nodes) at the given index, or nil. |
| `FillVolume:getFillVolumeUnloadInfo(unloadInfoIndex: any)` | 651 | ✍ Returns the unload info entry at the given index, or nil. |
| `FillVolume:getFillVolumeIndicesByFillUnitIndex(fillUnitIndex: any)` | 658 | ✍ Returns an array of the indices of all fill volumes attached to the given fill unit index (possibly empty). |
| `FillVolume:setFillVolumeForcedFillTypeByFillUnitIndex(fillUnitIndex: any, forcedFillType: any)` | 672 | ✍ Forces the displayed fill type on every fill volume linked to the given fill unit. |
| `FillVolume:setFillVolumeForcedFillType(fillVolumeIndex: any, forcedFillType: any)` | 683 | ✍ Sets a forced display fill type on one volume; it is used at the next fill level change and cleared when the unit becomes empty. |
| `FillVolume:getFillVolumeUVScrollSpeed()` | 692 | ✍ Hook returning 0, 0, 0 (no texture scrolling); other specializations can override it to animate the heap surface. |
| `FillVolume:setMovingToolDirty(superFunc: function, node: integer, forceUpdate: boolean, dt: number)` | 702 | ✍ Overrides the parent: after calling it, marks the deformer bound to that moving tool node as dirty so the heap is deformed in the next update. |
| `FillVolume:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 716 | ✍ Overrides the parent: after it succeeds, reads fillVolumeIndex and deformerNodeIndices from a moving part or tool entry. Returns false if the parent fails. |
| `FillVolume:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 738 | ✍ Overrides the parent: resolves the referenced volume once (warning and dropping the link if it does not exist), then marks the listed deformer nodes as dirty. |
| `FillVolume:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, _: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 767 | ✍ Core handler: syncs each linked volume to the unit level, sets surface angle and texture for the fill type, shows or hides the shape, and adds or removes material at the load position (best fill info node, or a default spot on clients). May send the fill position and flags height nodes and deformers dirty. |
| `FillVolume:updateDebugValues(values: any)` | 962 | ✍ Appends debug rows (fill unit and volume index, last fill type, shape id, visibility, texture array index, last fill positions) to the given values list for the vehicle debug display. |

## Specialization

| Type | Name | Line |
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
