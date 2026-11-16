# gui/base/TabbedMenuWithDetails.lua

*[Version française](../../../fr/scripts/gui/base/TabbedMenuWithDetails.md)*

Source: `dataS/scripts/gui/base/TabbedMenuWithDetails.lua` — FS25 1.25.1.0

✍ TabbedMenu extension where each tab keeps a stack of frames: a root page plus detail pages pushed on top, with back navigation popping them. Detail pages are regular pages in the paging element that get enabled and disabled as they are pushed and popped. A developer note in the source describes a known bug with the page index and mapping index when invisible pages sit between tabs.

- **TabbedMenuWithDetails** inherits from `TabbedMenu` (l.22)

## Functions

| Function | Line | Description |
|---|---|---|
| `TabbedMenuWithDetails.new(target: any, custom_mt: any)` | 26 | ✍ Creates the menu through TabbedMenu.new and adds an empty table of stacks, keyed by page index. |
| `TabbedMenuWithDetails:reset()` | 36 | ✍ Resets the base menu state and discards all detail stacks. |
| `TabbedMenuWithDetails:getIsDetailMode()` | 44 | ✍ Returns true when the current tab shows a detail page instead of its root. |
| `TabbedMenuWithDetails:exitMenu()` | 50 | ✍ Pops all details back to the root, then exits the menu through the parent class. |
| `TabbedMenuWithDetails:onOpen(element: any)` | 59 | ✍ Replaces TabbedMenu:onOpen on purpose, skipping its code to avoid a doubled blur and extra sounds. At root it refreshes pages and restores the saved page; otherwise it reopens the top detail frame and its buttons. |
| `TabbedMenuWithDetails:onPageClicked(oldPage: any)` | 96 | ✍ When a tab is clicked, pops the whole detail stack back to the root. |
| `TabbedMenuWithDetails:onDetailClosed(detailPage: any)` | 102 | ✍ Empty hook called after a detail page is closed; subclasses override it. |
| `TabbedMenuWithDetails:onDetailOpened(detailPage: any)` | 107 | ✍ Empty hook called after a detail page is opened; subclasses override it. |
| `TabbedMenuWithDetails:onButtonBack()` | 112 | ✍ Back button: exits the menu when at root, otherwise closes the top detail. |
| `TabbedMenuWithDetails:onPageChange(pageIndex: any, pageMappingIndex: any, element: any, skipTabVisualUpdate: any)` | 122 | ✍ Paging callback. During a detail push or pop it skips the tab visual update; for a normal page change it first pops the stack to root. Then calls the base implementation. |
| `TabbedMenuWithDetails:getStack(page: any)` | 139 | ✍ Returns the frame stack of the given page, or of the current tab, creating it with a root entry if absent. Entries hold the page, plus pageId and isRoot for the root. |
| `TabbedMenuWithDetails:isAtRoot()` | 164 | ✍ Returns true when the current tab's stack holds only the root page. |
| `TabbedMenuWithDetails:getTopFrame()` | 170 | ✍ Returns the page at the top of the current tab's stack. |
| `TabbedMenuWithDetails:setPageDisabled(page: any, disabled: any)` | 177 | ✍ Sets the disabled flag of a page in the paging element, looked up by its element. |
| `TabbedMenuWithDetails:pushDetail(detailPage: any)` | 185 | ✍ Pushes a detail page on the current stack and shows it. A detail already on top is hidden, closed and disabled first (onDetailClosed). The new page is enabled, selected with sounds suppressed, and onDetailOpened is called. |
| `TabbedMenuWithDetails:popDetail()` | 222 | ✍ Removes the top detail, closes and disables it (onDetailClosed), then reopens the detail below or selects the root page. Note: at root it logs an error and returns without resetting isChangingDetail, which stays true. |
| `TabbedMenuWithDetails:popToRoot()` | 268 | ✍ Pops details one by one until only the root remains; does nothing if already there. |
| `TabbedMenuWithDetails:replaceDetail(detailPage: any)` | 281 | ✍ Pops the current detail then pushes the given one, keeping the stack depth and so the back behaviour. Fails like popDetail when called at root. |
| `TabbedMenuWithDetails:getBreadcrumbs(page: any)` | 299 | ✍ Returns an array of page titles (empty string when none) for the stack of the given or current page, from root to top. |
