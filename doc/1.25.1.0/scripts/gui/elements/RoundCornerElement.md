# gui/elements/RoundCornerElement.lua

*[Version française](../../../fr/scripts/gui/elements/RoundCornerElement.md)*

Source: `dataS/scripts/gui/elements/RoundCornerElement.lua` — FS25 1.25.1.0

✍ GUI element that draws a filled rectangle with rounded corners in a state-dependent color (normal, disabled, pressed, selected, focused, highlighted). It extends GuiElement and is used for rounded backgrounds and sliders, for example created by MultiTextOptionElement default profiles. Corner size is in units where 1 equals 20 px according to the source.

- **RoundCornerElement** inherits from `GuiElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `RoundCornerElement.new(target: any, custom_mt: any)` | 18 | ✍ Constructor. Creates the element with opaque white as base color and a corner size of 1. |
| `RoundCornerElement:loadFromXML(xmlFile: any, key: any)` | 30 | ✍ Loads the base element, then reads the color attributes (color, colorDisabled, colorHighlighted, colorSelected, colorFocused, colorPressed) and cornerSize from the XML. |
| `RoundCornerElement:loadProfile(profile: any, applyProfile: any)` | 68 | ✍ Loads the base profile, then the six colors as gradient-capable color arrays and cornerSize (converted to a number) from the profile. |
| `RoundCornerElement:copyAttributes(src: any)` | 106 | ✍ Copies the base color and any state colors defined on the source (as new tables), plus the corner size. |
| `RoundCornerElement:getColor()` | 132 | ✍ Returns the color for the current state, checked in the order disabled, pressed, selected, focused, highlighted; falls back to the base color when that state color is not defined. |
| `RoundCornerElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 151 | ✍ Draws a rounded filled rectangle at the absolute position and size with the state color and clip bounds, then runs the parent draw (children). |
