---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableManureHeap.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for a manure heap: it creates a LoadingStation and a ManureHeap storage object, registers them with the mission storage system, and optionally requires placement near a barn. Handles network streaming, savegame delegation to the ManureHeap object, shop capacity spec and info HUD fill level. ManureHeap, LoadingStation and the storage system are used but their code is not part of this file.
---@class PlaceableManureHeap
PlaceableManureHeap = {}

--- Always returns true: no prerequisite specialization is required.
---@param specializations table
---@return boolean
function PlaceableManureHeap.prerequisitesPresent(specializations) end

--- Overrides setOwnerFarmId, collectPickObjects, getCanBePlacedAt and updateInfo on the placeable type.
---@param placeableType any
function PlaceableManureHeap.registerOverwrittenFunctions(placeableType) end

--- Subscribes to onLoad, onDelete, onFinalizePlacement, onReadStream and onWriteStream.
---@param placeableType any
function PlaceableManureHeap.registerEventListeners(placeableType) end

--- Declares the manureHeap XML keys: those of ManureHeap, the needsBarn flag (schema default true) and the nested loadingStation keys.
---@param schema any
---@param basePath any
function PlaceableManureHeap.registerXMLPaths(schema, basePath) end

--- Registers the savegame XML keys by delegating to ManureHeap.registerSavegameXMLPaths.
---@param schema any
---@param basePath any
function PlaceableManureHeap.registerSavegameXMLPaths(schema, basePath) end

--- Registers the shop spec type manureHeapCapacity (capacity icon, placeable species) with its load and display callbacks.
function PlaceableManureHeap.initSpecialization() end

--- Creates and loads the loading station, then the ManureHeap, and reads needsBarn from the XML. Returns false (and frees the station) if the loading station fails to load. Note: it passes spec.isServer to ManureHeap.new, a field not set in this file, and needsBarn defaults to false here while the schema default is true.
---@param savegame table
function PlaceableManureHeap:onLoad(savegame) end

--- Removes the heap from the storage system and from its loading/unloading stations, deletes it, then unregisters and deletes the loading station (including from the manure loading station list when manure is supported).
function PlaceableManureHeap:onDelete() end

--- Registers the loading station and heap as network objects, adds them to the storage system with the owner farm, and links the heap and nearby storage extensions to extendable loading and unloading stations in range.
function PlaceableManureHeap:onFinalizePlacement() end

--- Client side on join: reads the object ids and stream data of the loading station and the heap, then finishes their client registration.
---@param streamId any
---@param connection any
function PlaceableManureHeap:onReadStream(streamId, connection) end

--- Server side on join: writes the object ids and stream data of the loading station and the heap and registers both objects in the connection stream.
---@param streamId any
---@param connection any
function PlaceableManureHeap:onWriteStream(streamId, connection) end

--- Savegame loading: forwards to the ManureHeap object if it exists.
---@param xmlFile any
---@param key any
function PlaceableManureHeap:loadFromXMLFile(xmlFile, key) end

--- Savegame saving: forwards to the ManureHeap object if it exists.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableManureHeap:saveToXMLFile(xmlFile, key, usedModNames) end

--- Override: calls the parent, then on the server sets the heap's owner and re-links storage extensions and extendable loading/unloading stations in range for the new farm.
---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableManureHeap:setOwnerFarmId(superFunc, farmId, noEventSend) end

--- Override: skips the loading-station load trigger nodes and the heap's activation trigger so they are not added as pickable objects; other nodes go to the parent.
---@param superFunc any
---@param node any
function PlaceableManureHeap:collectPickObjects(superFunc, node) end

--- Override: refuses placement if there is no heap, or if needsBarn is set and no extendable unloading station of the farm is in range (returns false plus a warning text); otherwise defers to the parent.
---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param farmId any
function PlaceableManureHeap:getCanBePlacedAt(superFunc, x, y, z, farmId) end

--- Override: after the parent, appends a line to the info table showing the manure heap fill level in liters.
---@param superFunc any
---@param infoTable any
function PlaceableManureHeap:updateInfo(superFunc, infoTable) end

--- Reads the manureHeap capacity value from the placeable XML for the shop spec.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function PlaceableManureHeap.loadSpecValueCapacity(xmlFile, customEnvironment, baseDir) end

--- Returns the capacity formatted as a volume string for the shop, or nil if the store item has none.
---@param storeItem any
---@param realItem any
function PlaceableManureHeap.getSpecValueCapacity(storeItem, realItem) end
