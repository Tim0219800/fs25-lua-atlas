---@meta
-- FS25 1.25.1.0 : vehicles/ai/AIVehicleUtil.lua (generated stub, FS25 Lua Atlas)

---@class AIVehicleUtil
AIVehicleUtil = {}

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

---@param self any
---@param dt any
---@param curvature any
---@param maxSpeed any
---@param acceleration any
function AIVehicleUtil.driveAlongCurvature(self, dt, curvature, maxSpeed, acceleration) end

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

---@param refNode integer
---@param x number
---@param y number
---@param z number
---@return number
---@return number
function AIVehicleUtil.getDriveDirection(refNode, x, y, z) end

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

---@param vehicle table
---@return boolean
function AIVehicleUtil.getAttachedImplementsAllowTurnBackward(vehicle) end

---@param vehicle table
---@return boolean
function AIVehicleUtil.getAttachedImplementsBlockTurnBackward(vehicle) end

---@param vehicle any
function AIVehicleUtil.getAttachedImplementsMaxTurnRadius(vehicle) end

---@param vehicle table
---@return integer?
function AIVehicleUtil.getAIToolReverserDirectionNode(vehicle) end

---@param implement table
---@return number
function AIVehicleUtil.getMaxToolRadius(implement) end

---@param rootAttacherVehicle table
---@param vehicle table
function AIVehicleUtil.updateInvertLeftRightMarkers(rootAttacherVehicle, vehicle) end

---@param vehicle table
---@param turnData table
---@return number
---@return number
function AIVehicleUtil.getValidityOfTurnDirections(vehicle, turnData) end

---@param directionX any
---@param directionZ any
---@param leftNode any
---@param rightNode any
---@param xOffset any
---@param zOffset any
---@param areaSize any
---@param invertXOffset any
function AIVehicleUtil.getAreaDimensions(directionX, directionZ, leftNode, rightNode, xOffset, zOffset, areaSize, invertXOffset) end

---@param vehicle any
---@param sX any
---@param sZ any
---@param wX any
---@param wZ any
---@param hX any
---@param hZ any
function AIVehicleUtil.getIsAreaOwned(vehicle, sX, sZ, wX, wZ, hX, hZ) end

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
