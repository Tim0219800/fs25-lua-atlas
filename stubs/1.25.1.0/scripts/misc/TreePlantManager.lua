---@meta
-- FS25 1.25.1.0 : misc/TreePlantManager.lua (generated stub, FS25 Lua Atlas)

--- Manager (subclass of AbstractManager) for plantable and cuttable trees. It loads tree types from data/maps/maps_treeTypes.xml and the map XML (name, title, growth time, split type, growth stages with variations), plants and grows trees on the server, tracks cut trees and decaying branch/leaf state, saves and loads the tree list, and sends it to joining clients. Many engine calls (split shapes, physics, shared i3d) are used; engine and some classes are not in the dump. Constants such as MAX_NUM_TYPES, DECAY_INTERVAL and STAGE_NUM_BITS are used but not defined in this file (UNVERIFIED), and several console command handlers and onMissionStarted are also missing here.
---@class TreePlantManager : AbstractManager
TreePlantManager = {}

--- Constructor: creates the manager on top of AbstractManager with the given or default metatable.
---@param customMt any
function TreePlantManager.new(customMt) end

--- Resets tree type lists and lookups (by index, name, split type), the i3d file cache, pending trunk loads, the count of trees without split shapes and the decaying split shape table.
function TreePlantManager:initDataStructures() end

--- Creates the "trees" transform group linked to the scene root and the treesData structure (growing trees, split trees, client trees by server file id, cut joints, counters).
function TreePlantManager:initialize() end

--- Deletes the trees root node, subtracts this data's untracked-split tree count from the manager total and resets the data structures. Does nothing if treesData was never created.
function TreePlantManager:deleteTreesData() end

--- Loads the base tree types from data/maps/maps_treeTypes.xml as base types, then closes the XML file.
---@param missionInfo any
---@param baseDirectory any
function TreePlantManager:loadDefaultTypes(missionInfo, baseDirectory) end

--- Loads map data: registers the gsTree* console commands (server cheats and debug only), reads map.treeTypes#maxNumTrees (default 8000, clamped 1 to 30000), subscribes once to the mission start message, loads default types and then the map's treeTypes via XMLUtil. Returns the result of that load.
---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function TreePlantManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Releases cached shared i3d requests, removes the console commands, deletes the trees data, unsubscribes from the mission start message and calls the parent unload.
function TreePlantManager:unloadMapData() end

--- Reads map.treeTypes.treeType entries from an XML file (a raw file handle is wrapped first): name, title, growthTimeHours, splitType, supportsPlanting, saplingPrice and the stages with their variations (filename, pallet, planter). Invalid entries are skipped with a warning, stage and variation counts are capped, then registerTreeType is called. Uses g_splitShapeManager:getSplitTypeIndexByName, not defined in SplitShapeManager.lua (UNVERIFIED). Returns true.
---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@param isBaseType any
---@param customEnvironment any
function TreePlantManager:loadTreeTypes(xmlFile, missionInfo, baseDirectory, isBaseType, customEnvironment) end

--- Registers or updates a tree type (name uppercased). Refuses when the type limit is reached, or when a base type name already exists. A later definition of an existing name replaces stages, growth time and planting data; the sapling price is kept only if planting is supported. Returns the type table or nil.
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

--- Returns the i3d filename of a random variation for the given growth stage (capped to the last stage), or nil if no type description is given.
---@param treeTypeDesc any
---@param growthStateI any
function TreePlantManager:getTreeTypeFilename(treeTypeDesc, growthStateI) end

--- Returns true when the number of unsplit trees in the world plus trees without split shapes is below maxNumTrees, using the engine's getNumOfSplitShapes.
function TreePlantManager:canPlantTree() end

--- Server side: loads a tree node at a position and rotation for a type, stage and variation, records it as growing (with a target growth hour, if it can still grow) or as a fixed split tree, and broadcasts a TreePlantEvent. Returns the tree node id, or nil if the type is unknown or loading failed.
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

--- Loads the i3d of a tree stage and variation, links it under the trees root, positions it, adds it to physics, keeps split shapes kinematic on clients, warns on a wrong split type, and marks the collision map and AI area dirty. Returns the node id and the split shape file id (the node id is 0 on failure).
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

