---@meta
-- FS25 1.25.1.0 : objects/ProductionPoint.lua (generated stub, FS25 Lua Atlas)

--- Network object (extends Object) for a placeable production point: a set of productions that turn input fill types into output fill types, backed by a storage, an unloading (selling) station, an optional loading station and pallet spawner. In this dump only part of the class has bodies: XML schema registration (including savegame keys), join-time stream sync, loading of the saved state, store spec values, the player interaction trigger, opening the production menu and the purchase request. The production cycle logic, output distribution (setOutputDistributionMode, setProductionState, setProductionStatus) and constants such as OUTPUT_MODE are not in the dump and are UNVERIFIED.
---@class ProductionPoint : Object
ProductionPoint = {}

--- Registers the XML schema of a production point: name, shared throughput flag, each production (id, name, cycles per month/hour/minute, costs while active, inputs and outputs with fillType and amount, sellDirectly, isPrimary), player trigger node, sounds, animation nodes, effect nodes and the sub-sections for selling station, loading station, pallet spawner and storage.
---@param schema any
---@param basePath any
function ProductionPoint.registerXMLPaths(schema, basePath) end

--- Registers the savegame XML keys: pallet spawn cooldown, production costs still to claim, directSellFillType and autoDeliverFillType lists, per-production id and isEnabled, and the storage's savegame paths.
---@param schema any
---@param basePath any
function ProductionPoint.registerSavegameXMLPaths(schema, basePath) end

--- Client join: after the parent readStream, reads the direct-sell and auto-deliver fill types, then the object ids and state of the unloading station, the optional loading station and the storage (finishing their registration), the active productions with status, and the pallet limit flag.
---@param streamId integer
---@param connection table
function ProductionPoint:readStream(streamId, connection) end

--- Server join: writes the same data read by readStream, in the same order, and registers the stations and the storage in the stream for the connecting client.
---@param streamId integer
---@param connection table
function ProductionPoint:writeStream(streamId, connection) end

--- Client update: reads the palletLimitReached boolean sent by the server.
---@param streamId any
---@param timestamp any
---@param connection any
function ProductionPoint:readUpdateStream(streamId, timestamp, connection) end

--- Server update: writes the palletLimitReached boolean.
---@param streamId any
---@param connection any
---@param dirtyMask any
function ProductionPoint:writeUpdateStream(streamId, connection, dirtyMask) end

--- Restores the saved state: pallet spawn cooldown, unclaimed costs, enabled state of each production (all enabled if the placeable is unowned), direct-sell and auto-deliver fill types, then the storage. Returns false if the storage fails to load; unknown production ids give a warning.
---@param xmlFile XMLFile
---@param key string
---@return boolean
function ProductionPoint:loadFromXMLFile(xmlFile, key) end

--- Store spec loader: collects the set of input fill type names from all productions in the placeable XML, including the first production point configuration. Returns a name set, or nil if there are none.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function ProductionPoint.loadSpecValueInputFillTypes(xmlFile, customEnvironment, baseDir) end

--- Converts the stored input fill type names of a store item into fill type data through the fill type manager; nil if none.
---@param storeItem any
---@param realItem any
function ProductionPoint.getSpecValueInputFillTypes(storeItem, realItem) end

--- Store spec loader like the input one, but collecting the output fill type names of all productions and of the first configuration.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function ProductionPoint.loadSpecValueOutputFillTypes(xmlFile, customEnvironment, baseDir) end

--- Converts the stored output fill type names of a store item into fill type data; nil if none.
---@param storeItem any
---@param realItem any
function ProductionPoint.getSpecValueOutputFillTypes(storeItem, realItem) end

--- Trigger callback for the local player entering or leaving the interaction zone. On enter it either runs the activatable at once (platforms with auto-activate) or refreshes its text and registers it; on leave it removes it.
---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function ProductionPoint:interactionTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

--- Opens the in-game menu and publishes GUI_INGAME_OPEN_PRODUCTION_SCREEN with this production point so the production page shows it.
function ProductionPoint:openMenu() end

--- Starts a purchase of an unowned production point: refuses during a guided tour, computes the price (plus farmland price when the placeable buys land the farm does not own) and shows a yes/no dialog; on yes sends a BuyExistingPlaceableEvent and shows the result. Note: it subscribes a callback without target but unsubscribes with the production point as target, which may not remove it (UNVERIFIED).
---@param requestCallback any
---@param target any
function ProductionPoint:buyRequest(requestCallback, target) end
