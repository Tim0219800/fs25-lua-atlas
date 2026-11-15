---@meta
-- FS25 1.25.1.0 : vehicles/VehicleMotor.lua (generated stub, FS25 Lua Atlas)

---@class VehicleMotor
VehicleMotor = {}

---@param vehicle integer
---@param minRpm integer
---@param maxRpm integer
---@param maxForwardSpeed number
---@param maxBackwardSpeed number
---@param torqueCurve table
---@param brakeForce number
---@param forwardGears number
---@param backwardGears number
---@param minForwardGearRatio number
---@param maxForwardGearRatio number
---@param minBackwardGearRatio number
---@param maxBackwardGearRatio number
---@param ptoMotorRpmRatio integer
---@param minSpeed any
---@return table
function VehicleMotor.new(vehicle, minRpm, maxRpm, maxForwardSpeed, maxBackwardSpeed, torqueCurve, brakeForce, forwardGears, backwardGears, minForwardGearRatio, maxForwardGearRatio, minBackwardGearRatio, maxBackwardGearRatio, ptoMotorRpmRatio, minSpeed) end

---@param savegame table
function VehicleMotor:postLoad(savegame) end

function VehicleMotor:delete() end

---@param gearGroups table
---@param groupType any
---@param groupChangeTime any
function VehicleMotor:setGearGroups(gearGroups, groupType, groupChangeTime) end

---@param directionChangeUseGear table
---@param directionChangeGearIndex any
---@param directionChangeUseGroup any
---@param directionChangeGroupIndex any
---@param directionChangeTime any
function VehicleMotor:setDirectionChange(directionChangeUseGear, directionChangeGearIndex, directionChangeUseGroup, directionChangeGroupIndex, directionChangeTime) end

---@param manualShiftGears boolean
---@param manualShiftGroups boolean
function VehicleMotor:setManualShift(manualShiftGears, manualShiftGroups) end

---@param startGearThreshold number
function VehicleMotor:setStartGearThreshold(startGearThreshold) end

---@param lowBrakeForceScale number
---@param lowBrakeForceSpeedLimit number
function VehicleMotor:setLowBrakeForce(lowBrakeForceScale, lowBrakeForceSpeedLimit) end

---@return number
function VehicleMotor:getMaxClutchTorque() end

---@return number
function VehicleMotor:getRotInertia() end

---@param rotInertia number
function VehicleMotor:setRotInertia(rotInertia) end

---@return number
function VehicleMotor:getDampingRateFullThrottle() end

---@return number
function VehicleMotor:getDampingRateZeroThrottleClutchEngaged() end

---@return number
function VehicleMotor:getDampingRateZeroThrottleClutchDisengaged() end

---@param dampingRateScale number
function VehicleMotor:setDampingRateScale(dampingRateScale) end

---@param gearChangeTime number
function VehicleMotor:setGearChangeTime(gearChangeTime) end

---@param autoGearChangeTime number
function VehicleMotor:setAutoGearChangeTime(autoGearChangeTime) end

---@return number
function VehicleMotor:getPeakTorque() end

---@return number
function VehicleMotor:getBrakeForce() end

---@return number
function VehicleMotor:getMinRpm() end

---@return number
function VehicleMotor:getMaxRpm() end

---@return number
---@return number
function VehicleMotor:getRequiredMotorRpmRange() end

---@return number
function VehicleMotor:getLastMotorRpm() end

---@return number
function VehicleMotor:getLastModulatedMotorRpm() end

---@return number
function VehicleMotor:getLastRealMotorRpm() end

---@return number
function VehicleMotor:getSmoothLoadPercentage() end

---@return number
function VehicleMotor:getClutchPedal() end

---@return number
function VehicleMotor:getSmoothedClutchPedal() end

---@return number
function VehicleMotor:getManualClutchPedal() end

---@param isDashboard any
---@return string
function VehicleMotor:getGearToDisplay(isDashboard) end

---@return string
---@return boolean
---@return boolean
---@return string
---@return string
---@return string
---@return string
---@return boolean
function VehicleMotor:getGearInfoToDisplay() end

function VehicleMotor:getDrivingDirection() end

---@param isDashboard any
---@return string
---@return boolean
function VehicleMotor:getGearGroupToDisplay(isDashboard) end

---@param streamId any
function VehicleMotor:readGearDataFromStream(streamId) end

---@param streamId any
function VehicleMotor:writeGearDataToStream(streamId) end

---@param lastRpm number
function VehicleMotor:setLastRpm(lastRpm) end

---@return number
function VehicleMotor:getMotorAppliedTorque() end

---@return number
function VehicleMotor:getMotorExternalTorque() end

---@return number
function VehicleMotor:getMotorAvailableTorque() end

---@return number
function VehicleMotor:getEqualizedMotorRpm() end

---@param rpm number
function VehicleMotor:setEqualizedMotorRpm(rpm) end

---@return number
function VehicleMotor:getPtoMotorRpmRatio() end

---@param externalTorqueVirtualMultiplicator any
---@return number
function VehicleMotor:setExternalTorqueVirtualMultiplicator(externalTorqueVirtualMultiplicator) end

