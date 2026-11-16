---@meta
-- FS25 1.25.1.0 : vehicles/VehicleMotor.lua (generated stub, FS25 Lua Atlas)

--- Per-vehicle motor and transmission model used by the Motorized specialization. It holds the torque curve, RPM range, speed limits, forward/backward gears, optional gear groups and direction-change modes, and each update reads the motor rotation speed and torque from the engine. It computes smoothed load, picks start gears and automatic shifts, supports manual and manual-clutch shifting, and raises vehicle events such as `onGearChanged`. Gear state is synchronized with the stream functions; the tuning constants (`VehicleMotor.*`, `MODULATION_*`) are defined outside the functions shown (UNVERIFIED).
---@class VehicleMotor
VehicleMotor = {}

--- Creates the motor for a vehicle from RPM range, speed limits, torque curve, brake force, gear tables and gear ratio ranges. It initializes all timers and limits, derives peak torque and peak power from the curve, and reads direction-change and gear-shift modes from game settings.
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

--- Post-load step: if gear groups exist, raises `onGearGroupChanged` for the active group so listeners get the initial state. The savegame argument is unused.
---@param savegame table
function VehicleMotor:postLoad(savegame) end

--- Unsubscribes the motor from all message center subscriptions.
function VehicleMotor:delete() end

--- Sets the gear groups, their transmission type and change time, then picks the default group (first group with positive ratio, overridden by one flagged as default) as active group.
---@param gearGroups table
---@param groupType any
---@param groupChangeTime any
function VehicleMotor:setGearGroups(gearGroups, groupType, groupChangeTime) end

--- Configures how forward/backward direction changes work: via a backward gear, via a group, or by inverting the forward gears, plus the change time.
---@param directionChangeUseGear table
---@param directionChangeGearIndex any
---@param directionChangeUseGroup any
---@param directionChangeGroupIndex any
---@param directionChangeTime any
function VehicleMotor:setDirectionChange(directionChangeUseGear, directionChangeGearIndex, directionChangeUseGroup, directionChangeGroupIndex, directionChangeTime) end

--- Sets whether gears and gear groups are shifted manually.
---@param manualShiftGears boolean
---@param manualShiftGroups boolean
function VehicleMotor:setManualShift(manualShiftGears, manualShiftGroups) end

--- Sets the factor threshold used when choosing a suitable start gear.
---@param startGearThreshold number
function VehicleMotor:setStartGearThreshold(startGearThreshold) end

--- Sets the brake force scale and the speed limit below which the low-speed automatic braking applies.
---@param lowBrakeForceScale number
---@param lowBrakeForceSpeedLimit number
function VehicleMotor:setLowBrakeForce(lowBrakeForceScale, lowBrakeForceSpeedLimit) end

--- Returns the maximum torque the clutch can transfer (default 5).
---@return number
function VehicleMotor:getMaxClutchTorque() end

--- Returns the motor rotational inertia.
---@return number
function VehicleMotor:getRotInertia() end

--- Sets the motor rotational inertia.
---@param rotInertia number
function VehicleMotor:setRotInertia(rotInertia) end

--- Returns the motor damping rate at full throttle.
---@return number
function VehicleMotor:getDampingRateFullThrottle() end

--- Returns the damping rate at zero throttle with the clutch engaged.
---@return number
function VehicleMotor:getDampingRateZeroThrottleClutchEngaged() end

--- Returns the damping rate at zero throttle with the clutch disengaged.
---@return number
function VehicleMotor:getDampingRateZeroThrottleClutchDisengaged() end

--- Scales all three damping rates relative to their default constants.
---@param dampingRateScale number
function VehicleMotor:setDampingRateScale(dampingRateScale) end

--- Sets the gear change duration. A time of 0 marks the transmission as powershift, any other value as default.
---@param gearChangeTime number
function VehicleMotor:setGearChangeTime(gearChangeTime) end

