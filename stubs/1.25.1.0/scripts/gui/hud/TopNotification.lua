---@meta
-- FS25 1.25.1.0 : gui/hud/TopNotification.lua (generated stub, FS25 Lua Atlas)

---@class TopNotification : HUDDisplay
TopNotification = {}

function TopNotification.new() end

function TopNotification:storeScaledValues() end

---@param title string
---@param text string
---@param info string
---@param iconFilename string?
---@param duration integer?
function TopNotification:setNotification(title, text, info, iconFilename, duration) end
