---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableAnimatedObjects.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization (`spec_animatedObjects`) that owns a list of `AnimatedObject` instances (doors, gates and similar) loaded from `placeable.animatedObjects`. It supports dependencies between objects based on animation time, registers the objects when placement is finished, syncs them to joining clients, saves them, and keeps their farm owner in step with the placeable. It has no prerequisites.
---@class PlaceableAnimatedObjects
PlaceableAnimatedObjects = {}

--- Prerequisite check; always returns true.
---@param specializations table
---@return boolean
function PlaceableAnimatedObjects.prerequisitesPresent(specializations) end

--- Registers `getCanTriggerAnimatedObject` and `getAnimatedObjectBySaveId` on the placeable type. Note: no `getCanTriggerAnimatedObject` function is defined in this file, so the registered value is nil here (UNVERIFIED if another file supplies it).
---@param placeableType any
function PlaceableAnimatedObjects.registerFunctions(placeableType) end

--- Registers an override of the placeable's `setOwnerFarmId`.
---@param placeableType any
function PlaceableAnimatedObjects.registerOverwrittenFunctions(placeableType) end

--- Subscribes to `onLoad`, `onDelete`, `onReadStream`, `onWriteStream` and `onPostFinalizePlacement`.
---@param placeableType any
function PlaceableAnimatedObjects.registerEventListeners(placeableType) end

--- Registers the `.animatedObjects` schema through `AnimatedObject.registerXMLPaths`, plus per-object `dependency` entries with `animatedObjectIndex`, `minTime` and `maxTime`.
---@param schema any
---@param basePath any
function PlaceableAnimatedObjects.registerXMLPaths(schema, basePath) end

--- Registers the savegame paths of each `animatedObject` by delegating to `AnimatedObject.registerSavegameXMLPaths`.
---@param schema any
---@param basePath any
function PlaceableAnimatedObjects.registerSavegameXMLPaths(schema, basePath) end

--- Creates and loads each `AnimatedObject` with its dependency list, then wraps its `getCanBeTriggered` so it also requires the placeable's `getCanTriggerAnimatedObject` and that each dependency object's animation time lies within its min/max.
---@param savegame table
function PlaceableAnimatedObjects:onLoad(savegame) end

--- Deletes all animated objects and clears the list.
function PlaceableAnimatedObjects:onDelete() end

--- Registers every animated object as a network object and gives it the placeable's owner farm id.
function PlaceableAnimatedObjects:onPostFinalizePlacement() end

--- Client side: for each animated object reads its network object id and state from the stream, then finishes registering it with `g_client`.
---@param streamId any
---@param connection any
function PlaceableAnimatedObjects:onReadStream(streamId, connection) end

--- Server side, when a client joins: writes each animated object's node reference and state to the stream and registers it for that connection.
---@param streamId integer
---@param connection table
function PlaceableAnimatedObjects:onWriteStream(streamId, connection) end

--- Loads each animated object's saved state from the savegame XML under `<key>.animatedObject(i)`.
---@param xmlFile any
---@param key any
function PlaceableAnimatedObjects:loadFromXMLFile(xmlFile, key) end

--- Saves each animated object to the savegame XML under `<key>.animatedObject(i)`, passing the used mod names.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableAnimatedObjects:saveToXMLFile(xmlFile, key, usedModNames) end

--- Returns the animated object whose `saveId` matches, or nil if none does.
---@param saveId string
---@return table?
function PlaceableAnimatedObjects:getAnimatedObjectBySaveId(saveId) end

--- Override: calls the parent function, then sets the same owner farm id on every animated object without sending an event.
---@param superFunc any
---@param ownerFarmId any
---@param noEventSend any
function PlaceableAnimatedObjects:setOwnerFarmId(superFunc, ownerFarmId, noEventSend) end
