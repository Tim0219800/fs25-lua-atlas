---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryFood.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that manages the food stock of a husbandry. It requires `PlaceableHusbandryAnimals`, keeps one fill level per supported fill type (from the animal food groups and mixtures of `animalFoodSystem`), shows it with a dynamic fill plane and a food plane, and exposes unload triggers as feeding troughs. It computes the hourly consumption from the clusters, consumes food in `updateFeeding`, registers feeding places in the engine husbandry and syncs fill levels over the network (server authoritative).
---@class PlaceableHusbandryFood
PlaceableHusbandryFood = {}

--- Returns true only if `PlaceableHusbandryAnimals` is present.
---@param specializations table
---@return boolean
function PlaceableHusbandryFood.prerequisitesPresent(specializations) end

--- Registers the food methods (fill planes, food places, add/remove food, totals, capacity, liters per hour) on the placeable type. `getAvailableFood` and `getFoodLitersPerHour` have no body in the SDK dump.
---@param placeableType any
function PlaceableHusbandryFood.registerFunctions(placeableType) end

--- Registers overrides of `updateInfo`, `updateFeeding`, `getFoodInfos`, `collectPickObjects` and `getAnimalDescription`.
---@param placeableType any
function PlaceableHusbandryFood.registerOverwrittenFunctions(placeableType) end

--- Subscribes to the load, delete, placement, stream and update-stream events, plus `onHusbandryAnimalsUpdate` and `onHusbandryAnimalsCreated`.
---@param placeableType any
function PlaceableHusbandryFood.registerEventListeners(placeableType) end

--- Registers the XML keys under `husbandry.food`: trough capacity, food places, dynamic food plane, food plane and the unload trigger paths.
---@param schema any
---@param basePath any
function PlaceableHusbandryFood.registerXMLPaths(schema, basePath) end

--- Registers the savegame keys `fillLevel(?)#fillType` and `#fillLevel`.
---@param schema any
---@param basePath any
function PlaceableHusbandryFood.registerSavegameXMLPaths(schema, basePath) end

--- Adds the `animalFoodFillTypes` store spec (fill type icons in the shop list).
function PlaceableHusbandryFood.initSpecialization() end

--- Initializes the food state, reads the capacity (default 5000), creates the feeding trough unload triggers (error state if none), the optional dynamic food plane and food plane with default fill types, and the food places.
---@param savegame any
function PlaceableHusbandryFood:onLoad(savegame) end

--- Reads the animal type and builds the supported fill types from the animal food groups and the food mixtures of the animal food system, with each group fill level starting at 0.
function PlaceableHusbandryFood:onPostLoad() end

--- Deletes the feeding trough triggers, the dynamic food plane node and the food plane.
function PlaceableHusbandryFood:onDelete() end

--- Registers each feeding trough trigger as a network object.
function PlaceableHusbandryFood:onFinalizePlacement() end

--- Refreshes the food fill planes once placement is finished.
function PlaceableHusbandryFood:onPostFinalizePlacement() end

--- Network read: reads the fill level of each fill type, then each trough trigger's object id and stream data, and finishes its client registration.
---@param streamId any
---@param connection any
function PlaceableHusbandryFood:onReadStream(streamId, connection) end

--- Network write: writes the fill level of each fill type, then each trough trigger's object id and stream data, registering it in the connection.
---@param streamId any
---@param connection any
function PlaceableHusbandryFood:onWriteStream(streamId, connection) end

--- Client side update read: reads the optional fill position, then the optional fill levels and applies each difference via `addFood` or `removeFood`. Ignored if the connection is not from the server.
---@param streamId any
---@param timestamp any
---@param connection any
function PlaceableHusbandryFood:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side update write: sends the last fill position and the fill levels when their dirty flags are set. Does nothing when called for the server connection.
---@param streamId any
---@param connection any
---@param dirtyMask any
function PlaceableHusbandryFood:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Reads the saved `fillLevel` entries and adds each amount via `addFood`, only for fill types this husbandry supports.
---@param xmlFile any
---@param key any
function PlaceableHusbandryFood:loadFromXMLFile(xmlFile, key) end

