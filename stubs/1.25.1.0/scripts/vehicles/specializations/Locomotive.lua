---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Locomotive.lua (generated stub, FS25 Lua Atlas)

--- Specialization for railroad locomotives running on a spline. Requires SplineVehicle and Drivable. It holds a state machine (automatic travel, manual active/inactive, requested position, braking toward a position), replaces the vehicle physics with a simple 1D speed model (tractive effort, brake force, slope force), fakes engine RPM for the HUD, and can move a power arm toward an electricity spline. Server runs the physics; the state is broadcast with `LocomotiveStateEvent`. The `Locomotive.STATE_*` constants are defined outside this file (UNVERIFIED where).
---@class Locomotive
Locomotive = {}

--- Returns true only if both SplineVehicle and Drivable specializations are present.
---@param specializations table
---@return boolean
function Locomotive.prerequisitesPresent(specializations) end

--- Registers the XML path `vehicle.locomotive.powerArm#node`.
function Locomotive.initSpecialization() end

--- Registers the specialization event `onAutomatedTrainTravelActive`, raised every update during automatic travel on the server.
---@param vehicleType any
function Locomotive.registerEvents(vehicleType) end

--- Registers the slope force, speed, requested position, state and automated travel functions on the vehicle type.
---@param vehicleType any
function Locomotive.registerFunctions(vehicleType) end

--- Overrides motor state, physics, train system, name, sounds, stats, enterability, map hotspot, reset, stop-on-leave and real RPM functions.
---@param vehicleType any
function Locomotive.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onReadStream, onWriteStream, onUpdate, onLeaveVehicle and onEnterVehicle.
---@param vehicleType any
function Locomotive.registerEventListeners(vehicleType) end

--- Loads the power arm node, sets `serverMass` to 1 to avoid divisions by zero, initialises speed and RPM state, sets the idle state and subscribes to player farm changed and player created messages.
---@param savegame table
function Locomotive:onLoad(savegame) end

--- Unsubscribes from all message center messages.
function Locomotive:onDelete() end

--- Client join: reads the locomotive state directly from the stream.
---@param streamId integer
---@param connection Connection
function Locomotive:onReadStream(streamId, connection) end

--- Server join: writes the locomotive state to the stream.
---@param streamId integer
---@param connection Connection
function Locomotive:onWriteStream(streamId, connection) end

--- Once a train system exists, starts automatic travel or manual state (if rented). On the server drives the physics each frame for automatic travel, requested position (with braking-point computation), braking, and inactive manual state; clients only keep the vehicle active.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Locomotive:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Override: after the parent, prepares the electricity spline data (length difference and search time) used to position the power arm, if the arm and spline exist.
---@param superFunc any
---@param trainSystem any
function Locomotive:setTrainSystem(superFunc, trainSystem) end

--- Override: returns the store item name for this vehicle's config file (the call is not nil-checked).
---@param superFunc any
function Locomotive:getFullName(superFunc) end

--- Override: surface sounds are active when the last speed exceeds 0.1.
---@param superFunc any
function Locomotive:getAreSurfaceSoundsActive(superFunc) end

--- Override: distance statistics count only in the manual travel active state.
---@param superFunc any
function Locomotive:getTraveledDistanceStatsActive(superFunc) end

--- Override: enterable only if the parent allows it, the train is within driveable range, and the state is manual (active or inactive).
---@param superFunc any
function Locomotive:getIsEnterable(superFunc) end

--- Override: hotspot is visible only if the parent allows it, the train is in driveable range and its position lies inside the terrain bounds.
---@param superFunc any
function Locomotive:getIsMapHotspotVisible(superFunc) end

--- Override: returns the train position from the train system, or 0, 0, 0 without one.
---@param superFunc any
function Locomotive:getMapHotspotPosition(superFunc) end

--- Override: returns the simulated (virtual) RPM value instead of a real engine value.
---@param superFunc any
function Locomotive:getMotorRpmReal(superFunc) end

--- Sets a target spline position (0 to 1, wrapped to the nearer lap), switches to the requested position state and starts the motor on the server. `noEventSend` is accepted but unused.
---@param splinePosition any
---@param noEventSend any
function Locomotive:setRequestedSplinePosition(splinePosition, noEventSend) end

--- Returns the remaining distance to the requested position in spline length units while moving or braking toward it, 0 otherwise or if the position was overshot.
function Locomotive:getDistanceToRequestedPosition() end

--- Sets the state; entering automatic travel picks a random vehicle character and manual active restores it. On the server it broadcasts `LocomotiveStateEvent` unless `noEventSend` is set.
---@param state any
---@param noEventSend any
function Locomotive:setLocomotiveState(state, noEventSend) end

--- Switches to automatic travel and starts the motor.
function Locomotive:startAutomatedTrainTravel() end

--- Message callback: makes the locomotive tabbable only when the train is rented by the local player's farm.
function Locomotive:notifyPlayerFarmChanged() end

--- Unless in automatic travel, schedules an automatic-drive start time if ready, sets the manual inactive state and clears any requested position.
function Locomotive:onLeaveVehicle() end

--- Clears requested position and scheduled start, restarts the motor if automatic motor start is off and the train was moving by itself, then sets manual active state.
function Locomotive:onEnterVehicle() end

--- Override: not ready while a player controls the locomotive; otherwise defers to the parent.
---@param superFunc any
function Locomotive:getIsReadyForAutomatedTrainTravel(superFunc) end

--- Override: the motor counts as started also in automatic travel, requested position and requested position braking states.
---@param superFunc any
function Locomotive:getIsMotorStarted(superFunc) end

--- Returns the force along the track from gravity (server mass times 9.81 times the sine of the slope angle, positive when pointing downhill).
function Locomotive:getDownhillForce() end

--- Returns the simulated locomotive speed (m/s, sign gives direction).
function Locomotive:getLocomotiveSpeed() end

--- Helper (called with the vehicle): returns the deceleration with brake force (18 percent of weight, much weaker while driven at speed) plus slope force. Uses 95 percent of the slope force if the sum is near zero.
---@param self any
function Locomotive.getBrakeAcceleration(self) end

--- Override: calls the parent, then updates the simulated speed from tractive effort (capped at 300000 and at the brake force), braking, slope and cruise control, clamps it to the motor limits and updates a fake RPM pushed to the motor.
---@param superFunc any
---@param axisForward any
---@param axisSide any
---@param doHandbrake any
---@param dt any
function Locomotive:updateVehiclePhysics(superFunc, axisForward, axisSide, doHandbrake, dt) end

--- Override: after the parent, when the power arm is within 50 m of the active camera, snaps its height to the closest point on the electricity spline. Clients also refresh the map hotspot.
---@param superFunc any
---@param spline any
---@param yOffset any
---@param tFront any
function Locomotive:alignToSplineTime(superFunc, spline, yOffset, tFront) end

--- Override: always false, locomotives cannot be reset.
---@param superFunc any
function Locomotive:getCanBeReset(superFunc) end

--- Override: the motor stops on leaving only in the manual states.
---@param superFunc any
function Locomotive:getStopMotorOnLeave(superFunc) end
