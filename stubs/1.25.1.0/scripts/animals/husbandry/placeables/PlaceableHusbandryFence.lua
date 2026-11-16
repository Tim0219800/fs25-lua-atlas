---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryFence.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization giving a husbandry a fence built from a separate fence XML and i3D file (`Fence` class). Sections in `placeable.husbandry.fence` define default segments from node positions, optionally one customizable last section the player can place by hand, and extra navigation contour nodes. It validates placement (collisions, unowned land) during preview, syncs the fence in network streams, and overrides navigation mesh creation (the body of several registered methods is not in the SDK dump).
---@class PlaceableHusbandryFence
PlaceableHusbandryFence = {}

--- Always returns true: this specialization has no prerequisites.
---@param specializations table
---@return boolean
function PlaceableHusbandryFence.prerequisitesPresent(specializations) end

--- Registers the fence methods (customization, default fence, contour positions, segment deletion rules, loading callbacks) on the placeable type. Several registered methods have no body in the SDK dump.
---@param placeableType any
function PlaceableHusbandryFence.registerFunctions(placeableType) end

--- Registers overrides of `setPreviewPosition`, `getCanBePlacedAt` and `createNavigationMesh`.
---@param placeableType any
function PlaceableHusbandryFence.registerOverwrittenFunctions(placeableType) end

--- Subscribes to `onLoad`, `onDelete`, `onPreFinalizePlacement`, `onPostFinalizePlacement`, `onReadStream` and `onWriteStream`.
---@param placeableType any
function PlaceableHusbandryFence.registerEventListeners(placeableType) end

--- Registers the XML keys under `husbandry.fence`: fence XML filename, sections (segment id, reversed flag, customizable flag, nodes) and additional navigation mesh nodes.
---@param schema XMLSchema
---@param basePath string
function PlaceableHusbandryFence.registerXMLPaths(schema, basePath) end

--- Registers the savegame XML paths under `.fence` by delegating to `Fence.registerSavegameXMLPaths`.
---@param schema any
---@param basePath any
function PlaceableHusbandryFence.registerSavegameXMLPaths(schema, basePath) end

--- Resets customization state, then, unless the icon generator is running, loads the fence XML named in the placeable XML and starts an async load of its i3D file. Returns silently with a warning if the file or its i3D path is missing.
---@param savegame any
function PlaceableHusbandryFence:onLoad(savegame) end

--- Callback of the async i3D load: builds the `Fence`, reads the default sections (each with a valid segment id; a customizable section must be the last) and the navigation contour nodes, and creates the default fence in construction preview. Cleans up the temporary XML and ends the loading task.
---@param i3dNode any
---@param failedReason any
---@param args any
function PlaceableHusbandryFence:onFenceI3DLoaded(i3dNode, failedReason, args) end

--- Frees the temporary fence XML, flags the fence as being deleted, deletes the preview segments and the fence itself, and releases the shared i3D file.
function PlaceableHusbandryFence:onDelete() end

--- Network read: deletes the existing fence segments, reads the fence and per-segment customizable/default flags, finalizes the fence, then reads the customizing flag and hides the default fence if the user is customizing.
---@param streamId any
---@param connection any
function PlaceableHusbandryFence:onReadStream(streamId, connection) end

--- Network write: writes the fence, the per-segment customizable and default flags, and whether the user is customizing.
---@param streamId any
---@param connection any
function PlaceableHusbandryFence:onWriteStream(streamId, connection) end

--- Loads the fence from the `.fence` key of the savegame if it exists.
---@param xmlFile XMLFile
---@param key string
function PlaceableHusbandryFence:loadFromXMLFile(xmlFile, key) end

--- Server only and only for a newly placed (not savegame) placeable: creates the default fence, rebuilds and finalizes each preview segment, then finalizes the fence. Does nothing if no fence was loaded.
function PlaceableHusbandryFence:onPreFinalizePlacement() end

--- Positions each preview segment between its section nodes, rebuilds meshes, checks overlaps and ownership, and sets `spec.fenceErrorMessageKey`. Returns false on a mesh error, collision or unowned land.
---@return boolean
function PlaceableHusbandryFence:updateHusbandryFence() end

--- Override: calls the parent, then updates the fence and stores in `spec.canBePlaced` whether the fence fits at the new preview position.
---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param rotX any
---@param rotY any
---@param rotZ any
function PlaceableHusbandryFence:setPreviewPosition(superFunc, x, y, z, rotX, rotY, rotZ) end

--- Returns whether the XML defined a customizable section (true or nil).
function PlaceableHusbandryFence:getHasCustomizableFence() end

--- Returns the `Fence` object, or nil if none was loaded.
function PlaceableHusbandryFence:getFence() end

--- Override: returns false with the stored fence error text (or a default one) when the fence cannot be placed; otherwise defers to the parent.
---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param farmId any
function PlaceableHusbandryFence:getCanBePlacedAt(superFunc, x, y, z, farmId) end
