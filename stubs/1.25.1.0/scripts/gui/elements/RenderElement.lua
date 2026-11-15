---@meta
-- FS25 1.25.1.0 : gui/elements/RenderElement.lua (stub généré, atlas Lua FS25)

---@class RenderElement : GuiElement
RenderElement = {}

---@param target table
---@param custom_mt table?
---@return RenderElement
function RenderElement.new(target, custom_mt) end

function RenderElement:delete() end

---@param xmlFile integer
---@param key string
function RenderElement:loadFromXML(xmlFile, key) end

---@param profile table
---@param applyProfile boolean
function RenderElement:loadProfile(profile, applyProfile) end

---@param src table
function RenderElement:copyAttributes(src) end

function RenderElement:createScene() end

function RenderElement:destroyScene() end

---@param i3dFilename string
function RenderElement:setScene(i3dFilename) end

---@param node integer
---@param failedReason integer
---@param args table?
function RenderElement:onSceneLoaded(node, failedReason, args) end

function RenderElement:createOverlay() end

---@param dt number
function RenderElement:update(dt) end

---@param clipX1 number?
---@param clipY1 number?
---@param clipX2 number?
---@param clipY2 number?
function RenderElement:draw(clipX1, clipY1, clipX2, clipY2) end

---@return boolean
function RenderElement:canReceiveFocus() end

---@return integer
function RenderElement:getSceneRoot() end

function RenderElement:setRenderDirty() end