---@return number
function VehicleMotor:getNonClampedMotorRpm() end

---@return number
function VehicleMotor:getMotorRotSpeed() end

---@return number
function VehicleMotor:getClutchRpm() end

---@return number
function VehicleMotor:getClutchRotSpeed() end

---@return table
function VehicleMotor:getTorqueCurve() end

---@param acceleration number
---@return number
function VehicleMotor:getTorque(acceleration) end

---@param rpm number
---@return number
function VehicleMotor:getTorqueCurveValue(rpm) end

function VehicleMotor:getTorqueAndSpeedValues() end

---@return number
function VehicleMotor:getMaximumForwardSpeed() end

---@return number
function VehicleMotor:getMaximumBackwardSpeed() end

---@return number
function VehicleMotor:calculatePhysicalMaximumForwardSpeed() end

---@return number
function VehicleMotor:calculatePhysicalMaximumBackwardSpeed() end

---@param minGearRatio number
---@param gears table
---@param maxRpm integer
---@return number
function VehicleMotor.calculatePhysicalMaximumSpeed(minGearRatio, gears, maxRpm) end

---@param dt number
function VehicleMotor:update(dt) end

---@param dt number
---@param rawLoadPercentage number
function VehicleMotor:updateSmoothLoadPercentage(dt, rawLoadPercentage) end

---@param dt table
---@return integer
function VehicleMotor:updateStartGearValues(dt) end

---@param gears table
---@return integer
function VehicleMotor:getBestStartGear(gears) end

---@param ratio number
---@return number
function VehicleMotor:getRequiredRpmAtSpeedLimit(ratio) end

---@param ratio number
---@return number
function VehicleMotor:getStartInGearFactor(ratio) end

---@param wheelSpeedRpm number
---@param minRatio number
---@param maxRatio number
---@param accSafeMotorRpm number
---@param requiredMotorPower number
---@param requiredMotorRpm number
---@return number
function VehicleMotor:getBestGearRatio(wheelSpeedRpm, minRatio, maxRatio, accSafeMotorRpm, requiredMotorPower, requiredMotorRpm) end

---@param acceleration number
---@param wheelSpeedRpm number
---@param accSafeMotorRpm number
---@param requiredMotorPower number
---@param requiredMotorRpm number
---@return number
---@return number
function VehicleMotor:getBestGear(acceleration, wheelSpeedRpm, accSafeMotorRpm, requiredMotorPower, requiredMotorRpm) end

---@param curGear any
---@param gears any
---@param gearSign any
---@param gearChangeTimer any
---@param acceleratorPedal any
---@param dt any
function VehicleMotor:findGearChangeTargetGearPrediction(curGear, gears, gearSign, gearChangeTimer, acceleratorPedal, dt) end

function VehicleMotor:applyTargetGear() end

---@param acceleratorPedal number
---@param brakePedal any
---@param dt any
---@return number
function VehicleMotor:updateGear(acceleratorPedal, brakePedal, dt) end

---@param up any
function VehicleMotor:shiftGear(up) end

---@param gearIndex any
---@param activation any
function VehicleMotor:selectGear(gearIndex, activation) end

---@param gearIndex any
---@param isLocked any
function VehicleMotor:setGear(gearIndex, isLocked) end

---@param up any
function VehicleMotor:shiftGroup(up) end

---@param groupIndex any
---@param activation any
function VehicleMotor:selectGroup(groupIndex, activation) end

---@param groupIndex any
---@param isLocked any
function VehicleMotor:setGearGroup(groupIndex, isLocked) end

---@param direction any
---@param force any
function VehicleMotor:changeDirection(direction, force) end

---@param clutchValue number
function VehicleMotor:onManualClutchChanged(clutchValue) end

---@return boolean
function VehicleMotor:getIsGearChangeAllowed() end

---@return boolean
function VehicleMotor:getIsGearGroupChangeAllowed() end

---@param direction integer
function VehicleMotor:setTransmissionDirection(direction) end

---@return number
---@return number
function VehicleMotor:getMinMaxGearRatio() end

function VehicleMotor:getGearRatio() end

---@return number
function VehicleMotor:getGearRatioMultiplier() end

function VehicleMotor:getIsInNeutral() end

function VehicleMotor:getCanMotorRun() end

---@return integer
function VehicleMotor:getCurMaxRpm() end

---@param limit number
function VehicleMotor:setSpeedLimit(limit) end

function VehicleMotor:getSpeedLimit() end

---@param accelerationLimit any
function VehicleMotor:setAccelerationLimit(accelerationLimit) end

function VehicleMotor:getAccelerationLimit() end

---@param rpmLimit number
function VehicleMotor:setRpmLimit(rpmLimit) end

---@param limit any
function VehicleMotor:setMotorRotationAccelerationLimit(limit) end

function VehicleMotor:getMotorRotationAccelerationLimit() end

---@param directionChangeMode any
function VehicleMotor:setDirectionChangeMode(directionChangeMode) end

---@param gearShiftMode any
function VehicleMotor:setGearShiftMode(gearShiftMode) end

function VehicleMotor:getUseAutomaticGearShifting() end

function VehicleMotor:getUseAutomaticGroupShifting() end
