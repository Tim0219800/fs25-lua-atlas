---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WoodCrusher.lua (generated stub, FS25 Lua Atlas)

--- Specialization for machines that pull logs through a trigger, cut them at a cut node and turn them into wood chips in a fill unit. It requires TurnOnVehicle and FillUnit. Most logic lives in reusable static functions (`loadWoodCrusher`, `updateWoodCrusher`, ...) taking an explicit spec table, so other specializations can embed a crusher. Crushing, forces and trigger bookkeeping run on the server; effects, sounds and animations run on the client, with a single boolean in the update stream telling clients whether crushing is happening. XML root is `vehicle.woodCrusher`.
---@class WoodCrusher
WoodCrusher = {}

--- Returns true only if the vehicle type has both the TurnOnVehicle and FillUnit specializations.
---@param specializations table
---@return boolean
function WoodCrusher.prerequisitesPresent(specializations) end

--- Registers the XML schema: the shared crusher paths under `vehicle.woodCrusher`, plus `#moveColDisableCollisionPairs` and `#fillUnitIndex`.
function WoodCrusher.initSpecialization() end

--- Registers crusher XML paths under a given key: cut and drum nodes, move triggers and collisions, move speed (m/s) and force (kN), down force nodes, auto turn-on, crush effects, animation nodes and start/stop/work/idle sounds.
---@param schema any
---@param key any
function WoodCrusher.registerWoodCrusherXMLPaths(schema, key) end

--- Registers the vehicle function `onCrushedSplitShape`.
---@param vehicleType any
function WoodCrusher.registerFunctions(vehicleType) end

--- Overrides `getDirtMultiplier`, `getWearMultiplier`, `getCanBeTurnedOn`, `getConsumingLoad` and `getRequiresPower`.
---@param vehicleType any
function WoodCrusher.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, the read/write update stream, onUpdate, onUpdateTick, onTurnedOn and onTurnedOff.
---@param vehicleType any
function WoodCrusher.registerEventListeners(vehicleType) end

--- Loads the crusher from the vehicle XML. If `#moveColDisableCollisionPairs` is true (default), disables collision between every component and each move collision node. Reads the fill unit index (default 1).
---@param savegame table
function WoodCrusher:onLoad(savegame) end

--- Releases triggers, effects, sounds and animations through `deleteWoodCrusher`.
function WoodCrusher:onDelete() end

--- Client side: reads one boolean from the server and sets the crushing timer to 1000 ms or 0.
---@param streamId integer
---@param timestamp integer
---@param connection table
function WoodCrusher:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes one boolean telling whether the crushing timer is above zero.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function WoodCrusher:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Runs `updateWoodCrusher` with the vehicle's current turned-on state.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function WoodCrusher:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Runs `updateTickWoodCrusher`, then on the server, if automatic motor start is enabled in the savegame and `#automaticallyTurnOn` is set: starts the motor (own or attacher's) and turns the crusher on while logs are in the move triggers when unattended, and turns it off after a 3 s delay once empty.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function WoodCrusher:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Event handler: delegates to `turnOnWoodCrusher`.
function WoodCrusher:onTurnedOn() end

--- Event handler: delegates to `turnOffWoodCrusher`.
function WoodCrusher:onTurnedOff() end

--- Returns false when the crusher is configured to turn on automatically (manual switching is blocked); otherwise defers to the parent implementation.
---@param superFunc any
---@return boolean
function WoodCrusher:getCanBeTurnedOn(superFunc) end

--- Adds one load unit (and one to the count) to the parent result while crushing is in progress. The count is incremented even when idle.
---@param superFunc any
function WoodCrusher:getConsumingLoad(superFunc) end

--- Returns true whenever the crusher is turned on; otherwise uses the parent result.
---@param superFunc any
function WoodCrusher:getRequiresPower(superFunc) end

--- Adds the vehicle's work dirt multiplier to the parent value while crushing.
---@param superFunc any
---@return number
function WoodCrusher:getDirtMultiplier(superFunc) end

