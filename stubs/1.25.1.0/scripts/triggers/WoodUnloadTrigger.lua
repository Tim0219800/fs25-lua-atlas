---@meta
-- FS25 1.25.1.0 : triggers/WoodUnloadTrigger.lua (generated stub, FS25 Lua Atlas)

--- Subclass of UnloadTrigger that sells or processes logs (split shapes) lying in a tree-collision trigger. The server computes volume and a quality-based price per log, adds it to the target and deletes the log. A second trigger lets the player start a manual sale, or autoUnload sells when a vehicle is inside; a trainSystemId can credit the rental farm of a train. Several helpers called here (getCanProcessWood, getTargetFillType, onProcessedWood, getNeedRaiseActive, updateActivatableObject) are not defined in the dump (UNVERIFIED).
---@class WoodUnloadTrigger : UnloadTrigger
WoodUnloadTrigger = {}

--- Registers the parent UnloadTrigger XML paths plus triggerNode, activationTriggerNode, autoUnload (default false) and trainSystemId.
---@param schema any
---@param basePath any
function WoodUnloadTrigger.registerXMLPaths(schema, basePath) end

--- Creates the trigger on top of UnloadTrigger.new with empty tables of wood and vehicles in the trigger, split-shape stat placeholders, and extraAttributes initialised with price = 1.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function WoodUnloadTrigger.new(isServer, isClient, customMt) end

--- Calls the parent load, then requires a triggerNode whose collision mask includes the TREE bit (else returns false) and registers `woodTriggerCallback`. Optionally registers a player activation trigger (needs the PLAYER mask bit), reads autoUnload and trainSystemId, and creates the activatable.
---@param components table
---@param xmlFile table
---@param xmlNode string
---@param target table
---@param extraAttributes table
---@param i3dMappings table
---@return boolean
function WoodUnloadTrigger:load(components, xmlFile, xmlNode, target, extraAttributes, i3dMappings) end

--- Removes the wood trigger, and the activation trigger together with its activatable if present, then calls the parent delete.
function WoodUnloadTrigger:delete() end

--- On a client it only sends WoodUnloadTriggerEvent to the server. On the server it sells each existing log in the trigger: computes volume and price, adds the fill level to the target (if free capacity exceeds 90 percent of the volume), calls onProcessedWood and deletes the log. Note: totalMass is never increased, so the woodTonsSold stat always receives 0.
---@param farmId any
---@param noEventSend any
function WoodUnloadTrigger:processWood(farmId, noEventSend) end

--- Reads volume, split type and split shape stats of a log node, then returns the result of calculateWoodBaseValueForData: liters, price per liter and longest side.
---@param objectId any
function WoodUnloadTrigger:calculateWoodBaseValue(objectId) end

--- Computes volume times the split type's volumeToLiter, and a price per liter from the split type scaled by shape quality (bounding box vs volume, convex count), length and attachments count. The quality effect is blended by economic difficulty. Returns liters, price, longest side.
---@param volume any
---@param splitType any
---@param sizeX any
---@param sizeY any
---@param sizeZ any
---@param numConvexes any
---@param numAttachments any
function WoodUnloadTrigger:calculateWoodBaseValueForData(volume, splitType, sizeX, sizeY, sizeZ, numConvexes, numAttachments) end

--- After the parent update, on the server picks the farm to credit: the train system's last rental farm, the vehicle owner in autoUnload mode, or the target owner. If that farm is not the spectator, it calls processWood.
---@param dt any
function WoodUnloadTrigger:update(dt) end

--- Physics callback. Split shapes with a positive price per liter are added on enter and removed on leave. In autoUnload mode, vehicles are counted in and out; entry raises the object active.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function WoodUnloadTrigger:woodTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

--- Returns the table of logs currently in the trigger, keyed by node id.
function WoodUnloadTrigger:getWoodLogs() end

--- Physics callback of the activation trigger: when the local player's root node enters (and manual selling is active) the activatable is added, and removed on leave.
---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function WoodUnloadTrigger:woodSellTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end
