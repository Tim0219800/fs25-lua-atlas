---@meta
-- FS25 1.25.1.0 : gui/elements/TextBackdropElement.lua (generated stub, FS25 Lua Atlas)

--- Bitmap element (derived from BitmapElement) meant to size itself around a child text element, with a four-value padding (left, top, right, bottom) read from the XML attribute or profile key padding. This file only handles loading and copying the padding; the resizing logic is not in it (UNVERIFIED).
---@class TextBackdropElement : BitmapElement
TextBackdropElement = {}

--- Constructor. Sets the padding to zero on all four sides.
---@param target any
---@param custom_mt any
function TextBackdropElement.new(target, custom_mt) end

--- Loads the padding attribute from the XML node as normalised screen values after the parent class, keeping the current padding as default.
---@param xmlFile any
---@param key any
function TextBackdropElement:loadFromXML(xmlFile, key) end

--- Loads the padding value from the GUI profile as normalised screen values, keeping the current padding as default.
---@param profile any
---@param applyProfile any
function TextBackdropElement:loadProfile(profile, applyProfile) end

--- Copies parent attributes and clones the padding table from the source.
---@param src any
function TextBackdropElement:copyAttributes(src) end