--- Sets the minimum delay between automatic gear changes and clamps the running timer to it.
---@param autoGearChangeTime number
function VehicleMotor:setAutoGearChangeTime(autoGearChangeTime) end

--- Returns the maximum torque of the torque curve.
---@return number
function VehicleMotor:getPeakTorque() end

--- Returns the configured brake force.
---@return number
function VehicleMotor:getBrakeForce() end

--- Returns the minimum (idle) RPM.
---@return number
function VehicleMotor:getMinRpm() end

--- Returns the maximum RPM.
---@return number
function VehicleMotor:getMaxRpm() end

--- Returns min and max RPM the motor must run at: the lower bound is raised to the PTO-driven RPM when a PTO consumer demands it, otherwise it is idle RPM.
---@return number
---@return number
function VehicleMotor:getRequiredMotorRpmRange() end

--- Returns the smoothed motor RPM last stored by `setLastRpm`.
---@return number
function VehicleMotor:getLastMotorRpm() end

--- Returns the smoothed RPM plus a load-dependent oscillation and minus a drop after load increases. Intended for cosmetic use such as sound; returns 0 when the RPM is 0.
---@return number
function VehicleMotor:getLastModulatedMotorRpm() end

--- Returns the unsmoothed RPM last given to `setLastRpm`.
---@return number
function VehicleMotor:getLastRealMotorRpm() end

--- Returns the smoothed motor load with a small modulation offset applied (cosmetic variation).
---@return number
function VehicleMotor:getSmoothLoadPercentage() end

--- Returns the clutch pedal value: the manual value on clients or in manual-clutch mode, otherwise an estimate from the gap between clutch and motor speed (0 to 1, with a 50 RPM tolerance).
---@return number
function VehicleMotor:getClutchPedal() end

--- Returns the low-pass smoothed clutch pedal value.
---@return number
function VehicleMotor:getSmoothedClutchPedal() end

--- Returns the manual clutch value in manual-clutch mode, otherwise 0.
---@return number
function VehicleMotor:getManualClutchPedal() end

--- Returns the gear label for the HUD or dashboard (gear name, reverse name or N). Without gear tables it returns D or R from the driving direction.
---@param isDashboard any
---@return string
function VehicleMotor:getGearToDisplay(isDashboard) end

--- Returns the current gear name, whether gear display is available, whether the transmission is automatic, the previous and next two gear names, and whether a gear change is in progress.
---@return string
---@return boolean
---@return boolean
---@return string
---@return string
---@return string
---@return string
---@return boolean
function VehicleMotor:getGearInfoToDisplay() end

--- Returns the driving direction (1, -1 or 0): from the selected direction in manual cases, otherwise from the vehicle moving direction when faster than 0.95 km/h, else 0.
function VehicleMotor:getDrivingDirection() end

--- Returns the active gear group label and whether group display is available (N and false when there are no groups).
---@param isDashboard any
---@return string
---@return boolean
function VehicleMotor:getGearGroupToDisplay(isDashboard) end

--- Reads direction, target gear, gear-changing flag, gear table and group from a network stream. Raises `onGearChanged` and `onGearGroupChanged` when the values differ from the local state.
---@param streamId any
function VehicleMotor:readGearDataFromStream(streamId) end

--- Writes direction, target gear, gear-changing flag, forward/backward table choice and active group to a network stream, mirroring `readGearDataFromStream`.
---@param streamId any
function VehicleMotor:writeGearDataToStream(streamId) end

--- Stores the real RPM, smooths it into the displayed RPM, updates the turbo scale and blow-off valve state (raising `onMotorBlowOffValveChanged` when it toggles) and the constant-RPM charge.
---@param lastRpm number
function VehicleMotor:setLastRpm(lastRpm) end

--- Returns the torque actually applied this frame, including the externally consumed part.
---@return number
function VehicleMotor:getMotorAppliedTorque() end

--- Returns the torque taken from the motor but not sent to the wheels, for example by PTO consumers.
---@return number
function VehicleMotor:getMotorExternalTorque() end

