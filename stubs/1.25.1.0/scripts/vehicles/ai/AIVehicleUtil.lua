---@meta
-- FS25 1.25.1.0 : vehicles/ai/AIVehicleUtil.lua (generated stub, FS25 Lua Atlas)

--- Static helper table with the low-level routines the AI uses to steer vehicles and to query the land around implements: driving toward a point, along a curvature or in a direction, turn radius and reverse permissions of attached tools, marker inversion, turn-side validity checks, and field-crop or density-height area queries. Some functions draw debug lines when VehicleDebug is in AI mode.
---@class AIVehicleUtil
AIVehicleUtil = {}

--- Steers the vehicle toward a local target (tX, tZ): computes steering from the circle through the target, smooths rotatedTime, lowers speed with steering error, sets the motor speed limit, enables cruise control and applies wheel physics. Does nothing before the first update.
---@param self table
---@param dt number
---@param acceleration number
---@param allowedToDrive boolean
---@param moveForwards boolean
---@param tX number
---@param tZ number
---@param maxSpeed number
---@param doNotSteer boolean?
function AIVehicleUtil.driveToPoint(self, dt, acceleration, allowedToDrive, moveForwards, tX, tZ, maxSpeed, doNotSteer) end

--- Sets the steering directly from a curvature value, applies the speed limit and cruise control and updates wheel physics; acceleration is cut when maxSpeed is not positive. Wheel part only after the first update.
---@param self any
---@param dt any
---@param curvature any
---@param maxSpeed any
---@param acceleration any
function AIVehicleUtil.driveAlongCurvature(self, dt, curvature, maxSpeed, acceleration) end

--- Steers toward a normalised local direction (lx, lz): steering is proportional to the angle up to steeringAngleLimit, speed or acceleration is reduced above slowAngleLimit, cruise control is enabled when a speed limit is given, then wheel physics run.
---@param self table
---@param dt number
---@param steeringAngleLimit number
---@param acceleration number
---@param slowAcceleration number
---@param slowAngleLimit number
---@param allowedToDrive boolean
---@param moveForwards boolean
---@param lx number
---@param lz number
---@param maxSpeed number
---@param slowDownFactor number
function AIVehicleUtil.driveInDirection(self, dt, steeringAngleLimit, acceleration, slowAcceleration, slowAngleLimit, allowedToDrive, moveForwards, lx, lz, maxSpeed, slowDownFactor) end

--- Converts a world position into the local space of refNode and returns the normalised x and z direction (lx, lz) toward it.
---@param refNode integer
---@param x number
---@param y number
---@param z number
---@return number
---@return number
function AIVehicleUtil.getDriveDirection(refNode, x, y, z) end

--- Same as getDriveDirection but toward the midpoint of two world positions. Returns the normalised lx, lz and the distance to that midpoint in local x-z.
---@param refNode integer
---@param x number
---@param y number
---@param z number
---@param x2 number
---@param y2 number
---@param z2 number
---@return number
---@return number
function AIVehicleUtil.getAverageDriveDirection(refNode, x, y, z, x2, y2, z2) end

--- Recursively checks the vehicle and its attached implements; returns false if any getAIAllowTurnBackward reports false, true otherwise.
---@param vehicle table
---@return boolean
function AIVehicleUtil.getAttachedImplementsAllowTurnBackward(vehicle) end

--- Recursively checks the vehicle and its attached implements; returns true as soon as one getAIBlockTurnBackward reports true, false otherwise.
---@param vehicle table
---@return boolean
function AIVehicleUtil.getAttachedImplementsBlockTurnBackward(vehicle) end

--- Recursively takes the largest turn radius limitation (getAITurnRadiusLimitation) among attached implements. Returns -1 when none defines one.
---@param vehicle any
function AIVehicleUtil.getAttachedImplementsMaxTurnRadius(vehicle) end

--- Searches attached implements, recursively, for the first AI tool reverser direction node and returns it, or nil if none exists.
---@param vehicle table
---@return integer?
function AIVehicleUtil.getAIToolReverserDirectionNode(vehicle) end

--- Estimates the maximum turn radius of an implement from its wheel positions, rotation limits of the attacher or component joint and steering axle, merged with the manual radius of the root vehicle tree. Logs a warning if the rotation node matches no joint.
---@param implement table
---@return number
function AIVehicleUtil.getMaxToolRadius(implement) end

--- Compares the x positions of the left and right AI markers of a vehicle in the AI direction node space of the root attacher vehicle, and calls setAIMarkersInverted if the right marker has the larger x.
---@param rootAttacherVehicle table
---@param vehicle table
function AIVehicleUtil.updateInvertLeftRightMarkers(rootAttacherVehicle, vehicle) end

--- Samples work area to the left and right ahead of the implements (using getAIAreaOfVehicle) and returns the average left and right area ratios used to pick a turn side. Draws debug lines in AI debug mode. Note: turnData is optional (marker width is used without it) and the average divides by the implement count.
---@param vehicle table
---@param turnData table
---@return number
---@return number
function AIVehicleUtil.getValidityOfTurnDirections(vehicle, turnData) end

--- Builds the six values (start, width, height corners) of a parallelogram from left and right nodes, offsets and a direction vector, shifted back by half a meter at the start. Returns sX, sZ, wX, wZ, hX, hZ.
---@param directionX any
---@param directionZ any
---@param leftNode any
---@param rightNode any
---@param xOffset any
---@param zOffset any
---@param areaSize any
---@param invertXOffset any
function AIVehicleUtil.getAreaDimensions(directionX, directionZ, leftNode, rightNode, xOffset, zOffset, areaSize, invertXOffset) end

--- Returns true if the area center is on land owned by the vehicle's AI job farm, or if a mission allows work there for that farm; false otherwise.
---@param vehicle any
---@param sX any
---@param sZ any
---@param wX any
---@param wZ any
---@param hX any
---@param hZ any
function AIVehicleUtil.getIsAreaOwned(vehicle, sX, sZ, wX, wZ, hX, hZ) end

--- Returns (area, totalArea) of workable ground for the vehicle in a parallelogram: uses density height requirements if the vehicle defines any, else its field crops query (0, 0 if invalid).
---@param vehicle table
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return number
---@return number
function AIVehicleUtil.getAIAreaOfVehicle(vehicle, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

--- Converts the corner points to x, z, width, height form and returns the result of the crops query's getParallelogram (area, total area).
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param query table
---@return number
---@return number
function AIVehicleUtil.getAIFruitArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, query) end

--- Returns (area, totalArea) of the required fill types on the density height map in the parallelogram; returns 0, 0 when the zone is not a field. Sums areas over requirements with a known fill type.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param densityHeightTypeRequirements boolean
---@return number
---@return number
function AIVehicleUtil.getAIDensityHeightArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, densityHeightTypeRequirements) end