--- Saves every fill type with a level above zero as a `fillLevel` entry (name and amount).
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableHusbandryFood:saveToXMLFile(xmlFile, key, usedModNames) end

--- Override: on the server consumes food through the animal food system for the current hourly need (times the time adjustment), removes the consumed amounts, and returns the parent's factor multiplied by the consumption factor.
---@param superFunc any
function PlaceableHusbandryFood:updateFeeding(superFunc) end

--- Override: appends the total food amount in liters to the info list.
---@param superFunc any
---@param infoTable any
function PlaceableHusbandryFood:updateInfo(superFunc, infoTable) end

--- Override: adds one entry per food group with its title, production weight percentage, summed fill level, capacity and fill ratio.
---@param superFunc any
function PlaceableHusbandryFood:getFoodInfos(superFunc) end

--- Sets the food plane state to total food over capacity (clamped 0 to 1) and, if food is present and a fill type is given, applies that fill type's material to the plane.
---@param fillTypeIndex any
function PlaceableHusbandryFood:updateFillPlanes(fillTypeIndex) end

--- Override: ignores nodes that are the exact-fill root of a feeding trough so they are not collected as pick objects; otherwise defers to the parent.
---@param superFunc any
---@param node any
function PlaceableHusbandryFood:collectPickObjects(superFunc, node) end

--- When the engine husbandry exists, adds each food place as a feeding place (type food) and stores the place index only if it is reachable on the navigation mesh.
---@param husbandryId any
function PlaceableHusbandryFood:onHusbandryAnimalsCreated(husbandryId) end

--- Pushes the current total food level to every accessible feeding place of the engine husbandry.
function PlaceableHusbandryFood:updateFoodPlaces() end

--- Returns the sum of the fill levels of all fill types, in liters.
function PlaceableHusbandryFood:getTotalFood() end

--- Returns the trough capacity.
function PlaceableHusbandryFood:getFoodCapacity() end

--- Returns the capacity minus total food, or 0 if the fill type is not supported (capacity is shared across all fill types).
---@param fillTypeIndex any
function PlaceableHusbandryFood:getFreeFoodCapacity(fillTypeIndex) end

--- Adds food of a fill type, limited by free capacity, and returns the amount actually added (0 if unsupported or full). Mixtures are split into their ingredients by weight; also fills the dynamic plane and flags the network update on the server. Note: the position-change condition mixes `and`/`or` without parentheses, so the second part is evaluated even on a client.
---@param farmId any
---@param deltaFillLevel any
---@param fillTypeIndex any
---@param fillPositionData any
---@param toolType any
---@param extraAttributes any
function PlaceableHusbandryFood:addFood(farmId, deltaFillLevel, fillTypeIndex, fillPositionData, toolType, extraAttributes) end

--- Removes up to the given amount of a fill type (never more than stored), updates the dynamic plane and food places, flags the network update on the server, and returns the amount removed.
---@param absDeltaFillLevel any
---@param fillTypeIndex any
function PlaceableHusbandryFood:removeFood(absDeltaFillLevel, fillTypeIndex) end

--- Recomputes `litersPerHour` from every cluster: the daily food need per animal for its age times the animal count, divided by 24.
---@param clusters any
function PlaceableHusbandryFood:onHusbandryAnimalsUpdate(clusters) end

--- Override: appends the localized percentage description text to the parent's text.
---@param superFunc any
---@param cluster any
function PlaceableHusbandryFood:getAnimalDescription(superFunc, cluster) end

--- Store spec loader: reads the animal type name and whether the husbandry needs a water supply (no automatic water supply). Returns nil if neither node exists.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function PlaceableHusbandryFood.loadSpecValueAnimalFoodFillTypes(xmlFile, customEnvironment, baseDir) end

--- Store spec getter: lists the fill types of the animal type's food groups and mixtures, plus water if needed. Returns nil if the spec or animal type is missing.
---@param storeItem any
---@param realItem any
function PlaceableHusbandryFood.getSpecValueAnimalFoodFillTypes(storeItem, realItem) end
