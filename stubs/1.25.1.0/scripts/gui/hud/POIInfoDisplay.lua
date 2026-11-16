---@meta
-- FS25 1.25.1.0 : gui/hud/POIInfoDisplay.lua (generated stub, FS25 Lua Atlas)

--- Small HUD label at the top-left corner (extends HUDDisplayElement) that shows one line of text, used for points-of-interest info. It draws a rounded background sized to the text width plus offsets. text, offsets and applyValues are set elsewhere (UNVERIFIED). Client-side only.
---@class POIInfoDisplay : HUDDisplayElement
POIInfoDisplay = {}

--- Draws a rounded filled rectangle fitted to the text width plus left/right offsets, then the text, then the parent draw. Does nothing when the text is empty.
function POIInfoDisplay:draw() end

--- Applies the scale through the parent, repositions at the scaled background position and calls applyValues with the scale.
---@param uiScale number
function POIInfoDisplay:setScale(uiScale) end

--- Returns the base position: configured X offset times scale, and Y measured from the top of the screen minus the scaled height.
---@param uiScale any
function POIInfoDisplay.getBackgroundPosition(uiScale) end

--- Creates an image-less overlay with the base position and configured size, used as the positioning frame.
function POIInfoDisplay.createBackground() end
