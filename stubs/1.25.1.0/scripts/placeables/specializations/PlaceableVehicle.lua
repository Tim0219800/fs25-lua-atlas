---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableVehicle.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for a building-menu entry that only spawns vehicles. On the server (or the constructing client in preview) it loads the vehicles listed under `placeable.placeableVehicle.vehicle` and parks them on link nodes; when placement is final the server detaches them, adds them to physics and registers them. The placeable itself is then deleted instead of being registered.
---@class PlaceableVehicle
PlaceableVehicle = {}

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function PlaceableVehicle.prerequisitesPresent(specializations) end

--- Registers `onFinishLoadingVehicle` on the placeable type.
---@param vehicleType any
function PlaceableVehicle.registerFunctions(vehicleType) end

--- Overrides `collectPickObjects` and `register` on the placeable type.
---@param placeableType any
function PlaceableVehicle.registerOverwrittenFunctions(placeableType) end

--- Subscribes to onLoad, onFinalizePlacement and onDelete.
---@param placeableType any
function PlaceableVehicle.registerEventListeners(placeableType) end

--- Declares the per-vehicle XML keys (`#xmlFilename` and `#linkNode`) under `placeable.placeableVehicle.vehicle`. The exact key list comes from the registration lines, partly UNVERIFIED.
---@param schema any
---@param basePath any
function PlaceableVehicle.registerXMLPaths(schema, basePath) end

--- Server or construction-preview client only: for each vehicle entry with a filename and link node, starts an asynchronous vehicle load at the node pose, as a shop-config preview or an owned unregistered vehicle, tied to a loading task.
---@param savegame table
function PlaceableVehicle:onLoad(savegame) end

--- Load callback: if the placeable is being deleted it deletes the loaded vehicles; otherwise it removes them from physics, sets the farm owner and links their components to the link node. Logs an error on failure, and always finishes the loading task.
---@param vehicles any
---@param vehicleLoadState any
---@param vehicleData any
function PlaceableVehicle:onFinishLoadingVehicle(vehicles, vehicleLoadState, vehicleData) end

--- Server only, and not with an icon generator: moves vehicle components back to the root node keeping their world pose, adds the vehicles to physics and registers them, then clears the pending list.
function PlaceableVehicle:onFinalizePlacement() end

--- Deletes any vehicle still held in the pending list (those never released at placement).
function PlaceableVehicle:onDelete() end

--- Overrides registration: outside construction preview, the placeable deletes itself, so it is never synchronized to clients; only the spawned vehicles remain.
---@param alreadySent any
function PlaceableVehicle:register(alreadySent) end

--- Skips a node that is one of the vehicle link nodes (returns without calling the parent), so those nodes are not collected as pick objects; other nodes go to the parent function.
---@param superFunc any
---@param node any
function PlaceableVehicle:collectPickObjects(superFunc, node) end
