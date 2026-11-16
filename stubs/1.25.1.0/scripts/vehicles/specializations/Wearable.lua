---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Wearable.lua (generated stub, FS25 Lua Atlas)

--- Specialization giving vehicles two kinds of ageing. Damage (0..1) grows on the server while the vehicle is in use, reduces performance through `getVehicleDamage` and sets the repair price. Wear (0..1 per wearable node group) is stored in the shader parameter `scratches_dirt_snow_wetness` of every node that has it and drives the repaint price. Both are saved, synced by dirty flags with a quantized bit stream, and the store gets a 'condition' spec when `Platform.gameplay.hasVehicleDamage`. On mobile some listeners (streams, update tick, sale item) are not registered.
---@class Wearable
Wearable = {}

--- Always returns true: no prerequisites.
---@param specializations any
function Wearable.prerequisitesPresent(specializations) end

--- Registers the store spec type `wearable` (condition icon) when vehicle damage is enabled on the platform, the XML paths wearDuration (minutes, default 600), workMultiplier (20), fieldMultiplier (2), showOnHud, and the savegame attributes for damage and per-node wear.
function Wearable.initSpecialization() end

--- Adds the damage, wear and wearable-node management functions to the vehicle type (addDamageAmount, setNodeWearAmount, repairVehicle, repaintVehicle, validateWearableNode, and others). Note: `repaintVehicle` is registered here but has no body in this file (UNVERIFIED).
---@param vehicleType any
function Wearable.registerFunctions(vehicleType) end

--- Overrides getVehicleDamage, getRepairPrice, getRepaintPrice and showInfo.
---@param vehicleType any
function Wearable.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad and onLoadFinished, and, except on mobile, to onSaleItemSet, the stream events and onUpdateTick.
---@param vehicleType any
function Wearable.registerEventListeners(vehicleType) end

--- Creates the default (global) wearable node, converts wearDuration from minutes into a per-millisecond rate times `Wearable.WEAR_FACTOR`, initializes damage and totals, reads the work/field multipliers and HUD flag, and allocates a dirty flag.
---@param savegame any
function Wearable:onLoad(savegame) end

--- Loads saved damage (and derives `damageByCurve`), scans all components for nodes with the wear shader parameter, then applies saved per-node wear or resets it to 0.
---@param savegame any
function Wearable:onLoadFinished(savegame) end

--- Applies the damage and wear stored on a sale item to the vehicle, forcing the sync.
---@param saleItem any
function Wearable:onSaleItemSet(saleItem) end

--- Saves the damage value and each wearable node's wear amount to the savegame.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Wearable:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client join: reads damage and per-node wear, quantized with `Wearable.SEND_NUM_BITS` bits, and applies them forcibly.
---@param streamId any
---@param connection any
function Wearable:onReadStream(streamId, connection) end

--- Server side on join: writes damage and per-node wear as quantized integers.
---@param streamId any
---@param connection any
function Wearable:onWriteStream(streamId, connection) end

--- Client: when the server flagged a change, reads damage and per-node wear and applies them.
---@param streamId any
---@param timestamp any
---@param connection any
function Wearable:onReadUpdateStream(streamId, timestamp, connection) end

--- Server: writes a presence boolean for the dirty flag, then damage and per-node wear when set.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Wearable:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Server only: adds the damage computed by `updateDamageAmount` and, for each wearable node, the change returned by its update function.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Wearable:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Clamps damage to 0..1, recomputes `damageByCurve` (damage above 0.3 rescaled to 0..1) and, on the server, raises the dirty flag when the change since the last send exceeds `Wearable.SEND_THRESHOLD` or when forced.
---@param amount any
---@param force any
function Wearable:setDamageAmount(amount, force) end

--- Default wear update function for a node: returns dt times the wear rate times `getWearMultiplier`, halved, or 0 when usage causes no wear.
---@param nodeData any
---@param dt any
function Wearable:updateWearAmount(nodeData, dt) end

--- Returns the damage increase for dt ms when usage causes damage, scaled by 0.35 and by an ageing factor built from age/lifetime and operating hours with the economy manager constants. Returns 0 otherwise.
---@param dt any
function Wearable:updateDamageAmount(dt) end

--- Returns true by default: usage always causes wear.
function Wearable:getUsageCausesWear() end

--- Returns true when the vehicle is active and not a mission-owned vehicle. For non-motorized vehicles it returns false if the root node is sleeping (physics).
function Wearable:getUsageCausesDamage() end

--- Adds the given wear to every wearable node (clamped by `setNodeWearAmount`).
---@param wearAmount any
---@param force any
function Wearable:addWearAmount(wearAmount, force) end

