---@meta
-- FS25 1.25.1.0 : gui/elements/PlatformIconElement.lua (generated stub, FS25 Lua Atlas)

--- Bitmap element that shows the icon of a gaming platform (identified by a PlatformId) by selecting an image slice. On PS5, Xbox Series and Microsoft Store builds only the icon of the same platform is shown; others fall back to a generic slice. The PlatformId, SLICES and ALLOW_COLOR_CHANGE tables are defined elsewhere (UNVERIFIED).
---@class PlatformIconElement : BitmapElement
PlatformIconElement = {}

--- Constructor. Builds a BitmapElement and returns it with no extra fields.
---@param target any
---@param custom_mt any
function PlatformIconElement.new(target, custom_mt) end

--- Deletes the element by calling the parent delete; no extra cleanup.
function PlatformIconElement:delete() end

--- Copies the platformId from a source element after the base copy.
---@param src any
function PlatformIconElement:copyAttributes(src) end

--- Selects the icon slice for a platform id, replacing it with 0 (generic) when the current platform only allows its own icon. Backs up and neutralizes the selected color for platforms not allowing color change. Note: the source comment mentions a terrain layer, which looks like a copy-paste leftover.
---@param platformId any
function PlatformIconElement:setPlatformId(platformId) end
