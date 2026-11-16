# gui/base/TabbedMenu.lua

*[Version française](../../../fr/scripts/gui/base/TabbedMenu.md)*

Source: `dataS/scripts/gui/base/TabbedMenu.lua` — FS25 1.25.1.0

✍ Base class (extends ScreenElement) of full-screen tabbed menus such as the in-game menu. It keeps the registered page frames, their header tabs and enabling predicates, drives a PagingElement and a page selector, and maps the bottom menu buttons to input actions and callbacks. Page frames expose onFrameOpen/onFrameClose, requestClose and menu button info; subclasses override setupMenuButtonInfo and onMenuOpened. Optional depth-of-field blur and game state switching are done on open/close.

- **TabbedMenu** inherits from `ScreenElement` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `TabbedMenu.new(target: any, custom_mt: any)` | 42 | ✍ Creates the menu with empty page, tab, predicate and button-callback tables, current page index 1, and callbacks for next/previous page. Subclasses can set performBackgroundBlur. |
| `TabbedMenu:delete()` | 78 | ✍ Unsubscribes the menu from all message center topics, then deletes it through the parent class. |
| `TabbedMenu:onGuiSetupFinished()` | 86 | ✍ After GUI loading, creates the back callback, calls setupMenuButtonInfo, and for the profile uiInGameMenuPaging sizes the paging element to the width left beside the header. |
| `TabbedMenu:exitMenu()` | 100 | ✍ Leaves the menu by changing to no screen (nil). |
| `TabbedMenu:reset()` | 106 | ✍ Resets the current page and the remembered page index and scroll offset to their initial values (first page). |
| `TabbedMenu:onOpen(element: any)` | 118 | ✍ On opening: optionally pushes a full-screen blur, plays the paging sound unless muted, applies the menu game state, refreshes enabled pages, and restores the last page and tab scroll. Sounds from focus changes are suppressed meanwhile; ends with onMenuOpened. |
| `TabbedMenu:onClose(element: any)` | 156 | ✍ On closing: notifies the current page first, pops the blur, restores input bindings, clears button actions, stores the current page, index and tab scroll for next time, and resets the game state if one was set. |
| `TabbedMenu:update(dt: any)` | 187 | ✍ Per-frame update. Forces the focus onto the current page when no dialog is visible, pushes the page's button info to the buttons when it is flagged dirty and this menu is the active listener, and updates the header visibility when the page asks for it. |
| `TabbedMenu:setupMenuButtonInfo()` | 215 | ✍ Empty hook in this class; subclasses override it to define their default menu button info. |
| `TabbedMenu:addPageTab(frameController: any, iconFilename: any, iconUVs: any, iconSliceId: any, soundId: any)` | 221 | ✍ Records the tab data (icon file, UVs, slice, sound) for a page frame and builds its click callback, which asks the current page to close and then switches to that page. Must be called together with registerPage to keep ordering consistent. |
| `TabbedMenu:onPageClicked(oldPage: any)` | 244 | ✍ Empty hook called when a tab is clicked; TabbedMenuWithDetails overrides it. Note: the tab callback passes self.activeDetailPage, which this file never sets. |
| `TabbedMenu:setPageTabEnabled(pageController: any, isEnabled: any, blockListReload: any)` | 249 | ✍ Marks the header tab of a page as enabled or disabled and reloads the tab list unless blockListReload is set. |
| `TabbedMenu:rebuildTabList()` | 259 | ✍ Rebuilds the list of enabled pages in registration order, reloads the tab list and restores the selection to the current list index. |
| `TabbedMenu:updatePages()` | 300 | ✍ Evaluates every page's enabling predicate (pages disabled via setPageEnabled stay off), updates the paging element and tabs without page-change side effects, then rebuilds the tab list and page selector titles. |
| `TabbedMenu:clearMenuButtonActions()` | 318 | ✍ Empties the action-to-callback table and removes the input action events registered for custom menu buttons. |
| `TabbedMenu:assignMenuButtonInfo(menuButtonInfo: any)` | 331 | ✍ Applies a list of button descriptors (inputAction, text, callback, sound, disabled, showWhenPaused...) to the menu buttons: sets action, text, click sound and callback, registers custom input events or stores default-action callbacks, and hides unused buttons. Always guarantees MENU_BACK works, then relayouts the panel. |
| `TabbedMenu:setPageSelectorTitles()` | 417 | ✍ Fills the page selector with the titles of the visible pages, disables it when only one exists, and syncs its state to the current page without firing events. |
| `TabbedMenu:goToPage(page: any, muteSound: any)` | 430 | ✍ Switches to the given page frame through the page selector, with a forced event. Sound is muted for the switch when muteSound is true; the previous mute state is restored afterwards. |
| `TabbedMenu:updatePagingVisibility(visible: any)` | 444 | ✍ Shows or hides the menu header. |
| `TabbedMenu:onMenuActionClick(menuActionName: any) → boolean` | 455 | ✍ Calls the callback stored for an input action name, if any. Returns the callback's result or false when it ran, and true (event not consumed) when there was no callback. |
| `TabbedMenu:onClickOk()` | 466 | ✍ Handles the accept input by dispatching MENU_ACCEPT to the stored callback; the parent class is deliberately not called. |
| `TabbedMenu:onClickBack()` | 474 | ✍ Handles back: asks the current page to allow closing, then calls the parent handler and the MENU_BACK callback. Returns whether the event stayed unused. |
| `TabbedMenu:onClickCancel()` | 490 | ✍ Handles cancel (quit to main menu): runs the parent handler, then the MENU_CANCEL callback if the event is still unused. |
| `TabbedMenu:onClickActivate()` | 502 | ✍ Handles activate (save the game): runs the parent handler, then the MENU_ACTIVATE callback if the event is still unused. |
| `TabbedMenu:onClickMenuExtra1()` | 514 | ✍ Runs the parent handler, then the MENU_EXTRA_1 callback if the event is still unused. |
| `TabbedMenu:onClickMenuExtra2()` | 526 | ✍ Runs the parent handler, then the MENU_EXTRA_2 callback if the event is still unused. |
| `TabbedMenu:onClickPageSelection(state: any)` | 537 | ✍ Called when the page selector changes state: sets that page in the paging element and plays the tab's sound (or the default click) unless muted. |
| `TabbedMenu:onPagePrevious()` | 551 | ✍ Goes to the previous page. On mobile it asks the page for its own previous sub-page; otherwise it asks the page for permission to close, then lets the parent change page. |
| `TabbedMenu:onPageNext()` | 565 | ✍ Goes to the next page, with the same mobile and desktop split as onPagePrevious. |
| `TabbedMenu:onPageChange(pageIndex: any, pageMappingIndex: any, element: any, skipTabVisualUpdate: any)` | 579 | ✍ Paging callback on page change: closes and hides the old page, resets bindings, shows the new page, gives it focus with sounds suppressed, updates the tab selection, refreshes buttons and tab display, then calls onFrameOpen on the new page. |
| `TabbedMenu:updateButtonsPanel(page: any)` | 618 | ✍ Assigns the page's button info (custom or default) to the buttons and moves the page's own button box to the end of its parent so it draws on top. |
| `TabbedMenu:getPageButtonInfo(page: any)` | 664 | ✍ Returns the page's own button info when it declares custom buttons, otherwise the menu's default button info. |
| `TabbedMenu:onPageUpdate()` | 678 | ✍ Empty hook for when a page is disabled or updated; does nothing here. |
| `TabbedMenu:onButtonBack()` | 683 | ✍ Default back-button action: exits the menu. |
| `TabbedMenu:onMenuOpened()` | 689 | ✍ Empty hook called at the end of onOpen, after the page has been restored. |
| `TabbedMenu:registerPage(pageFrameElement: any, position: any, enablingPredicateFunction: any)` | 704 | ✍ Inserts a page frame into the menu's page list (clamped position, appended by default), indexes it by class, stores its root element and optional enabling predicate, and hides it. Does not touch the paging component. Returns the root element and the final position. |
| `TabbedMenu:unregisterPage(pageFrameClass: table) → boolean, table, table, table` | 731 | ✍ Removes the page registered for a frame class from the menu's tables. Returns found flag, controller, root and tab. Note: the tab is never looked up, so the returned tab is always nil, and an entry is not removed from pagingElement. |
| `TabbedMenu:addPage(pageFrameElement: any, position: any, tabIconFilename: any, tabIconUVs: any, enablingPredicateFunction: any)` | 780 | ✍ Adds a page at runtime: registers it, creates its header tab from an icon file and UVs, and adds it to the paging element under its title (root title or the l10n key ui_<name>). Lasts until the game restarts or the page is removed. |
| `TabbedMenu:removePage(pageFrameClass: table)` | 804 | ✍ Removes a page by class and deletes it with its children, but only disables built-in pages (those in defaultPageElementIDs, UNVERIFIED where it is filled). Note: unregisterPage returns a nil tab, so the pageTab:delete() call would fail for non-default pages. |
| `TabbedMenu:setPageEnabled(pageFrameClass: table, isEnabled: boolean)` | 829 | ✍ Enables or disables a page by controller class: updates the paging element, the controller's own disabled state, the persistent disabled list and its tab. Survives reset(); undo it by hand. |
| `TabbedMenu:makeSelfCallback(func: any)` | 853 | ✍ Returns a closure that calls func with this menu as first argument followed by any call arguments. |