--- Adds the vehicle's work wear multiplier to the parent value while crushing.
---@param superFunc any
---@return number
function WoodCrusher:getWearMultiplier(superFunc) end

--- Adds wood chips to the fill unit for a crushed volume (volume x liters per volume x chips per liter of the split type). Volume is reduced by vehicle damage times `WoodCrusher.DAMAGED_YIELD_DECREASE`.
---@param splitType table
---@param volume number
function WoodCrusher:onCrushedSplitShape(splitType, volume) end

--- Loads all crusher data from XML into a spec table: nodes, move triggers (warns if the TREE collision bit is missing), move collisions, down force nodes, effects, animations and sounds. Registers triggers on the server. Also warns about deprecated FS17/FS19 XML keys.
---@param self table
---@param woodCrusher table
---@param xmlFile XMLFile
---@param rootNode integer
---@param i3dMappings table
function WoodCrusher.loadWoodCrusher(self, woodCrusher, xmlFile, rootNode, i3dMappings) end

--- Removes move and down force triggers and deletes effects, sounds and animations of a crusher table.
---@param self any
---@param woodCrusher any
function WoodCrusher.deleteWoodCrusher(self, woodCrusher) end

--- Server, while on: crushes shapes queued in `crushNodes`, applies down force to logs in the trigger, tracks the largest log height to move the drum reference node smoothly (0.0003 m per ms), and keeps the vehicle active while logs are present or crushing runs.
---@param self number
---@param woodCrusher any
---@param dt number
---@param isTurnedOn any
function WoodCrusher.updateWoodCrusher(self, woodCrusher, dt, isTurnedOn) end

--- Server, while on: tests each log against the cut plane; crushes it whole if 0.4 or less remains below, or splits it when 0.2 or more lies above; jitters move collision nodes. Then decrements the crushing timer and, on clients, starts or stops the chip effect and the work sound.
---@param self number
---@param woodCrusher any
---@param dt number
---@param isTurnedOn any
function WoodCrusher.updateTickWoodCrusher(self, woodCrusher, dt, isTurnedOn) end

--- On turn-on: the server sets friction velocity on move collision nodes (pulling logs in); the client stops sounds, plays the start sample then idle, and starts animations.
---@param self any
---@param woodCrusher any
function WoodCrusher.turnOnWoodCrusher(self, woodCrusher) end

--- On turn-off: the server crushes any queued shapes and zeroes friction velocity; the client stops effects, sounds and animations and plays the stop sample.
---@param self any
---@param woodCrusher any
function WoodCrusher.turnOffWoodCrusher(self, woodCrusher) end

--- Server: if the shape's split type yields wood chips, reads its volume, deletes the shape, sets the 1000 ms crushing timer and calls `onCrushedSplitShape`. Does nothing for other types.
---@param self integer
---@param woodCrusher any
---@param shape integer
function WoodCrusher.crushSplitShape(self, woodCrusher, shape) end

--- Callback of `splitShape`: queues the resulting shape for crushing if it is not the part below the cut, and notifies `g_treePlantManager` of the new split shape.
---@param self integer
---@param shape integer
---@param isBelow boolean
---@param isAbove boolean
---@param minY number
---@param maxY number
---@param minZ number
---@param maxZ number
function WoodCrusher.woodCrusherSplitShapeCallback(self, shape, isBelow, isAbove, minY, maxY, minZ, maxZ) end

--- Move trigger callback: for dynamic non-vehicle bodies whose split type gives wood chips, counts enters and leaves per body in `moveTriggerNodes` and raises the vehicle's active state on enter.
---@param self integer
---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function WoodCrusher.woodCrusherMoveTriggerCallback(self, triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Same bookkeeping as the move trigger callback, but per down force node whose extra trigger matches, storing counts in that node's `triggerNodes`.
---@param self integer
---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function WoodCrusher.woodCrusherDownForceTriggerCallback(self, triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end
