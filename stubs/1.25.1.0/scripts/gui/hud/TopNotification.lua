---@meta
-- FS25 1.25.1.0 : gui/hud/TopNotification.lua (generated stub, FS25 Lua Atlas)

--- HUD element (HUDDisplay subclass) showing a framed notification at the top centre of the screen with a title, text, info line and optional icon. Only one notification is held at a time; a new one replaces the current one. Rendering code is not defined in this file apart from the setters shown.
---@class TopNotification : HUDDisplay
TopNotification = {}

--- Creates the display with an empty, invalid current notification and the left/middle/right background overlays tinted with the HUD background colour. Also prepares an icon cache.
function TopNotification.new() end

--- Recomputes scaled sizes, offsets and the anchor position (screen centre, top anchor) for the current UI scale.
function TopNotification:storeScaledValues() end

--- Replaces the current notification: title and text are converted to uppercase, the icon is loaded once per filename and cached, and the duration defaults to TopNotification.DEFAULT_DURATION when nil. Marks the notification valid.
---@param title string
---@param text string
---@param info string
---@param iconFilename string?
---@param duration integer?
function TopNotification:setNotification(title, text, info, iconFilename, duration) end
