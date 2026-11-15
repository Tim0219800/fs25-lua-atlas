---@meta
-- FS25 1.25.1.0 : misc/TreePlantManager.lua (generated stub, FS25 Lua Atlas)

---@class TreePlantManager : AbstractManager
TreePlantManager = {}

---@param customMt any
function TreePlantManager.new(customMt) end

function TreePlantManager:initDataStructures() end

function TreePlantManager:initialize() end

function TreePlantManager:deleteTreesData() end

---@param missionInfo any
---@param baseDirectory any
function TreePlantManager:loadDefaultTypes(missionInfo, baseDirectory) end

---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function TreePlantManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

function TreePlantManager:unloadMapData() end

---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@param isBaseType any
---@param customEnvironment any
function TreePlantManager:loadTreeTypes(xmlFile, missionInfo, baseDirectory, isBaseType, customEnvironment) end

---@param name string
---@param title string
---@param stages array
---@param growthTimeHours number
---@param isBaseType boolean
---@param splitTypeIndex integer
---@param supportsPlanting boolean
---@param saplingPrice number
---@return table
function TreePlantManager:registerTreeType(name, title, stages, growthTimeHours, isBaseType, splitTypeIndex, supportsPlanting, saplingPrice) end

---@param treeTypeDesc any
---@param growthStateI any
function TreePlantManager:getTreeTypeFilename(treeTypeDesc, growthStateI) end

function TreePlantManager:canPlantTree() end

---@param treeTypeIndex integer
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
---@param growthStateI integer
---@param variationIndex integer
---@param isGrowing boolean?
---@param nextGrowthTargetHour number?
---@param existingSplitShapeFileId integer?
---@return integer?
function TreePlantManager:plantTree(treeTypeIndex, x, y, z, rx, ry, rz, growthStateI, variationIndex, isGrowing, nextGrowthTargetHour, existingSplitShapeFileId) end

---@param treeTypeDesc any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
---@param growthStateI any
---@param variationIndex any
---@param splitShapeLoadingFileId any
function TreePlantManager:loadTreeNode(treeTypeDesc, x, y, z, rx, ry, rz, growthStateI, variationIndex, splitShapeLoadingFileId) end

---@param treeTypeDesc any
---@param x any
---@param y any
---@param z any
---@param dirX any
---@param dirY any
---@param dirZ any
---@param length any
---@param growthStateI any
---@param variationIndex any
---@param delimb any
---@param useOnlyStump any
function TreePlantManager:loadTreeTrunk(treeTypeDesc, x, y, z, dirX, dirY, dirZ, length, growthStateI, variationIndex, delimb, useOnlyStump) end

---@param loadTreeTrunkData any
---@param shape any
---@param isBelow any
---@param isAbove any
---@param minY any
---@param maxY any
---@param minZ any
---@param maxZ any
function TreePlantManager.cutTreeTrunkCallback(loadTreeTrunkData, shape, isBelow, isAbove, minY, maxY, minZ, maxZ) end

---@param dt any
---@param dtGame any
function TreePlantManager:updateTrees(dt, dtGame) end

---@param jointIndex any
---@param shape any
---@param nx any
---@param ny any
---@param nz any
---@param maxAngle any
---@param maxLifetime any
function TreePlantManager:addTreeCutJoint(jointIndex, shape, nx, ny, nz, maxAngle, maxLifetime) end

---@param node any
function TreePlantManager:getIsTreeDeleted(node) end

---@param node any
function TreePlantManager:getTreeRigidBodyType(node) end

function TreePlantManager:cleanupDeletedTrees() end

---@param xmlFilename any
function TreePlantManager:loadFromXMLFile(xmlFilename) end

---@param xmlFilename any
function TreePlantManager:saveToXMLFile(xmlFilename) end

---@param streamId any
function TreePlantManager:readFromServerStream(streamId) end

---@param streamId any
function TreePlantManager:writeToClientStream(streamId) end

---@param index any
function TreePlantManager:getTreeTypeDescFromIndex(index) end

---@param index any
function TreePlantManager:getTreeTypeNameFromIndex(index) end

---@param name any
function TreePlantManager:getTreeTypeDescFromName(name) end

---@param name any
---@param stageIndex any
---@param variationName any
function TreePlantManager:getTreeTypeIndexAndVariationFromName(name, stageIndex, variationName) end

---@param treeTypeIndex any
---@param stageIndex any
---@param variationIndex any
function TreePlantManager:getTreeTypeNameAndVariationByIndex(treeTypeIndex, stageIndex, variationIndex) end

---@param treeTypeIndex any
---@param stageIndex any
---@param variationIndex any
function TreePlantManager:getPalletStoreItemFilenameByIndex(treeTypeIndex, stageIndex, variationIndex) end

---@param splitTypeIndex any
function TreePlantManager:getTreeTypeDescFromSplitType(splitTypeIndex) end

---@param name any
function TreePlantManager:getTreeTypeIndexFromName(name) end

---@param serverSplitShapeFileId any
---@param nodeId any
function TreePlantManager:addClientTree(serverSplitShapeFileId, nodeId) end

---@param serverSplitShapeFileId any
function TreePlantManager:removeClientTree(serverSplitShapeFileId) end

---@param serverSplitShapeFileId any
function TreePlantManager:getClientTree(serverSplitShapeFileId) end

---@param shape any
---@param oldShape any
---@param fromTree any
function TreePlantManager:addingSplitShape(shape, oldShape, fromTree) end

---@param shape any
function TreePlantManager:removingSplitShape(shape) end

---@param shape any
---@param scale any
---@param variation any
function TreePlantManager:setSplitShapeLeafScaleAndVariation(shape, scale, variation) end

---@param radius string|number
---@return string
function TreePlantManager:consoleCommandCutTrees(radius) end

---@param objectId any
function TreePlantManager:onTreeCutCommandOverlapCallback(objectId, ...) end

---@param shape any
---@param isBelow any
---@param isAbove any
---@param minY any
---@param maxY any
---@param minZ any
---@param maxZ any
function TreePlantManager:onTreeCutCommandSplitCallback(shape, isBelow, isAbove, minY, maxY, minZ, maxZ) end

---@param treeTypeName any
---@param number any
---@param growthStateI any
---@param variationIndex any
---@param isGrowing any
function TreePlantManager:consoleCommandPlantTrees(treeTypeName, number, growthStateI, variationIndex, isGrowing) end

---@param treeTypeName any
---@param number any
---@param growthStateI any
---@param variationIndex any
---@param isGrowing any
function TreePlantManager:consoleCommandLoadAll(treeTypeName, number, growthStateI, variationIndex, isGrowing) end
