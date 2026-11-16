---@meta
-- FS25 1.25.1.0 : debug/DebugUtil.lua (generated stub, FS25 Lua Atlas)

--- DebugUtil is a static helper table with immediate-mode debug drawing (lines, gizmos, circles, cubes, parallelograms) built on the engine functions `drawDebugLine`, `drawDebugTriangle` and `drawDebugPoint`, plus text helpers and table/node-hierarchy printers. Drawing functions must be called every frame. Some functions in this dump reference helpers whose bodies are not included (`DebugGizmo.renderAtNodeWithOffset`, `DebugUtil.setNodeEffectivelyVisible`, `DebugUtil.DEFAULT_RENDERLINE_SCALAR`).
---@class DebugUtil
DebugUtil = {}

--- Draws a coloured axis gizmo at a node's world position using the node's up and forward directions, optionally with a text label, a Y offset and snapping to the terrain.
---@param node integer
---@param text string
---@param alignToGround any
---@param offsetY any
function DebugUtil.drawDebugNode(node, text, alignToGround, offsetY) end

--- Draws three 0.3 m axis lines (red side, green up, blue forward) at a world position from direction and up vectors. Optionally snaps to 0.1 m above the terrain and renders a text label.
---@param x any
---@param y any
---@param z any
---@param dirX any
---@param dirY any
---@param dirZ any
---@param upX any
---@param upY any
---@param upZ any
---@param text any
---@param alignToGround any
---@param color any
function DebugUtil.drawDebugGizmoAtWorldPos(x, y, z, dirX, dirY, dirZ, upX, upY, upZ, text, alignToGround, color) end

--- Draws a work area defined by start/width/height nodes as a rectangle, optionally with gizmos on the three nodes and a white centre line with a circle computed by `DensityMapHeightUtil.getLineByArea` (radius from that call).
---@param start any
---@param width any
---@param height any
---@param r any
---@param g any
---@param b any
---@param alignToGround any
---@param drawNodes any
---@param drawCircle any
---@param offsetY any
function DebugUtil.drawDebugArea(start, width, height, r, g, b, alignToGround, drawNodes, drawCircle, offsetY) end

--- Draws a line between two world points (default white, nil Y treated as 0), optionally snapped to 0.1 m above terrain, and optionally a circle of the given radius at each end.
---@param x1 any
---@param y1 any
---@param z1 any
---@param x2 any
---@param y2 any
---@param z2 any
---@param r any
---@param g any
---@param b any
---@param radius any
---@param alignToGround any
function DebugUtil.drawDebugLine(x1, y1, z1, x2, y2, z2, r, g, b, radius, alignToGround) end

--- Draws the outline of a parallelogram given an origin and two corner points in world space, optionally snapping each of the three points to 0.1 m above the terrain. Colour is passed as r, g, b.
---@param x any
---@param y any
---@param z any
---@param x1 any
---@param y1 any
---@param z1 any
---@param x2 any
---@param y2 any
---@param z2 any
---@param alignToGround any
---@param r any
---@param g any
---@param b any
function DebugUtil.drawDebugAreaRectangle(x, y, z, x1, y1, z1, x2, y2, z2, alignToGround, r, g, b) end

--- Draws a filled, semi-transparent version of the area rectangle using two triangles (fourth corner derived from the other points), optionally snapped to the terrain. Alpha is the last argument.
---@param x any
---@param y any
---@param z any
---@param x1 any
---@param y1 any
---@param z1 any
---@param x2 any
---@param y2 any
---@param z2 any
---@param alignToGround any
---@param r any
---@param g any
---@param b any
---@param a any
function DebugUtil.drawDebugAreaRectangleFilled(x, y, z, x1, y1, z1, x2, y2, z2, alignToGround, r, g, b, a) end