--- Returns the torque available to the physics simulation.
---@return number
function VehicleMotor:getMotorAvailableTorque() end

--- Returns the equalized motor RPM value.
---@return number
function VehicleMotor:getEqualizedMotorRpm() end

--- Stores the equalized RPM and also feeds it into `setLastRpm`.
---@param rpm number
function VehicleMotor:setEqualizedMotorRpm(rpm) end

--- Returns the ratio between motor RPM and PTO RPM.
---@return number
function VehicleMotor:getPtoMotorRpmRatio() end

--- Sets a virtual multiplier applied to the external torque (defaults to 1 when nil).
---@param externalTorqueVirtualMultiplicator any
---@return number
function VehicleMotor:setExternalTorqueVirtualMultiplicator(externalTorqueVirtualMultiplicator) end

--- Returns the motor RPM converted from rotation speed, without clamping to min/max.
---@return number
function VehicleMotor:getNonClampedMotorRpm() end

--- Returns the motor rotation speed in rad/s.
---@return number
function VehicleMotor:getMotorRotSpeed() end

--- Returns the RPM on the wheel side of the clutch (differential speed times gear ratio).
---@return number
function VehicleMotor:getClutchRpm() end

--- Returns the clutch rotation speed in rad/s (differential speed times gear ratio).
---@return number
function VehicleMotor:getClutchRotSpeed() end

--- Returns the torque curve object.
---@return table
function VehicleMotor:getTorqueCurve() end

--- Returns the torque for the current motor speed (clamped to min/max RPM) scaled by the absolute acceleration value.
---@param acceleration number
---@return number
function VehicleMotor:getTorque(acceleration) end

--- Returns the curve torque at an RPM, reduced by vehicle damage through `VehicleMotor.DAMAGE_TORQUE_REDUCTION`.
---@param rpm number
---@return number
function VehicleMotor:getTorqueCurveValue(rpm) end

--- Returns two arrays built from the torque curve keyframes: damage-adjusted torques and rotation speeds in rad/s.
function VehicleMotor:getTorqueAndSpeedValues() end

--- Returns the maximum forward speed in m/s.
---@return number
function VehicleMotor:getMaximumForwardSpeed() end

--- Returns the maximum backward speed in m/s.
---@return number
function VehicleMotor:getMaximumBackwardSpeed() end

--- Computes the theoretical top forward speed from the minimum forward ratio or gears and max RPM.
---@return number
function VehicleMotor:calculatePhysicalMaximumForwardSpeed() end

--- Computes the theoretical top backward speed from backward gears, or forward gears if there are none.
---@return number
function VehicleMotor:calculatePhysicalMaximumBackwardSpeed() end

--- Static helper: top speed in m/s from max RPM and the smallest gear ratio. Prints a call stack and returns 0 if neither ratio nor gears are given.
---@param minGearRatio number
---@param gears table
---@param maxRpm integer
---@return number
function VehicleMotor.calculatePhysicalMaximumSpeed(minGearRatio, gears, maxRpm) end

--- Main per-frame update: reads motor rotation speed, torque and gear ratio from the engine node, tracks clutch slipping, PTO RPM and load percentage (server side), and updates smoothed load, start gear values and modulation. Without a motorized node it derives speeds from the wheels.
---@param dt number
function VehicleMotor:update(dt) end

--- Low-pass filters the raw load percentage with a speed-dependent factor (slower when load falls) and accumulates the load-change charge used for RPM drop effects.
---@param dt number
---@param rawLoadPercentage number
function VehicleMotor:updateSmoothLoadPercentage(dt, rawLoadPercentage) end

--- Recomputes the data that rates start gears: total mass, tool force demand, mass on the ground, direction difference of attached tools, available power after PTO, and slope. Also blocks idle gear changes briefly while the mass changes.
---@param dt table
---@return integer
function VehicleMotor:updateStartGearValues(dt) end

