---@meta
-- FS25 1.25.1.0 : gui/elements/ColorPickButtonElement.lua (generated stub, FS25 Lua Atlas)

--- Button used in the color picker, derived from ButtonElement. It fills with a color, draws a rectangular selection frame when selected or focused, and overlays a glossy, metallic or matte material icon. Works with the ColorPickerDialog.MATERIAL_* constants (defined elsewhere). Client-side GUI.
---@class ColorPickButtonElement : ButtonElement
ColorPickButtonElement = {}

--- Constructor: default frame thickness and white frame color, material glossy, and creates three scaled overlays (`gui.glossyBig`, `gui.metallicBig`, `gui.matteBig`) through `g_overlayManager`.
---@param target any
---@param custom_mt any
function ColorPickButtonElement.new(target, custom_mt) end

--- Reads `selectionFrameThickness` and `selectionFrameColor` from the XML node after the parent button attributes.
---@param xmlFile any
---@param key any
function ColorPickButtonElement:loadFromXML(xmlFile, key) end

--- Reads the selection frame thickness and color from a GUI profile after the parent attributes.
---@param profile any
---@param applyProfile any
function ColorPickButtonElement:loadProfile(profile, applyProfile) end

--- Copies frame thickness, frame color and material from a source element. The icon overlays are not copied (each element creates its own).
---@param src any
function ColorPickButtonElement:copyAttributes(src) end

--- Forces the overlay color of every state to white (normal, selected, focused, disabled at alpha 1, highlighted at alpha 0.5) so the actual color can be applied separately.
function ColorPickButtonElement:onGuiSetupFinished() end

--- Deletes the three material icon overlays and then runs the parent delete.
function ColorPickButtonElement:delete() end

--- Draws the pixel-aligned overlay, inset by 7 pixels with four filled-rect frame edges when selected or focused, optional debug outline, then the icon matching `self.material`. Icon positioning is not set here (UNVERIFIED).
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function ColorPickButtonElement:draw(clipX1, clipY1, clipX2, clipY2) end