--- Draws a rectangle in a node's local XZ plane (min/max X and Z at a given Y offset) as four lines, optionally filled with two triangles of the given colour and alpha.
---@param node any
---@param minX any
---@param maxX any
---@param minZ any
---@param maxZ any
---@param yOffset any
---@param r any
---@param g any
---@param b any
---@param a any
---@param filled any
function DebugUtil.drawDebugRectangle(node, minX, maxX, minZ, maxZ, yOffset, r, g, b, a, filled) end

--- Draws a circle of line segments around a world point in the horizontal plane (default red), with optional terrain alignment, filled translucent triangles and solid flag. Note: with terrain alignment the centre Y is overwritten inside the loop, so later segments use a changed height.
---@param x number
---@param y number
---@param z number
---@param radius number
---@param steps integer
---@param color table?
---@param alignToTerrain any
---@param filled any
---@param solid any
function DebugUtil.drawDebugCircle(x, y, z, radius, steps, color, alignToTerrain, filled, solid) end

--- Draws a circle around a node, horizontal or vertical in the node's local space, with an optional local offset and colour (red by default).
---@param node integer
---@param radius number
---@param steps integer
---@param color table?
---@param vertical boolean?
---@param offset table?
function DebugUtil.drawDebugCircleAtNode(node, radius, steps, color, vertical, offset) end

--- Draws a wireframe box at a world position oriented by direction and up vectors. It creates a temporary transform group under the root node, draws with `drawDebugCube`, then deletes it.
---@param x number
---@param y number
---@param z number
---@param dirX number
---@param dirY number
---@param dirZ number
---@param upX number
---@param upY number
---@param upZ number
---@param sizeX number
---@param sizeY number
---@param sizeZ number
---@param r number
---@param g number
---@param b number
function DebugUtil.drawDebugCubeAtWorldPos(x, y, z, dirX, dirY, dirZ, upX, upY, upZ, sizeX, sizeY, sizeZ, r, g, b) end

--- Draws an overlap box given its centre, Euler rotation and half-extents, by building a temporary transform group and drawing a cube twice the extents in size. Useful to visualise overlap test volumes.
---@param x any
---@param y any
---@param z any
---@param rotX any
---@param rotY any
---@param rotZ any
---@param extendX any
---@param extendY any
---@param extendZ any
---@param r any
---@param g any
---@param b any
function DebugUtil.drawOverlapBox(x, y, z, rotX, rotY, rotZ, extendX, extendY, extendZ, r, g, b) end

--- Draws the twelve edges of a wireframe box centred on a node (plus optional local offset), scaled by the given full sizes along local X, Y and Z, default colour white.
---@param node integer
---@param sizeX number
---@param sizeY number
---@param sizeZ number
---@param r number
---@param g number
---@param b number
---@param offsetX any
---@param offsetY any
---@param offsetZ any
function DebugUtil.drawDebugCube(node, sizeX, sizeY, sizeZ, r, g, b, offsetX, offsetY, offsetZ) end

--- Draws an axis-aligned wireframe cube of the given edge length centred on a world point, plus a point at its centre. Colour r, g, b is required.
---@param x number
---@param y number
---@param z number
---@param width number
---@param r number
---@param g number
---@param b number
function DebugUtil.drawSimpleDebugCube(x, y, z, width, r, g, b) end

--- Draws reference axes at a node's world position using its local up and forward directions. Does nothing when the node is nil.
---@param node integer
function DebugUtil.drawDebugReferenceAxisFromNode(node) end

--- Draws three 0.4 m axis lines centred on a world position (each extending 0.2 m both ways, white to red, green or blue) from up and direction vectors.
---@param posX number
---@param posY number
---@param posZ number
---@param upX number
---@param upY number
---@param upZ number
---@param dirX number
---@param dirY number
---@param dirZ number
function DebugUtil.drawDebugReferenceAxis(posX, posY, posZ, upX, upY, upZ, dirX, dirY, dirZ) end

