# vehicles/specializations/Wearable.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Wearable.md)*

Source: `dataS/scripts/vehicles/specializations/Wearable.lua` — FS25 1.25.1.0

✍ Specialization giving vehicles two kinds of ageing. Damage (0..1) grows on the server while the vehicle is in use, reduces performance through `getVehicleDamage` and sets the repair price. Wear (0..1 per wearable node group) is stored in the shader parameter `scratches_dirt_snow_wetness` of every node that has it and drives the repaint price. Both are saved, synced by dirty flags with a quantized bit stream, and the store gets a 'condition' spec when `Platform.gameplay.hasVehicleDamage`. On mobile some listeners (streams, update tick, sale item) are not registered.

- **Wearable** (l.19)

## Functions

| Function | Line | Description |
|---|---|---|
| `Wearable.prerequisitesPresent(specializations: any)` | 29 | ✍ Always returns true: no prerequisites. |
| `Wearable.initSpecialization()` | 35 | ✍ Registers the store spec type `wearable` (condition icon) when vehicle damage is enabled on the platform, the XML paths wearDuration (minutes, default 600), workMultiplier (20), fieldMultiplier (2), showOnHud, and the savegame attributes for damage and per-node wear. |
| `Wearable.registerFunctions(vehicleType: any)` | 57 | ✍ Adds the damage, wear and wearable-node management functions to the vehicle type (addDamageAmount, setNodeWearAmount, repairVehicle, repaintVehicle, validateWearableNode, and others). Note: `repaintVehicle` is registered here but has no body in this file (UNVERIFIED). |
| `Wearable.registerOverwrittenFunctions(vehicleType: any)` | 85 | ✍ Overrides getVehicleDamage, getRepairPrice, getRepaintPrice and showInfo. |
| `Wearable.registerEventListeners(vehicleType: any)` | 94 | ✍ Subscribes to onLoad and onLoadFinished, and, except on mobile, to onSaleItemSet, the stream events and onUpdateTick. |
| `Wearable:onLoad(savegame: any)` | 110 | ✍ Creates the default (global) wearable node, converts wearDuration from minutes into a per-millisecond rate times `Wearable.WEAR_FACTOR`, initializes damage and totals, reads the work/field multipliers and HUD flag, and allocates a dirty flag. |
| `Wearable:onLoadFinished(savegame: any)` | 138 | ✍ Loads saved damage (and derives `damageByCurve`), scans all components for nodes with the wear shader parameter, then applies saved per-node wear or resets it to 0. |
| `Wearable:onSaleItemSet(saleItem: any)` | 168 | ✍ Applies the damage and wear stored on a sale item to the vehicle, forcing the sync. |
| `Wearable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 175 | ✍ Saves the damage value and each wearable node's wear amount to the savegame. |
| `Wearable:onReadStream(streamId: any, connection: any)` | 190 | ✍ Client join: reads damage and per-node wear, quantized with `Wearable.SEND_NUM_BITS` bits, and applies them forcibly. |
| `Wearable:onWriteStream(streamId: any, connection: any)` | 205 | ✍ Server side on join: writes damage and per-node wear as quantized integers. |
| `Wearable:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 219 | ✍ Client: when the server flagged a change, reads damage and per-node wear and applies them. |
| `Wearable:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 238 | ✍ Server: writes a presence boolean for the dirty flag, then damage and per-node wear when set. |
| `Wearable:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 256 | ✍ Server only: adds the damage computed by `updateDamageAmount` and, for each wearable node, the change returned by its update function. |
| `Wearable:setDamageAmount(amount: any, force: any)` | 278 | ✍ Clamps damage to 0..1, recomputes `damageByCurve` (damage above 0.3 rescaled to 0..1) and, on the server, raises the dirty flag when the change since the last send exceeds `Wearable.SEND_THRESHOLD` or when forced. |
| `Wearable:updateWearAmount(nodeData: any, dt: any)` | 295 | ✍ Default wear update function for a node: returns dt times the wear rate times `getWearMultiplier`, halved, or 0 when usage causes no wear. |
| `Wearable:updateDamageAmount(dt: any)` | 306 | ✍ Returns the damage increase for dt ms when usage causes damage, scaled by 0.35 and by an ageing factor built from age/lifetime and operating hours with the economy manager constants. Returns 0 otherwise. |
| `Wearable:getUsageCausesWear()` | 326 | ✍ Returns true by default: usage always causes wear. |
| `Wearable:getUsageCausesDamage()` | 332 | ✍ Returns true when the vehicle is active and not a mission-owned vehicle. For non-motorized vehicles it returns false if the root node is sleeping (physics). |
| `Wearable:addWearAmount(wearAmount: any, force: any)` | 344 | ✍ Adds the given wear to every wearable node (clamped by `setNodeWearAmount`). |
| `Wearable:addDamageAmount(amount: any, force: any)` | 355 | ✍ Adds the given amount to the current damage through `setDamageAmount`. |
| `Wearable:setNodeWearAmount(nodeData: any, wearAmount: any, force: any)` | 362 | ✍ Clamps and stores a node group's wear. When the change exceeds the threshold or is forced, writes it to the `scratches_dirt_snow_wetness` shader parameter of each node, raises the dirty flag on the server and recomputes the average total wear. |
| `Wearable:getNodeWearAmount(nodeData: any)` | 388 | ✍ Returns the wear amount of the given node group. |
| `Wearable:getWearTotalAmount() → number` | 395 | ✍ Returns the average wear (0..1) over all wearable node groups. |
| `Wearable:getDamageAmount() → number` | 402 | ✍ Returns the current damage value (0..1). |
| `Wearable:getDamageShowOnHud() → boolean` | 409 | ✍ Returns whether the damage should be shown on the HUD (XML `showOnHud`). |
| `Wearable:repairVehicle()` | 415 | ✍ On the server charges the repair price to the owner farm (MoneyType.VEHICLE_REPAIR), updates the repair statistic and tries to unlock repair achievements; then resets damage to 0 (on every side that calls it). |
| `Wearable:getRepairPrice(superFunc: any)` | 449 | ✍ Override: base repair price plus `calculateRepairPrice` of the vehicle price and current damage. |
| `Wearable.calculateRepairPrice(price: any, damage: any)` | 456 | ✍ Repair price formula: price times damage to the power 1.5 times 0.09 (so 9 percent of the price at full damage). Also used by the sale system. |
| `Wearable:getRepaintPrice(superFunc: any)` | 464 | ✍ Override: base repaint price plus `calculateRepaintPrice` of the vehicle price and total wear. |
| `Wearable:showInfo(superFunc: any, box: any)` | 470 | ✍ Override: adds a damage percentage line to the info box when damage is above 1 percent, then calls the previous implementation. |
| `Wearable.calculateRepaintPrice(price: any, wear: any)` | 482 | ✍ Repaint price formula: price times the square root of wear/100 times 2. Note: wear is a 0..1 value elsewhere, so the division by 100 looks unusual (inferred from the code). |
| `Wearable:getVehicleDamage(superFunc: any)` | 488 | ✍ Override: adds the curve-based damage to the previous value and caps the result at 1, so damage affects performance only above 30 percent. |
| `Wearable:addAllSubWearableNodes(rootNode: any)` | 494 | ✍ Walks the node hierarchy from the root and registers every node having the `scratches_dirt_snow_wetness` shader parameter as wearable. |
| `Wearable:addWearableNode(node: any)` | 502 | ✍ Asks `validateWearableNode` how to handle a node and adds it either to the global node group or to a local group with its own update function. |
| `Wearable:validateWearableNode(node: any)` | 513 | ✍ Default validation: every node is global. Other specializations may overwrite it to return a local group, update function, custom index and extra parameters. |
| `Wearable:addToGlobalWearableNode(node: any)` | 519 | ✍ Adds the node to the first (default) wearable node group, if it exists. |
| `Wearable:addToLocalWearableNode(node: any, updateFunc: any, customIndex: any, extraParams: any)` | 528 | ✍ Creates a wearable node group with its own update function and extra fields, or, when `customIndex` already exists, just adds the node to that group. |
| `Wearable:removeAllSubWearableNodes(rootNode: any)` | 563 | ✍ Walks the node hierarchy from the root and removes each node with the wear shader parameter from its wearable groups. |
| `Wearable:removeWearableNode(node: node)` | 572 | ✍ Removes the node from every wearable node group. |
| `Wearable:getWearMultiplier() → number` | 585 | ✍ Returns the wear speed multiplier: 0 when the last speed is below 1, otherwise 1, multiplied by the field multiplier while on a field. The node argument is unused here. |
| `Wearable:getWorkWearMultiplier() → number` | 603 | ✍ Returns the XML work multiplier (default 20) for use by work-related wear. |
| `Wearable:updateDebugValues(values: any)` | 611 | ✍ Debug display: adds the damage rate per hour and the wear rate per hour of each node (server only) to the values list. |
| `Wearable.loadSpecValueCondition(xmlFile: any, customEnvironment: any, baseDir: any)` | 629 | ✍ Store spec loader: returns nil because the condition spec only applies to existing items. |
| `Wearable.getSpecValueCondition(storeItem: any, realItem: any)` | 636 | ✍ Store spec getter: returns the damage as a percentage string for a real item, or nil if there is no item or it lacks `getDamageAmount`. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `addAllSubWearableNodes` | 58 |
| registerFunction | `addDamageAmount` | 59 |
| registerFunction | `addToGlobalWearableNode` | 60 |
| registerFunction | `addToLocalWearableNode` | 61 |
| registerFunction | `addWearableNode` | 62 |
| registerFunction | `addWearAmount` | 63 |
| registerFunction | `getDamageAmount` | 64 |
| registerFunction | `getDamageShowOnHud` | 65 |
| registerFunction | `getNodeWearAmount` | 66 |
| registerFunction | `getUsageCausesDamage` | 67 |
| registerFunction | `getUsageCausesWear` | 68 |
| registerFunction | `getWearMultiplier` | 69 |
| registerFunction | `getWearTotalAmount` | 70 |
| registerFunction | `getWorkWearMultiplier` | 71 |
| registerFunction | `removeAllSubWearableNodes` | 72 |
| registerFunction | `removeWearableNode` | 73 |
| registerFunction | `repaintVehicle` | 74 |
| registerFunction | `repairVehicle` | 75 |
| registerFunction | `setDamageAmount` | 76 |
| registerFunction | `setNodeWearAmount` | 77 |
| registerFunction | `updateDamageAmount` | 78 |
| registerFunction | `updateWearAmount` | 79 |
| registerFunction | `validateWearableNode` | 80 |
| registerOverwrittenFunction | `getVehicleDamage` | 86 |
| registerOverwrittenFunction | `getRepairPrice` | 87 |
| registerOverwrittenFunction | `getRepaintPrice` | 88 |
| registerOverwrittenFunction | `showInfo` | 89 |
| registerEventListener | `onLoad` | 95 |
| registerEventListener | `onLoadFinished` | 96 |
| registerEventListener | `onSaleItemSet` | 99 |
| registerEventListener | `onReadStream` | 100 |
| registerEventListener | `onWriteStream` | 101 |
| registerEventListener | `onReadUpdateStream` | 102 |
| registerEventListener | `onWriteUpdateStream` | 103 |
| registerEventListener | `onUpdateTick` | 104 |
