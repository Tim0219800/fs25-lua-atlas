---@meta
-- FS25 1.25.1.0 : gui/hud/InfoDisplayKeyValueBoxMobile.lua (generated stub, FS25 Lua Atlas)

--- Mobile variant of the key/value info box (extends InfoDisplayBox). It keeps a pool of reusable line tables (cached/active) and draws a rounded translucent black panel with bold key text on the left and value text on the right, truncated with an ellipsis. It must be re-armed every frame with showNextFrame. Client-side only.
---@class InfoDisplayKeyValueBoxMobile : InfoDisplayBox
InfoDisplayKeyValueBoxMobile = {}

--- Creates the box with empty line pools and a vertical offset computed from 160 reference pixels scaled to the current screen height.
---@param infoDisplay any
---@param uiScale any
function InfoDisplayKeyValueBoxMobile.new(infoDisplay, uiScale) end

--- Returns true only if showNextFrame was called since the last draw.
function InfoDisplayKeyValueBoxMobile:canDraw() end

--- Returns the panel height for the active lines (margins plus rows) plus a small label offset.
---@return number
function InfoDisplayKeyValueBoxMobile:getDisplayHeight() end

--- Draws the rounded panel right-aligned inside the safe-frame inset, then the active lines from bottom to top with an optional highlight color. Clears the show-next-frame flag.
---@param posX any
---@param posY any
function InfoDisplayKeyValueBoxMobile:draw(posX, posY) end

--- Moves all active lines back into the cache pool for reuse.
function InfoDisplayKeyValueBoxMobile:clear() end

--- Empty function: the mobile box ignores titles.
---@param title any
function InfoDisplayKeyValueBoxMobile:setTitle(title) end

--- Shrinks the text size in 5 percent steps until the text fits on one line within maxWidth, never below minSize (default half the base size), and returns the size. Not called in this file.
---@param baseSize any
---@param text any
---@param maxWidth any
---@param minSize any
function InfoDisplayKeyValueBoxMobile:textSizeToFit(baseSize, text, maxWidth, minSize) end

--- Appends a key/value line, reusing a cached table when possible; a missing value becomes an empty string. The accentuate flag and optional color highlight the key.
---@param key any
---@param value any
---@param accentuate any
---@param accentuateColor any
function InfoDisplayKeyValueBoxMobile:addLine(key, value, accentuate, accentuateColor) end

--- Marks the box to be drawn on the next frame.
function InfoDisplayKeyValueBoxMobile:showNextFrame() end

--- Stores the UI scale and recomputes scaled values.
---@param uiScale any
function InfoDisplayKeyValueBoxMobile:setScale(uiScale) end

--- Converts reference-pixel constants (box width 500, rows 450x40, margins, text offsets) and HUDElement.TEXT_SIZE.DEFAULT_TEXT_MOBILE to screen units for the current scale.
function InfoDisplayKeyValueBoxMobile:storeScaledValues() end