--- Chooses the best start gear (and group when groups exist) by scoring each with `getStartInGearFactor` against the start threshold. Returns the gear and the group index.
---@param gears table
---@return integer
function VehicleMotor:getBestStartGear(gears) end

--- Returns the RPM needed to reach the current speed limit (vehicle limit, cruise control and motor max speed) with a given gear ratio.
---@param ratio number
---@return number
function VehicleMotor:getRequiredRpmAtSpeedLimit(ratio) end

--- Returns a difficulty factor for starting in a gear ratio, from mass, slope, available power and ratio; math.huge if the gear would not reach a useful RPM at the speed limit. Lower is better.
---@param ratio number
---@return number
function VehicleMotor:getStartInGearFactor(ratio) end

--- For continuous (CVT-like) ratio ranges, returns the ratio giving the best power at the wheel speed, or one matching a required motor RPM when that is given, clamped to the allowed ratio range.
---@param wheelSpeedRpm number
---@param minRatio number
---@param maxRatio number
---@param accSafeMotorRpm number
---@param requiredMotorPower number
---@param requiredMotorRpm number
---@return number
function VehicleMotor:getBestGearRatio(wheelSpeedRpm, minRatio, maxRatio, accSafeMotorRpm, requiredMotorPower, requiredMotorRpm) end

--- Returns the direction (1 or -1) and gear ratio to use for the requested acceleration, using the ratio range or the first gear depending on the transmission type.
---@param acceleration number
---@param wheelSpeedRpm number
---@param accSafeMotorRpm number
---@param requiredMotorPower number
---@param requiredMotorRpm number
---@return number
---@return number
function VehicleMotor:getBestGear(acceleration, wheelSpeedRpm, accSafeMotorRpm, requiredMotorPower, requiredMotorRpm) end

--- Predicts the speed after a gear change and scores each valid gear on power, RPM preference and change penalty, returning the best target gear. It writes debug values into the gear tables in transmission debug mode.
---@param curGear any
---@param gears any
---@param gearSign any
---@param gearChangeTimer any
---@param acceleratorPedal any
---@param dt any
function VehicleMotor:findGearChangeTargetGearPrediction(curGear, gears, gearSign, gearChangeTimer, acceleratorPedal, dt) end

--- Makes the target gear the active gear, sets min/max gear ratio from it (outside manual-clutch mode), resets the gear change time and raises `onGearChanged`.
function VehicleMotor:applyTargetGear() end

--- Core gear logic called each physics update: advances change timers, handles automatic start-gear and shift selection and group shifts, manual-clutch ratio and stalling (stops the motor), and returns the adjusted accelerator and brake pedals.
---@param acceleratorPedal number
---@param brakePedal any
---@param dt any
---@return number
function VehicleMotor:updateGear(acceleratorPedal, brakePedal, dt) end

--- Manual shift one gear up or down in the current direction, clamped to the gear table. May flip direction when going below the first gear, then calls `setGear`; raises `onClutchCreaking` if the clutch forbids it.
---@param up any
function VehicleMotor:shiftGear(up) end

--- Selects a gear directly (H-shifter style). On activation sets the gear if allowed and the gear exists, otherwise raises `onClutchCreaking`; on release goes to neutral.
---@param gearIndex any
---@param activation any
function VehicleMotor:selectGear(gearIndex, activation) end

--- Sets the target gear, starts the gear change timer (or applies directly in manual-clutch mode) and raises `onGearChanged`. Does nothing if the gear is unchanged.
---@param gearIndex any
---@param isLocked any
function VehicleMotor:setGear(gearIndex, isLocked) end

--- Manually shifts the gear group up or down, clamped to the existing groups, if allowed; raises `onClutchCreaking` if the clutch forbids it.
---@param up any
function VehicleMotor:shiftGroup(up) end

--- Selects a gear group directly if allowed and it exists, otherwise raises `onClutchCreaking`; releasing activation sets group 0 (neutral).
---@param groupIndex any
---@param activation any
function VehicleMotor:selectGroup(groupIndex, activation) end

