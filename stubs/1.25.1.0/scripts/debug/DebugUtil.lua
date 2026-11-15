---@meta
-- FS25 1.25.1.0 : debug/DebugUtil.lua (generated stub, FS25 Lua Atlas)

---@class DebugUtil
DebugUtil = {}

---@param node integer
---@param text string
---@param alignToGround any
---@param offsetY any
function DebugUtil.drawDebugNode(node, text, alignToGround, offsetY) end

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

---@param node integer
---@param radius number
---@param steps integer
---@param color table?
---@param vertical boolean?
---@param offset table?
function DebugUtil.drawDebugCircleAtNode(node, radius, steps, color, vertical, offset) end

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

---@param x number
---@param y number
---@param z number
---@param width number
---@param r number
---@param g number
---@param b number
function DebugUtil.drawSimpleDebugCube(x, y, z, width, r, g, b) end

---@param node integer
function DebugUtil.drawDebugReferenceAxisFromNode(node) end

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

---@param area any
---@param r any
---@param g any
---@param b any
---@param a any
function DebugUtil.drawArea(area, r, g, b, a) end

---@param node integer
---@param sizeY number
---@param sizeZ number
---@param r number
---@param g number
---@param b number
function DebugUtil.drawCutNodeArea(node, sizeY, sizeZ, r, g, b) end

---@param inputTable table
---@param inputIndent string
---@param depth integer
---@param maxDepth integer
function DebugUtil.printTableRecursively(inputTable, inputIndent, depth, maxDepth) end

---@param inputTable any
---@param inputIndent any
---@param depth any
---@param maxDepth any
function DebugUtil.debugTableToString(inputTable, inputIndent, depth, maxDepth) end

---@param posX any
---@param posY any
---@param textSize any
---@param data any
---@param nextColumnOffset any
function DebugUtil.renderTable(posX, posY, textSize, data, nextColumnOffset) end

---@param x number
---@param y number
---@param textSize number
---@param text string
---@param spacingScalar number?
---@param isBold boolean?
---@param color Color?
---@return number
function DebugUtil.renderTextLine(x, y, textSize, text, spacingScalar, isBold, color) end

---@param y number
---@param textSize number
---@param spacingScalar number?
---@return number
function DebugUtil.renderNewLine(y, textSize, spacingScalar) end

---@param node any
---@param offset any
---@param appendType any
function DebugUtil.printNodeHierarchy(node, offset, appendType) end

function DebugUtil.printCallingFunctionLocation() end
