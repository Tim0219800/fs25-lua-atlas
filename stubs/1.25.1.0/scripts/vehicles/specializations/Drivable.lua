---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Drivable.lua (generated stub, FS25 Lua Atlas)

--- Specialization that turns player input into vehicle driving: pedals, steering, handbrake, cruise control, idle (on the spot) turning, force feedback and the odometer. It requires Enterable and Motorized. The client computes the axes and sends them through the update stream; the server applies them to the motor and wheel physics. It also exposes dashboard value types and raises onVehiclePhysicsUpdate and onCruiseControlSpeedChanged.
---@class Drivable
Drivable = {}

--- Returns true only if the vehicle type has both Enterable and Motorized.
---@param specializations table
---@return boolean
function Drivable.prerequisitesPresent(specializations) end

--- Registers the XML schema for vehicle.drivable (directions, speedRotScale, cruise control, steering wheel, idle turning, dashboards, waterSplash sound) and the savegame attributes cruiseControl, cruiseControlReverse and odometerMilage.
function Drivable.initSpecialization() end

--- Registers the specialization's vehicle functions: cruise control, axes, reverser and steering direction, input setters, player control checks and updateVehiclePhysics.
---@param vehicleType any
function Drivable.registerFunctions(vehicleType) end

--- Overrides getIsManualDirectionChangeAllowed, getMapHotspotRotation and setTransmissionDirection of other specializations.
---@param vehicleType any
function Drivable.registerOverwrittenFunctions(vehicleType) end

--- Declares the events onVehiclePhysicsUpdate and onCruiseControlSpeedChanged.
---@param vehicleType any
function Drivable.registerEvents(vehicleType) end

--- Subscribes to load, delete, dashboard value type registration, stream read/write, update, draw, action event registration, leave vehicle and set broken events.
---@param vehicleType any
function Drivable.registerEventListeners(vehicleType) end

