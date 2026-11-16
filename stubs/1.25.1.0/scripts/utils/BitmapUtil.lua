---@meta
-- FS25 1.25.1.0 : utils/BitmapUtil.lua (generated stub, FS25 Lua Atlas)

--- Small utility for dumping pixel data to disk as portable anymap (PNM) images, mostly useful for debugging maps and density data. The format table BitmapUtil.FORMAT_TO_PNM used by both functions is not defined in the SDK dump (UNVERIFIED).
---@class BitmapUtil
BitmapUtil = {}

--- Writes a table of pixels to a PNM file, adding the format's extension to the path. Logs an error and returns false on an unknown format or if the file cannot be created; returns true after writing and logging.
---@param pixels table
---@param width integer
---@param height integer
---@param filepath string
---@param imageFormat integer
---@return boolean
function BitmapUtil.writeBitmapToFile(pixels, width, height, filepath, imageFormat) end

--- Like writeBitmapToFile but pulls pixels from an iterator function instead of a table, flushing to disk in chunks. Returns false on bad format or file creation failure, true on success.
---@param iterator function
---@param width integer
---@param height integer
---@param filepath string
---@param imageFormat integer
---@return boolean
function BitmapUtil.writeBitmapToFileFromIterator(iterator, width, height, filepath, imageFormat) end
