---@meta
-- FS25 1.25.1.0 : gui/base/TabbedMenu.lua (generated stub, FS25 Lua Atlas)

--- Base class (extends ScreenElement) of full-screen tabbed menus such as the in-game menu. It keeps the registered page frames, their header tabs and enabling predicates, drives a PagingElement and a page selector, and maps the bottom menu buttons to input actions and callbacks. Page frames expose onFrameOpen/onFrameClose, requestClose and menu button info; subclasses override setupMenuButtonInfo and onMenuOpened. Optional depth-of-field blur and game state switching are done on open/close.
---@class TabbedMenu : ScreenElement
TabbedMenu = {}

--- Creates the menu with empty page, tab, predicate and button-callback tables, current page index 1, and callbacks for next/previous page. Subclasses can set performBackgroundBlur.
---@param target any
---@param custom_mt any
function TabbedMenu.new(target, custom_mt) end

--- Unsubscribes the menu from all message center topics, then deletes it through the parent class.
function TabbedMenu:delete() end

--- After GUI loading, creates the back callback, calls setupMenuButtonInfo, and for the profile uiInGameMenuPaging sizes the paging element to the width left beside the header.
function TabbedMenu:onGuiSetupFinished() end

--- Leaves the menu by changing to no screen (nil).
function TabbedMenu:exitMenu() end

--- Resets the current page and the remembered page index and scroll offset to their initial values (first page).
function TabbedMenu:reset() end

--- On opening: optionally pushes a full-screen blur, plays the paging sound unless muted, applies the menu game state, refreshes enabled pages, and restores the last page and tab scroll. Sounds from focus changes are suppressed meanwhile; ends with onMenuOpened.
---@param element any
function TabbedMenu:onOpen(element) end

--- On closing: notifies the current page first, pops the blur, restores input bindings, clears button actions, stores the current page, index and tab scroll for next time, and resets the game state if one was set.
---@param element any
function TabbedMenu:onClose(element) end

--- Per-frame update. Forces the focus onto the current page when no dialog is visible, pushes the page's button info to the buttons when it is flagged dirty and this menu is the active listener, and updates the header visibility when the page asks for it.
---@param dt any
function TabbedMenu:update(dt) end

--- Empty hook in this class; subclasses override it to define their default menu button info.
function TabbedMenu:setupMenuButtonInfo() end

--- Records the tab data (icon file, UVs, slice, sound) for a page frame and builds its click callback, which asks the current page to close and then switches to that page. Must be called together with registerPage to keep ordering consistent.
---@param frameController any
---@param iconFilename any
---@param iconUVs any
---@param iconSliceId any
---@param soundId any
function TabbedMenu:addPageTab(frameController, iconFilename, iconUVs, iconSliceId, soundId) end

--- Empty hook called when a tab is clicked; TabbedMenuWithDetails overrides it. Note: the tab callback passes self.activeDetailPage, which this file never sets.
---@param oldPage any
function TabbedMenu:onPageClicked(oldPage) end

--- Marks the header tab of a page as enabled or disabled and reloads the tab list unless blockListReload is set.
---@param pageController any
---@param isEnabled any
---@param blockListReload any
function TabbedMenu:setPageTabEnabled(pageController, isEnabled, blockListReload) end

--- Rebuilds the list of enabled pages in registration order, reloads the tab list and restores the selection to the current list index.
function TabbedMenu:rebuildTabList() end

--- Evaluates every page's enabling predicate (pages disabled via setPageEnabled stay off), updates the paging element and tabs without page-change side effects, then rebuilds the tab list and page selector titles.
function TabbedMenu:updatePages() end

--- Empties the action-to-callback table and removes the input action events registered for custom menu buttons.
function TabbedMenu:clearMenuButtonActions() end

--- Applies a list of button descriptors (inputAction, text, callback, sound, disabled, showWhenPaused...) to the menu buttons: sets action, text, click sound and callback, registers custom input events or stores default-action callbacks, and hides unused buttons. Always guarantees MENU_BACK works, then relayouts the panel.
---@param menuButtonInfo any
function TabbedMenu:assignMenuButtonInfo(menuButtonInfo) end

--- Fills the page selector with the titles of the visible pages, disables it when only one exists, and syncs its state to the current page without firing events.
function TabbedMenu:setPageSelectorTitles() end

--- Switches to the given page frame through the page selector, with a forced event. Sound is muted for the switch when muteSound is true; the previous mute state is restored afterwards.
---@param page any
---@param muteSound any
function TabbedMenu:goToPage(page, muteSound) end

--- Shows or hides the menu header.
---@param visible any
function TabbedMenu:updatePagingVisibility(visible) end

