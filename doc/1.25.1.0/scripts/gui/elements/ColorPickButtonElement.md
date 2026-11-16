# gui/elements/ColorPickButtonElement.lua

*[Version française](../../../fr/scripts/gui/elements/ColorPickButtonElement.md)*

Source: `dataS/scripts/gui/elements/ColorPickButtonElement.lua` — FS25 1.25.1.0

✍ Button used in the color picker, derived from ButtonElement. It fills with a color, draws a rectangular selection frame when selected or focused, and overlays a glossy, metallic or matte material icon. Works with the ColorPickerDialog.MATERIAL_* constants (defined elsewhere). Client-side GUI.

- **ColorPickButtonElement** inherits from `ButtonElement` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `ColorPickButtonElement.new(target: any, custom_mt: any)` | 22 | ✍ Constructor: default frame thickness and white frame color, material glossy, and creates three scaled overlays (`gui.glossyBig`, `gui.metallicBig`, `gui.matteBig`) through `g_overlayManager`. |
| `ColorPickButtonElement:loadFromXML(xmlFile: any, key: any)` | 44 | ✍ Reads `selectionFrameThickness` and `selectionFrameColor` from the XML node after the parent button attributes. |
| `ColorPickButtonElement:loadProfile(profile: any, applyProfile: any)` | 54 | ✍ Reads the selection frame thickness and color from a GUI profile after the parent attributes. |
| `ColorPickButtonElement:copyAttributes(src: any)` | 63 | ✍ Copies frame thickness, frame color and material from a source element. The icon overlays are not copied (each element creates its own). |
| `ColorPickButtonElement:onGuiSetupFinished()` | 74 | ✍ Forces the overlay color of every state to white (normal, selected, focused, disabled at alpha 1, highlighted at alpha 0.5) so the actual color can be applied separately. |
| `ColorPickButtonElement:delete()` | 109 | ✍ Deletes the three material icon overlays and then runs the parent delete. |
| `ColorPickButtonElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 119 | ✍ Draws the pixel-aligned overlay, inset by 7 pixels with four filled-rect frame edges when selected or focused, optional debug outline, then the icon matching `self.material`. Icon positioning is not set here (UNVERIFIED). |
