# utils/SplitShapeUtil.lua

*[Version française](../../fr/scripts/utils/SplitShapeUtil.md)*

Source: `dataS/scripts/utils/SplitShapeUtil.lua` — FS25 1.25.1.0

> ⚠ In the SDK dump this file only contains **signatures** (no bodies).

✍ Static helpers around engine split shapes (trees and logs): splitting, locating a tree's center and radius, building a tension belt around a tree and finding the split shape in a node hierarchy. The dump only has signatures, so behaviour is inferred and UNVERIFIED.

- **SplitShapeUtil** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `SplitShapeUtil.onSplitShapeCallback(unused: any, shape: integer, isBelow: boolean, isAbove: boolean, minY: number, maxY: number, minZ: number, maxZ: number)` | 29 | ✍ Signature only (no body in the SDK dump): Callback shape receiving the split shape plus flags for below and above and Y/Z extents. Its role as a split result handler is inferred and UNVERIFIED. |
| `SplitShapeUtil.splitShape(shape: integer, x: number, y: number, z: number, nx: number, ny: number, nz: number, yx: number, yy: number, yz: number, cutSizeY: number, callback: string, cutSizeZ: number, callback: string, target: table?)` | 64 | ✍ Signature only (no body in the SDK dump): Presumably cuts a split shape with a plane given by a position, a normal and a Y direction, with cut sizes, then calls a named callback, optionally on a target table. The signature lists the callback parameter twice, so the real parameter order is UNVERIFIED. |
| `SplitShapeUtil.getTreeOffsetPosition(shapeId: integer, x: number, y: number, z: number, maxRadius: number, minLength: number) → number, number, number, number, number, number, number` | 122 | ✍ Signature only (no body in the SDK dump): Returns the tree center position, up normal and radius near a world position within a maximum radius and a minimum length. UNVERIFIED beyond the annotations. |
| `SplitShapeUtil.createTreeBelt(beltData: table, shapeId: integer, tx: number, ty: number, tz: number, sx: number, sy: number, sz: number, upX: number, upY: number, upZ: number, hookOffset: number, ignoreYDirection: boolean, spacing: number) → integer` | 167 | ✍ Signature only (no body in the SDK dump): Creates a tension belt shape around a tree from a tree center, a target position, the trunk up direction, a hook offset, an option to ignore the Y direction and a spacing; fills the given belt data table and returns the belt shape id. UNVERIFIED. |
| `SplitShapeUtil.getSplitShapeId(node: integer) → integer` | 228 | ✍ Signature only (no body in the SDK dump): Returns the first split shape mesh found in the hierarchy of a node, or nil. |