--- Reads XML settings and initialises input, cruise control (max speeds default to the motor's maximum in km/h), steering wheel, idle turning wheels, force feedback state and the waterSplash sample. Restores cruise speeds and odometer from the savegame and creates the cruise control HUD extension.
---@param savegame table
function Drivable:onLoad(savegame) end

--- Registers the dashboard value types of the 'drivable' group: cruiseControl, cruiseControlReverse, cruiseControlActive, directionForward/Backward, movingDirection, acceleration and deceleration axes, steeringAngle, combined pedals and odometerMilage.
function Drivable:onRegisterDashboardValueTypes() end

--- Deletes the sound samples and the cruise control HUD extension.
function Drivable:onDelete() end

--- Saves the cruise control speed, the reverse cruise speed and the odometer value into the vehicle's savegame entry.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Drivable:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client join sync: if cruise control is enabled for the vehicle, reads its state (2 bits), forward and reverse speeds (8 bits each) and the odometer (float32).
---@param streamId integer
---@param connection Connection
function Drivable:onReadStream(streamId, connection) end

--- Server join sync: writes the same cruise control state, speeds and odometer that onReadStream reads, when cruise control is enabled.
---@param streamId integer
---@param connection Connection
function Drivable:onWriteStream(streamId, connection) end

--- Reads the networked forward and side axes (10 bits each, rescaled to -1..1 with tiny values zeroed), the handbrake flag and the idle turning flag.
---@param streamId integer
---@param timestamp integer
---@param connection table
function Drivable:onReadUpdateStream(streamId, timestamp, connection) end

--- When the drivable dirty flag is set, writes the quantised forward and side axes, the handbrake flag and the idle turning flag.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Drivable:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Main per-frame logic. Client: turns pedal, steering and cruise inputs into axisForward/axisSide (target speed, brakeToStop, idle turning, force feedback, gyroscope steering) and raises the dirty flag on change. Server: sets the motor speed limit from speed limit, cruise and idle turning, then calls updateVehiclePhysics. Also updates the steering wheel and odometer.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Drivable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Sets the cruise control state (off, active or full). Unless noEventSend is true it sends SetCruiseControlStateEvent to the server, or to the owner connection when called on the server. Updates the toggle action text.
---@param state integer
---@param noEventSend boolean
function Drivable:setCruiseControlState(state, noEventSend) end

--- Clamps and stores the cruise speed and optional reverse speed (km/h), drops FULL state back to ACTIVE if the speed changed, adjusts the motor speed limit and raises onCruiseControlSpeedChanged. Does nothing when speed is nil.
---@param speed number
---@param speedReverse number
function Drivable:setCruiseControlMaxSpeed(speed, speedReverse) end

--- Rotates the steering wheel node from rotatedTime, using the indoor rotation range when the local player is in an inside non-passenger camera, else the outdoor one. Marks the vehicle character dirty on change. Does nothing if the wheel is nil.
---@param steeringWheel any
---@param dt any
---@param direction any
function Drivable:updateSteeringWheel(steeringWheel, dt, direction) end

--- Returns the current cruise control state constant.
function Drivable:getCruiseControlState() end

--- Returns the cruise control speed in km/h, or the maximum speed when the state is FULL.
function Drivable:getCruiseControlSpeed() end

--- Returns the maximum selectable forward cruise control speed.
function Drivable:getCruiseControlMaxSpeed() end

--- Returns the cruise speed to show on the speedometer HUD (forward or reverse according to direction and reverser, max speed in FULL state) and whether cruise control is on.
---@return number
---@return boolean
function Drivable:getCruiseControlDisplayInfo() end

--- Returns the current forward axis value (-1 to 1).
function Drivable:getAxisForward() end

--- Returns the accelerator pedal position (0 to 1), taking the moving direction and reverser into account.
function Drivable:getAccelerationAxis() end

--- Returns the brake pedal position (0 to 1) shown by dashboards; it is zero when the vehicle is almost stopped or moving opposite to the input below a speed threshold.
function Drivable:getDecelerationAxis() end

--- Returns 1 if cruise control is not off, otherwise 0.
function Drivable:getCruiseControlAxis() end

--- Returns the forward axis multiplied by the reverser direction, as a signed pedal value.
function Drivable:getAcDecelerationAxis() end

--- Returns the steering position normalised by maxRotTime (and by the reverser direction), with special handling during idle turning. Used for the steeringAngle dashboard.
function Drivable:getDashboardSteeringAxis() end

--- Dashboard value for a combined left pedal: pedal axis minus the steering value, clamped to -1..1, or a signed pedal value while idle turning.
function Drivable:getDashboardCombinedPedalLeft() end

--- Dashboard value for a combined right pedal: pedal axis plus the steering value, clamped to -1..1, or the opposite signed value while idle turning.
function Drivable:getDashboardCombinedPedalRight() end

--- Stores the reverser direction (1 or -1) without any network event.
---@param reverserDirection any
function Drivable:setReverserDirection(reverserDirection) end

--- Returns the reverser direction (1 forward, -1 inverted).
function Drivable:getReverserDirection() end

--- Returns the steering direction factor (-1 inverts steering).
function Drivable:getSteeringDirection() end

--- Returns true when getDrivingDirection is zero or positive (so also true when standing still).
function Drivable:getIsDrivingForward() end

--- Returns true when getDrivingDirection is negative.
function Drivable:getIsDrivingBackward() end

--- Returns 0 when nearly stopped (or slow with no input), otherwise movingDirection times the reverser direction (+1 forward, -1 backward).
function Drivable:getDrivingDirection() end

--- Always returns true in this specialization; other specializations may override it.
function Drivable:getIsVehicleControlledByPlayer() end

--- Runs the registered check functions of attached vehicles (dropping stale ones) and returns false plus a warning text from the first that refuses, else true.
---@return boolean
---@return string
function Drivable:getIsPlayerVehicleControlAllowed() end

--- Registers a check function for a given vehicle, keyed by its network object id, to be consulted before the player can control this root vehicle.
---@param vehicle table
---@param func function
function Drivable:registerPlayerVehicleControlAllowedFunction(vehicle, func) end

--- Turns cruise control off without sending an event. It is not registered with registerFunctions in this file, so it is presumably called as a motor-stop hook from elsewhere: UNVERIFIED.
---@param noEventSend boolean
function Drivable:stopMotor(noEventSend) end

--- Client only: registers accelerate, brake, steer, cruise toggle and cruise level actions when the vehicle is entered and active (the first four skipped while an AI drives).
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Drivable:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Turns cruise control off, applies the brake if the vehicle has one, and releases force feedback when the player had entered it.
---@param wasEntered any
function Drivable:onLeaveVehicle(wasEntered) end

--- Client only: plays the waterSplash sound sample when the vehicle becomes broken.
function Drivable:onSetBroken() end

--- Server-side step: derives acceleration from the forward axis (engine on or off, cruise control forces 1), stops the motor if it cannot run, sets rotatedTime from the side axis when occupied and calls WheelsUtil.updateWheelsPhysics. Returns the acceleration.
---@param axisForward number
---@param axisSide number
---@param doHandbrake boolean
---@param dt number
function Drivable:updateVehiclePhysics(axisForward, axisSide, doHandbrake, dt) end

--- Stores the accelerator input clamped to 0..1 and cancels any target speed.
---@param inputValue any
function Drivable:setAccelerationPedalInput(inputValue) end

--- Stores the brake input clamped to 0..1 and cancels any target speed.
---@param inputValue any
function Drivable:setBrakePedalInput(inputValue) end

--- Sets a target speed and direction; speed is treated as a fraction of the motor's max forward or backward speed and converted to km/h. onUpdate then regulates the forward axis towards it.
---@param speed any
---@param direction any
function Drivable:setTargetSpeedAndDirection(speed, direction) end

--- Stores the steering input for this frame; analog flag and device category are kept only when the input is non-zero.
---@param inputValue any
---@param isAnalog any
---@param deviceCategory any
function Drivable:setSteeringInput(inputValue, isAnalog, deviceCategory) end

--- Requests automatic braking down to about 1 km/h, handled by onUpdate.
function Drivable:brakeToStop() end

--- Returns the steering angle for a wheel, replaced by the configured idle turning angle (plus pi if inverted) while idle turning is active and the wheel matches.
---@param wheel any
---@param dt any
---@param steeringAngle any
function Drivable:updateSteeringAngle(wheel, dt, steeringAngle) end

--- Override: returns false while idle turning is active, otherwise defers to the parent implementation.
---@param superFunc any
function Drivable:getIsManualDirectionChangeAllowed(superFunc) end

--- Override: adds 180 degrees (pi) to the map hotspot rotation when the reverser direction is inverted.
---@param superFunc any
---@param isPlayerHotspot any
function Drivable:getMapHotspotRotation(superFunc, isPlayerHotspot) end

--- Override: after the parent call, if the direction changed it swaps the forward and reverse max cruise speeds and applies the swapped cruise speeds.
---@param superFunc integer
---@param direction integer
function Drivable:setTransmissionDirection(superFunc, direction) end

--- Input callback for the accelerate axis: warns if unpowered, checks player control is allowed, then calls setAccelerationPedalInput.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Drivable.actionEventAccelerate(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback for the brake axis: warns if unpowered, checks player control is allowed, then calls setBrakePedalInput.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Drivable.actionEventBrake(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback for the steering axis: detects force feedback support on the binding and tracks the active device, then forwards non-zero input to setSteeringInput if control is allowed.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
---@param deviceCategory any
---@param binding any
function Drivable.actionEventSteer(self, actionName, inputValue, callbackState, isAnalog, isMouse, deviceCategory, binding) end

--- Input callback for the cruise toggle: when control is allowed, flags the toggle for onUpdate, otherwise shows the warning.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Drivable.actionEventCruiseControlState(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback for the cruise level axis: stores the raw input value for onUpdate.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Drivable.actionEventCruiseControlValue(self, actionName, inputValue, callbackState, isAnalog) end
