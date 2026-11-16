---@meta
-- FS25 1.25.1.0 : gui/elements/DynamicFadedBitmapElement.lua (generated stub, FS25 Lua Atlas)

--- DynamicFadedBitmapElement is a PictureElement that cross-fades between a list of images. Settings come from XML attributes or profile values (fadeTime, fadeInterval, imageFilenames separated by semicolons). The methods buildOverlays and the update of fadeAlpha/currentImageIndex are not present in this dump (blank region), so the actual timing logic is UNVERIFIED.
---@class DynamicFadedBitmapElement : PictureElement
DynamicFadedBitmapElement = {}

--- Constructor. Initialises fadeTime 2500, fadeInterval 10000, empty filename and overlay lists, image index 1 and fade alpha 0.
---@param target any
---@param custom_mt any
function DynamicFadedBitmapElement.new(target, custom_mt) end

--- Frees every overlay and the template overlay through GuiOverlay, then calls the parent delete.
function DynamicFadedBitmapElement:delete() end

--- Reads the fadeTime and fadeInterval attributes (integers) and loads and creates the template overlay from the XML node.
---@param xmlFile any
---@param key any
function DynamicFadedBitmapElement:loadFromXML(xmlFile, key) end

--- Reads fadeTime and fadeInterval from the profile, reloads the template overlay (recreated only if its file names changed) and, if imageFilenames is set, splits it on ';' and rebuilds the overlays.
---@param profile any
---@param applyProfile any
function DynamicFadedBitmapElement:loadProfile(profile, applyProfile) end

--- Copies the template overlay, filename list and fade timings from a source element, then rebuilds the overlays.
---@param src any
function DynamicFadedBitmapElement:copyAttributes(src) end

--- Sets the element alpha through the parent and keeps a copy used as the base opacity when drawing the fading images.
---@param alpha any
function DynamicFadedBitmapElement:setAlpha(alpha) end

--- Replaces the list of image files and rebuilds the overlays (buildOverlays is not in the dump: UNVERIFIED).
---@param filenames any
function DynamicFadedBitmapElement:setImageFilenames(filenames) end

--- Stores the UV table for the images and rebuilds the overlays.
---@param uvs any
function DynamicFadedBitmapElement:setImagesUVs(uvs) end

--- Draws the current image fully, then the next one (wrapping around) with a smoothstep alpha derived from fadeAlpha, fadeTime and fadeInterval, multiplied by the element alpha. Assumes at least one filename.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function DynamicFadedBitmapElement:draw(clipX1, clipY1, clipX2, clipY2) end

--- Returns true only if the element is visible, has child elements and every child can itself receive focus.
function DynamicFadedBitmapElement:canReceiveFocus() end

--- Returns the first child element as focus target if there is one, otherwise the element itself.
function DynamicFadedBitmapElement:getFocusTarget() end
