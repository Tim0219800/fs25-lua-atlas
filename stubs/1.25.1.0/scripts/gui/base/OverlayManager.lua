---@meta
-- FS25 1.25.1.0 : gui/base/OverlayManager.lua (generated stub, FS25 Lua Atlas)

--- Loads texture config XML files (image file, size, list of slices with UV rectangles) and creates `Overlay` objects from named slices, identified as "prefix.sliceId". Mods can pass a custom environment name that is prepended to the prefix. The `textureConfigs` table is initialised elsewhere (UNVERIFIED); the global instance is `g_overlayManager`.
---@class OverlayManager
OverlayManager = {}

--- Reads the XML (texture.meta filename and size, texture.slices.slice entries with id and uvs) and registers slices under the prefix, with a warning and abort on missing data. Duplicate prefix is refused except during GUI reload. Note: early error returns skip `xmlFile:delete()`.
---@param filename string
---@param prefix string
---@param customEnv string?
function OverlayManager:addTextureConfigFile(filename, prefix, customEnv) end

--- Splits "prefix.sliceId", finds the slice and returns a new `Overlay` with its image and UVs, at the given position (default 0) and size (default slice size). Returns nil with a warning if unknown.
---@param identifier string
---@param posX number?
---@param posY number?
---@param width number?
---@param height number?
---@param customEnv string?
---@return Overlay?
function OverlayManager:createOverlay(identifier, posX, posY, width, height, customEnv) end

--- Returns the stored slice table (id, size, UVs, file, image size) for "prefix.sliceId", or nil with a warning if the identifier or config is invalid. A nil identifier returns nil silently.
---@param identifier string
---@param customEnv string?
---@return table?
function OverlayManager:getSliceInfoById(identifier, customEnv) end

--- Returns a table {filename, imageSize} for a loaded config prefix, or nil with a warning if the prefix is nil or not loaded.
---@param configPrefix string
---@param customEnv string?
---@return table?
function OverlayManager:getConfigMetaData(configPrefix, customEnv) end
