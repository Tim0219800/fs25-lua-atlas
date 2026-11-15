---@meta
-- FS25 1.25.1.0 : gui/elements/TabbedMenuFrameElement.lua (generated stub, FS25 Lua Atlas)

---@class TabbedMenuFrameElement : FrameElement
TabbedMenuFrameElement = {}

---@param target any
---@param customMt any
function TabbedMenuFrameElement.new(target, customMt) end

function TabbedMenuFrameElement:initialize(...) end

function TabbedMenuFrameElement:getHasCustomMenuButtons() end

---@return table
function TabbedMenuFrameElement:getMenuButtonInfo() end

---@param menuButtonInfo table?
function TabbedMenuFrameElement:setMenuButtonInfo(menuButtonInfo) end

function TabbedMenuFrameElement:setMenuButtonInfoDirty() end

function TabbedMenuFrameElement:isMenuButtonInfoDirty() end

function TabbedMenuFrameElement:clearMenuButtonInfoDirty() end

function TabbedMenuFrameElement:getMainElementSize() end

function TabbedMenuFrameElement:getMainElementPosition() end

---@param callback any
function TabbedMenuFrameElement:requestClose(callback) end

function TabbedMenuFrameElement:onFrameOpen() end

function TabbedMenuFrameElement:onFrameClose() end

---@param title any
function TabbedMenuFrameElement:setTitle(title) end
