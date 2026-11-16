---@meta
-- FS25 1.25.1.0 : gui/elements/InputGlyphElementUI.lua (generated stub, FS25 Lua Atlas)

--- InputGlyphElementUI is a GuiElement that wraps an input glyph element to show the key or button bound to one or two input actions. XML or profile keys: glyphColor, buttonGlyphColor, glyphBackgroundColor, isLeftAligned, inputAction, inputAction2 (names must exist in InputAction). buildGlyph and the glyph element class are defined elsewhere: UNVERIFIED.
---@class InputGlyphElementUI : GuiElement
InputGlyphElementUI = {}

--- Constructor. Sets default glyph colors (white, dark background), left alignment off and an empty action name list.
---@param target any
---@param custom_mt any
function InputGlyphElementUI.new(target, custom_mt) end

--- Deletes the inner glyph element if any, then calls the parent delete.
function InputGlyphElementUI:delete() end

--- Reads colors and alignment, builds the glyph and, if inputAction (and optionally inputAction2) is a known InputAction, stores and applies the actions. Otherwise reapplies actions already set by a profile.
---@param xmlFile any
---@param key any
function InputGlyphElementUI:loadFromXML(xmlFile, key) end

--- Reads colors, alignment and the inputAction/inputAction2 values from the profile and builds the glyph. Actions are only stored, not applied yet. Note: the fallback passed to getValue is self.inputActionName, a field never set in this file.
---@param profile any
---@param applyProfile any
function InputGlyphElementUI:loadProfile(profile, applyProfile) end

--- Copies colors, alignment and action names from a source; if the source had a glyph, builds one and applies the actions.
---@param src any
function InputGlyphElementUI:copyAttributes(src) end

--- Draws the element through the parent, then draws the inner glyph element within the given clip rectangle.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function InputGlyphElementUI:draw(clipX1, clipY1, clipX2, clipY2) end

--- Forwards the actions, optional text, text size, modifier flag and custom binding to the glyph, then resizes this element to the glyph width and invalidates the parent layout.
---@param actions any
---@param actionText any
---@param actionTextSize any
---@param noModifiers any
---@param customBinding any
function InputGlyphElementUI:setActions(actions, actionText, actionTextSize, noModifiers, customBinding) end
