# gui/elements/RenderElement.lua

*[Version française](../../../fr/scripts/gui/elements/RenderElement.md)*

Source: `dataS/scripts/gui/elements/RenderElement.lua` — FS25 1.25.1.0

✍ GUI element that loads an i3d scene asynchronously through g_i3DManager and renders it from a chosen camera into a render overlay, which it then draws in the layout (used for 3D previews in menus). It exposes render settings (masks, shadows, bloom, DOF, SSAO, atmosphere quality, super-sampling) and a callback fired when the overlay is ready. The overlay is only re-rendered when flagged dirty. Engine functions such as createRenderOverlay are UNVERIFIED (not in the dump).

- **RenderElement** inherits from `GuiElement` (l.17)

## Functions

| Function | Line | Description |
|---|---|---|
| `RenderElement.new(target: table, custom_mt: table?) → RenderElement` | 26 | ✍ Constructor. Sets defaults: alpha on, shapes mask 255, light mask 67108864 (bit 26 only), no shadows, no bloom, DOF or SSAO, async shader compilation off, atmosphere quality off, render not dirty. |
| `RenderElement:delete()` | 50 | ✍ Destroys the scene and overlay to free resources, then runs the parent delete. |
| `RenderElement:loadFromXML(xmlFile: integer, key: string)` | 60 | ✍ Loads the base element, then reads filename, cameraNode, superSamplingFactor, shapesMask, lightMask, shadow, bloom, DOF, SSAO and async-shader options, and an atmosphereQuality name (warning if invalid), and registers the onRenderLoad callback. |
| `RenderElement:loadProfile(profile: table, applyProfile: boolean)` | 91 | ✍ Loads filename, cameraNode, superSamplingFactor and atmosphereQuality from a profile. Note: the first three are overwritten with nil when the profile lacks them. If applyProfile is true, it destroys and reloads the scene. |
| `RenderElement:copyAttributes(src: table)` | 117 | ✍ Copies filename, camera path, super-sampling factor, atmosphere quality and the render-load callback from a source element. |
| `RenderElement:createScene()` | 130 | ✍ Starts loading the configured scene file and creating the overlay once loaded. Pair with destroyScene to release resources. |
| `RenderElement:destroyScene()` | 136 | ✍ Releases the shared i3d loading request, deletes the render overlay and deletes the scene node, resetting the references to nil. |
| `RenderElement:setScene(i3dFilename: string)` | 156 | ✍ Starts asynchronous loading of the given i3d file and marks the element as loading. Logs an error and does nothing if a scene request already exists; call destroyScene first. |
| `RenderElement:onSceneLoaded(node: integer, failedReason: integer, args: table?)` | 173 | ✍ Load-completion callback. On success it links the scene under the root node, hides it and creates the overlay; on failure it logs an error for file-not-found or unknown reasons and deletes any returned node. |
| `RenderElement:createOverlay()` | 195 | ✍ (Re)creates the render overlay sized to the element on screen times the super-sampling factor, using the camera found by path. Logs errors if the camera or overlay is missing; on success marks it dirty and raises onRenderLoad with scene and overlay. |
| `RenderElement:update(dt: number)` | 237 | ✍ Per-frame update: if flagged dirty and an overlay exists, re-renders the scene into the overlay and clears the flag. |
| `RenderElement:draw(clipX1: number?, clipY1: number?, clipX2: number?, clipY2: number?)` | 252 | ✍ Draws the overlay in the element rectangle when loaded, adjusting UV coordinates to match the clip bounds when clipping is requested, then runs the parent draw. |
| `RenderElement:canReceiveFocus() → boolean` | 305 | ✍ Always returns false: a render element never takes UI focus. |
| `RenderElement:getSceneRoot() → integer` | 312 | ✍ Returns the root node of the loaded scene, or nil if none is loaded. |
| `RenderElement:setRenderDirty()` | 318 | ✍ Flags the overlay so the next update re-renders the scene into it. |
