---@meta
-- FS25 1.25.1.0 : gui/elements/PagingElement.lua (stub généré, atlas Lua FS25)

---@class PagingElement : GuiElement
PagingElement = {}

---@param target any
---@param custom_mt any
function PagingElement.new(target, custom_mt) end

---@param xmlFile any
---@param key any
function PagingElement:loadFromXML(xmlFile, key) end

---@param src any
function PagingElement:copyAttributes(src) end

function PagingElement:onGuiSetupFinished() end

---@param element any
function PagingElement:addElement(element) end

---@param element any
function PagingElement:removeElement(element) end

function PagingElement:getCurrentPageId() end

---@param pageId any
function PagingElement:getPageMappingIndex(pageId) end

---@param pageId any
function PagingElement:getIsPageDisabled(pageId) end

---@param pageId any
function PagingElement:getPageById(pageId) end

---@param page any
---@param disabled any
function PagingElement:setPageDisabled(page, disabled) end

function PagingElement:updatePageMapping() end
