---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolHPWLance.lua (stub généré, atlas Lua FS25)

---@class HandToolHPWLance
HandToolHPWLance = {}

---@param xmlSchema any
function HandToolHPWLance.registerXMLPaths(xmlSchema) end

---@param handToolType any
function HandToolHPWLance.registerFunctions(handToolType) end

---@param vehicleType any
function HandToolHPWLance.registerOverwrittenFunctions(vehicleType) end

---@param handToolType any
function HandToolHPWLance.registerEventListeners(handToolType) end

---@param specializations any
function HandToolHPWLance.prerequisitesPresent(specializations) end

---@param xmlFile any
---@param baseDirectory any
function HandToolHPWLance:onLoad(xmlFile, baseDirectory) end

function HandToolHPWLance:onDelete() end

---@param streamId any
---@param connection any
---@param dirtyMask any
function HandToolHPWLance:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param streamId any
---@param timestamp any
---@param connection any
function HandToolHPWLance:onReadUpdateStream(streamId, timestamp, connection) end

---@param dt any
function HandToolHPWLance:onUpdate(dt) end

---@param nodeId any
---@param x any
---@param y any
---@param z any
---@param distance any
---@param nx any
---@param ny any
---@param nz any
---@param subShapeIndex any
---@param shapeId any
---@param isLast any
function HandToolHPWLance:onLanceCallback(nodeId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

---@param isActivated any
function HandToolHPWLance:setIsActivated(isActivated) end

function HandToolHPWLance:onRegisterActionEvents() end

---@param _ any
---@param inputValue any
function HandToolHPWLance:onWashAction(_, inputValue) end

---@param superFunc any
function HandToolHPWLance:getCanBeDropped(superFunc) end

function HandToolHPWLance:onHeldEnd() end

---@param x any
---@param y any
---@param textSize any
function HandToolHPWLance:onDebugDraw(x, y, textSize) end
