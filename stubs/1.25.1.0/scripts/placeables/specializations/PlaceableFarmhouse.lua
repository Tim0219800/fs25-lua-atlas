---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableFarmhouse.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that turns a building into a farmhouse: it provides the player spawn node and an optional sleeping trigger with its camera, and lets players sleep there through a FarmhouseActivatable. The building registers itself with the placeable system once finalized, so constructible farmhouses only count after completion. It has no prerequisites.
---@class PlaceableFarmhouse
PlaceableFarmhouse = {}

--- No prerequisite: always returns true.
---@param specializations table
---@return boolean
function PlaceableFarmhouse.prerequisitesPresent(specializations) end

--- Registers the sleeping trigger callback, the sleep camera and spawn getters, and getIsAllowedToSleep (body not in the SDK dump: UNVERIFIED).
---@param placeableType table
function PlaceableFarmhouse.registerFunctions(placeableType) end

--- Overrides finalizeConstruction on the placeable type; the override body is not in the SDK dump (UNVERIFIED).
---@param placeableType table
function PlaceableFarmhouse.registerOverwrittenFunctions(placeableType) end

--- Subscribes to load, delete and finalize-placement events.
---@param placeableType table
function PlaceableFarmhouse.registerEventListeners(placeableType) end

--- Declares farmhouse#spawnNode, farmhouse#isFinalized and the sleeping trigger node, camera node and isFreeForAll flag.
---@param schema XMLSchema
---@param basePath string
function PlaceableFarmhouse.registerXMLPaths(schema, basePath) end

--- Declares the single savegame attribute isFreeForAll.
---@param schema XMLSchema
---@param basePath string
function PlaceableFarmhouse.registerSavegameXMLPaths(schema, basePath) end

--- Creates the activatable, reads the spawn node (logs an error and falls back to the root node if missing) and the sleeping trigger, which gets a callback and a warning if the player collision bit is absent. Adds the sleeping camera when the node really is a camera, and reads isFreeForAll (default false) and isFinalized (default true).
---@param savegame table
function PlaceableFarmhouse:onLoad(savegame) end

--- Overrides isFreeForAll with the saved value when one exists.
---@param xmlFile XMLFile
---@param key string
function PlaceableFarmhouse:loadFromXMLFile(xmlFile, key) end

--- Writes the current isFreeForAll flag to the savegame.
---@param xmlFile XMLFile
---@param key string
---@param usedModNames table
function PlaceableFarmhouse:saveToXMLFile(xmlFile, key, usedModNames) end

--- If the farmhouse is already finalized, registers it as a farmhouse with the placeable system.
function PlaceableFarmhouse:onFinalizePlacement() end

--- Removes the activatable, unregisters the farmhouse from the placeable system, removes the sleeping trigger and drops the sleeping camera from the camera manager.
function PlaceableFarmhouse:onDelete() end

--- Returns the player spawn node, or nil while the farmhouse is not finalized.
---@return integer?
function PlaceableFarmhouse:getSpawnPoint() end

--- Returns the world x, y, z of the spawn node, or nil when not finalized.
function PlaceableFarmhouse:getSpawnWorldPosition() end

--- Returns the sleeping camera node, or nil if none was defined.
---@return integer?
function PlaceableFarmhouse:getSleepCamera() end

--- Trigger callback: only for the local player's root node, it adds the sleep activatable on enter and removes it on leave. A commented-out TODO about resetting the player's dog is dead code. Does nothing on a dedicated server (no local player).
---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function PlaceableFarmhouse:farmhouseSleepingTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end
