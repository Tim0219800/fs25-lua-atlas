---@meta
-- FS25 1.25.1.0 : utils/BitmapUtil.lua (stub généré, atlas Lua FS25)

---@class BitmapUtil
BitmapUtil = {}

---@param pixels table
---@param width integer
---@param height integer
---@param filepath string
---@param imageFormat integer
---@return boolean
function BitmapUtil.writeBitmapToFile(pixels, width, height, filepath, imageFormat) end

---@param iterator function
---@param width integer
---@param height integer
---@param filepath string
---@param imageFormat integer
---@return boolean
function BitmapUtil.writeBitmapToFileFromIterator(iterator, width, height, filepath, imageFormat) end
