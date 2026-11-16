---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableFactory.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for a factory building that consumes configured input fill types over time and, once all are used up, yields a single high-value item (for example a finished machine) sold by the farm. It requires PlaceableSellingStation, reuses its SellingStation, adds a Storage for the inputs, and registers itself as a production-like entry for the production menu. Server drives the progress; clients receive it through the stream. Several methods it registers (updateRemainingAmount, setMeshProgress, createFactoryItem, sellFactoryItem, updateInfo, onUpdate and others) have no body in the SDK dump: UNVERIFIED.
---@class PlaceableFactory
PlaceableFactory = {}

--- Returns true only when the placeable type also has the PlaceableSellingStation specialization.
---@param specializations table
---@return boolean
function PlaceableFactory.prerequisitesPresent(specializations) end

--- Registers the factory methods on the placeable type: mesh loading, remaining amount and progress, item creation and selling, capacity and fill level, buy request, player trigger and info data.
---@param placeableType any
function PlaceableFactory.registerFunctions(placeableType) end

--- Overrides updateInfo and setOwnerFarmId on the placeable type so the factory can add its own info lines and react to ownership changes.
---@param placeableType any
function PlaceableFactory.registerOverwrittenFunctions(placeableType) end

--- Subscribes the specialization to load, delete, update, stream read/write, update-stream, finalize-placement and info-trigger enter/leave events.
---@param placeableType any
function PlaceableFactory.registerEventListeners(placeableType) end

--- Declares the XML paths under factory: player trigger, item (link node, i3d file, reward, progressive-visibility meshes), production inputs and output, selling station, storage and active sound.
---@param schema any
---@param basePath any
function PlaceableFactory.registerXMLPaths(schema, basePath) end

--- Declares the savegame paths: one input entry per fill type with its remaining amount, plus the storage block.
---@param schema any
---@param basePath any
function PlaceableFactory.registerSavegameXMLPaths(schema, basePath) end

--- Loads the item i3d asynchronously, builds the Storage and patches the SellingStation (accepts any good, skips selling while a farm owns it). Parses inputs (amount, usagePerHour converted to per second) and the output into a productions entry, creates the player trigger and the sound.
---@param savegame table
function PlaceableFactory:onLoad(savegame) end

--- Saves each input's fill type and remaining amount, then the storage content, into the savegame.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableFactory:saveToXMLFile(xmlFile, key, usedModNames) end

--- Restores remaining amounts per input by matching fill type names (through updateRemainingAmount), then loads the storage content.
---@param xmlFile any
---@param key any
function PlaceableFactory:loadFromXMLFile(xmlFile, key) end

--- Client side join: reads the storage object id and state, the has-input-materials flag, the compressed progress and each progressive mesh's hide index, applying them with setMeshProgress.
---@param streamId any
---@param connection any
function PlaceableFactory:onReadStream(streamId, connection) end

--- Server side counterpart of onReadStream: writes the storage object id and state, registers it in the stream, then the input flag, the progress and the last value of each progressive mesh.
---@param streamId any
---@param connection any
function PlaceableFactory:onWriteStream(streamId, connection) end

--- Calls the parent, then shows the player trigger only while the factory is unowned. Outside construction preview it re-registers the factory in the production chain and adds or removes its selling station from the economy and storage systems.
---@param superFunc any
---@param farmId any
function PlaceableFactory:setOwnerFarmId(superFunc, farmId) end
