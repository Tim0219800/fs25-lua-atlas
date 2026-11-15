# debug/DebugUtil.lua

Source : `dataS/scripts/debug/DebugUtil.lua` — FS25 1.25.1.0

- **DebugUtil** (l.8)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugUtil.drawDebugNode(node: integer, text: string, alignToGround: any, offsetY: any)` | 28 |  |
| `DebugUtil.drawDebugGizmoAtWorldPos(x: any, y: any, z: any, dirX: any, dirY: any, dirZ: any, upX: any, upY: any, upZ: any, text: any, alignToGround: any, color: any)` | 44 |  |
| `DebugUtil.drawDebugArea(start: any, width: any, height: any, r: any, g: any, b: any, alignToGround: any, drawNodes: any, drawCircle: any, offsetY: any)` | 62 |  |
| `DebugUtil.drawDebugLine(x1: any, y1: any, z1: any, x2: any, y2: any, z2: any, r: any, g: any, b: any, radius: any, alignToGround: any)` | 98 |  |
| `DebugUtil.drawDebugAreaRectangle(x: any, y: any, z: any, x1: any, y1: any, z1: any, x2: any, y2: any, z2: any, alignToGround: any, r: any, g: any, b: any)` | 121 |  |
| `DebugUtil.drawDebugAreaRectangleFilled(x: any, y: any, z: any, x1: any, y1: any, z1: any, x2: any, y2: any, z2: any, alignToGround: any, r: any, g: any, b: any, a: any)` | 155 |  |
| `DebugUtil.drawDebugRectangle(node: any, minX: any, maxX: any, minZ: any, maxZ: any, yOffset: any, r: any, g: any, b: any, a: any, filled: any)` | 171 |  |
| `DebugUtil.drawDebugCircle(x: number, y: number, z: number, radius: number, steps: integer, color: table?, alignToTerrain: any, filled: any, solid: any)` | 268 |  |
| `DebugUtil.drawDebugCircleAtNode(node: integer, radius: number, steps: integer, color: table?, vertical: boolean?, offset: table?)` | 309 |  |
| `DebugUtil.drawDebugCubeAtWorldPos(x: number, y: number, z: number, dirX: number, dirY: number, dirZ: number, upX: number, upY: number, upZ: number, sizeX: number, sizeY: number, sizeZ: number, r: number, g: number, b: number)` | 362 |  |
| `DebugUtil.drawOverlapBox(x: any, y: any, z: any, rotX: any, rotY: any, rotZ: any, extendX: any, extendY: any, extendZ: any, r: any, g: any, b: any)` | 373 |  |
| `DebugUtil.drawDebugCube(node: integer, sizeX: number, sizeY: number, sizeZ: number, r: number, g: number, b: number, offsetX: any, offsetY: any, offsetZ: any)` | 391 |  |
| `DebugUtil.drawSimpleDebugCube(x: number, y: number, z: number, width: number, r: number, g: number, b: number)` | 431 |  |
| `DebugUtil.drawDebugReferenceAxisFromNode(node: integer)` | 453 |  |
| `DebugUtil.drawDebugReferenceAxis(posX: number, posY: number, posZ: number, upX: number, upY: number, upZ: number, dirX: number, dirY: number, dirZ: number)` | 474 |  |
| `DebugUtil.drawDebugParallelogram(x: number, z: number, widthX: number, widthZ: number, heightX: number, heightZ: number, heightOffset: number, r: number, g: number, b: number, a: number, fixedHeight: any)` | 496 |  |
| `DebugUtil.drawDebugWorldParallelogram(x: number, z: number, widthX: number, widthZ: number, heightX: number, heightZ: number, heightOffset: number, r: number, g: number, b: number, a: number, fixedHeight: any)` | 545 |  |
| `DebugUtil.drawArea(area: any, r: any, g: any, b: any, a: any)` | 583 |  |
| `DebugUtil.drawCutNodeArea(node: integer, sizeY: number, sizeZ: number, r: number, g: number, b: number)` | 599 |  |
| `DebugUtil.printTableRecursively(inputTable: table, inputIndent: string, depth: integer, maxDepth: integer)` | 614 |  |
| `DebugUtil.debugTableToString(inputTable: any, inputIndent: any, depth: any, maxDepth: any)` | 639 |  |
| `DebugUtil.renderTable(posX: any, posY: any, textSize: any, data: any, nextColumnOffset: any)` | 662 |  |
| `DebugUtil.renderTextLine(x: number, y: number, textSize: number, text: string, spacingScalar: number?, isBold: boolean?, color: Color?) → number` | 712 |  |
| `DebugUtil.renderNewLine(y: number, textSize: number, spacingScalar: number?) → number` | 734 |  |
| `DebugUtil.printNodeHierarchy(node: any, offset: any, appendType: any)` | 742 |  |
| `DebugUtil.printCallingFunctionLocation()` | 768 |  |
