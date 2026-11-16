# gui/elements/PictureElement.lua

*[Version française](../../../fr/scripts/gui/elements/PictureElement.md)*

Source: `dataS/scripts/gui/elements/PictureElement.lua` — FS25 1.25.1.0

✍ Bitmap element that draws its image with a content mode (no scaling, scale to fill, or scale with aspect fit) based on a declared source image size. It extends BitmapElement and replaces its draw. The helper that computes the adjusted rectangle (getAdjustedPosition) and the CONTENT_MODE constants are not in this dump (UNVERIFIED).

- **PictureElement** inherits from `BitmapElement` (l.16)

## Functions

| Function | Line | Description |
|---|---|---|
| `PictureElement.new(target: any, custom_mt: any)` | 31 | ✍ Constructor. Builds a BitmapElement with aspect-fit content mode, a default image size of 2048 by 2048 and aspect ratio 1. |
| `PictureElement:loadFromXML(xmlFile: any, key: any)` | 44 | ✍ Loads the base element, reads the imageSize attribute as normalized screen values and recomputes the aspect ratio. |
| `PictureElement:loadProfile(profile: any, applyProfile: any)` | 53 | ✍ Loads the base profile, then imageSize (with the aspect ratio) and pictureContentMode, which accepts noScaling, scaleToFill or scaleAspectFit; other values leave the mode unchanged. |
| `PictureElement:copyAttributes(src: any)` | 71 | ✍ Copies content mode, aspect ratio and image size from a source element after the base copy. |
| `PictureElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 131 | ✍ Renders the overlay in the adjusted rectangle with the given clip bounds, draws a yellow debug frame when debug is enabled, and skips BitmapElement's draw by calling the grandparent draw directly. |
