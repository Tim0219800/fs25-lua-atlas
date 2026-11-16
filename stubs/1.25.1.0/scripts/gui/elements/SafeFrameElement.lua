---@meta
-- FS25 1.25.1.0 : gui/elements/SafeFrameElement.lua (generated stub, FS25 Lua Atlas)

--- Minimal GUI element that fills the whole screen with opaque black. It is meant as a backdrop behind some screens so the game does not show through when the UI is shifted by safe-frame margins. It extends GuiElement and is named safeFrame.
---@class SafeFrameElement : GuiElement
SafeFrameElement = {}

--- Constructor. Creates a GuiElement and sets its name to "safeFrame".
---@param target any
---@param custom_mt any
function SafeFrameElement.new(target, custom_mt) end

--- Draws a black rectangle covering the whole normalized screen (0,0 to 1,1). It ignores clip bounds and does not draw children.
function SafeFrameElement:draw() end
