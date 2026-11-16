# placement/PlacementGrid2D.lua

*[Version française](../../fr/scripts/placement/PlacementGrid2D.md)*

Source: `dataS/scripts/placement/PlacementGrid2D.lua` — FS25 1.25.1.0

✍ Helper that models a rectangular area attached to a node (width along X, length along Z) and tracks which parts of it are occupied. Occupancy is stored as one entry per Z slice of size `spacing`, each holding the min and max X blocked. Two placement modes are mentioned in the file's comments, SIDES and FILL; the constants such as `MODE_SIDES` are not present in the dump, so their values are UNVERIFIED. The free-position query itself is not in this dump.

- **PlacementGrid2D** (l.54)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlacementGrid2D.new(node: any, width: any, length: any, spacing: any, mode: any)` | 58 | ✍ Creates a grid for the given node, width, length and slice spacing. The mode defaults to `PlacementGrid2D.MODE_SIDES`. Starts with no blocked areas and two invalid lower/upper position records. |
| `PlacementGrid2D:delete()` | 78 | ✍ Empty destructor, nothing is released. |
| `PlacementGrid2D:reset()` | 83 | ✍ Discards all blocked areas so the whole grid is free again. |
| `PlacementGrid2D:blockAreaLocal(x: any, z: any, width: any, length: any)` | 182 | ✍ Blocks a rectangle given in the grid's local space (x, z as the corner, then width and length) by forwarding its bounds to `updateBlockedArea`. No clamping to the grid size is done here. |
| `PlacementGrid2D:blockAreaByBoundingBox(x: any, y: any, z: any, dirX: any, dirY: any, dirZ: any, upX: any, upY: any, upZ: any, extendX: any, extendY: any, extendZ: any)` | 193 | ✍ Blocks the footprint of an oriented box given by world position, direction, up vector and half extents. The eight corners are converted to the grid node's local space and their bounds are clamped to the grid before blocking. |
| `PlacementGrid2D:updateBlockedArea(minX: any, maxX: any, minZ: any, maxZ: any)` | 213 | ✍ Marks every Z slice touched by the given range, creating missing slices and widening each slice's blocked min/max X to include the new range. Slice indices start at 1 and use `spacing` as size. |
| `PlacementGrid2D:drawDebug()` | 242 | ✍ Debug drawing: outlines the grid in white and, for each blocked slice, draws its edges in white plus a red center line. Must be called every frame to stay visible. |
