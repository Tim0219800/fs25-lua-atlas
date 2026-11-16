---@meta
-- FS25 1.25.1.0 : gui/elements/PagingElement.lua (generated stub, FS25 Lua Atlas)

--- GUI container that shows one of several page children at a time. Every child added becomes a page; named children use the localization key 'ui_' plus the name as their title. It extends GuiElement and includes IndexChangeSubjectMixin so observers learn about page and page-count changes. Pages can be disabled, in which case they are left out of the visible page mapping. Several methods (such as setPage) are absent from this dump (UNVERIFIED).
---@class PagingElement : GuiElement
PagingElement = {}

--- Constructor. Creates the element with the index-change mixin and empty page structures: the page list, an id-to-page hash, the visible-page mapping and current page indices set to 1.
---@param target any
---@param custom_mt any
function PagingElement.new(target, custom_mt) end

--- Loads the base element, then registers the onPageChange and onPageUpdate callbacks from the XML.
---@param xmlFile any
---@param key any
function PagingElement:loadFromXML(xmlFile, key) end

--- Copies the two page callbacks from a source element and clones the index-change mixin.
---@param src any
function PagingElement:copyAttributes(src) end

--- Runs the base setup-finished handling, then builds the visible page mapping.
function PagingElement:onGuiSetupFinished() end

--- Adds the child as usual and registers it as a page. If it has a name with an existing 'ui_<name>' text, the page id is the upper-cased name and the title the translation; otherwise the id is the element's string form and the title empty. addPage itself is not in this dump (UNVERIFIED).
---@param element any
function PagingElement:addElement(element) end

--- Removes the child through the parent, then removes any page whose root element is that child.
---@param element any
function PagingElement:removeElement(element) end

--- Returns the id of the page at the current page index.
function PagingElement:getCurrentPageId() end

--- Returns the position of the given page among the visible (non-disabled) pages. Errors if the id is unknown; disabled pages report 1.
---@param pageId any
function PagingElement:getPageMappingIndex(pageId) end

--- Returns whether the page with the given id is disabled. Errors if the id is unknown.
---@param pageId any
function PagingElement:getIsPageDisabled(pageId) end

--- Returns the page table registered under the given id, or nil if none.
---@param pageId any
function PagingElement:getPageById(pageId) end

--- Enables or disables a page (nil page is ignored), rebuilds the visible page mapping and raises the onPageUpdate callback with the page and this element.
---@param page any
---@param disabled any
function PagingElement:setPageDisabled(page, disabled) end

--- Rebuilds the list of visible page indices and titles, skipping disabled pages. If the current page became disabled it clamps the mapping index and calls setPage (unless neuterPageUpdates is set); otherwise it notifies index observers of the new count.
function PagingElement:updatePageMapping() end
