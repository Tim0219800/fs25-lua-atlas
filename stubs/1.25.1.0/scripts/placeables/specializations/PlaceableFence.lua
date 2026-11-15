---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableFence.lua (stub généré, atlas Lua FS25)

---@class PlaceableFence
PlaceableFence = {}

---@param specializations table
---@return boolean
function PlaceableFence.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableFence.registerEvents(placeableType) end

---@param placeableType any
function PlaceableFence.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableFence.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableFence.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableFence.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableFence.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableFence:onLoad(savegame) end

function PlaceableFence:onDelete() end

---@param streamId any
---@param connection any
function PlaceableFence:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableFence:onWriteStream(streamId, connection) end

---@param dt any
function PlaceableFence:onUpdate(dt) end

---@param superFunc any
---@param ownerFarmId any
---@param noEventSend any
function PlaceableFence:setOwnerFarmId(superFunc, ownerFarmId, noEventSend) end

---@param xmlFile any
---@param key any
function PlaceableFence:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableFence:saveToXMLFile(xmlFile, key, usedModNames) end

---@param x any
---@param y any
---@param z any
---@param maxDistance any
---@return x
---@return z
---@return distance
function PlaceableFence:getPoleNear(x, y, z, maxDistance) end

---@param hitObjectId any
function PlaceableFence:getPoleNearOverlapCallback(hitObjectId) end

---@param node any
---@param allowPanel any
function PlaceableFence:getPolePosition(node, allowPanel) end

function PlaceableFence:getPoleShapeForPreview() end

function PlaceableFence:getMaxVerticalAngleAndYForPreview() end

---@param segment table
---@return number
---@return number
---@return number
function PlaceableFence:getMaxVerticalAngleAndYForSegment(segment) end

---@param segment any
function PlaceableFence:getSegmentLength(segment) end

function PlaceableFence:getPanelLength() end

function PlaceableFence:getIsPanelLengthFixed() end

---@param superFunc function
---@return boolean
---@return string?
function PlaceableFence:canBeSold(superFunc) end

---@return boolean
function PlaceableFence:getIsBuildLocked() end

---@param isLocked boolean
function PlaceableFence:setBuildLocked(isLocked) end

---@param x1 any
---@param z1 any
---@param x2 any
---@param z2 any
---@param renderFirst any
---@param gateIndex any
function PlaceableFence:createSegment(x1, z1, x2, z2, renderFirst, gateIndex) end

---@param segment any
---@param sync any
function PlaceableFence:addSegment(segment, sync) end

---@param segment any
function PlaceableFence:deleteSegment(segment) end

---@param x1 any
---@param z1 any
---@param x2 any
---@param z2 any
function PlaceableFence:updateDirtyAreas(x1, z1, x2, z2) end

---@param segment any
function PlaceableFence:setPreviewSegment(segment) end

function PlaceableFence:getPreviewSegment() end

---@param index any
function PlaceableFence:getGate(index) end

---@param index any
function PlaceableFence:getSegment(index) end

function PlaceableFence:getNumSequments() end

function PlaceableFence:getMaxVerticalAngle() end

function PlaceableFence:getMaxVerticalGateAngle() end

function PlaceableFence:getBoundingCheckWidth() end

function PlaceableFence:getSnapDistance() end

function PlaceableFence:getSnapCheckDistance() end

function PlaceableFence:getAllowExtendingOnly() end

function PlaceableFence:getMaxCornerAngle() end

function PlaceableFence:getHasParallelSnapping() end

function PlaceableFence:getSupportsParallelSnapping() end

---@param node any
function PlaceableFence:deletePanel(node) end

---@param segment any
---@param segmentIndex any
---@param poleIndex any
function PlaceableFence:doDeletePanel(segment, segmentIndex, poleIndex) end

---@param node any
function PlaceableFence:findRaycastInfo(node) end

---@param node any
function PlaceableFence:getNodesToDeleteForPanel(node) end

---@param x any
---@param z any
---@param ignoreSegment any
function PlaceableFence:isPoleInAnySegment(x, z, ignoreSegment) end

---@param x any
---@param y any
---@param z any
---@param n any
function PlaceableFence:fakeRandomValueForPosition(x, y, z, n) end

---@param segment any
---@param sync any
function PlaceableFence:generateSegmentPoles(segment, sync) end

---@param segment table
---@return boolean
function PlaceableFence:calculateSegmentPoles(segment) end

---@param segment any
function PlaceableFence:updateSegmentShapes(segment) end

---@param segment any
function PlaceableFence:addSegmentShapesToUpdate(segment) end

function PlaceableFence:updateSegmentUpdateQueue() end

---@param segment any
function PlaceableFence:addPickingNodesForSegment(segment) end

---@param segment any
function PlaceableFence:removePickingNodesForSegment(segment) end

---@param objects any
---@param node any
function PlaceableFence:recursivelyAddPickingNodes(objects, node) end

---@param superFunc any
function PlaceableFence:getDestructionMethod(superFunc) end

---@param superFunc any
---@param node any
function PlaceableFence:previewNodeDestructionNodes(superFunc, node) end

---@param superFunc any
---@param node any
function PlaceableFence:performNodeDestruction(superFunc, node) end

---@param superFunc any
---@param node any
function PlaceableFence:collectPickObjects(superFunc, node) end
