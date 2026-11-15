---@meta
-- FS25 1.25.1.0 : gui/base/OverlayManager.lua (generated stub, FS25 Lua Atlas)

---@class OverlayManager
OverlayManager = {}

---@param filename string
---@param prefix string
---@param customEnv string?
function OverlayManager:addTextureConfigFile(filename, prefix, customEnv) end

---@param identifier string
---@param posX number?
---@param posY number?
---@param width number?
---@param height number?
---@param customEnv string?
---@return Overlay?
function OverlayManager:createOverlay(identifier, posX, posY, width, height, customEnv) end

---@param identifier string
---@param customEnv string?
---@return table?
function OverlayManager:getSliceInfoById(identifier, customEnv) end

---@param configPrefix string
---@param customEnv string?
---@return table?
function OverlayManager:getConfigMetaData(configPrefix, customEnv) end
