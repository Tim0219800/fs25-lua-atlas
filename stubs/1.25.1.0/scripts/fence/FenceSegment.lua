---@meta
-- FS25 1.25.1.0 : fence/FenceSegment.lua (generated stub, FS25 Lua Atlas)

---@class FenceSegment
FenceSegment = {}

---@param schema any
---@param basePath any
function FenceSegment.registerXMLPaths(schema, basePath) end

---@param xmlFile any
---@param key any
function FenceSegment:saveToXMLFile(xmlFile, key) end

---@param streamId integer
---@param connection table
---@param lastSegment FenceSegment
function FenceSegment:readStream(streamId, connection, lastSegment) end

---@param streamId integer
---@param connection table
---@param lastSegment FenceSegment
function FenceSegment:writeStream(streamId, connection, lastSegment) end

---@return number
---@return number
---@return number
function FenceSegment:getStartPos() end

---@return vector?
function FenceSegment:getStartPosVector() end

---@return number
---@return number
---@return number
function FenceSegment:getEndPos() end

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
