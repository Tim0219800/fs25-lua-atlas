# gui/elements/DynamicFadedBitmapElement.lua

*[Version française](../../../fr/scripts/gui/elements/DynamicFadedBitmapElement.md)*

Source: `dataS/scripts/gui/elements/DynamicFadedBitmapElement.lua` — FS25 1.25.1.0

✍ DynamicFadedBitmapElement is a PictureElement that cross-fades between a list of images. Settings come from XML attributes or profile values (fadeTime, fadeInterval, imageFilenames separated by semicolons). The methods buildOverlays and the update of fadeAlpha/currentImageIndex are not present in this dump (blank region), so the actual timing logic is UNVERIFIED.

- **DynamicFadedBitmapElement** inherits from `PictureElement` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `DynamicFadedBitmapElement.new(target: any, custom_mt: any)` | 19 | ✍ Constructor. Initialises fadeTime 2500, fadeInterval 10000, empty filename and overlay lists, image index 1 and fade alpha 0. |
| `DynamicFadedBitmapElement:delete()` | 38 | ✍ Frees every overlay and the template overlay through GuiOverlay, then calls the parent delete. |
| `DynamicFadedBitmapElement:loadFromXML(xmlFile: any, key: any)` | 49 | ✍ Reads the fadeTime and fadeInterval attributes (integers) and loads and creates the template overlay from the XML node. |
| `DynamicFadedBitmapElement:loadProfile(profile: any, applyProfile: any)` | 61 | ✍ Reads fadeTime and fadeInterval from the profile, reloads the template overlay (recreated only if its file names changed) and, if imageFilenames is set, splits it on ';' and rebuilds the overlays. |
| `DynamicFadedBitmapElement:copyAttributes(src: any)` | 83 | ✍ Copies the template overlay, filename list and fade timings from a source element, then rebuilds the overlays. |
| `DynamicFadedBitmapElement:setAlpha(alpha: any)` | 97 | ✍ Sets the element alpha through the parent and keeps a copy used as the base opacity when drawing the fading images. |
| `DynamicFadedBitmapElement:setImageFilenames(filenames: any)` | 104 | ✍ Replaces the list of image files and rebuilds the overlays (buildOverlays is not in the dump: UNVERIFIED). |
| `DynamicFadedBitmapElement:setImagesUVs(uvs: any)` | 111 | ✍ Stores the UV table for the images and rebuilds the overlays. |
| `DynamicFadedBitmapElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 147 | ✍ Draws the current image fully, then the next one (wrapping around) with a smoothstep alpha derived from fadeAlpha, fadeTime and fadeInterval, multiplied by the element alpha. Assumes at least one filename. |
| `DynamicFadedBitmapElement:canReceiveFocus()` | 169 | ✍ Returns true only if the element is visible, has child elements and every child can itself receive focus. |
| `DynamicFadedBitmapElement:getFocusTarget()` | 184 | ✍ Returns the first child element as focus target if there is one, otherwise the element itself. |
