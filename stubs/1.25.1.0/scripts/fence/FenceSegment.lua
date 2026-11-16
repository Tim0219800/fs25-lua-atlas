---@meta
-- FS25 1.25.1.0 : fence/FenceSegment.lua (generated stub, FS25 Lua Atlas)

--- One straight run of a fence: a start and end world position, optional start/end poles and a chain of panels built from the segment template metadata. This dump only keeps the XML schema, savegame position saving, network streaming and position getters; the mesh building, finalize, delete and validation methods that other fence files call (updateMeshes, finalize, getPrice, getCanBeBuilt...) are not present, so their behaviour is UNVERIFIED. FenceGate extends this class.
---@class FenceSegment
FenceSegment = {}

--- Registers the per-segment XML keys: slope/vertical angle limits, snap distances, parallel snapping and extending settings, `#price`, `poles.pole(?)` (variation, node, radius, height) and `panels` (maxScale, useRandomization, `panel(?)` with node, collisionNode, length, width, height, alignY, scaleZ).
---@param schema any
---@param basePath any
function FenceSegment.registerXMLPaths(schema, basePath) end

--- Writes the start and end positions as translations under `#start` and `#end`. Returns false (with a dev log) if either position is unset, which makes the caller skip the segment.
---@param xmlFile any
---@param key any
function FenceSegment:saveToXMLFile(xmlFile, key) end

--- Reads the segment from a stream: the UInt16 id (only when the sender is the server), a start position or, if the Bool is false, the previous segment's end, then the compressed end position, pole flags if the template has poles, and the split-rebuild flag. Registers terrain-height callbacks.
---@param streamId integer
---@param connection table
---@param lastSegment FenceSegment
function FenceSegment:readStream(streamId, connection, lastSegment) end

--- Mirror of readStream: writes the id (when sending to a client), skips the start position when it equals the previous segment's end, then the compressed end position, pole flags and the split-rebuild flag.
---@param streamId integer
---@param connection table
---@param lastSegment FenceSegment
function FenceSegment:writeStream(streamId, connection, lastSegment) end

--- Returns the start position as three numbers (x, y, z).
---@return number
---@return number
---@return number
function FenceSegment:getStartPos() end

--- Returns the start position as a vector, or nil if it is not set yet.
---@return vector?
function FenceSegment:getStartPosVector() end

--- Returns the end position as three numbers (x, y, z).
---@return number
---@return number
---@return number
function FenceSegment:getEndPos() end

--- Resolves a node to its segment part (via getSegmentPartFromNode, not in this file, UNVERIFIED) and returns its start and end world positions plus whether it is the first or last part of the segment (0.01 distance tolerance). Returns nil if no part is found.
---@param node integer
---@return number?
---@return number?
---@return number?
---@return number?
---@return number?
---@return number?
---@return boolean?
---@return boolean?
function FenceSegment:getSegmentPartStartEnd(node) end
