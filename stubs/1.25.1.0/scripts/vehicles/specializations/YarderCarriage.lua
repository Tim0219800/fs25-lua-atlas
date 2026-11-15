---@meta
-- FS25 1.25.1.0 : vehicles/specializations/YarderCarriage.lua (stub généré, atlas Lua FS25)

---@param specializations table
---@return boolean
function YarderCarriage.prerequisitesPresent(specializations) end

function YarderCarriage.initSpecialization() end

---@param vehicleType any
function YarderCarriage.registerFunctions(vehicleType) end

---@param vehicleType any
function YarderCarriage.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function YarderCarriage.registerEventListeners(vehicleType) end

---@param savegame any
function YarderCarriage:onLoad(savegame) end

---@param savegame any
function YarderCarriage:onLoadFinished(savegame) end

function YarderCarriage:onDelete() end

---@param streamId integer
---@param connection Connection
function YarderCarriage:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function YarderCarriage:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function YarderCarriage:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function YarderCarriage:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function YarderCarriage:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function YarderCarriage:getCarriageDimensions() end

function YarderCarriage:getCarriagePullRopeTargetNode() end

function YarderCarriage:getCarriagePushRopeTargetNode() end

---@param vehicle any
function YarderCarriage:setYarderTowerVehicle(vehicle) end

---@param ropeNode any
---@param tx any
---@param ty any
---@param tz any
---@param maxOffset any
function YarderCarriage:updateRopeAlignmentNodes(ropeNode, tx, ty, tz, maxOffset) end

function YarderCarriage:updateCarriageInRange() end

function YarderCarriage:onYarderCarriageUpdateEnd() end

---@param dt any
function YarderCarriage:updateTreeAttachRopes(dt) end

---@param hitObjectId any
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
function YarderCarriage:onCarriageTreeRaycastCallback(hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

function YarderCarriage:onAttachTreeAction() end

---@param splitShapeId any
---@param x any
---@param y any
---@param z any
---@param ropeIndex any
---@param noEventSend any
function YarderCarriage:attachTreeToCarriage(splitShapeId, x, y, z, ropeIndex, noEventSend) end

---@param shapeId any
---@param shapeJointId any
function YarderCarriage:createJoint(shapeId, shapeJointId) end

function YarderCarriage:onDetachTreeAction() end

---@param ropeIndex any
---@param noEventSend any
function YarderCarriage:detachTreeFromCarriage(ropeIndex, noEventSend) end

function YarderCarriage:getNumAttachedTrees() end

function YarderCarriage:getMaxNumAttachedTrees() end

function YarderCarriage:getAttachedTreeMass() end

---@param splitShapeId any
function YarderCarriage:getIsCarriageTreeAttachAllowed(splitShapeId) end

function YarderCarriage:getIsTreeInMountRange() end

---@param ropeIndex any
---@param reason any
function YarderCarriage:showCarriageTreeMountFailedWarning(ropeIndex, reason) end

---@param direction any
function YarderCarriage:setCarriageLiftInput(direction) end

---@param schema any
---@param basePath any
function YarderCarriage.registerSavegameXMLPaths(schema, basePath) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function YarderCarriage:saveAttachedTreesToXML(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
function YarderCarriage.loadAttachedTreesFromXML(xmlFile, key) end

---@param data any
function YarderCarriage:resolveLoadedAttachedTrees(data) end

---@param oldShape any
---@param shape any
function YarderCarriage:onYarderCarriageTreeShapeCut(oldShape, shape) end

---@param shape any
---@param mountVehicle any
function YarderCarriage:onYarderCarriageTreeShapeMounted(shape, mountVehicle) end

---@param superFunc any
---@return number
function YarderCarriage:getDirtMultiplier(superFunc) end

---@param superFunc any
---@return number
function YarderCarriage:getWearMultiplier(superFunc) end