--- Applies a new active gear group: adjusts direction when groups encode direction, starts the group change timer or applies the gear at once for powershift groups, and raises `onGearGroupChanged`.
---@param groupIndex any
---@param isLocked any
function VehicleMotor:setGearGroup(groupIndex, isLocked) end

--- Changes driving direction (toggle when nil, or forced). Depending on configuration it uses a backward gear, a group or inverted gears, starts the direction timer, and raises `onGearDirectionChanged`, `onGearChanged` and possibly `onGearGroupChanged`.
---@param direction any
---@param force any
function VehicleMotor:changeDirection(direction, force) end

--- Stores the manual clutch pedal value (0 to 1).
---@param clutchValue number
function VehicleMotor:onManualClutchChanged(clutchValue) end

--- Returns whether a manual gear change is allowed: in manual-clutch mode on a non-powershift gearbox the clutch must be pressed beyond 0.5, otherwise always true.
---@return boolean
function VehicleMotor:getIsGearChangeAllowed() end

--- Same rule as for gears but for groups; returns false when no gear groups exist.
---@return boolean
function VehicleMotor:getIsGearGroupChangeAllowed() end

--- Sets the transmission direction; a negative value swaps forward and backward speeds and gear ratio ranges with their stored original values.
---@param direction integer
function VehicleMotor:setTransmissionDirection(direction) end

--- Returns the minimum and maximum gear ratio in effect, adjusted for clutch slipping (widens the maximum or blends toward the slipping ratio).
---@return number
---@return number
function VehicleMotor:getMinMaxGearRatio() end

--- Returns the gear ratio last read from the engine.
function VehicleMotor:getGearRatio() end

--- Returns the group and direction factor multiplied into gear ratios (0 if the group is neutral).
---@return number
function VehicleMotor:getGearRatioMultiplier() end

--- Returns true when a gear table exists and both current and target gear are 0.
function VehicleMotor:getIsInNeutral() end

--- In manual-clutch mode, with the motor off and a gear engaged, returns false and `REASON_CLUTCH_NOT_ENGAGED` when the clutch would stall it; otherwise true.
function VehicleMotor:getCanMotorRun() end

--- Returns the highest allowed RPM now: the motor maximum, lowered by speed limit through the current gear ratio and by the RPM limit.
---@return integer
function VehicleMotor:getCurMaxRpm() end

--- Sets the speed limit in km/h, never below the motor minimum speed.
---@param limit number
function VehicleMotor:setSpeedLimit(limit) end

--- Returns the speed limit in km/h.
function VehicleMotor:getSpeedLimit() end

--- Sets the acceleration limit in m/s^2.
---@param accelerationLimit any
function VehicleMotor:setAccelerationLimit(accelerationLimit) end

--- Returns the acceleration limit in m/s^2.
function VehicleMotor:getAccelerationLimit() end

--- Sets an upper RPM limit.
---@param rpmLimit number
function VehicleMotor:setRpmLimit(rpmLimit) end

--- Sets the limit of motor rotation acceleration in rad/s^2.
---@param limit any
function VehicleMotor:setMotorRotationAccelerationLimit(limit) end

--- Returns the limit of motor rotation acceleration in rad/s^2.
function VehicleMotor:getMotorRotationAccelerationLimit() end

--- Sets the direction change mode (manual or automatic).
---@param directionChangeMode any
function VehicleMotor:setDirectionChangeMode(directionChangeMode) end

--- Sets the gear shift mode. The manual-clutch mode is downgraded to plain manual on powershift gearboxes.
---@param gearShiftMode any
function VehicleMotor:setGearShiftMode(gearShiftMode) end

--- True in automatic mode, or when the vehicle has no manual gear shifting.
function VehicleMotor:getUseAutomaticGearShifting() end

--- True in automatic mode, or when the vehicle has no manual group shifting.
function VehicleMotor:getUseAutomaticGroupShifting() end
