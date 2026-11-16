---@meta
-- FS25 1.25.1.0 : gui/hud/IngameMessage.lua (generated stub, FS25 Lua Atlas)

--- HUD message dialog (extends HUDDisplay) shown at the bottom center, with a title, text, a list of control rows and a skip (OK) button. The constructor sets up a pending-message queue, button overlays and input-mode tracking. Only construction, scaled layout and drawing are in this file; queue handling, updateControls and drawControl are not defined here (UNVERIFIED where they live). Client-side only.
---@class IngameMessage : HUDDisplay
IngameMessage = {}

--- Creates the message display with empty queue, glyph and keyboard button overlays, the localized button_ok text as skip label, no skip control, not paused, and a next-message timer of -1.
---@param customMt any?
---@return any
function IngameMessage.new(customMt) end

--- Converts the reference-pixel layout (640 wide box, text and title sizes, offsets, control row height, minimum button widths) to screen units, positions the box at the bottom center and calls updateControls.
function IngameMessage:storeScaledValues() end

--- Draws the current message: rounded dark panel sized from title, text and control count, wrapped title and text, a separator line, each control with its text truncated with an ellipsis, and the skip label with its button. Skipped when hidden, when a GUI is visible, or without a message.
function IngameMessage:draw() end
