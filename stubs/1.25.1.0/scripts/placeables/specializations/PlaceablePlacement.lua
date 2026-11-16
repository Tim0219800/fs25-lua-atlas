---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceablePlacement.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization with no prerequisites that holds the data used when a building is positioned by the player: test boxes for overlap checks, position and rotation snapping, optional terrain alignment and place/destroy sounds. It registers many functions (overlap mask, valid overlap node, water check, density-height overlap, area blocked) whose bodies are absent from the dump, so those are UNVERIFIED. XML keys are read under placeable.placement.
---@class PlaceablePlacement
PlaceablePlacement = {}

--- Always returns true, so this specialization can be added to any placeable type.
---@param specializations table
---@return boolean
function PlaceablePlacement.prerequisitesPresent(specializations) end

--- Registers the placement functions on the placeable type, including several (getPlacementOverlapMask, isValidOverlapNode, getCanBePlacedInWater, getIsAreaBlocked, getHasOverlapWithDensityHeight, getIsOnOwnedFarmland) that are not defined in this file's dump.
---@param placeableType any
function PlaceablePlacement.registerFunctions(placeableType) end

--- Subscribes the specialization to the onLoad, onDelete and onPreFinalizePlacement events.
---@param placeableType any
function PlaceablePlacement.registerEventListeners(placeableType) end

--- Declares the XML schema for placeable.placement: the three terrain-alignment nodes, test areas (start/end nodes), random/manual rotation flags, alignToWorldY, position and rotation snap values, and the place, placeLayered and destroy sounds.
---@param schema any
---@param basePath any
function PlaceablePlacement.registerXMLPaths(schema, basePath) end

--- Loads the test areas, rotation flags, snap sizes (absolute values) and alignToWorldY from XML; falls back to world-Y alignment with a warning if the three position nodes are missing. On the client, when Platform.hasContruction is set, it also loads the 2D place sounds.
---@param savegame table
function PlaceablePlacement:onLoad(savegame) end

--- On the client, deletes the loaded placement sound samples.
function PlaceablePlacement:onDelete() end

--- Reads one test area from XML. The end node must be a direct child of the start node; computes box size, center relative to the root node and Y rotation, with a 5 cm downward safety offset. Returns false (with a warning) if invalid.
---@param xmlFile any
---@param key any
---@param area any
function PlaceablePlacement:loadTestArea(xmlFile, key, area) end

--- Takes the proposed rotation and snaps the Y component to the configured snap angle if one is set; returns x, y, z.
---@param x any
---@param y any
---@param z any
function PlaceablePlacement:getPlacementRotation(x, y, z) end

--- Snaps x and z to the configured grid size (floor, then plus the snap offset) when a snap size is set; y is untouched. Returns x, y, z.
---@param x any
---@param y any
---@param z any
function PlaceablePlacement:getPlacementPosition(x, y, z) end

--- Returns the position snap grid size from the XML.
function PlaceablePlacement:getPositionSnapSize() end

--- Returns the position snap offset from the XML.
function PlaceablePlacement:getPositionSnapOffset() end

--- Returns the rotation snap angle in radians from the XML.
function PlaceablePlacement:getRotationSnapAngle() end

--- Server only, when alignToWorldY is false: drops the root onto the terrain height and rotates it so the three position nodes follow the terrain slope. Clients receive the resulting transform through sync.
function PlaceablePlacement:onPreFinalizePlacement() end

--- Returns true only if the farm owns the land along all four edges of the parallelogram defined by the corner points (via g_farmlandManager).
---@param sx any
---@param sz any
---@param wx any
---@param wz any
---@param hx any
---@param hz any
---@param farmId any
function PlaceablePlacement:getIsAreaOwnedByFarm(sx, sz, wx, wz, hx, hz, farmId) end

--- Empty hook called with the proposed position and Y rotation; specializations or mods can override it.
---@param x any
---@param y any
---@param z any
---@param rotY any
function PlaceablePlacement:startPlacementCheck(x, y, z, rotY) end

--- Tests every test area for a blocked area, then runs an overlapBox (box lowered to 0.5 m under the lowest terrain corner) against the placement mask and a density-height check. Returns true plus the hit node, or false, nil.
---@param x any
---@param y any
---@param z any
---@param rotY any
---@param checkFunc any
function PlaceablePlacement:getHasOverlap(x, y, z, rotY, checkFunc) end

--- Returns true if any corner of any test area, at the given position and rotation, lies inside one of the given placement places.
---@param places any
---@param x any
---@param y any
---@param z any
---@param rotY any
function PlaceablePlacement:getHasOverlapWithPlaces(places, x, y, z, rotY) end

--- Returns true if a test-area corner is inside a restricted zone (with a water check unless the placeable may stand in water) or outside the placeable system boundary.
---@param zones any
---@param x any
---@param y any
---@param z any
---@param rotY any
function PlaceablePlacement:getHasOverlapWithZones(zones, x, y, z, rotY) end

--- Computes the four world-space XZ corners of a test area for a placement position and Y rotation. Returns the start, width, height and opposite corners as x, z pairs.
---@param testArea any
---@param x any
---@param z any
---@param rotY any
function PlaceablePlacement:getTestParallelogramAtWorldPosition(testArea, x, z, rotY) end

--- Client only: plays the place and placeLayered samples.
function PlaceablePlacement:playPlaceSound() end

--- Client only: plays the destroy sample, optionally skipping it if it is already playing.
---@param onlyIfNotPlaying any
function PlaceablePlacement:playDestroySound(onlyIfNotPlaying) end
