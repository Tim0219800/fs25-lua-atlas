---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SplineVehicle.lua (generated stub, FS25 Lua Atlas)

--- Specialization for vehicles that only move along a spline (the train wagons and locomotives). It reads the front/back nodes and the two dollies, measures their distances, and lets the train system (`self.trainSystem`, set through `setTrainSystem`) place the vehicle along the rail spline with `alignToSplineTime`. It overrides speed, surface sound and discharge activation. The TrainSystem class is not in the dump, so its behaviour is UNVERIFIED. Note: `setSplineSpeed` is registered as a vehicle function but no function of that name is defined in this file.
---@class SplineVehicle
SplineVehicle = {}

--- Always returns true: no other specialization is required.
---@param specializations table
---@return boolean
function SplineVehicle.prerequisitesPresent(specializations) end

--- Declares the XML schema for `vehicle.splineVehicle.dollies` (front/back nodes, the two dolly nodes, align flag) and the `needsIsEntered` attribute on discharge nodes (also per configuration).
function SplineVehicle.initSpecialization() end

--- Registers `getFrontToBackDistance`, `getSplineTimeFromDistance`, `getSplinePositionAndTimeFromDistance`, `alignToSplineTime`, `getCurrentSplinePosition` and `setSplineSpeed`.
---@param vehicleType any
function SplineVehicle.registerFunctions(vehicleType) end

--- Overrides `getLastSpeed`, `setTrainSystem`, `getCurrentSurfaceSound`, `getAreSurfaceSoundsActive`, `getIsDischargeNodeActive` and `loadDischargeNode`.
---@param vehicleType any
function SplineVehicle.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad and onUpdate.
---@param vehicleType any
function SplineVehicle.registerEventListeners(vehicleType) end

--- Reads the front, back and dolly nodes, computes their distances (front to back, dolly to dolly, root to each end) with `calcDistanceFrom`, reads the align flag and zeroes the spline position and speed state.
---@param savegame table
function SplineVehicle:onLoad(savegame) end

--- If a train system is set, asks it to update the railroad vehicle positions with `updateRailroadVehiclePositions(dt)`.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function SplineVehicle:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Calls the parent, then converts the vehicle's measured distances into spline time fractions using the spline length from the train system.
---@param superFunc any
---@param trainSystem any
function SplineVehicle:setTrainSystem(superFunc, trainSystem) end

--- Returns the current spline position (time value) of the vehicle.
function SplineVehicle:getCurrentSplinePosition() end

--- Returns the distance between the front and back nodes, measured at load.
function SplineVehicle:getFrontToBackDistance() end

--- Returns the valid spline time reached by moving a given distance from spline time `t`; direction forward if `stepSize` is not negative. Returns nothing without a train system.
---@param t any
---@param distance any
---@param stepSize any
function SplineVehicle:getSplineTimeFromDistance(t, distance, stepSize) end

--- Same as `getSplineTimeFromDistance` but returns the x, y, z spline position and the valid spline time. Returns nothing without a train system.
---@param t any
---@param distance any
---@param stepSize any
function SplineVehicle:getSplinePositionAndTimeFromDistance(t, distance, stepSize) end

--- Places the vehicle on the spline from the front spline time: derives the moving direction, positions the root from the front and dolly points, sets orientation, feeds the network interpolators, aligns the dolly nodes, stores the position and returns the spline time of the back node. Note: it reads `spec.trainSystem` for the spline length, while the rest of the file uses `self.trainSystem`, so this looks like a bug (UNVERIFIED which one is set).
---@param spline any
---@param yOffset any
---@param tFront any
function SplineVehicle:alignToSplineTime(spline, yOffset, tFront) end

--- Returns the absolute spline speed converted to km/h (spline position speed times 3.6), ignoring the parent.
---@param superFunc any
---@param useAttacherVehicleSpeed any
function SplineVehicle:getLastSpeed(superFunc, useAttacherVehicleSpeed) end

--- Returns the wheel surface sound registered under "railroad".
function SplineVehicle:getCurrentSurfaceSound() end

--- Delegates to the root vehicle when this is not the root (so only the train head decides); otherwise returns true.
---@param superFunc any
function SplineVehicle:getAreSurfaceSoundsActive(superFunc) end

--- Calls the parent and additionally reads `needsIsEntered` (default true) onto the discharge node entry.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function SplineVehicle:loadDischargeNode(superFunc, xmlFile, key, entry) end

--- For nodes that need the vehicle to be entered, returns false while the root vehicle is not controlled; otherwise defers to the parent.
---@param superFunc any
---@param dischargeNode any
function SplineVehicle:getIsDischargeNodeActive(superFunc, dischargeNode) end
