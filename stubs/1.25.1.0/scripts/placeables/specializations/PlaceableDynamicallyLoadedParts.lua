---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableDynamicallyLoadedParts.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that loads extra parts from external i3d files at load time and links them into the placeable. Per part, the XML gives the file, source node, link node, position, rotation, a shader parameter and object changes; skinned meshes are validated so a mesh and its bones are always linked together, which avoids an engine crash.
---@class PlaceableDynamicallyLoadedParts
PlaceableDynamicallyLoadedParts = {}

--- Always returns true: no prerequisite specializations.
---@param specializations table
---@return boolean
function PlaceableDynamicallyLoadedParts.prerequisitesPresent(specializations) end

--- Registers `onDynamicallyPartI3DLoaded`, the async load callback.
---@param placeableType any
function PlaceableDynamicallyLoadedParts.registerFunctions(placeableType) end

--- Subscribes to `onLoad`, `onDelete` and `onFinalizePlacement`; no `onFinalizePlacement` body appears in the dump (UNVERIFIED).
---@param placeableType any
function PlaceableDynamicallyLoadedParts.registerEventListeners(placeableType) end

--- Declares `dynamicallyLoadedParts.dynamicallyLoadedPart(?)` keys: `filename`, `node`, `linkNode`, `position`, `rotationNode`, `rotation`, `shaderParameterName`, `shaderParameter`, plus object-change keys.
---@param schema any
---@param basePath any
function PlaceableDynamicallyLoadedParts.registerXMLPaths(schema, basePath) end

--- For each part with a filename, creates a loading task and requests the shared i3d asynchronously (callback `onDynamicallyPartI3DLoaded`); warns about parts without a filename.
---@param savegame table
function PlaceableDynamicallyLoadedParts:onLoad(savegame) end

--- Async callback: finds the node, rejects the part if skinned shapes and their bones are not all included, then removes it from physics, applies position, rotation, shader parameter and object changes, links it under the link node and records it. Always finishes the loading task; returns true on success, false otherwise.
---@param i3dNode any
---@param failedReason any
---@param args any
function PlaceableDynamicallyLoadedParts:onDynamicallyPartI3DLoaded(i3dNode, failedReason, args) end

--- Releases the shared i3d load requests and deletes the nodes of all loaded parts.
function PlaceableDynamicallyLoadedParts:onDelete() end
