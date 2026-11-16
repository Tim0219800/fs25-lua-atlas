---@meta
-- FS25 1.25.1.0 : gui/elements/RenderElement.lua (generated stub, FS25 Lua Atlas)

--- GUI element that loads an i3d scene asynchronously through g_i3DManager and renders it from a chosen camera into a render overlay, which it then draws in the layout (used for 3D previews in menus). It exposes render settings (masks, shadows, bloom, DOF, SSAO, atmosphere quality, super-sampling) and a callback fired when the overlay is ready. The overlay is only re-rendered when flagged dirty. Engine functions such as createRenderOverlay are UNVERIFIED (not in the dump).
---@class RenderElement : GuiElement
RenderElement = {}

--- Constructor. Sets defaults: alpha on, shapes mask 255, light mask 67108864 (bit 26 only), no shadows, no bloom, DOF or SSAO, async shader compilation off, atmosphere quality off, render not dirty.
---@param target table
---@param custom_mt table?
---@return RenderElement
function RenderElement.new(target, custom_mt) end

--- Destroys the scene and overlay to free resources, then runs the parent delete.
function RenderElement:delete() end

--- Loads the base element, then reads filename, cameraNode, superSamplingFactor, shapesMask, lightMask, shadow, bloom, DOF, SSAO and async-shader options, and an atmosphereQuality name (warning if invalid), and registers the onRenderLoad callback.
---@param xmlFile integer
---@param key string
function RenderElement:loadFromXML(xmlFile, key) end

--- Loads filename, cameraNode, superSamplingFactor and atmosphereQuality from a profile. Note: the first three are overwritten with nil when the profile lacks them. If applyProfile is true, it destroys and reloads the scene.
---@param profile table
---@param applyProfile boolean
function RenderElement:loadProfile(profile, applyProfile) end

--- Copies filename, camera path, super-sampling factor, atmosphere quality and the render-load callback from a source element.
---@param src table
function RenderElement:copyAttributes(src) end

--- Starts loading the configured scene file and creating the overlay once loaded. Pair with destroyScene to release resources.
function RenderElement:createScene() end

--- Releases the shared i3d loading request, deletes the render overlay and deletes the scene node, resetting the references to nil.
function RenderElement:destroyScene() end

--- Starts asynchronous loading of the given i3d file and marks the element as loading. Logs an error and does nothing if a scene request already exists; call destroyScene first.
---@param i3dFilename string
function RenderElement:setScene(i3dFilename) end

--- Load-completion callback. On success it links the scene under the root node, hides it and creates the overlay; on failure it logs an error for file-not-found or unknown reasons and deletes any returned node.
---@param node integer
---@param failedReason integer
---@param args table?
function RenderElement:onSceneLoaded(node, failedReason, args) end

--- (Re)creates the render overlay sized to the element on screen times the super-sampling factor, using the camera found by path. Logs errors if the camera or overlay is missing; on success marks it dirty and raises onRenderLoad with scene and overlay.
function RenderElement:createOverlay() end

--- Per-frame update: if flagged dirty and an overlay exists, re-renders the scene into the overlay and clears the flag.
---@param dt number
function RenderElement:update(dt) end

--- Draws the overlay in the element rectangle when loaded, adjusting UV coordinates to match the clip bounds when clipping is requested, then runs the parent draw.
---@param clipX1 number?
---@param clipY1 number?
---@param clipX2 number?
---@param clipY2 number?
function RenderElement:draw(clipX1, clipY1, clipX2, clipY2) end

--- Always returns false: a render element never takes UI focus.
---@return boolean
function RenderElement:canReceiveFocus() end

--- Returns the root node of the loaded scene, or nil if none is loaded.
---@return integer
function RenderElement:getSceneRoot() end

--- Flags the overlay so the next update re-renders the scene into it.
function RenderElement:setRenderDirty() end
