---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableWardrobe.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for a wardrobe where players change their character. A player trigger adds a WardrobeActivatable for the local player when the wardrobe is free for all or belongs to the player farm. The free-for-all flag is saved and sent to joining clients.
---@class PlaceableWardrobe
PlaceableWardrobe = {}

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function PlaceableWardrobe.prerequisitesPresent(specializations) end

--- Registers `wardrobeTriggerCallback` on the placeable type.
---@param placeableType any
function PlaceableWardrobe.registerFunctions(placeableType) end

--- Subscribes to onLoad, onDelete, onReadStream and onWriteStream (savegame load/save are handled by the standard placeable hooks, UNVERIFIED).
---@param placeableType any
function PlaceableWardrobe.registerEventListeners(placeableType) end

--- Declares the wardrobe XML keys (trigger node and `#isFreeForAll`).
---@param schema any
---@param basePath any
function PlaceableWardrobe.registerXMLPaths(schema, basePath) end

--- Declares the savegame attribute `#isFreeForAll`.
---@param schema any
---@param basePath any
function PlaceableWardrobe.registerSavegameXMLPaths(schema, basePath) end

--- Creates the activatable, reads `placeable.wardrobe#triggerNode` (warning if it lacks the player collision bit) and registers the trigger, then reads `#isFreeForAll` (default false).
---@param savegame table
function PlaceableWardrobe:onLoad(savegame) end

--- Restores `#isFreeForAll` from the savegame when present.
---@param xmlFile any
---@param key any
function PlaceableWardrobe:loadFromXMLFile(xmlFile, key) end

--- Writes `#isFreeForAll` to the savegame.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableWardrobe:saveToXMLFile(xmlFile, key, usedModNames) end

--- Removes the activatable from the activatable system and removes the trigger.
function PlaceableWardrobe:onDelete() end

--- Client side on join: reads the free-for-all boolean.
---@param streamId integer
---@param connection Connection
function PlaceableWardrobe:onReadStream(streamId, connection) end

--- Server side on join: writes the free-for-all boolean.
---@param streamId integer
---@param connection Connection
function PlaceableWardrobe:onWriteStream(streamId, connection) end

--- Trigger callback: when the local player enters or leaves, and the wardrobe is free for all or owned by the player farm, adds or removes the activatable. Other actors are ignored.
---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function PlaceableWardrobe:wardrobeTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end
