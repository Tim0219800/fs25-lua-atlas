---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableVine.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for vineyards, built on PlaceableFence: each fence panel carries a vine node whose growth state is read from the fruit-type density map (`FSDensityMapUtil` vine area functions, signatures only in the dump, so their internals are UNVERIFIED). It loads the fruit type, panel size, sections, growth-state visuals and reset rules from `placeable.vine`, and offers harvest, prepare and shake/squeeze hooks used by vine machines, working server side. The vine system in `g_currentMission.vineSystem` tracks the panels.
---@class PlaceableVine
PlaceableVine = {}

--- Returns true only if the placeable type includes the PlaceableFence specialization.
---@param specializations table
---@return boolean
function PlaceableVine.prerequisitesPresent(specializations) end

--- Registers the vine functions: node and visual updates, area destruction, fruit type and initial growth state getters, shake and squeeze factors, harvest, prepare, section factor, area by node and segment helpers.
---@param placeableType any
function PlaceableVine.registerFunctions(placeableType) end

--- Overrides the fence functions `doDeletePanel`, `generateSegmentPoles`, `deleteSegment` and `getHasParallelSnapping`. Note: no `getHasParallelSnapping` function is defined in this file (UNVERIFIED target).
---@param placeableType any
function PlaceableVine.registerOverwrittenFunctions(placeableType) end

--- Subscribes to onLoad and onCreateSegmentPanel (the latter is raised by the fence specialization for each created panel).
---@param placeableType any
function PlaceableVine.registerEventListeners(placeableType) end

--- Declares the `.vine` keys: `#fruitType`, `#width`, `#length`, `#thresholdFactor`, `#numLODOffsets`, `#numSections`, on/off-season growth states, growth state nodes with foliage states, and reset states with threshold and target.
---@param schema any
---@param basePath any
function PlaceableVine.registerXMLPaths(schema, basePath) end

--- Declares the savegame attribute `#startGrowthState` of the vineyard.
---@param schema any
---@param basePath any
function PlaceableVine.registerSavegameXMLPaths(schema, basePath) end

--- Reads the fruit type (warns and aborts if missing or unknown), panel dimensions, section count, on/off-season growth states, growth-state foliage mappings (with validity checks) and reset states, plus the saved start growth state.
---@param savegame table
function PlaceableVine:onLoad(savegame) end

--- Forgets the stored vine data of the segment, then calls the parent to delete it.
---@param superFunc any
---@param segment any
function PlaceableVine:deleteSegment(superFunc, segment) end

--- Before the parent regenerates a non-preview segment, unregisters its previous vine nodes from the vine system and resets the segment data list.
---@param superFunc any
---@param segment any
---@param sync any
function PlaceableVine:generateSegmentPoles(superFunc, segment, sync) end

--- Called per new fence panel. Optionally disables shadow casting, then for real panels creates the vine node data, hides the growth-state nodes, adjusts custom LOD children and random UV offsets, computes section areas and reads existing vine pixels. If no vine exists yet it creates the area with the start state, and registers the node with the vine system. In preview it only shows the preview state.
---@param isPreview any
---@param segment any
---@param panel any
---@param poleIndex any
---@param dy any
---@param pole any
function PlaceableVine:onCreateSegmentPanel(isPreview, segment, panel, poleIndex, dy, pole) end

--- Before the parent deletes a panel, removes the matching vine node from the vine system and destroys its density-map vine area; does nothing for an invalid segment or pole index.
---@param superFunc any
---@param segment any
---@param segmentIndex any
---@param poleIndex any
function PlaceableVine:doDeletePanel(superFunc, segment, segmentIndex, poleIndex) end

--- Server only: destroys the density-map vine area of each section of the given panel data.
---@param data any
function PlaceableVine:destroyVineArea(data) end

--- Returns the index of the vineyard fruit type.
function PlaceableVine:getVineFruitTypeIndex() end

--- Returns the growth state new vines start in: the off-season state when the fruit type cannot be planted in the current period and one is defined, else the on-season state or 1. Uses `environment.currentPeriod`, UNVERIFIED.
---@return integer
function PlaceableVine:getInitialGrowthState() end

--- Refreshes a panel node: if growing, may reset the whole area to a target state when part of it is already in a reset state (server only); then re-reads the growth values of every section from the density map and updates visuals. Ignores unknown or deleted nodes.
---@param node any
---@param isGrowing any
function PlaceableVine:updateVineNode(node, isGrowing) end

--- Shows the growth-state node with the largest foliage area, hides the others, and sets its `hideSectionStates` shader parameter from the dominant state of each section (the shader call uses only three section values).
---@param data any
function PlaceableVine:updateVineVisuals(data) end

--- Server only: for sections overlapped by the harvester path beyond the threshold factor, cuts the vine area and calls `callback(target, ...)` with area, weed, spray, plow and lime factors; then refreshes the node.
---@param node any
---@param startX any
---@param startY any
---@param startZ any
---@param currentX any
---@param currentY any
---@param currentZ any
---@param callback any
---@param target any
function PlaceableVine:harvestVine(node, startX, startY, startZ, currentX, currentY, currentZ, callback, target) end

--- Sets the `harvestPosition` shader parameter (world position and intensity) on all growth-state nodes of the panel to animate shaking.
---@param node any
---@param worldX any
---@param worldY any
---@param worldZ any
---@param intensity any
function PlaceableVine:setShakingFactor(node, worldX, worldY, worldZ, intensity) end

--- Sets the squeeze shader parameters (`harvestSqueezePosition` and `harvestSqueezeScale` with strength, length, fade length) on all growth-state nodes of the panel.
---@param node integer
---@param worldX number
---@param worldY number
---@param worldZ number
---@param strength number
---@param length number
---@param fadeLength number?
function PlaceableVine:setSqueezeFactor(node, worldX, worldY, worldZ, strength, length, fadeLength) end

--- Server only: applies the prepare operation to sections touched by the machine path (beyond the threshold factor), refreshes the node if anything changed and returns the total prepared area (0 on clients or unknown nodes).
---@param node any
---@param startX any
---@param startY any
---@param startZ any
---@param currentX any
---@param currentY any
---@param currentZ any
function PlaceableVine:prepareVine(node, startX, startY, startZ, currentX, currentY, currentZ) end

--- Returns the fraction (0 to 1) of section `i` covered along the node local Z axis by the segment between the start and current world positions.
---@param node any
---@param i any
---@param startX any
---@param startY any
---@param startZ any
---@param currentX any
---@param currentY any
---@param currentZ any
function PlaceableVine:getSectionFactor(node, i, startX, startY, startZ, currentX, currentY, currentZ) end

--- Returns six numbers (start, width and height corner coordinates in XZ) of the rectangle covered by a panel node, using the configured vine width and length.
---@param node any
function PlaceableVine:getVineAreaByNode(node) end

--- Returns the vineyard fruit type index, same value as `getVineFruitTypeIndex`.
function PlaceableVine:getVineFruitType() end

--- Returns true if any panel of the segment has area in the harvest growth states (or the withered state when preparing) for the given fruit type; false for another fruit type or when neither mode is requested.
---@param segment any
---@param fruitTypeIndex any
---@param useHarvestStates any
---@param usePrepareStates any
function PlaceableVine:getHasSegmentTargetGrowthState(segment, fruitTypeIndex, useHarvestStates, usePrepareStates) end

--- Returns six XZ coordinates describing a strip along one side of a fence segment, offset from the segment by the snap distance (side 1 by default).
---@param segment any
---@param segmentSide any
function PlaceableVine:getSegmentSideArea(segment, segmentSide) end
