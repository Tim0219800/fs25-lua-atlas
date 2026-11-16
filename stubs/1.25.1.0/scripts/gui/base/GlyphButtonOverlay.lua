---@meta
-- FS25 1.25.1.0 : gui/base/GlyphButtonOverlay.lua (generated stub, FS25 Lua Atlas)

--- Minimal subclass of ButtonOverlay used for gamepad button glyph icons. The file defines only a constructor and adds no behaviour of its own; everything else comes from ButtonOverlay (defined elsewhere).
---@class GlyphButtonOverlay : ButtonOverlay
GlyphButtonOverlay = {}

--- Creates a GlyphButtonOverlay by calling ButtonOverlay.new. Note: the customMt argument is ignored and the class metatable is always passed to the parent constructor, so subclassing through it does not work.
---@param customMt table?
---@return GlyphButtonOverlay
function GlyphButtonOverlay.new(customMt) end
