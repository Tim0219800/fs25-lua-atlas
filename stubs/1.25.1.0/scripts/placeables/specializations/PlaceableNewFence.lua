---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableNewFence.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for the segment-based fence system: it wraps a Fence object (created from placeable.fence and the i3d at placeable.base.filename), forwards network, update and savegame handling to it, and merges into an already existing instance of the same fence config. Ownership always follows the farmland, picking is per segment, destruction is per node, and a counted build lock prevents selling a fence while a build run uses it. Several functions it registers (getFence, onSegmentCreated, getIsOnFarmland, getOwnerFarmId, deletePanel, getNodesToDeleteForPanel) are not defined in this file: UNVERIFIED where they come from.
---@class PlaceableNewFence
PlaceableNewFence = {}

--- Always returns true: no prerequisite specialization is required.
---@param specializations table
---@return boolean
function PlaceableNewFence.prerequisitesPresent(specializations) end

--- Registers the placeable event onCreateSegment.
---@param placeableType any
function PlaceableNewFence.registerEvents(placeableType) end

--- Registers fence-related functions on the placeable type (getFence, onSegmentCreated, panel and snap getters, updateDirtyAreas, build lock accessors). getFence and onSegmentCreated have no definition in this file.
---@param placeableType any
function PlaceableNewFence.registerFunctions(placeableType) end

--- Overrides getIsOnFarmland, collectPickObjects, getDestructionMethod, performNodeDestruction, previewNodeDestructionNodes, setOwnerFarmId, getOwnerFarmId and canBeSold. getIsOnFarmland and getOwnerFarmId are not defined in this file.
---@param placeableType any
function PlaceableNewFence.registerOverwrittenFunctions(placeableType) end

--- Subscribes to onLoad, onDelete, onReadStream, onWriteStream, onUpdate and onFinalizePlacement (no onFinalizePlacement handler is defined in this file).
---@param placeableType any
function PlaceableNewFence.registerEventListeners(placeableType) end

--- Declares the XML keys by delegating to Fence.registerXMLPaths.
---@param schema any
---@param basePath any
function PlaceableNewFence.registerXMLPaths(schema, basePath) end

--- Declares the savegame XML keys by delegating to Fence.registerSavegameXMLPaths.
---@param schema any
---@param basePath any
function PlaceableNewFence.registerSavegameXMLPaths(schema, basePath) end

--- Initialises the build lock count, requires placeable.base.filename (ERROR state otherwise), and returns early if another placeable with the same config exists (merge mode). Otherwise creates a segments transform group and the Fence object, and for preplaced fences deletes the map's pre-existing segment and static fence child nodes.
---@param savegame table
function PlaceableNewFence:onLoad(savegame) end

--- Deletes the Fence object if one was created.
function PlaceableNewFence:onDelete() end

--- Client side on join: lets the Fence read its stream data. Note: no nil check on the fence, which is nil when the placeable merged into an existing instance.
---@param streamId any
---@param connection any
function PlaceableNewFence:onReadStream(streamId, connection) end

--- Server side on join: lets the Fence write its stream data. Note: no nil check on the fence (see onReadStream).
---@param streamId any
---@param connection any
function PlaceableNewFence:onWriteStream(streamId, connection) end

--- Per-frame update: forwards dt to the Fence if it exists.
---@param dt any
function PlaceableNewFence:onUpdate(dt) end

--- Override that intentionally does nothing: a fence never takes an owner farm directly, it follows the farmland.
---@param superFunc any
---@param ownerFarmId any
---@param noEventSend any
function PlaceableNewFence:setOwnerFarmId(superFunc, ownerFarmId, noEventSend) end

--- Savegame loading: loads into this fence, or into the existing instance's fence when this placeable was merged.
---@param xmlFile any
---@param key any
function PlaceableNewFence:loadFromXMLFile(xmlFile, key) end

--- Savegame saving: delegates to the Fence object.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableNewFence:saveToXMLFile(xmlFile, key, usedModNames) end

--- Returns the horizontal distance between a segment's two end points (x1/z1 to x2/z2).
---@param segment any
function PlaceableNewFence:getSegmentLength(segment) end

