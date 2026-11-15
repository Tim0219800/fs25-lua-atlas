---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolSprayCan.lua (generated stub, FS25 Lua Atlas)

---@class HandToolSprayCan
HandToolSprayCan = {}

---@param xmlSchema any
function HandToolSprayCan.registerXMLPaths(xmlSchema) end

---@param savegameXMLSchema any
---@param baseKey any
function HandToolSprayCan.registerSavegameXMLPaths(savegameXMLSchema, baseKey) end

---@param handToolType any
function HandToolSprayCan.registerFunctions(handToolType) end

---@param handToolType any
function HandToolSprayCan.registerEventListeners(handToolType) end

---@param specializations any
function HandToolSprayCan.prerequisitesPresent(specializations) end

---@param xmlFile any
function HandToolSprayCan:onLoad(xmlFile) end

---@param savegame any
function HandToolSprayCan:onPostLoad(savegame) end

function HandToolSprayCan:onDelete() end

---@param streamId any
---@param connection any
---@param dirtyMask any
function HandToolSprayCan:onWriteStream(streamId, connection, dirtyMask) end

---@param streamId any
---@param connection any
---@param carryingPlayer any
function HandToolSprayCan:onReadStream(streamId, connection, carryingPlayer) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function HandToolSprayCan:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param streamId any
---@param timestamp any
---@param connection any
---@param carryingPlayer any
function HandToolSprayCan:onReadUpdateStream(streamId, timestamp, connection, carryingPlayer) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function HandToolSprayCan:saveToXMLFile(xmlFile, key, usedModNames) end

---@param dt any
function HandToolSprayCan:onUpdate(dt) end

function HandToolSprayCan:onDraw() end

function HandToolSprayCan:onHeldStart() end

function HandToolSprayCan:onRegisterActionEvents() end

---@param _ any
---@param inputValue any
function HandToolSprayCan:activateSpraying(_, inputValue) end

---@param treeMarkerTypeIndex any
---@param splitShapeId any
---@param x any
---@param y any
---@param z any
---@param hitX any
---@param hitY any
---@param hitZ any
function HandToolSprayCan:tryToAddTreeMarker(treeMarkerTypeIndex, splitShapeId, x, y, z, hitX, hitY, hitZ) end

function HandToolSprayCan:processDelayedMarker() end

---@param isSpraying any
---@param force any
function HandToolSprayCan:setIsSpraying(isSpraying, force) end

---@param _ any
---@param inputValue any
function HandToolSprayCan:changeTreeMarkerType(_, inputValue) end

---@param shape any
function HandToolSprayCan:getIsSprayingAllowed(shape) end
