---@meta
-- FS25 1.25.1.0 : gui/elements/IndexStateElement.lua (generated stub, FS25 Lua Atlas)

--- IndexStateElement is a BoxLayoutElement that shows one small indicator per page or item, highlighting the current index. It clones a hidden template element for each page and listens to an indexable element (ListElement, PageElement, multi-option) that includes IndexChangeSubjectMixin. XML keys: stateElementTemplateId, indexableElementId, reverseElements, indexMinimizeWidth. Views may also drive it by hand.
---@class IndexStateElement : BoxLayoutElement
IndexStateElement = {}

--- Constructor. Creates empty page element list, current page index 1, no template or indexable element, and the reverse and minimize-width flags off.
---@param target any
---@param custom_mt any
function IndexStateElement.new(target, custom_mt) end

--- Reads stateElementTemplateId, indexableElementId, reverseElements and indexMinimizeWidth from the XML node after the parent load.
---@param xmlFile any
---@param key any
function IndexStateElement:loadFromXML(xmlFile, key) end

--- Reads the reverseElements and indexMinimizeWidth booleans from the profile.
---@param profile any
---@param applyProfile any
function IndexStateElement:loadProfile(profile, applyProfile) end

--- Copies settings from a source element, clones its state template and re-locates the indexable element. Fails if the source has no template.
---@param src any
function IndexStateElement:copyAttributes(src) end

--- After GUI setup, locates the state template if missing and, when an indexable element id is configured, locates that element too.
function IndexStateElement:onGuiSetupFinished() end

--- Looks up the template by id among the parent's descendants, hides it, disables focus handling and unlinks it from the hierarchy. Prints a warning if not found.
function IndexStateElement:locateStateElementTemplate() end

--- Climbs up to 20 parent levels to the view root, finds the indexable element by id and registers onIndexChange as observer if it includes IndexChangeSubjectMixin; warns otherwise.
function IndexStateElement:locateIndexableElement() end

--- Observer callback. Rebuilds the indicators if the item count changed, then calls setPageIndex (defined elsewhere, not in this file) with the new index.
---@param index integer
---@param count integer
function IndexStateElement:onIndexChange(index, count) end

--- If the count differs, deletes existing indicators, clones the template count times, invalidates the layout, optionally sets the initial index and updates the size.
---@param count integer
---@param initialIndex integer?
function IndexStateElement:setPageCount(count, initialIndex) end
