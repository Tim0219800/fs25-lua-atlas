---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableRiceField.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for player-drawn rice paddies. Each field is a polygon with a flat terrain area, a raised ridge around it, a water plane (visual, mirror and collision meshes), a pump with sounds and a player trigger. The server animates the water level over game time and syncs it; the terrain is deformed through g_terrainDeformationQueue. It also uses PlaceableRiceFieldActivatable and the shallow water simulation if present. Many functions are registered but have no body in the dump (field creation, vertices, water getters, events), so they are UNVERIFIED.
---@class PlaceableRiceField
PlaceableRiceField = {}

--- Declares the XML schema under placeable.riceField: inner area and ridge ground types and sizes, ridge foliage, water max level and fill duration, underwater fog shader values, pump i3d with filling/emptying nodes and sounds, player trigger node, and the supported fruit types.
---@param schema XMLSchema
---@param basePath string
function PlaceableRiceField.registerXMLPaths(schema, basePath) end

--- Declares the savegame XML for each saved field: world height, water height and target, initial fruit data for preplaced fields, outline vertices and per-period water levels.
---@param schema any
---@param basePath any
function PlaceableRiceField.registerSavegameXMLPaths(schema, basePath) end

--- Always returns true; no prerequisite specialization.
---@param specializations table
---@return boolean
function PlaceableRiceField.prerequisitesPresent(specializations) end

--- Registers the rice field API on the placeable type (field create/remove/get, vertices, water height and fill level getters/setters, terrain deformation callbacks, rice field state events). Most of these functions are not defined in the dump.
---@param placeableType any
function PlaceableRiceField.registerFunctions(placeableType) end

--- Overrides addToPhysics, collectPickObjects, getIsOnFarmland, getFarmlandId, getDestructionMethod, performNodeDestruction and previewNodeDestructionNodes.
---@param placeableType any
function PlaceableRiceField.registerOverwrittenFunctions(placeableType) end

--- Subscribes to onLoad, onDelete, the stream read/write events (initial and update), onDirtyMaskCleared, onUpdateTick and onPeriodChanged.
---@param placeableType any
function PlaceableRiceField.registerEventListeners(placeableType) end

--- Only when g_isDevelopmentVersion is set, registers four console commands (gsRiceFieldWaterSetLevel, gsRiceFieldWaterSetShaderParameters, gsRiceFieldSetRice, gsRiceFieldCreateFromField).
function PlaceableRiceField.initSpecialization() end

--- Reads ground types, ridge and water settings, fog values, trigger node and fruit types from XML, starts the async load of the pump i3d, loads pump sounds on the client, creates the activatable and subscribes to FINISHED_GROWTH_PERIOD. Note: the ridge foliage growth state fallback reads the foliageGrowthStateName key instead of foliageGrowthState.
---@param savegame table
function PlaceableRiceField:onLoad(savegame) end

--- Async callback for the shared pump i3d: stores the node as a template cloned per field, remembers the node paths for filling/emptying water and splash, then finishes the loading task. Returns false if the i3d failed.
---@param i3dNode any
---@param failedReason any
---@param args any
function PlaceableRiceField:onPumpI3DLoaded(i3dNode, failedReason, args) end

--- Removes the activatable, unsubscribes from messages, deletes all fields, the pump template, sounds and the shared i3d request.
function PlaceableRiceField:onDelete() end

--- Client initial sync: reads each field (height, polygon vertices, water height, optional target), creates it, builds its meshes and sets the pump effects as filling or emptying.
---@param streamId any
---@param connection any
function PlaceableRiceField:onReadStream(streamId, connection) end

--- Server initial sync: writes the number of fields, then for each its height, polygon vertices, water height and optional water target.
---@param streamId any
---@param connection any
function PlaceableRiceField:onWriteStream(streamId, connection) end

--- Server only: when the water dirty flag is set, writes the water height (compressed up to the max level) and a flag telling if the target was reached, only for fields marked dirty.
---@param streamId any
---@param connection any
---@param dirtyMask any
function PlaceableRiceField:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Adds random waves to the shallow water simulation near filling splashes. On the server, moves each field's water height toward its target at a rate scaled by effective time scale and the fill duration, ends effects and flags a sync when the target is reached.
---@param dt any
function PlaceableRiceField:onUpdateTick(dt) end

--- Loads each saved field: height, water height, polygon, per-period water levels and optional water target. On a new savegame, the server also applies the initial terrain deformation and initial fruit. Note: the local callback passed to performTerrainDeformation is never defined, so it is nil.
---@param xmlFile any
---@param key any
function PlaceableRiceField:loadFromXMLFile(xmlFile, key) end

--- Saves each field: world height, water height, optional target, per-period water levels per square meter and polygon vertices as x z strings.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableRiceField:saveToXMLFile(xmlFile, key, usedModNames) end

--- Returns Placeable.DESTRUCTION.PER_NODE, so the player removes one field at a time instead of the whole placeable.
---@param superFunc any
function PlaceableRiceField:getDestructionMethod(superFunc) end

--- For the field under the targeted node, draws the outline of its water mesh and of the visible shapes of its pump. Returns nil (no extra nodes for the brush to highlight).
---@param superFunc function
---@param node integer
---@return array?
function PlaceableRiceField:previewNodeDestructionNodes(superFunc, node) end

--- Removes the field matching the node; returns whether a field was removed and whether the whole placeable should be destroyed (no valid field left).
---@param superFunc any
---@param node any
function PlaceableRiceField:performNodeDestruction(superFunc, node) end

--- Empty override: disables the default pick object collection for this placeable.
---@param superFunc any
---@param node any
---@param target any
function PlaceableRiceField:collectPickObjects(superFunc, node, target) end

--- Builds a field's nodes from its polygon: visual water plane with the riceFieldWaterSimulation material, a mirror plane, water and placement collision planes, a cloned pump and a player trigger at the first edge. Registers the field, sets the water height and adds the water plane to the shallow water simulation. Returns false if a mesh cannot be created. Note: shader parameters of the mirror plane are set on the main plane node.
---@param field any
function PlaceableRiceField:buildMesh(field) end

--- Queues three terrain jobs for a field: flattening the polygon with the inner ground type, raising ridges along each edge, and painting the ridge ground type if it exists. Each job calls onTerrainDeformationTaskFinished; the callback is stored in field.brushCallback.
---@param field any
---@param callback any
function PlaceableRiceField:performTerrainDeformation(field, callback) end

--- Returns true if at least one field polygon has three or more vertices.
function PlaceableRiceField:getHasValidFields() end
