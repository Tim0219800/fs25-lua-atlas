---@meta
-- FS25 1.25.1.0 : gui/hud/InfoDisplay.lua (generated stub, FS25 Lua Atlas)

--- Base class of the HUD info panels anchored at the bottom right of the screen (extends HUDDisplay). It holds a list of boxes (InfoDisplayBox) and forwards scale changes to them. The boxes list, totalHeight and isEnabled are filled by subclasses or other code, not here (UNVERIFIED).
---@class InfoDisplay : HUDDisplay
InfoDisplay = {}

--- Applies the UI scale through the parent class, then calls setScale on every box in self.boxes.
---@param uiScale number
function InfoDisplay:setScale(uiScale) end

--- Anchors the display at the HUD's right/bottom anchor and caches a 5 pixel vertical margin between boxes in screen units.
function InfoDisplay:storeScaledValues() end

--- Returns the stored total height when the display is enabled, otherwise 0.
function InfoDisplay:getDisplayHeight() end
