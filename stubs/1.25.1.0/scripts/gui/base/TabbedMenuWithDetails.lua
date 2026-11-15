---@meta
-- FS25 1.25.1.0 : gui/base/TabbedMenuWithDetails.lua (generated stub, FS25 Lua Atlas)

---@class TabbedMenuWithDetails : TabbedMenu
TabbedMenuWithDetails = {}

---@param target any
---@param custom_mt any
function TabbedMenuWithDetails.new(target, custom_mt) end

function TabbedMenuWithDetails:reset() end

function TabbedMenuWithDetails:getIsDetailMode() end

function TabbedMenuWithDetails:exitMenu() end

---@param element any
function TabbedMenuWithDetails:onOpen(element) end

---@param oldPage any
function TabbedMenuWithDetails:onPageClicked(oldPage) end

---@param detailPage any
function TabbedMenuWithDetails:onDetailClosed(detailPage) end

---@param detailPage any
function TabbedMenuWithDetails:onDetailOpened(detailPage) end

function TabbedMenuWithDetails:onButtonBack() end

---@param pageIndex any
---@param pageMappingIndex any
---@param element any
---@param skipTabVisualUpdate any
function TabbedMenuWithDetails:onPageChange(pageIndex, pageMappingIndex, element, skipTabVisualUpdate) end

---@param page any
function TabbedMenuWithDetails:getStack(page) end

function TabbedMenuWithDetails:isAtRoot() end

function TabbedMenuWithDetails:getTopFrame() end

---@param page any
---@param disabled any
function TabbedMenuWithDetails:setPageDisabled(page, disabled) end

---@param detailPage any
function TabbedMenuWithDetails:pushDetail(detailPage) end

function TabbedMenuWithDetails:popDetail() end

function TabbedMenuWithDetails:popToRoot() end

---@param detailPage any
function TabbedMenuWithDetails:replaceDetail(detailPage) end

---@param page any
function TabbedMenuWithDetails:getBreadcrumbs(page) end
