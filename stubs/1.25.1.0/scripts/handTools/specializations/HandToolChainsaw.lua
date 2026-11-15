---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolChainsaw.lua (stub généré, atlas Lua FS25)

---@class HandToolChainsaw
HandToolChainsaw = {}

---@param xmlSchema any
function HandToolChainsaw.registerXMLPaths(xmlSchema) end

---@param handToolType any
function HandToolChainsaw.registerFunctions(handToolType) end

---@param handToolType any
function HandToolChainsaw.registerEventListeners(handToolType) end

---@param specializations any
function HandToolChainsaw.prerequisitesPresent(specializations) end

---@param xmlFile any
---@param baseDirectory any
function HandToolChainsaw:onLoad(xmlFile, baseDirectory) end

---@param savegame any
function HandToolChainsaw:onPostLoad(savegame) end

---@param ringNode any
---@param failedReason any
function HandToolChainsaw:onRingLoadFinished(ringNode, failedReason) end

function HandToolChainsaw:onDelete() end

---@param streamId any
---@param connection any
---@param dirtyMask any
function HandToolChainsaw:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param streamId any
---@param timestamp any
---@param connection any
function HandToolChainsaw:onReadUpdateStream(streamId, timestamp, connection) end

---@param dt any
function HandToolChainsaw:onUpdate(dt) end

function HandToolChainsaw:onDraw() end

function HandToolChainsaw:onHeldStart() end

function HandToolChainsaw:onHeldEnd() end

function HandToolChainsaw:onRegisterActionEvents() end

---@param _ any
---@param inputDelta any
function HandToolChainsaw:onRollAction(_, inputDelta) end

---@param _ any
---@param inputValue any
function HandToolChainsaw:onCutAction(_, inputValue) end

---@param cutState any
---@param isVerticalCut any
function HandToolChainsaw:setCurrentCutState(cutState, isVerticalCut) end

---@param treeNode any
---@param cutX any
---@param cutZ any
function HandToolChainsaw:testIfCutAllowed(treeNode, cutX, cutZ) end

---@param treeNode any
---@param cutX any
---@param cutZ any
---@param minY any
---@param maxY any
---@param minZ any
---@param maxZ any
function HandToolChainsaw:testIfCutValid(treeNode, cutX, cutZ, minY, maxY, minZ, maxZ) end

---@param treeNode integer
---@param minY number
---@param maxY number
---@param minZ number
---@param maxZ number
---@return boolean
function HandToolChainsaw:testIfTooLow(treeNode, minY, maxY, minZ, maxZ) end

function HandToolChainsaw:getChainSpeedFactor() end

function HandToolChainsaw:beginDelimbing() end

function HandToolChainsaw:stopDelimbing() end

function HandToolChainsaw:beginCutting() end

---@param sliceTree any
function HandToolChainsaw:stopCutting(sliceTree) end

---@param dt any
function HandToolChainsaw:updateCutting(dt) end

---@param dt any
function HandToolChainsaw:updateCuttingAnimation(dt) end

function HandToolChainsaw:updateSplitPlane() end

---@param targetedTree any
---@param isCutPossible any
---@param cutMinimumY any
---@param cutMaximumY any
---@param cutMinimumZ any
---@param cutMaximumZ any
function HandToolChainsaw:updateRingSelector(targetedTree, isCutPossible, cutMinimumY, cutMaximumY, cutMinimumZ, cutMaximumZ) end

function HandToolChainsaw:calculateCutPlane() end
