---@meta
-- FS25 1.25.1.0 : gui/elements/FrameReferenceElement.lua (generated stub, FS25 Lua Atlas)

--- FrameReferenceElement is a placeholder GuiElement that names a frame to display. It stores the name from the XML attribute ref. Resolution and removal of the placeholder happen in the GUI loading code, which is not in this file: UNVERIFIED.
---@class FrameReferenceElement : GuiElement
FrameReferenceElement = {}

--- Constructor. Creates the element with an empty referencedFrameName.
---@param target any
---@param custom_mt any
function FrameReferenceElement.new(target, custom_mt) end

--- Loads the base attributes and reads the referenced frame name from the ref attribute (empty string if absent).
---@param xmlFile any
---@param key any
function FrameReferenceElement:loadFromXML(xmlFile, key) end

--- Copies base attributes and the referenced frame name from a source element.
---@param src any
function FrameReferenceElement:copyAttributes(src) end
