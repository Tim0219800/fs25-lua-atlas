---@meta
-- FS25 1.25.1.0 : gui/base/StatusBar.lua (generated stub, FS25 Lua Atlas)

--- Simple horizontal progress bar drawn from plain-colour overlays: a background, a value fill and an optional marker. The value is a fraction between 0 and 1. Pure rendering helper with no event handling.
---@class StatusBar
StatusBar = {}

--- Creates a bar at x, y with the given size, background colour and value colour (colour tables are unpacked). A markerSize table {w, h} adds a marker overlay centred on the fill edge. Starts at value 0.
---@param x any
---@param y any
---@param width any
---@param height any
---@param bgColor any
---@param valueColor any
---@param markerSize any
---@param custom_mt any
function StatusBar.new(x, y, width, height, bgColor, valueColor, markerSize, custom_mt) end

--- Deletes the background, value and marker overlays that exist.
function StatusBar:delete() end

--- Sets the disabled flag; while disabled only the background is rendered.
---@param isDisabled any
function StatusBar:setDisabled(isDisabled) end

--- Moves the bar and its overlays to x, y, keeping the marker vertically centred on the bar. Note: the marker goes to the bar's left edge, not the current value position, until setValue is called again.
---@param x any
---@param y any
function StatusBar:setPosition(x, y) end

--- Sets the colour of the value fill and of the marker; the background keeps its colour.
---@param r any
---@param g any
---@param b any
---@param a any
function StatusBar:setColor(r, g, b, a) end

--- Stores the value clamped to 0..1 and resizes the fill and moves the marker. Note: the overlay width and marker use the unclamped newValue, so out-of-range inputs draw outside the bar.
---@param newValue any
function StatusBar:setValue(newValue) end

--- Draws the background, then the fill and marker unless the bar is disabled.
function StatusBar:render() end