--- Calls the callback stored for an input action name, if any. Returns the callback's result or false when it ran, and true (event not consumed) when there was no callback.
---@param menuActionName any
---@return boolean
function TabbedMenu:onMenuActionClick(menuActionName) end

--- Handles the accept input by dispatching MENU_ACCEPT to the stored callback; the parent class is deliberately not called.
function TabbedMenu:onClickOk() end

--- Handles back: asks the current page to allow closing, then calls the parent handler and the MENU_BACK callback. Returns whether the event stayed unused.
function TabbedMenu:onClickBack() end

--- Handles cancel (quit to main menu): runs the parent handler, then the MENU_CANCEL callback if the event is still unused.
function TabbedMenu:onClickCancel() end

--- Handles activate (save the game): runs the parent handler, then the MENU_ACTIVATE callback if the event is still unused.
function TabbedMenu:onClickActivate() end

--- Runs the parent handler, then the MENU_EXTRA_1 callback if the event is still unused.
function TabbedMenu:onClickMenuExtra1() end

--- Runs the parent handler, then the MENU_EXTRA_2 callback if the event is still unused.
function TabbedMenu:onClickMenuExtra2() end

--- Called when the page selector changes state: sets that page in the paging element and plays the tab's sound (or the default click) unless muted.
---@param state any
function TabbedMenu:onClickPageSelection(state) end

--- Goes to the previous page. On mobile it asks the page for its own previous sub-page; otherwise it asks the page for permission to close, then lets the parent change page.
function TabbedMenu:onPagePrevious() end

--- Goes to the next page, with the same mobile and desktop split as onPagePrevious.
function TabbedMenu:onPageNext() end

--- Paging callback on page change: closes and hides the old page, resets bindings, shows the new page, gives it focus with sounds suppressed, updates the tab selection, refreshes buttons and tab display, then calls onFrameOpen on the new page.
---@param pageIndex any
---@param pageMappingIndex any
---@param element any
---@param skipTabVisualUpdate any
function TabbedMenu:onPageChange(pageIndex, pageMappingIndex, element, skipTabVisualUpdate) end

--- Assigns the page's button info (custom or default) to the buttons and moves the page's own button box to the end of its parent so it draws on top.
---@param page any
function TabbedMenu:updateButtonsPanel(page) end

--- Returns the page's own button info when it declares custom buttons, otherwise the menu's default button info.
---@param page any
function TabbedMenu:getPageButtonInfo(page) end

--- Empty hook for when a page is disabled or updated; does nothing here.
function TabbedMenu:onPageUpdate() end

--- Default back-button action: exits the menu.
function TabbedMenu:onButtonBack() end

--- Empty hook called at the end of onOpen, after the page has been restored.
function TabbedMenu:onMenuOpened() end

--- Inserts a page frame into the menu's page list (clamped position, appended by default), indexes it by class, stores its root element and optional enabling predicate, and hides it. Does not touch the paging component. Returns the root element and the final position.
---@param pageFrameElement any
---@param position any
---@param enablingPredicateFunction any
function TabbedMenu:registerPage(pageFrameElement, position, enablingPredicateFunction) end

--- Removes the page registered for a frame class from the menu's tables. Returns found flag, controller, root and tab. Note: the tab is never looked up, so the returned tab is always nil, and an entry is not removed from pagingElement.
---@param pageFrameClass table
---@return boolean
---@return table
---@return table
---@return table
function TabbedMenu:unregisterPage(pageFrameClass) end

--- Adds a page at runtime: registers it, creates its header tab from an icon file and UVs, and adds it to the paging element under its title (root title or the l10n key ui_<name>). Lasts until the game restarts or the page is removed.
---@param pageFrameElement any
---@param position any
---@param tabIconFilename any
---@param tabIconUVs any
---@param enablingPredicateFunction any
function TabbedMenu:addPage(pageFrameElement, position, tabIconFilename, tabIconUVs, enablingPredicateFunction) end

--- Removes a page by class and deletes it with its children, but only disables built-in pages (those in defaultPageElementIDs, UNVERIFIED where it is filled). Note: unregisterPage returns a nil tab, so the pageTab:delete() call would fail for non-default pages.
---@param pageFrameClass table
function TabbedMenu:removePage(pageFrameClass) end

--- Enables or disables a page by controller class: updates the paging element, the controller's own disabled state, the persistent disabled list and its tab. Survives reset(); undo it by hand.
---@param pageFrameClass table
---@param isEnabled boolean
function TabbedMenu:setPageEnabled(pageFrameClass, isEnabled) end

--- Returns a closure that calls func with this menu as first argument followed by any call arguments.
---@param func any
function TabbedMenu:makeSelfCallback(func) end
