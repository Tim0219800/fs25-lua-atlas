# gui/elements/ThreePartBitmapElement.lua

*[Version française](../../../fr/scripts/gui/elements/ThreePartBitmapElement.md)*

Source: `dataS/scripts/gui/elements/ThreePartBitmapElement.lua` — FS25 1.25.1.0

✍ Bitmap element drawn in three parts: a start image, a stretched middle image (the element's normal overlay) and an end image. Derived from BitmapElement; it can run horizontally or vertically (isHorizontal). XML keys include startImage*, endImage*, startImageSize, endImageSize and isHorizontal.

- **ThreePartBitmapElement** inherits from `BitmapElement` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `ThreePartBitmapElement.new(target: any, custom_mt: any)` | 19 | ✍ Constructor. Creates the element on BitmapElement with empty start/end overlays, zero part sizes and horizontal layout. |
| `ThreePartBitmapElement:delete()` | 34 | ✍ Deletes the start and end overlays, then calls the parent delete. |
| `ThreePartBitmapElement:loadFromXML(xmlFile: any, key: any)` | 43 | ✍ Loads the start/end overlays, their sizes and isHorizontal from XML, creates the overlays and applies the normal-state colour of the main overlay to both ends. |
| `ThreePartBitmapElement:loadProfile(profile: any, applyProfile: any)` | 62 | ✍ Applies profile values for the start/end images, their sizes and isHorizontal; recreates an overlay only if its image file changed. |
| `ThreePartBitmapElement:copyAttributes(src: any)` | 84 | ✍ Copies part sizes, orientation and both end overlays from a source element. |
| `ThreePartBitmapElement:setImageColor(state: integer, r: number, g: number, b: number, a: number)` | 103 | ✍ Sets the colour for a GuiOverlay state on the main overlay and on both end overlays; nil channels keep their previous value, nil state means the default. |
| `ThreePartBitmapElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 121 | ✍ Renders start, middle and end overlays side by side (or stacked vertically; start at the top) using the current overlay state and clip area. Skips BitmapElement's own draw and calls GuiElement's. |