--- Draws a double-sided translucent parallelogram plus outline from an XZ origin and width/height vectors, following the terrain height plus an offset, or flat at the offset when `fixedHeight` is set.
---@param x number
---@param z number
---@param widthX number
---@param widthZ number
---@param heightX number
---@param heightZ number
---@param heightOffset number
---@param r number
---@param g number
---@param b number
---@param a number
---@param fixedHeight any
function DebugUtil.drawDebugParallelogram(x, z, widthX, widthZ, heightX, heightZ, heightOffset, r, g, b, a, fixedHeight) end

--- Same as `drawDebugParallelogram`, but the width and height arguments are absolute world corner coordinates instead of vectors; the fourth corner is derived from them.
---@param x number
---@param z number
---@param widthX number
---@param widthZ number
---@param heightX number
---@param heightZ number
---@param heightOffset number
---@param r number
---@param g number
---@param b number
---@param a number
---@param fixedHeight any
function DebugUtil.drawDebugWorldParallelogram(x, z, widthX, widthZ, heightX, heightZ, heightOffset, r, g, b, a, fixedHeight) end

--- Draws a work area table (start/width/height nodes) as a parallelogram. Note: it passes r, g, b, a where `drawDebugParallelogram` expects the height offset first, so the arguments are shifted and the call looks buggy.
---@param area any
---@param r any
---@param g any
---@param b any
---@param a any
function DebugUtil.drawArea(area, r, g, b, a) end

--- Draws a rectangle spanning a node's local Y and Z axes (sizes default to 1), default green. Does nothing when the node is nil.
---@param node integer
---@param sizeY number
---@param sizeZ number
---@param r number
---@param g number
---@param b number
function DebugUtil.drawCutNodeArea(node, sizeY, sizeZ, r, g, b) end

--- Prints each key and value of a table to the log, descending into sub-tables up to `maxDepth` (default 3, indent grows each level). Returns an empty string.
---@param inputTable table
---@param inputIndent string
---@param depth integer
---@param maxDepth integer
function DebugUtil.printTableRecursively(inputTable, inputIndent, depth, maxDepth) end

--- Builds and returns a multi-line string of a table's keys and values, recursing to `maxDepth` (default 2). Returns nil when the depth is exceeded; impractical for large tables.
---@param inputTable any
---@param inputIndent any
---@param depth any
---@param maxDepth any
function DebugUtil.debugTableToString(inputTable, inputIndent, depth, maxDepth) end

--- Renders a list of name/value pairs on screen at a position, names right-aligned before the values; numbers use 4 decimals. An entry with `newColumn` or `columnOffset` starts a new column.
---@param posX any
---@param posY any
---@param textSize any
---@param data any
---@param nextColumnOffset any
function DebugUtil.renderTable(posX, posY, textSize, data, nextColumnOffset) end

--- Renders one left-aligned line of text (optional bold and colour, white by default) and returns the Y position of the next line, moved down by the text size times a spacing factor.
---@param x number
---@param y number
---@param textSize number
---@param text string
---@param spacingScalar number?
---@param isBold boolean?
---@param color Color?
---@return number
function DebugUtil.renderTextLine(x, y, textSize, text, spacingScalar, isBold, color) end

--- Returns Y moved down by the text size times the spacing scalar; when no scalar is given it uses `DebugUtil.DEFAULT_RENDERLINE_SCALAR`, whose value is not in this dump (UNVERIFIED).
---@param y number
---@param textSize number
---@param spacingScalar number?
---@return number
function DebugUtil.renderNewLine(y, textSize, spacingScalar) end

--- Logs a node and all its descendants by name, indented per level, optionally appending the class ids (from `ClassIds`) that each node has.
---@param node any
---@param offset any
---@param appendType any
function DebugUtil.printNodeHierarchy(node, offset, appendType) end

--- Prints the script name and line of the code that called the function that invoked this helper (stack level 3), via `debug.info`.
function DebugUtil.printCallingFunctionLocation() end