--- Returns spec.panelLength. Note: this file never assigns that field, so it is probably nil unless set elsewhere (UNVERIFIED).
function PlaceableNewFence:getPanelLength() end

--- Returns spec.panelLengthFixed, a field not assigned in this file (UNVERIFIED).
function PlaceableNewFence:getIsPanelLengthFixed() end

--- Marks the bounding box of the given line segment as dirty in the density-map collision map and in the AI navigation system.
---@param x1 any
---@param z1 any
---@param x2 any
---@param z2 any
function PlaceableNewFence:updateDirtyAreas(x1, z1, x2, z2) end

--- Returns the number of fence segments from the Fence object (the name is misspelled in the source).
function PlaceableNewFence:getNumSequments() end

--- Returns spec.maxVerticalAngle, not assigned in this file (UNVERIFIED); not registered via registerFunctions here.
function PlaceableNewFence:getMaxVerticalAngle() end

--- Returns spec.maxVerticalGateAngle, not assigned in this file (UNVERIFIED); not registered via registerFunctions here.
function PlaceableNewFence:getMaxVerticalGateAngle() end

--- Returns the snap distance in meters from the first segment, or from the first segment template (parallel snapping value first, else its snapDistance); nil if there is no fence or template.
---@return number?
function PlaceableNewFence:getSnapDistance() end

--- Deprecated stub: always returns nil.
function PlaceableNewFence:getSnapAngle() end

--- Deprecated stub: always returns nil.
function PlaceableNewFence:getSnapCheckDistance() end

--- Deprecated stub: always returns nil.
function PlaceableNewFence:getAllowExtendingOnly() end

--- Deprecated stub: always returns nil.
function PlaceableNewFence:getMaxCornerAngle() end

--- Deprecated stub: always returns false.
function PlaceableNewFence:getHasParallelSnapping() end

--- Deprecated stub: always returns false.
function PlaceableNewFence:getSupportsParallelSnapping() end

--- Registers the segment's rigid-body nodes as node objects of this placeable so they can be picked; ignores the preview segment and resets overlayColorNodes.
---@param segment any
function PlaceableNewFence:addPickingNodesForSegment(segment) end

--- Removes the segment's rigid-body nodes from the mission's node objects; ignores the preview segment.
---@param segment any
function PlaceableNewFence:removePickingNodesForSegment(segment) end

--- Recursively collects into the given table every node under (and including) the given node whose rigid body type is not NONE.
---@param objects any
---@param node any
function PlaceableNewFence:recursivelyAddPickingNodes(objects, node) end

--- Override: returns Placeable.DESTRUCTION.PER_NODE, so a fence is demolished piece by piece rather than at once.
---@param superFunc any
function PlaceableNewFence:getDestructionMethod(superFunc) end

--- Override: returns the nodes of the panel containing the given node via getNodesToDeleteForPanel (defined elsewhere, UNVERIFIED).
---@param superFunc any
---@param node any
function PlaceableNewFence:previewNodeDestructionNodes(superFunc, node) end

--- Override: deletes the panel of the given node via deletePanel (defined elsewhere, UNVERIFIED) and returns the destroyed node plus true when no segments remain, so the placeable is removed.
---@param superFunc any
---@param node any
function PlaceableNewFence:performNodeDestruction(superFunc, node) end

--- Override that does nothing: default picking is disabled because picking nodes are added per segment.
---@param superFunc any
---@param node any
function PlaceableNewFence:collectPickObjects(superFunc, node) end

--- Override: returns false with an 'object in use' message while a build lock is held, otherwise defers to the parent.
---@param superFunc function
---@return boolean
---@return string?
function PlaceableNewFence:canBeSold(superFunc) end

--- Returns true while at least one build run holds a lock on this fence.
---@return boolean
function PlaceableNewFence:getIsBuildLocked() end

--- Takes (true) or releases (false) one build lock; the count never goes below zero, so overlapping runs do not unlock each other.
---@param isLocked boolean
function PlaceableNewFence:setBuildLocked(isLocked) end
