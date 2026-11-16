---@meta
-- FS25 1.25.1.0 : gui/hud/GamePausedDisplay.lua (generated stub, FS25 Lua Atlas)

--- Full-width HUD banner showing a pause text over a dark strip at the screen centre, optionally over a splash background. Derived from HUDDisplay. The default text is the hard-coded German word for paused, changeable with setPauseText.
---@class GamePausedDisplay : HUDDisplay
GamePausedDisplay = {}

--- Constructor. Creates the splash background overlay and sets the default uppercase pause text. Note: it calls SideNotification:superClass().new instead of its own superclass, which looks like a copy-paste slip.
---@return table
function GamePausedDisplay.new() end

--- Centres the banner on screen and computes its height (75 px scaled), text size and text offset.
function GamePausedDisplay:storeScaledValues() end

--- When visible, optionally renders the background, then draws a translucent black strip across the screen and the bold centred pause text.
---@param drawBackground any
function GamePausedDisplay:draw(drawBackground) end

--- Replaces the pause text, converted to uppercase.
---@param text any
function GamePausedDisplay:setPauseText(text) end
