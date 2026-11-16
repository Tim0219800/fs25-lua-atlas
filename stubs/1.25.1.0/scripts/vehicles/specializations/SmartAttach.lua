---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SmartAttach.lua (generated stub, FS25 Lua Atlas)

--- Specialization that lets a vehicle be attached to a nearby target vehicle with one button press, without manual attacher joint selection. A trigger node detects vehicles with a free attacher joint of the configured joint type; an activatable (`SmartAttachActivatable`) then appears when the two joints are close and aligned. The file also defines `SmartAttachActivatable` and `SmartAttachEvent`, which sends the request to the server and rebroadcasts it. It reads `vehicle.smartAttach#jointType` and `#trigger`.
---@class SmartAttachActivatable
SmartAttachActivatable = {}

--- Specialization that lets a vehicle be attached to a nearby target vehicle with one button press, without manual attacher joint selection. A trigger node detects vehicles with a free attacher joint of the configured joint type; an activatable (`SmartAttachActivatable`) then appears when the two joints are close and aligned. The file also defines `SmartAttachActivatable` and `SmartAttachEvent`, which sends the request to the server and rebroadcasts it. It reads `vehicle.smartAttach#jointType` and `#trigger`.
---@class SmartAttachEvent : Event
SmartAttachEvent = {}

--- Always returns true: no other specialization is required.
---@param specializations any
function SmartAttach.prerequisitesPresent(specializations) end

--- Declares the XML schema entries `vehicle.smartAttach#jointType` (joint type name) and `#trigger` (trigger node).
function SmartAttach.initSpecialization() end

--- Registers `smartAttachCallback`, `getCanBeSmartAttached` and `doSmartAttach` on the vehicle type.
---@param vehicleType any
function SmartAttach.registerFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete and onPreAttach.
---@param vehicleType any
function SmartAttach.registerEventListeners(vehicleType) end

--- Looks up the input attacher joint matching the configured joint type (warns if invalid or missing), registers the trigger node with `smartAttachCallback`, resets the target state and creates the activatable.
---@param savegame any
function SmartAttach:onLoad(savegame) end

--- Removes the activatable from the activatable objects system and removes the trigger.
function SmartAttach:onDelete() end

--- Sends a SmartAttachEvent, then on the server detaches this vehicle from its current attacher vehicle (if any) and attaches it to the target vehicle with the given joint indices.
---@param targetVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param noEventSend any
function SmartAttach:doSmartAttach(targetVehicle, inputJointDescIndex, jointDescIndex, noEventSend) end

--- Returns true if a target vehicle is known, one of the two vehicles is active for input, and the horizontal distance between the two joints is under SmartAttach.DISTANCE_THRESHOLD with a Y rotation difference under SmartAttach.ABS_ANGLE_THRESHOLD (constants defined outside the dump excerpt, values UNVERIFIED).
function SmartAttach:getCanBeSmartAttached() end

--- Clears the stored target vehicle and its counter before an attach takes place.
function SmartAttach:onPreAttach() end

--- Trigger callback: on enter, picks the first vehicle with a free attacher joint of the right type as target, builds the action text (ground attach or transform attach) and adds the activatable; counts shapes of the target inside the trigger. On leave, decrements the count and clears the target and activatable at zero.
---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function SmartAttach:smartAttachCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Creates the activatable object for a smart-attach vehicle, with an empty activation text.
---@param smartAttachVehicle table
---@return table
function SmartAttachActivatable.new(smartAttachVehicle) end

--- Returns whether the vehicle can currently be smart attached (delegates to `getCanBeSmartAttached`).
---@return boolean
function SmartAttachActivatable:getIsActivatable() end

--- Called when the player activates it: runs `doSmartAttach` with the stored target vehicle and joint indices.
function SmartAttachActivatable:run() end

--- Creates an empty SmartAttachEvent, used when reading from the network.
function SmartAttachEvent.emptyNew() end

--- Creates a SmartAttachEvent holding the vehicle, target vehicle and the two joint indices.
---@param vehicle any
---@param targetVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
function SmartAttachEvent.new(vehicle, targetVehicle, inputJointDescIndex, jointDescIndex) end

--- Reads the two vehicle objects and the two 7-bit joint indices from the stream, then runs the event.
---@param streamId any
---@param connection any
function SmartAttachEvent:readStream(streamId, connection) end

--- Writes the two vehicle objects and the two 7-bit joint indices to the stream.
---@param streamId any
---@param connection any
function SmartAttachEvent:writeStream(streamId, connection) end

--- Calls `doSmartAttach` without re-sending the event; when received by the server, rebroadcasts it to the other clients.
---@param connection any
function SmartAttachEvent:run(connection) end

--- Sends the event unless `noEventSend` is true: the server broadcasts it, a client sends it to the server connection.
---@param vehicle any
---@param targetVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param noEventSend any
function SmartAttachEvent.sendEvent(vehicle, targetVehicle, inputJointDescIndex, jointDescIndex, noEventSend) end
