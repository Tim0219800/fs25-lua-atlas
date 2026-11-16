---@meta
-- FS25 1.25.1.0 : gui/base/GuiOverlay.lua (generated stub, FS25 Lua Atlas)

--- Static helper table (no instances) that builds and renders GUI overlays held as plain tables. It reads filenames, UVs, slices, colors, rotation and mask data per state (normal, focused, pressed, etc.) from XML attributes or from a GuiProfile, creates the engine overlay handles, and draws them with clipping and masking. State constants and suffix tables (OVERLAY_STATE_SUFFIXES, STATE_*) are defined outside the visible bodies (UNVERIFIED).
---@class GuiOverlay
GuiOverlay = {}

--- Fills an overlay table from an XML file/key or, if none, from a profile: filenames, UVs, colors and SDF width for the given overlay name. Sets default UVs, white color and a black preview image; returns nil if no filename results.
---@param self table
---@param overlay table
---@param overlayName string
---@param imageSize table
---@param profile table?
---@param xmlFile integer?
---@param key string?
---@return table
function GuiOverlay.loadOverlay(self, overlay, overlayName, imageSize, profile, xmlFile, key) end

--- Reads per-state UVs from XML attributes, either from a slice id resolved by g_overlayManager (with optional rotation and X inversion) or from a UV string converted with the image size.
---@param xmlFile integer
---@param key string
---@param overlay table
---@param overlayName string
---@param imageSize table
function GuiOverlay.loadXMLUVs(xmlFile, key, overlay, overlayName, imageSize) end

--- Same as loadXMLUVs but reads from a profile, and also supports Y inversion. Warns when a profile from the base UI file still uses raw UV strings instead of slices.
---@param profile table
---@param overlay table
---@param overlayName string
---@param imageSize table
function GuiOverlay.loadProfileUVs(profile, overlay, overlayName, imageSize) end

--- Reads per-state colors (gradient arrays allowed), plus rotation in degrees (stored in radians) and the web-overlay flag, from XML attributes.
---@param xmlFile integer
---@param key string
---@param overlay table
---@param overlayName string
function GuiOverlay.loadXMLColors(xmlFile, key, overlay, overlayName) end

--- Reads per-state colors, rotation (degrees, stored as radians) and the web-overlay flag from a profile.
---@param profile table
---@param overlay table
---@param overlayName string
function GuiOverlay.loadProfileColors(profile, overlay, overlayName) end

--- Reads per-state image, preview and mask filenames from XML attributes and resolves each through resolveFilename.
---@param xmlFile integer
---@param key string
---@param overlay table
---@param overlayName string
function GuiOverlay.loadXMLFilenames(xmlFile, key, overlay, overlayName) end

--- Reads per-state image, preview and mask filenames from a profile and resolves each through resolveFilename.
---@param profile table
---@param overlay table
---@param overlayName string
function GuiOverlay.loadProfileFilenames(profile, overlay, overlayName) end

--- Maps the names g_baseUIFilename, g_baseHUDFilename and g_iconsUIFilename to their real global values and replaces $l10nSuffix with g_languageSuffix.
---@param filename string
---@return string
function GuiOverlay.resolveFilename(filename) end

--- Creates the engine overlay for the table's filename (web overlay when flagged and the path starts with http), plus state overlays and SDF width. Returns early if already created for that file; otherwise deletes old handles first and defaults rotation 0 and alpha 1.
---@param overlay table
---@param filename string?
---@return table
function GuiOverlay.createOverlay(overlay, filename) end

--- Creates image overlays for non-normal states that have their own filename, and mask textures for any state with a mask filename. Note: a state without a filename leaves imageOverlay nil, which is then compared with 0 and stored as nil.
---@param overlay table
function GuiOverlay.createStateOverlays(overlay) end

--- Copies the parameters (filenames, UVs, colors, alpha, SDF width, slice id) from a source table into another and creates a fresh engine overlay; handles are not shared. An optional filename overrides the target's.
---@param overlay table
---@param overlaySrc table
---@param overrideFilename string?
---@return table
function GuiOverlay.copyOverlay(overlay, overlaySrc, overrideFilename) end

--- Deletes the state overlays and mask textures and clears their fields, releasing the image handles. Does nothing for nil.
---@param overlay table
function GuiOverlay.deleteOverlay(overlay) end

--- Returns the color table for a state, falling back to the base color (pressed falls back to focused first).
---@param overlay table
---@param state integer
---@return Color
function GuiOverlay.getOverlayColor(overlay, state) end

--- Returns the UV table for a state, falling back to the base UVs when that state has none.
---@param overlay Overlay
---@param state integer
---@return table
function GuiOverlay.getOverlayUVs(overlay, state) end

--- Returns the engine overlay handle for a state; pressed falls back to the focused one, and anything missing falls back to the base overlay.
---@param overlay table
---@param currentState integer
---@return table
function GuiOverlay.getOverlay(overlay, currentState) end

--- Returns the mask texture handle for a state, with the same pressed-to-focused fallback, then the base mask. Despite the doc wording it returns a mask, not the image overlay.
---@param overlay table
---@param currentState integer
---@return table
function GuiOverlay.getMaskOverlay(overlay, currentState) end

--- Draws the overlay for a state at the given position and size, applying rotation, optional clip rectangle (UVs are cropped to match), optional 2D mask and per-corner or single color multiplied by overlay.alpha. Skips fully transparent colors and empty clips.
---@param overlay table
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
---@param state integer
---@param clipX1 number?
---@param clipY1 number?
---@param clipX2 number?
---@param clipY2 number?
---@param maskPosX number?
---@param maskPosY number?
---@param maskSizeX number?
---@param maskSizeY number?
function GuiOverlay.renderOverlay(overlay, posX, posY, sizeX, sizeY, state, clipX1, clipY1, clipX2, clipY2, maskPosX, maskPosY, maskSizeX, maskSizeY) end

--- Copies the color table references of every state from a source overlay (shared, not cloned).
---@param overlay table
---@param source table
function GuiOverlay.copyColors(overlay, source) end

--- Sets the engine overlay rotation around a pivot and marks the overlay as having a custom rotation, so renderOverlay stops resetting it. Only works once the engine overlay exists.
---@param overlay table
---@param rotation number
---@param centerX number
---@param centerY number
function GuiOverlay.setRotation(overlay, rotation, centerX, centerY) end

--- Replaces the base color with a new RGBA table.
---@param overlay table
---@param r number
---@param g number
---@param b number
---@param a number
function GuiOverlay.setColor(overlay, r, g, b, a) end

--- Replaces the selected-state color with a new RGBA table.
---@param overlay table
---@param r number
---@param g number
---@param b number
---@param a number
function GuiOverlay.setSelectedColor(overlay, r, g, b, a) end
