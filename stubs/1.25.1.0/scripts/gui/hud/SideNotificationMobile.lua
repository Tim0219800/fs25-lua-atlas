---@meta
-- FS25 1.25.1.0 : gui/hud/SideNotificationMobile.lua (generated stub, FS25 Lua Atlas)

--- Mobile variant of SideNotification (extends SideNotification) anchored to the top-right corner with its own background color, position and size constants. It only overrides construction and background helpers; applyValues is not defined in this file (UNVERIFIED).
---@class SideNotificationMobile : SideNotification
SideNotificationMobile = {}

--- Creates the mobile notification display with UI scale 1 and its background color, then calls applyValues.
---@return table
function SideNotificationMobile.new() end

--- Returns the top-right corner position plus the configured offset scaled by uiScale.
---@param uiScale number
function SideNotificationMobile.getBackgroundPosition(uiScale) end

--- Creates an image-less overlay at the top-right position with the configured size. Note: declared with a colon although it does not use self.
function SideNotificationMobile:createBackground() end
