# gui/elements/InputGlyphElementUI.lua

*[Version française](../../../fr/scripts/gui/elements/InputGlyphElementUI.md)*

Source: `dataS/scripts/gui/elements/InputGlyphElementUI.lua` — FS25 1.25.1.0

✍ InputGlyphElementUI is a GuiElement that wraps an input glyph element to show the key or button bound to one or two input actions. XML or profile keys: glyphColor, buttonGlyphColor, glyphBackgroundColor, isLeftAligned, inputAction, inputAction2 (names must exist in InputAction). buildGlyph and the glyph element class are defined elsewhere: UNVERIFIED.

- **InputGlyphElementUI** inherits from `GuiElement` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `InputGlyphElementUI.new(target: any, custom_mt: any)` | 19 | ✍ Constructor. Sets default glyph colors (white, dark background), left alignment off and an empty action name list. |
| `InputGlyphElementUI:delete()` | 34 | ✍ Deletes the inner glyph element if any, then calls the parent delete. |
| `InputGlyphElementUI:loadFromXML(xmlFile: any, key: any)` | 45 | ✍ Reads colors and alignment, builds the glyph and, if inputAction (and optionally inputAction2) is a known InputAction, stores and applies the actions. Otherwise reapplies actions already set by a profile. |
| `InputGlyphElementUI:loadProfile(profile: any, applyProfile: any)` | 77 | ✍ Reads colors, alignment and the inputAction/inputAction2 values from the profile and builds the glyph. Actions are only stored, not applied yet. Note: the fallback passed to getValue is self.inputActionName, a field never set in this file. |
| `InputGlyphElementUI:copyAttributes(src: any)` | 104 | ✍ Copies colors, alignment and action names from a source; if the source had a glyph, builds one and applies the actions. |
| `InputGlyphElementUI:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 155 | ✍ Draws the element through the parent, then draws the inner glyph element within the given clip rectangle. |
| `InputGlyphElementUI:setActions(actions: any, actionText: any, actionTextSize: any, noModifiers: any, customBinding: any)` | 165 | ✍ Forwards the actions, optional text, text size, modifier flag and custom binding to the glyph, then resizes this element to the glyph width and invalidates the parent layout. |