--- Loads a tree and queues a two-step cut (over two frames processed in updateTrees) to produce a loose trunk of a given length oriented along a direction, optionally delimbed or reduced to a stump. If the file has no split shapes the node is deleted.
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

--- Split callback used by the trunk cut: registers the new shape with addingSplitShape and appends its data (shape, below/above flags, bounds) to the pending trunk's parts list.
---@param loadTreeTrunkData any
---@param shape any
---@param isBelow any
---@param isAbove any
---@param minY any
---@param maxY any
---@param minZ any
---@param maxZ any
function TreePlantManager.cutTreeTrunkCallback(loadTreeTrunkData, shape, isBelow, isAbove, minY, maxY, minZ, maxZ) end

--- Main per-frame update called with dt and game-time delta. Every 60 in-game minutes it cleans up deleted trees and grows trees whose target hour passed (replace node, broadcast TreeGrowEvent). It also expires cut joints, processes queued trunk cuts, the cut-all console command, and seasonal leaf decay of active split shapes.
---@param dt any
---@param dtGame any
function TreePlantManager:updateTrees(dt, dtGame) end

--- Records a joint created when a tree is cut, with its direction in the shape's local space, a maximum angle and a lifetime; updateTrees removes it when the tilt exceeds the angle, the lifetime ends or the shape disappears.
---@param jointIndex any
---@param shape any
---@param nx any
---@param ny any
---@param nz any
---@param maxAngle any
---@param maxLifetime any
function TreePlantManager:addTreeCutJoint(jointIndex, shape, nx, ny, nz, maxAngle, maxLifetime) end

--- Recursively checks a node's hierarchy and returns true if it no longer contains any split shape or shape.
---@param node any
function TreePlantManager:getIsTreeDeleted(node) end

--- Recursively finds the first mesh split shape under a node and returns its rigid body type, or nil if none exists.
---@param node any
function TreePlantManager:getTreeRigidBodyType(node) end

--- Removes from the growing and split tree lists every tree whose hierarchy is empty, deleting its node and adjusting the without-splits counters.
function TreePlantManager:cleanupDeletedTrees() end

--- Loads the saved tree list (treePlant.tree entries with treeType, position, rotation, growthStateI, variationIndex, nextGrowthTargetHour, isGrowing, splitShapeFileId) and replants each via plantTree. Returns false if the filename is nil or the file cannot be opened; entries with an unknown type are skipped.
---@param xmlFilename any
function TreePlantManager:loadFromXMLFile(xmlFilename) end

--- Cleans up deleted trees, then writes all growing and split trees to a new treePlant XML file (type name, position, rotation in degrees, stage, variation if not 1, growth target hour, growing flag, split shape file id). Returns false and logs an error if the file cannot be created.
---@param xmlFilename any
function TreePlantManager:saveToXMLFile(xmlFilename) end

--- Client side, on join: reads the tree count, then each tree (type, position, rotation, stage, variation, server file id), loads the node locally and maps the local split shape file id to the server's.
---@param streamId any
function TreePlantManager:readFromServerStream(streamId) end

--- Server side, on client join: cleans up deleted trees then writes the number of trees and, for each growing then split tree, its type, position, rotation, stage, variation and split shape file id.
---@param streamId any
function TreePlantManager:writeToClientStream(streamId) end

--- Returns the tree type description at an index, or nil.
---@param index any
function TreePlantManager:getTreeTypeDescFromIndex(index) end

--- Returns the tree type name for an index, or nil if unknown.
---@param index any
function TreePlantManager:getTreeTypeNameFromIndex(index) end

--- Returns the tree type description for a name (case-insensitive), or nil.
---@param name any
function TreePlantManager:getTreeTypeDescFromName(name) end

--- Returns the tree type index and the variation index matching variationName (case-insensitive, "DEFAULT" if absent) in the given stage. Both are nil if the type or stage is unknown; the variation alone is nil if no variation matches.
---@param name any
---@param stageIndex any
---@param variationName any
function TreePlantManager:getTreeTypeIndexAndVariationFromName(name, stageIndex, variationName) end

