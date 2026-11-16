# gui/base/GuiOverlay.lua

*[Version française](../../../fr/scripts/gui/base/GuiOverlay.md)*

Source: `dataS/scripts/gui/base/GuiOverlay.lua` — FS25 1.25.1.0

✍ Static helper table (no instances) that builds and renders GUI overlays held as plain tables. It reads filenames, UVs, slices, colors, rotation and mask data per state (normal, focused, pressed, etc.) from XML attributes or from a GuiProfile, creates the engine overlay handles, and draws them with clipping and masking. State constants and suffix tables (OVERLAY_STATE_SUFFIXES, STATE_*) are defined outside the visible bodies (UNVERIFIED).

- **GuiOverlay** (l.9)

## Functions

| Function | Line | Description |
|---|---|---|
| `GuiOverlay.loadOverlay(self: table, overlay: table, overlayName: string, imageSize: table, profile: table?, xmlFile: integer?, key: string?) → table` | 37 | ✍ Fills an overlay table from an XML file/key or, if none, from a profile: filenames, UVs, colors and SDF width for the given overlay name. Sets default UVs, white color and a black preview image; returns nil if no filename results. |
| `GuiOverlay.loadXMLUVs(xmlFile: integer, key: string, overlay: table, overlayName: string, imageSize: table)` | 78 | ✍ Reads per-state UVs from XML attributes, either from a slice id resolved by g_overlayManager (with optional rotation and X inversion) or from a UV string converted with the image size. |
| `GuiOverlay.loadProfileUVs(profile: table, overlay: table, overlayName: string, imageSize: table)` | 115 | ✍ Same as loadXMLUVs but reads from a profile, and also supports Y inversion. Warns when a profile from the base UI file still uses raw UV strings instead of slices. |
| `GuiOverlay.loadXMLColors(xmlFile: integer, key: string, overlay: table, overlayName: string)` | 158 | ✍ Reads per-state colors (gradient arrays allowed), plus rotation in degrees (stored in radians) and the web-overlay flag, from XML attributes. |
| `GuiOverlay.loadProfileColors(profile: table, overlay: table, overlayName: string)` | 183 | ✍ Reads per-state colors, rotation (degrees, stored as radians) and the web-overlay flag from a profile. |
| `GuiOverlay.loadXMLFilenames(xmlFile: integer, key: string, overlay: table, overlayName: string)` | 209 | ✍ Reads per-state image, preview and mask filenames from XML attributes and resolves each through resolveFilename. |
| `GuiOverlay.loadProfileFilenames(profile: table, overlay: table, overlayName: string)` | 240 | ✍ Reads per-state image, preview and mask filenames from a profile and resolves each through resolveFilename. |
| `GuiOverlay.resolveFilename(filename: string) → string` | 270 | ✍ Maps the names g_baseUIFilename, g_baseHUDFilename and g_iconsUIFilename to their real global values and replaces $l10nSuffix with g_languageSuffix. |
| `GuiOverlay.createOverlay(overlay: table, filename: string?) → table` | 291 | ✍ Creates the engine overlay for the table's filename (web overlay when flagged and the path starts with http), plus state overlays and SDF width. Returns early if already created for that file; otherwise deletes old handles first and defaults rotation 0 and alpha 1. |
| `GuiOverlay.createStateOverlays(overlay: table)` | 331 | ✍ Creates image overlays for non-normal states that have their own filename, and mask textures for any state with a mask filename. Note: a state without a filename leaves imageOverlay nil, which is then compared with 0 and stored as nil. |
| `GuiOverlay.copyOverlay(overlay: table, overlaySrc: table, overrideFilename: string?) → table` | 364 | ✍ Copies the parameters (filenames, UVs, colors, alpha, SDF width, slice id) from a source table into another and creates a fresh engine overlay; handles are not shared. An optional filename overrides the target's. |
| `GuiOverlay.deleteOverlay(overlay: table)` | 387 | ✍ Deletes the state overlays and mask textures and clears their fields, releasing the image handles. Does nothing for nil. |
| `GuiOverlay.getOverlayColor(overlay: table, state: integer) → Color` | 408 | ✍ Returns the color table for a state, falling back to the base color (pressed falls back to focused first). |
| `GuiOverlay.getOverlayUVs(overlay: Overlay, state: integer) → table` | 438 | ✍ Returns the UV table for a state, falling back to the base UVs when that state has none. |
| `GuiOverlay.getOverlay(overlay: table, currentState: integer) → table` | 465 | ✍ Returns the engine overlay handle for a state; pressed falls back to the focused one, and anything missing falls back to the base overlay. |
| `GuiOverlay.getMaskOverlay(overlay: table, currentState: integer) → table` | 492 | ✍ Returns the mask texture handle for a state, with the same pressed-to-focused fallback, then the base mask. Despite the doc wording it returns a mask, not the image overlay. |
| `GuiOverlay.renderOverlay(overlay: table, posX: number, posY: number, sizeX: number, sizeY: number, state: integer, clipX1: number?, clipY1: number?, clipX2: number?, clipY2: number?, maskPosX: number?, maskPosY: number?, maskSizeX: number?, maskSizeY: number?)` | 530 | ✍ Draws the overlay for a state at the given position and size, applying rotation, optional clip rectangle (UVs are cropped to match), optional 2D mask and per-corner or single color multiplied by overlay.alpha. Skips fully transparent colors and empty clips. |
| `GuiOverlay.copyColors(overlay: table, source: table)` | 626 | ✍ Copies the color table references of every state from a source overlay (shared, not cloned). |
| `GuiOverlay.setRotation(overlay: table, rotation: number, centerX: number, centerY: number)` | 641 | ✍ Sets the engine overlay rotation around a pivot and marks the overlay as having a custom rotation, so renderOverlay stops resetting it. Only works once the engine overlay exists. |
| `GuiOverlay.setColor(overlay: table, r: number, g: number, b: number, a: number)` | 655 | ✍ Replaces the base color with a new RGBA table. |
| `GuiOverlay.setSelectedColor(overlay: table, r: number, g: number, b: number, a: number)` | 666 | ✍ Replaces the selected-state color with a new RGBA table. |
