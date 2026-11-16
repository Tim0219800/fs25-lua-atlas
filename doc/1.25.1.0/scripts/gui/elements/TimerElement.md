# gui/elements/TimerElement.lua

*[Version française](../../../fr/scripts/gui/elements/TimerElement.md)*

Source: `dataS/scripts/gui/elements/TimerElement.lua` — FS25 1.25.1.0

✍ Clock-like circular timer element (value 0 to 1) built from a front image, two background halves, two value halves and a marker that orbits at a given radius. Derived from GuiElement. The source file itself marks it as not in use. Note: timerOffset is never assigned in this file, so draw would fail on it unless set elsewhere (UNVERIFIED).

- **TimerElement** inherits from `GuiElement` (l.21)

## Functions

| Function | Line | Description |
|---|---|---|
| `TimerElement.new(target: any, custom_mt: any)` | 27 | ✍ Constructor. Initialises value 0, unit timer/marker sizes, radius and empty overlays for front, backgrounds, values and marker. |
| `TimerElement:delete()` | 51 | ✍ Deletes all six overlays, then calls the parent delete. |
| `TimerElement:loadFromXML(xmlFile: any, key: any)` | 63 | ✍ Loads the image/bgImage/valueImage/markerImage overlays plus timerSize, markerSize, value and radius from XML, creates the overlays and sets the initial value. |
| `TimerElement:loadProfile(profile: any, applyProfile: any)` | 95 | ✍ Loads the same overlays and the sizes, value and radius from a GUI profile. Does not create the overlays or set UVs here. |
| `TimerElement:copyAttributes(src: any)` | 117 | ✍ Copies sizes, offset, radius, value and all overlays from a source element. Note: it indexes src.timerOffset, which is nil unless assigned elsewhere. |
| `TimerElement:setValue(newValue: any)` | 136 | ✍ Clamps the value to 0..1 and rotates the UVs of the first value and first background overlays so the pie fill matches it. |
| `TimerElement:updateUVs(overlay: any, rotation: any)` | 144 | ✍ Writes the eight UV coordinates of an overlay as a quad rotated by the given angle in radians around its centre. |
| `TimerElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 158 | ✍ Draws the background and value halves according to whether the value is above or below one half, then the front image and the marker placed on an ellipse of the configured radius. |
