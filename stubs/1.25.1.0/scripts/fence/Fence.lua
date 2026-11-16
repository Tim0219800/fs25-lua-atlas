---@meta
-- FS25 1.25.1.0 : fence/Fence.lua (generated stub, FS25 Lua Atlas)

--- Container object of a fence placeable: it owns the list of FenceSegment (and FenceGate) instances and the segment templates, and handles their XML schema, savegame writing and join-time network streaming. In this dump many methods used elsewhere (createNewSegment, getSegmentById, removeSegment, deleteSegmentPart...) are not present in the file, so their behaviour is UNVERIFIED.
---@class Fence
Fence = {}

--- Registers the placeable XML paths `fence.segment(?)#id` and `#class` (both required), then delegates to FenceSegment and FenceGate to register their own per-segment keys. Uses the "Fence" specialization type.
---@param schema XMLSchema
---@param basePath string
function Fence.registerXMLPaths(schema, basePath) end

--- Registers the savegame XML paths for a fence: `segment(?)#id` (the id from the config XML) plus the savegame keys of FenceSegment and FenceGate.
---@param schema XMLSchema
---@param basePath string
function Fence.registerSavegameXMLPaths(schema, basePath) end

--- Saves each segment under `segment(i)`. Segments whose `needsSaving` is false are skipped, and the `#id` attribute and index counter advance only when the segment's own save returns true.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Fence:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client join: reads a UInt16 segment count, then per segment a UInt8 template index and its data (each chained to the previous segment), updates meshes (true, false) and finalizes it with true.
---@param streamId integer
---@param connection table
function Fence:readStream(streamId, connection) end

--- Server join: writes the UInt16 segment count, then per segment its UInt8 template index (found from its id) and its data, passing the previous segment for chaining. Mirror of readStream.
---@param streamId integer
---@param connection table
function Fence:writeStream(streamId, connection) end