--- Adds the given amount to the current damage through `setDamageAmount`.
---@param amount any
---@param force any
function Wearable:addDamageAmount(amount, force) end

--- Clamps and stores a node group's wear. When the change exceeds the threshold or is forced, writes it to the `scratches_dirt_snow_wetness` shader parameter of each node, raises the dirty flag on the server and recomputes the average total wear.
---@param nodeData any
---@param wearAmount any
---@param force any
function Wearable:setNodeWearAmount(nodeData, wearAmount, force) end

--- Returns the wear amount of the given node group.
---@param nodeData any
function Wearable:getNodeWearAmount(nodeData) end

--- Returns the average wear (0..1) over all wearable node groups.
---@return number
function Wearable:getWearTotalAmount() end

--- Returns the current damage value (0..1).
---@return number
function Wearable:getDamageAmount() end

--- Returns whether the damage should be shown on the HUD (XML `showOnHud`).
---@return boolean
function Wearable:getDamageShowOnHud() end

--- On the server charges the repair price to the owner farm (MoneyType.VEHICLE_REPAIR), updates the repair statistic and tries to unlock repair achievements; then resets damage to 0 (on every side that calls it).
function Wearable:repairVehicle() end

--- Override: base repair price plus `calculateRepairPrice` of the vehicle price and current damage.
---@param superFunc any
function Wearable:getRepairPrice(superFunc) end

--- Repair price formula: price times damage to the power 1.5 times 0.09 (so 9 percent of the price at full damage). Also used by the sale system.
---@param price any
---@param damage any
function Wearable.calculateRepairPrice(price, damage) end

--- Override: base repaint price plus `calculateRepaintPrice` of the vehicle price and total wear.
---@param superFunc any
function Wearable:getRepaintPrice(superFunc) end

--- Override: adds a damage percentage line to the info box when damage is above 1 percent, then calls the previous implementation.
---@param superFunc any
---@param box any
function Wearable:showInfo(superFunc, box) end

--- Repaint price formula: price times the square root of wear/100 times 2. Note: wear is a 0..1 value elsewhere, so the division by 100 looks unusual (inferred from the code).
---@param price any
---@param wear any
function Wearable.calculateRepaintPrice(price, wear) end

--- Override: adds the curve-based damage to the previous value and caps the result at 1, so damage affects performance only above 30 percent.
---@param superFunc any
function Wearable:getVehicleDamage(superFunc) end

--- Walks the node hierarchy from the root and registers every node having the `scratches_dirt_snow_wetness` shader parameter as wearable.
---@param rootNode any
function Wearable:addAllSubWearableNodes(rootNode) end

--- Asks `validateWearableNode` how to handle a node and adds it either to the global node group or to a local group with its own update function.
---@param node any
function Wearable:addWearableNode(node) end

--- Default validation: every node is global. Other specializations may overwrite it to return a local group, update function, custom index and extra parameters.
---@param node any
function Wearable:validateWearableNode(node) end

--- Adds the node to the first (default) wearable node group, if it exists.
---@param node any
function Wearable:addToGlobalWearableNode(node) end

--- Creates a wearable node group with its own update function and extra fields, or, when `customIndex` already exists, just adds the node to that group.
---@param node any
---@param updateFunc any
---@param customIndex any
---@param extraParams any
function Wearable:addToLocalWearableNode(node, updateFunc, customIndex, extraParams) end

--- Walks the node hierarchy from the root and removes each node with the wear shader parameter from its wearable groups.
---@param rootNode any
function Wearable:removeAllSubWearableNodes(rootNode) end

--- Removes the node from every wearable node group.
---@param node node
function Wearable:removeWearableNode(node) end

--- Returns the wear speed multiplier: 0 when the last speed is below 1, otherwise 1, multiplied by the field multiplier while on a field. The node argument is unused here.
---@return number
function Wearable:getWearMultiplier() end

--- Returns the XML work multiplier (default 20) for use by work-related wear.
---@return number
function Wearable:getWorkWearMultiplier() end

--- Debug display: adds the damage rate per hour and the wear rate per hour of each node (server only) to the values list.
---@param values any
function Wearable:updateDebugValues(values) end

--- Store spec loader: returns nil because the condition spec only applies to existing items.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Wearable.loadSpecValueCondition(xmlFile, customEnvironment, baseDir) end

--- Store spec getter: returns the damage as a percentage string for a real item, or nil if there is no item or it lacks `getDamageAmount`.
---@param storeItem any
---@param realItem any
function Wearable.getSpecValueCondition(storeItem, realItem) end
