---@meta
-- FS25 1.25.1.0 : gui/elements/RoundCornerElement.lua (generated stub, FS25 Lua Atlas)

--- GUI element that draws a filled rectangle with rounded corners in a state-dependent color (normal, disabled, pressed, selected, focused, highlighted). It extends GuiElement and is used for rounded backgrounds and sliders, for example created by MultiTextOptionElement default profiles. Corner size is in units where 1 equals 20 px according to the source.
---@class RoundCornerElement : GuiElement
RoundCornerElement = {}

--- Constructor. Creates the element with opaque white as base color and a corner size of 1.
---@param target any
---@param custom_mt any
function RoundCornerElement.new(target, custom_mt) end

--- Loads the base element, then reads the color attributes (color, colorDisabled, colorHighlighted, colorSelected, colorFocused, colorPressed) and cornerSize from the XML.
---@param xmlFile any
---@param key any
function RoundCornerElement:loadFromXML(xmlFile, key) end

--- Loads the base profile, then the six colors as gradient-capable color arrays and cornerSize (converted to a number) from the profile.
---@param profile any
---@param applyProfile any
function RoundCornerElement:loadProfile(profile, applyProfile) end

--- Copies the base color and any state colors defined on the source (as new tables), plus the corner size.
---@param src any
function RoundCornerElement:copyAttributes(src) end

--- Returns the color for the current state, checked in the order disabled, pressed, selected, focused, highlighted; falls back to the base color when that state color is not defined.
function RoundCornerElement:getColor() end

--- Draws a rounded filled rectangle at the absolute position and size with the state color and clip bounds, then runs the parent draw (children).
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function RoundCornerElement:draw(clipX1, clipY1, clipX2, clipY2) end
