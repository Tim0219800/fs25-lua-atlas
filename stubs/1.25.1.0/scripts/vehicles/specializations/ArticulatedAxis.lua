---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ArticulatedAxis.lua (generated stub, FS25 Lua Atlas)

--- Specialization for vehicles that steer by bending a component joint (articulated loaders, dumpers, and similar). It requires Drivable. The XML under vehicle.articulatedAxis gives the joint index, rotation speed and limits, a rotation node, optional rotating visual parts, wheel lists and a steering sound. It extends the steering time limits, computes a maximum turning radius from the wheels, and overrides the curvature/radius conversions used by steering and AI. The joint is only physically rotated on the server; visuals and sound run on clients.
---@class ArticulatedAxis
ArticulatedAxis = {}

--- Returns true only if the vehicle type has the Drivable specialization.
---@param specializations table
---@return boolean
function ArticulatedAxis.prerequisitesPresent(specializations) end

--- Registers the vehicle.articulatedAxis XML keys (joint index, rotSpeed, rotMax, rotMin, anchorActor, rotNode, aiReverserNode, maxTurningRadius, custom wheel indices, rotatingPart entries) and the steering sound paths.
function ArticulatedAxis.initSpecialization() end

--- Overrides getSteeringRotTimeByCurvature, getTurningRadiusByRotTime and getAIReverserNode. The getAIReverserNode body is not in the dump (UNVERIFIED).
---@param vehicleType any
function ArticulatedAxis.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onDelete, onDeactivate and onUpdate.
---@param vehicleType any
function ArticulatedAxis.registerEventListeners(vehicleType) end

--- Reads the axis settings (component joint index starts at 1) and rotating parts, then widens the vehicle's min/max steering time. It sets maxRotation and wheelSteeringDuration and estimates maxTurningRadius from wheel and joint angles, unless the XML overrides it. Warns if fewer than 2 wheels are found per component. Loads the steering sound on clients.
---@param savegame table
function ArticulatedAxis:onLoad(savegame) end

--- If a component joint is configured, calls updateArticulatedAxisRotation (when defined) once with angle 0 and a large dt. Otherwise removes the onUpdate listener.
function ArticulatedAxis:onPostLoad() end

--- On clients, deletes the loaded steering samples.
function ArticulatedAxis:onDelete() end

--- On clients, stops the steering sound and resets its playing flag.
function ArticulatedAxis:onDeactivate() end

--- Each frame converts rotatedTime into a clamped steering angle (optionally filtered by updateArticulatedAxisRotation), plays or stops the steering sound, and tracks an interpolated time for the camera. On change the server rotates the joint node and updates the component joint frame, and clients interpolate the rotating parts.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function ArticulatedAxis:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Override: converts a path curvature into a steering time using wheelSteeringDuration, an arctangent mapping and maxTurningRadius.
---@param superFunc any
---@param curvature any
function ArticulatedAxis:getSteeringRotTimeByCurvature(superFunc, curvature) end

--- Override: converts a steering time into a signed turning radius (1/curvature, math.huge when straight). Defers to the parent if there is no component joint or the rotation speed is 0.
---@param superFunc any
---@param rotTime any
function ArticulatedAxis:getTurningRadiusByRotTime(superFunc, rotTime) end
