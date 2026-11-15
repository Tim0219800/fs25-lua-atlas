---@meta
-- FS25 1.25.1.0 : gui/base/TabbedMenu.lua (stub généré, atlas Lua FS25)

---@class TabbedMenu : ScreenElement
TabbedMenu = {}

---@param target any
---@param custom_mt any
function TabbedMenu.new(target, custom_mt) end

function TabbedMenu:delete() end

function TabbedMenu:onGuiSetupFinished() end

function TabbedMenu:exitMenu() end

function TabbedMenu:reset() end

---@param element any
function TabbedMenu:onOpen(element) end

---@param element any
function TabbedMenu:onClose(element) end

---@param dt any
function TabbedMenu:update(dt) end

function TabbedMenu:setupMenuButtonInfo() end

---@param frameController any
---@param iconFilename any
---@param iconUVs any
---@param iconSliceId any
---@param soundId any
function TabbedMenu:addPageTab(frameController, iconFilename, iconUVs, iconSliceId, soundId) end

---@param oldPage any
function TabbedMenu:onPageClicked(oldPage) end

---@param pageController any
---@param isEnabled any
---@param blockListReload any
function TabbedMenu:setPageTabEnabled(pageController, isEnabled, blockListReload) end

function TabbedMenu:rebuildTabList() end

function TabbedMenu:updatePages() end

function TabbedMenu:clearMenuButtonActions() end

---@param menuButtonInfo any
function TabbedMenu:assignMenuButtonInfo(menuButtonInfo) end

function TabbedMenu:setPageSelectorTitles() end

---@param page any
---@param muteSound any
function TabbedMenu:goToPage(page, muteSound) end

---@param visible any
function TabbedMenu:updatePagingVisibility(visible) end

---@param menuActionName any
---@return boolean
function TabbedMenu:onMenuActionClick(menuActionName) end

function TabbedMenu:onClickOk() end

function TabbedMenu:onClickBack() end

function TabbedMenu:onClickCancel() end

function TabbedMenu:onClickActivate() end

function TabbedMenu:onClickMenuExtra1() end

function TabbedMenu:onClickMenuExtra2() end

---@param state any
function TabbedMenu:onClickPageSelection(state) end

function TabbedMenu:onPagePrevious() end

function TabbedMenu:onPageNext() end

---@param pageIndex any
---@param pageMappingIndex any
---@param element any
---@param skipTabVisualUpdate any
function TabbedMenu:onPageChange(pageIndex, pageMappingIndex, element, skipTabVisualUpdate) end

---@param page any
function TabbedMenu:updateButtonsPanel(page) end

---@param page any
function TabbedMenu:getPageButtonInfo(page) end

function TabbedMenu:onPageUpdate() end

function TabbedMenu:onButtonBack() end

function TabbedMenu:onMenuOpened() end

---@param pageFrameElement any
---@param position any
---@param enablingPredicateFunction any
function TabbedMenu:registerPage(pageFrameElement, position, enablingPredicateFunction) end

---@param pageFrameClass table
---@return boolean
---@return table
---@return table
---@return table
function TabbedMenu:unregisterPage(pageFrameClass) end

---@param pageFrameElement any
---@param position any
---@param tabIconFilename any
---@param tabIconUVs any
---@param enablingPredicateFunction any
function TabbedMenu:addPage(pageFrameElement, position, tabIconFilename, tabIconUVs, enablingPredicateFunction) end

---@param pageFrameClass table
function TabbedMenu:removePage(pageFrameClass) end

---@param pageFrameClass table
---@param isEnabled boolean
function TabbedMenu:setPageEnabled(pageFrameClass, isEnabled) end

---@param func any
function TabbedMenu:makeSelfCallback(func) end
