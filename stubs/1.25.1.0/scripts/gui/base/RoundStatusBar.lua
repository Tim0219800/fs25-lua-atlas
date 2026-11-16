---@meta
-- FS25 1.25.1.0 : gui/base/RoundStatusBar.lua (generated stub, FS25 Lua Atlas)

--- Circular (ring) progress bar built from several slice overlays: two half-ring backgrounds, two half-ring value overlays rotated according to the value, an optional front overlay and an optional marker at the progress tip. Overlays are created through `g_overlayManager`. Client-side HUD element.
---@class RoundStatusBar
RoundStatusBar = {}

--- Creates the bar from slice ids, position, sizes, radius, and colors, then sets the value to 0. Note: `overlayFront` is never assigned (the front overlay is stored as `overlayBackground`) and the marker uses the value slice id, not the marker slice id.
---@param frontSliceId any
---@param valueSliceId any
---@param markerSliceId any
---@param x any
---@param y any
---@param width any
---@param height any
---@param valueWidth any
---@param valueHeight any
---@param radius any
---@param color any
---@param bgColor any
---@param valueColor any
---@param markerSize any
---@param custom_mt any
function RoundStatusBar.new(frontSliceId, valueSliceId, markerSliceId, x, y, width, height, valueWidth, valueHeight, radius, color, bgColor, valueColor, markerSize, custom_mt) end

--- Deletes the front, background, value and marker overlays that exist. Note: because the front overlay is stored as `overlayBackground`, it is never deleted.
function RoundStatusBar:delete() end

--- Moves the bar (nil keeps a coordinate) and repositions the ring overlays with their centering offset and the front overlay if `overlayFront` exists. The marker is not moved here.
---@param x any
---@param y any
function RoundStatusBar:setPosition(x, y) end

--- Clamps the value to 0..1, rotates the value and background half rings accordingly and places the marker on the ellipse defined by `radius`.
---@param newValue any
function RoundStatusBar:setValue(newValue) end

--- Draws the layers in order, depending on whether the value is above one half: backgrounds, value halves, then the front overlay and the marker when present.
function RoundStatusBar:render() end