--- Returns the tree type name and the variation name ("DEFAULT" if unnamed) for a type, stage (default 1) and variation index, falling back to the first variation. Returns nil, nil if not found.
---@param treeTypeIndex any
---@param stageIndex any
---@param variationIndex any
function TreePlantManager:getTreeTypeNameAndVariationByIndex(treeTypeIndex, stageIndex, variationIndex) end

--- Returns the pallet store item XML filename of a tree type, stage (default 1) and variation (falling back to the first), or nil.
---@param treeTypeIndex any
---@param stageIndex any
---@param variationIndex any
function TreePlantManager:getPalletStoreItemFilenameByIndex(treeTypeIndex, stageIndex, variationIndex) end

--- Returns the tree type description linked to an engine split type index, or nil. If several tree types share a split type, the last registered wins.
---@param splitTypeIndex any
function TreePlantManager:getTreeTypeDescFromSplitType(splitTypeIndex) end

--- Returns the tree type index for a name (case-insensitive), or nil.
---@param name any
function TreePlantManager:getTreeTypeIndexFromName(name) end

--- Stores a tree node in the client trees table under its server split shape file id.
---@param serverSplitShapeFileId any
---@param nodeId any
function TreePlantManager:addClientTree(serverSplitShapeFileId, nodeId) end

--- Removes the client tree entry for a server split shape file id.
---@param serverSplitShapeFileId any
function TreePlantManager:removeClientTree(serverSplitShapeFileId) end

--- Returns the client tree node stored for a server split shape file id, or nil.
---@param serverSplitShapeFileId any
function TreePlantManager:getClientTree(serverSplitShapeFileId) end

--- Called when a split shape is created by a cut. Inherits or initialises its decay state (branch leaf scale) and variation, tracks it if it has children and applies the leaf shader values, then publishes MessageType.TREE_SHAPE_CUT with the old and new shapes.
---@param shape any
---@param oldShape any
---@param fromTree any
function TreePlantManager:addingSplitShape(shape, oldShape, fromTree) end

--- Forgets the decay state of a split shape that is being removed.
---@param shape any
function TreePlantManager:removingSplitShape(shape) end

--- Sets the shader parameter windSnowLeafScale recursively on a shape, with the leaf scale in the third component and the variation in the fourth.
---@param shape any
---@param scale any
---@param variation any
function TreePlantManager:setSplitShapeLeafScaleAndVariation(shape, scale, variation) end

--- Console command gsTreeCut: finds static, uncut tree split shapes within a radius (default 50) of the active camera and queues them for cutting. Returns a feedback string with the count.
---@param radius string|number
---@return string
function TreePlantManager:consoleCommandCutTrees(radius) end

--- Overlap callback of the cut command: keeps mesh split shapes that have a split type, are static and not yet split.
---@param objectId any
function TreePlantManager:onTreeCutCommandOverlapCallback(objectId, ...) end

--- Split callback of the cut command: tilts the new shape slightly, registers it as a known split shape on the mission and calls addingSplitShape as coming from a tree.
---@param shape any
---@param isBelow any
---@param isAbove any
---@param minY any
---@param maxY any
---@param minZ any
---@param maxZ any
function TreePlantManager:onTreeCutCommandSplitCallback(shape, isBelow, isAbove, minY, maxY, minZ, maxZ) end

--- Console command gsTreePlant: plants a number of trees of a type (default lodgepole pine, aspen or first type) in a line in front of the local player, skipping spots overlapping existing trees. Defaults to the last growth stage and a random variation. Returns a feedback string.
---@param treeTypeName any
---@param number any
---@param growthStateI any
---@param variationIndex any
---@param isGrowing any
function TreePlantManager:consoleCommandPlantTrees(treeTypeName, number, growthStateI, variationIndex, isGrowing) end

--- Debug console command gsTreeLoadAll: spawns every tree type, stage and variation in rows in front of the local player with debug planes, circles and text (split type, size, wood harvester support, diameters) and loose stump trunks. Calls g_splitShapeManager:getSplitShapeAllowsHarvester, not defined in SplitShapeManager.lua (UNVERIFIED). Returns the number planted.
---@param treeTypeName any
---@param number any
---@param growthStateI any
---@param variationIndex any
---@param isGrowing any
function TreePlantManager:consoleCommandLoadAll(treeTypeName, number, growthStateI, variationIndex, isGrowing) end
