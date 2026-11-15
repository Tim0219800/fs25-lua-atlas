---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableNewFence.lua (stub généré, atlas Lua FS25)

---@class PlaceableNewFence
PlaceableNewFence = {}

---@param specializations table
---@return boolean
function PlaceableNewFence.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableNewFence.registerEvents(placeableType) end

---@param placeableType any
function PlaceableNewFence.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableNewFence.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableNewFence.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableNewFence.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableNewFence.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableNewFence:onLoad(savegame) end

function PlaceableNewFence:onDelete() end

---@param streamId any
---@param connection any
function PlaceableNewFence:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableNewFence:onWriteStream(streamId, connection) end

---@param dt any
function PlaceableNewFence:onUpdate(dt) end

---@param superFunc any
---@param ownerFarmId any
---@param noEventSend any
function PlaceableNewFence:setOwnerFarmId(superFunc, ownerFarmId, noEventSend) end

---@param xmlFile any
---@param key any
function PlaceableNewFence:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableNewFence:saveToXMLFile(xmlFile, key, usedModNames) end

---@param segment any
function PlaceableNewFence:getSegmentLength(segment) end

function PlaceableNewFence:getPanelLength() end

function PlaceableNewFence:getIsPanelLengthFixed() end

---@param x1 any
---@param z1 any
---@param x2 any
---@param z2 any
function PlaceableNewFence:updateDirtyAreas(x1, z1, x2, z2) end

function PlaceableNewFence:getNumSequments() end

function PlaceableNewFence:getMaxVerticalAngle() end

function PlaceableNewFence:getMaxVerticalGateAngle() end

---@return number?
function PlaceableNewFence:getSnapDistance() end

function PlaceableNewFence:getSnapAngle() end

function PlaceableNewFence:getSnapCheckDistance() end

function PlaceableNewFence:getAllowExtendingOnly() end

function PlaceableNewFence:getMaxCornerAngle() end

function PlaceableNewFence:getHasParallelSnapping() end

function PlaceableNewFence:getSupportsParallelSnapping() end

---@param segment any
function PlaceableNewFence:addPickingNodesForSegment(segment) end

---@param segment any
function PlaceableNewFence:removePickingNodesForSegment(segment) end

---@param objects any
---@param node any
function PlaceableNewFence:recursivelyAddPickingNodes(objects, node) end

---@param superFunc any
function PlaceableNewFence:getDestructionMethod(superFunc) end

---@param superFunc any
---@param node any
function PlaceableNewFence:previewNodeDestructionNodes(superFunc, node) end

---@param superFunc any
---@param node any
function PlaceableNewFence:performNodeDestruction(superFunc, node) end

---@param superFunc any
---@param node any
function PlaceableNewFence:collectPickObjects(superFunc, node) end

---@param superFunc function
---@return boolean
---@return string?
function PlaceableNewFence:canBeSold(superFunc) end

---@return boolean
function PlaceableNewFence:getIsBuildLocked() end

---@param isLocked boolean
function PlaceableNewFence:setBuildLocked(isLocked) end
