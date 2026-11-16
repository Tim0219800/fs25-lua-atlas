---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FillVolume.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization that renders the content of a FillUnit as a visible, deformable 3D heap (fill plane shape) inside trailers, hoppers and similar tanks. It requires FillUnit, reads the fillVolume configuration in the vehicle XML (volumes, load and unload info nodes, height nodes, deformer nodes), creates engine fill plane shapes, and adds material to them whenever a fill unit level changes. Also drives height-dependent node scaling and translation, deformers moved by moving tools, and syncs the last fill position to clients. Created shapes and updates are client-oriented but the fill position is sent by the server.
---@class FillVolume
FillVolume = {}

--- Returns true only if the vehicle type also has the FillUnit specialization.
---@param specializations any
function FillVolume.prerequisitesPresent(specializations) end

--- Registers the fillVolume vehicle configuration and the XML schema for volumes (node, fill unit index and factor, heap limits, deformer nodes), load/unload info nodes, height nodes, and the fillVolume extras on moving tools and moving parts.
function FillVolume.initSpecialization() end

--- Registers the XML attributes of an info node list (node, width, length, height index, priority, min and max height or fill percentage, translation start and end), shared by load and unload infos.
---@param schema any
---@param basePath any
function FillVolume.registerInfoNodeXMLPaths(schema, basePath) end

--- Registers the fill volume functions on the vehicle type: loaders, load and unload info getters, fill volume index lookup, forced fill type setters and UV scroll speed.
---@param vehicleType any
function FillVolume.registerFunctions(vehicleType) end

--- Overrides setMovingToolDirty, loadExtraDependentParts and updateExtraDependentParts so moving tools and parts can mark deformer nodes as dirty.
---@param vehicleType any
function FillVolume.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, delete, read and write update stream, update, and onFillUnitFillLevelChanged events.
---@param vehicleType any
function FillVolume.registerEventListeners(vehicleType) end

--- Loads the configured fill volumes, normalizes fill unit factors, creates a fill plane shape per volume (with material and texture arrays, measuring the base height offset), finds deformer polylines, then loads load, unload and height infos. Removes the update listener on servers or when nothing is configured.
---@param savegame any
function FillVolume:onLoad(savegame) end

--- Deletes the engine fill plane shapes created for each volume and clears the references.
function FillVolume:onDelete() end

--- Client side: when flagged, reads the compressed last fill position (two values) sent by the server.
---@param streamId any
---@param timestamp any
---@param connection any
function FillVolume:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: when the dirty flag is set, writes the last sent fill position (two compressed values) to the clients.
---@param streamId any
---@param connection any
---@param dirtyMask any
function FillVolume:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Client only. Applies pending deformer translations to the shape polylines, scrolls the UV offset using getFillVolumeUVScrollSpeed, and recomputes height node values by sampling the heap at reference nodes and then scaling, translating or orienting the linked nodes.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function FillVolume:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Reads one volume: node (must be a shape), required valid fillUnitIndex, factor, side plane and heap options, default and forced fill types, slope and error limits, and deformer nodes. Returns false on invalid data. Note: the maximum physical angle is fixed at 35 degrees at load.
---@param xmlFile any
---@param key any
---@param entry any
function FillVolume:loadFillVolume(xmlFile, key, entry) end

--- Reads a list of fill position info nodes (node, width, length, height and fill percentage conditions, translation range) and sorts them by descending priority. Always returns true.
---@param xmlFile any
---@param key any
---@param entry any
function FillVolume:loadFillVolumeInfo(xmlFile, key, entry) end

--- Reads one height node: required fill volume index (fails if no such volume), reference nodes sampled for height, and affected nodes with scale and translation axes, maxima, offset and orientation option.
---@param xmlFile any
---@param key any
---@param entry any
function FillVolume:loadFillVolumeHeightNode(xmlFile, key, entry) end

--- Returns the load info entry (list of fill position nodes) at the given index, or nil.
---@param loadInfoIndex any
function FillVolume:getFillVolumeLoadInfo(loadInfoIndex) end

--- Returns the unload info entry at the given index, or nil.
---@param unloadInfoIndex any
function FillVolume:getFillVolumeUnloadInfo(unloadInfoIndex) end

--- Returns an array of the indices of all fill volumes attached to the given fill unit index (possibly empty).
---@param fillUnitIndex any
function FillVolume:getFillVolumeIndicesByFillUnitIndex(fillUnitIndex) end

--- Forces the displayed fill type on every fill volume linked to the given fill unit.
---@param fillUnitIndex any
---@param forcedFillType any
function FillVolume:setFillVolumeForcedFillTypeByFillUnitIndex(fillUnitIndex, forcedFillType) end

--- Sets a forced display fill type on one volume; it is used at the next fill level change and cleared when the unit becomes empty.
---@param fillVolumeIndex any
---@param forcedFillType any
function FillVolume:setFillVolumeForcedFillType(fillVolumeIndex, forcedFillType) end

--- Hook returning 0, 0, 0 (no texture scrolling); other specializations can override it to animate the heap surface.
function FillVolume:getFillVolumeUVScrollSpeed() end

--- Overrides the parent: after calling it, marks the deformer bound to that moving tool node as dirty so the heap is deformed in the next update.
---@param superFunc function
---@param node integer
---@param forceUpdate boolean
---@param dt number
function FillVolume:setMovingToolDirty(superFunc, node, forceUpdate, dt) end

--- Overrides the parent: after it succeeds, reads fillVolumeIndex and deformerNodeIndices from a moving part or tool entry. Returns false if the parent fails.
---@param superFunc any
---@param xmlFile any
---@param baseName any
---@param entry any
function FillVolume:loadExtraDependentParts(superFunc, xmlFile, baseName, entry) end

--- Overrides the parent: resolves the referenced volume once (warning and dropping the link if it does not exist), then marks the listed deformer nodes as dirty.
---@param superFunc any
---@param part any
---@param dt any
function FillVolume:updateExtraDependentParts(superFunc, part, dt) end

--- Core handler: syncs each linked volume to the unit level, sets surface angle and texture for the fill type, shows or hides the shape, and adds or removes material at the load position (best fill info node, or a default spot on clients). May send the fill position and flags height nodes and deformers dirty.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param _ any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function FillVolume:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, _, toolType, fillPositionData, appliedDelta) end

--- Appends debug rows (fill unit and volume index, last fill type, shape id, visibility, texture array index, last fill positions) to the given values list for the vehicle debug display.
---@param values any
function FillVolume:updateDebugValues(values) end
