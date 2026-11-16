---@meta
-- FS25 1.25.1.0 : gui/InGameMenu.lua (generated stub, FS25 Lua Atlas)

--- Main in-game pause menu, derived from TabbedMenu, hosting pages such as settings and help line. Only the two page-navigation handlers are described here. Most of the file is outside the described entries.
---@class InGameMenu : TabbedMenu
InGameMenu = {}

--- Next-page handler. Skips once if a block flag is set; otherwise asks the current page to close and, if it agrees, opens the save screen when leaving settings or help line, then calls TabbedMenu's onPageNext.
function InGameMenu:onPageNext() end

--- Previous-page handler. Asks the current page to close; if it agrees, opens the save screen when leaving settings or help line, then calls TabbedMenu's onPagePrevious. Unlike onPageNext, it has no block flag.
function InGameMenu:onPagePrevious() end
