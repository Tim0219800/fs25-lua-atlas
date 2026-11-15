# utils/SplitShapeUtil.lua

Source: `dataS/scripts/utils/SplitShapeUtil.lua` — FS25 1.25.1.0

> ⚠ In the SDK dump this file only contains **signatures** (no bodies).

- **SplitShapeUtil** (l.14)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `SplitShapeUtil.onSplitShapeCallback(unused: any, shape: integer, isBelow: boolean, isAbove: boolean, minY: number, maxY: number, minZ: number, maxZ: number)` | 29 |  |
| `SplitShapeUtil.splitShape(shape: integer, x: number, y: number, z: number, nx: number, ny: number, nz: number, yx: number, yy: number, yz: number, cutSizeY: number, callback: string, cutSizeZ: number, callback: string, target: table?)` | 64 |  |
| `SplitShapeUtil.getTreeOffsetPosition(shapeId: integer, x: number, y: number, z: number, maxRadius: number, minLength: number) → number, number, number, number, number, number, number` | 122 |  |
| `SplitShapeUtil.createTreeBelt(beltData: table, shapeId: integer, tx: number, ty: number, tz: number, sx: number, sy: number, sz: number, upX: number, upY: number, upZ: number, hookOffset: number, ignoreYDirection: boolean, spacing: number) → integer` | 167 |  |
| `SplitShapeUtil.getSplitShapeId(node: integer) → integer` | 228 |  |
