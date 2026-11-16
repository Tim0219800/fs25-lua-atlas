# vehicles/specializations/CropRowAdjustedNodes.lua

*[Version française](../../../fr/scripts/vehicles/specializations/CropRowAdjustedNodes.md)*

Source: `dataS/scripts/vehicles/specializations/CropRowAdjustedNodes.lua` — FS25 1.25.1.0

✍ Specialization that slides configured nodes sideways so implement parts line up with crop rows (or the middle between rows) of row crops. Rows are derived from the fruit type's plant spacing and a rasterized world position, snapped to 90 degree directions; only active while lowered, roughly aligned with the rows, and within a configurable distance of the player. Reads 'vehicle.cropRowAdjustedNodes'.

- **CropRowAdjustedNodes** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `CropRowAdjustedNodes.prerequisitesPresent(specializations: any)` | 15 | ✍ Always returns true: no other specialization is required. |
| `CropRowAdjustedNodes.initSpecialization()` | 21 | ✍ Registers the XML schema: max update distance and, per adjusted node, node, translation axis and limits, move speed, between-rows flag, fruit types and fold time limits. |
| `CropRowAdjustedNodes.registerFunctions(vehicleType: any)` | 46 | ✍ Registers loadCropRowAdjustedNodeFromXML, updateCropRowAdjustedNode and getIsCropRowAdjustedNodeActive. |
| `CropRowAdjustedNodes.registerEventListeners(vehicleType: any)` | 54 | ✍ Subscribes to load and update. |
| `CropRowAdjustedNodes:onLoad(savegame: any)` | 61 | ✍ Loads all adjusted nodes from XML and the max update distance; removes the update listener if none loaded. |
| `CropRowAdjustedNodes:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 81 | ✍ Each frame, if the vehicle is closer to the player than the max update distance, updates every adjusted node. |
| `CropRowAdjustedNodes:loadCropRowAdjustedNodeFromXML(xmlFile: any, key: any, adjustedNode: any)` | 92 | ✍ Loads one adjusted node: creates a reference transform group beside it, stores start translation, axis, limits, speed (converted from m/s to m/ms), between-rows flag, fruit types and fold limits. Returns false with a warning if the node or the fruit types are missing. |
| `CropRowAdjustedNodes:updateCropRowAdjustedNode(adjustedNode: any, dt: any)` | 153 | ✍ Computes the node's lateral offset to the nearest row from the fruit type under it, clamps it to the min/max translation and moves the node toward it at the configured speed. Returns to the start position when it becomes inactive. |
| `CropRowAdjustedNodes:getIsCropRowAdjustedNodeActive(adjustedNode: any)` | 231 | ✍ Returns true only when the fold time is within the node's limits, the implement is lowered, and its heading is within CropRowAdjustedNodes.MAX_ACTIVE_ANGLE (value not in this file) of a multiple of 90 degrees. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadCropRowAdjustedNodeFromXML` | 47 |
| registerFunction | `updateCropRowAdjustedNode` | 48 |
| registerFunction | `getIsCropRowAdjustedNodeActive` | 49 |
| registerEventListener | `onLoad` | 55 |
| registerEventListener | `onUpdate` | 56 |
