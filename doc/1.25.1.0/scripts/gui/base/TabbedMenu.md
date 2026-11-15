# gui/base/TabbedMenu.lua

Source: `dataS/scripts/gui/base/TabbedMenu.lua` — FS25 1.25.1.0

- **TabbedMenu** inherits from `ScreenElement` (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `TabbedMenu.new(target: any, custom_mt: any)` | 42 |  |
| `TabbedMenu:delete()` | 78 |  |
| `TabbedMenu:onGuiSetupFinished()` | 86 |  |
| `TabbedMenu:exitMenu()` | 100 |  |
| `TabbedMenu:reset()` | 106 |  |
| `TabbedMenu:onOpen(element: any)` | 118 |  |
| `TabbedMenu:onClose(element: any)` | 156 |  |
| `TabbedMenu:update(dt: any)` | 187 |  |
| `TabbedMenu:setupMenuButtonInfo()` | 215 |  |
| `TabbedMenu:addPageTab(frameController: any, iconFilename: any, iconUVs: any, iconSliceId: any, soundId: any)` | 221 |  |
| `TabbedMenu:onPageClicked(oldPage: any)` | 244 |  |
| `TabbedMenu:setPageTabEnabled(pageController: any, isEnabled: any, blockListReload: any)` | 249 |  |
| `TabbedMenu:rebuildTabList()` | 259 |  |
| `TabbedMenu:updatePages()` | 300 |  |
| `TabbedMenu:clearMenuButtonActions()` | 318 |  |
| `TabbedMenu:assignMenuButtonInfo(menuButtonInfo: any)` | 331 |  |
| `TabbedMenu:setPageSelectorTitles()` | 417 |  |
| `TabbedMenu:goToPage(page: any, muteSound: any)` | 430 |  |
| `TabbedMenu:updatePagingVisibility(visible: any)` | 444 |  |
| `TabbedMenu:onMenuActionClick(menuActionName: any) → boolean` | 455 |  |
| `TabbedMenu:onClickOk()` | 466 |  |
| `TabbedMenu:onClickBack()` | 474 |  |
| `TabbedMenu:onClickCancel()` | 490 |  |
| `TabbedMenu:onClickActivate()` | 502 |  |
| `TabbedMenu:onClickMenuExtra1()` | 514 |  |
| `TabbedMenu:onClickMenuExtra2()` | 526 |  |
| `TabbedMenu:onClickPageSelection(state: any)` | 537 |  |
| `TabbedMenu:onPagePrevious()` | 551 |  |
| `TabbedMenu:onPageNext()` | 565 |  |
| `TabbedMenu:onPageChange(pageIndex: any, pageMappingIndex: any, element: any, skipTabVisualUpdate: any)` | 579 |  |
| `TabbedMenu:updateButtonsPanel(page: any)` | 618 |  |
| `TabbedMenu:getPageButtonInfo(page: any)` | 664 |  |
| `TabbedMenu:onPageUpdate()` | 678 |  |
| `TabbedMenu:onButtonBack()` | 683 |  |
| `TabbedMenu:onMenuOpened()` | 689 |  |
| `TabbedMenu:registerPage(pageFrameElement: any, position: any, enablingPredicateFunction: any)` | 704 |  |
| `TabbedMenu:unregisterPage(pageFrameClass: table) → boolean, table, table, table` | 731 |  |
| `TabbedMenu:addPage(pageFrameElement: any, position: any, tabIconFilename: any, tabIconUVs: any, enablingPredicateFunction: any)` | 780 |  |
| `TabbedMenu:removePage(pageFrameClass: table)` | 804 |  |
| `TabbedMenu:setPageEnabled(pageFrameClass: table, isEnabled: boolean)` | 829 |  |
| `TabbedMenu:makeSelfCallback(func: any)` | 853 |  |
