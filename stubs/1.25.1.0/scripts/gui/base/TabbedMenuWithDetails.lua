---@meta
-- FS25 1.25.1.0 : gui/base/TabbedMenuWithDetails.lua (generated stub, FS25 Lua Atlas)

--- TabbedMenu extension where each tab keeps a stack of frames: a root page plus detail pages pushed on top, with back navigation popping them. Detail pages are regular pages in the paging element that get enabled and disabled as they are pushed and popped. A developer note in the source describes a known bug with the page index and mapping index when invisible pages sit between tabs.
---@class TabbedMenuWithDetails : TabbedMenu
TabbedMenuWithDetails = {}

--- Creates the menu through TabbedMenu.new and adds an empty table of stacks, keyed by page index.
---@param target any
---@param custom_mt any
function TabbedMenuWithDetails.new(target, custom_mt) end

--- Resets the base menu state and discards all detail stacks.
function TabbedMenuWithDetails:reset() end

--- Returns true when the current tab shows a detail page instead of its root.
function TabbedMenuWithDetails:getIsDetailMode() end

--- Pops all details back to the root, then exits the menu through the parent class.
function TabbedMenuWithDetails:exitMenu() end

--- Replaces TabbedMenu:onOpen on purpose, skipping its code to avoid a doubled blur and extra sounds. At root it refreshes pages and restores the saved page; otherwise it reopens the top detail frame and its buttons.
---@param element any
function TabbedMenuWithDetails:onOpen(element) end

--- When a tab is clicked, pops the whole detail stack back to the root.
---@param oldPage any
function TabbedMenuWithDetails:onPageClicked(oldPage) end

--- Empty hook called after a detail page is closed; subclasses override it.
---@param detailPage any
function TabbedMenuWithDetails:onDetailClosed(detailPage) end

--- Empty hook called after a detail page is opened; subclasses override it.
---@param detailPage any
function TabbedMenuWithDetails:onDetailOpened(detailPage) end

--- Back button: exits the menu when at root, otherwise closes the top detail.
function TabbedMenuWithDetails:onButtonBack() end

--- Paging callback. During a detail push or pop it skips the tab visual update; for a normal page change it first pops the stack to root. Then calls the base implementation.
---@param pageIndex any
---@param pageMappingIndex any
---@param element any
---@param skipTabVisualUpdate any
function TabbedMenuWithDetails:onPageChange(pageIndex, pageMappingIndex, element, skipTabVisualUpdate) end

--- Returns the frame stack of the given page, or of the current tab, creating it with a root entry if absent. Entries hold the page, plus pageId and isRoot for the root.
---@param page any
function TabbedMenuWithDetails:getStack(page) end

--- Returns true when the current tab's stack holds only the root page.
function TabbedMenuWithDetails:isAtRoot() end

--- Returns the page at the top of the current tab's stack.
function TabbedMenuWithDetails:getTopFrame() end

--- Sets the disabled flag of a page in the paging element, looked up by its element.
---@param page any
---@param disabled any
function TabbedMenuWithDetails:setPageDisabled(page, disabled) end

--- Pushes a detail page on the current stack and shows it. A detail already on top is hidden, closed and disabled first (onDetailClosed). The new page is enabled, selected with sounds suppressed, and onDetailOpened is called.
---@param detailPage any
function TabbedMenuWithDetails:pushDetail(detailPage) end

--- Removes the top detail, closes and disables it (onDetailClosed), then reopens the detail below or selects the root page. Note: at root it logs an error and returns without resetting isChangingDetail, which stays true.
function TabbedMenuWithDetails:popDetail() end

--- Pops details one by one until only the root remains; does nothing if already there.
function TabbedMenuWithDetails:popToRoot() end

--- Pops the current detail then pushes the given one, keeping the stack depth and so the back behaviour. Fails like popDetail when called at root.
---@param detailPage any
function TabbedMenuWithDetails:replaceDetail(detailPage) end

--- Returns an array of page titles (empty string when none) for the stack of the given or current page, from root to top.
---@param page any
function TabbedMenuWithDetails:getBreadcrumbs(page) end
