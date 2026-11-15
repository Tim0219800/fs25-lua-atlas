---@meta
-- FS25 1.25.1.0 : gui/elements/DialogElement.lua (stub généré, atlas Lua FS25)

---@class DialogElement : ScreenElement
DialogElement = {}

---@param target any
---@param custom_mt any
function DialogElement.new(target, custom_mt) end

function DialogElement:close() end

---@param forceBack any
---@param usedMenuButton any
function DialogElement:onClickBack(forceBack, usedMenuButton) end

---@param dialogType any
function DialogElement:setDialogType(dialogType) end

---@param isAllowed any
function DialogElement:setIsCloseAllowed(isAllowed) end
