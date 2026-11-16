# vehicles/VehicleMotor.lua

*[Version française](../../fr/scripts/vehicles/VehicleMotor.md)*

Source: `dataS/scripts/vehicles/VehicleMotor.lua` — FS25 1.25.1.0

✍ Per-vehicle motor and transmission model used by the Motorized specialization. It holds the torque curve, RPM range, speed limits, forward/backward gears, optional gear groups and direction-change modes, and each update reads the motor rotation speed and torque from the engine. It computes smoothed load, picks start gears and automatic shifts, supports manual and manual-clutch shifting, and raises vehicle events such as `onGearChanged`. Gear state is synchronized with the stream functions; the tuning constants (`VehicleMotor.*`, `MODULATION_*`) are defined outside the functions shown (UNVERIFIED).

- **VehicleMotor** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleMotor.new(vehicle: integer, minRpm: integer, maxRpm: integer, maxForwardSpeed: number, maxBackwardSpeed: number, torqueCurve: table, brakeForce: number, forwardGears: number, backwardGears: number, minForwardGearRatio: number, maxForwardGearRatio: number, minBackwardGearRatio: number, maxBackwardGearRatio: number, ptoMotorRpmRatio: integer, minSpeed: any) → table` | 66 | ✍ Creates the motor for a vehicle from RPM range, speed limits, torque curve, brake force, gear tables and gear ratio ranges. It initializes all timers and limits, derives peak torque and peak power from the curve, and reads direction-change and gear-shift modes from game settings. |
| `VehicleMotor:postLoad(savegame: table)` | 317 | ✍ Post-load step: if gear groups exist, raises `onGearGroupChanged` for the active group so listeners get the initial state. The savegame argument is unused. |
| `VehicleMotor:delete()` | 325 | ✍ Unsubscribes the motor from all message center subscriptions. |
| `VehicleMotor:setGearGroups(gearGroups: table, groupType: any, groupChangeTime: any)` | 332 | ✍ Sets the gear groups, their transmission type and change time, then picks the default group (first group with positive ratio, overridden by one flagged as default) as active group. |
| `VehicleMotor:setDirectionChange(directionChangeUseGear: table, directionChangeGearIndex: any, directionChangeUseGroup: any, directionChangeGroupIndex: any, directionChangeTime: any)` | 364 | ✍ Configures how forward/backward direction changes work: via a backward gear, via a group, or by inverting the forward gears, plus the change time. |
| `VehicleMotor:setManualShift(manualShiftGears: boolean, manualShiftGroups: boolean)` | 377 | ✍ Sets whether gears and gear groups are shifted manually. |
| `VehicleMotor:setStartGearThreshold(startGearThreshold: number)` | 386 | ✍ Sets the factor threshold used when choosing a suitable start gear. |
| `VehicleMotor:setLowBrakeForce(lowBrakeForceScale: number, lowBrakeForceSpeedLimit: number)` | 394 | ✍ Sets the brake force scale and the speed limit below which the low-speed automatic braking applies. |
| `VehicleMotor:getMaxClutchTorque() → number` | 402 | ✍ Returns the maximum torque the clutch can transfer (default 5). |
| `VehicleMotor:getRotInertia() → number` | 409 | ✍ Returns the motor rotational inertia. |
| `VehicleMotor:setRotInertia(rotInertia: number)` | 416 | ✍ Sets the motor rotational inertia. |
| `VehicleMotor:getDampingRateFullThrottle() → number` | 423 | ✍ Returns the motor damping rate at full throttle. |
| `VehicleMotor:getDampingRateZeroThrottleClutchEngaged() → number` | 430 | ✍ Returns the damping rate at zero throttle with the clutch engaged. |
| `VehicleMotor:getDampingRateZeroThrottleClutchDisengaged() → number` | 437 | ✍ Returns the damping rate at zero throttle with the clutch disengaged. |
| `VehicleMotor:setDampingRateScale(dampingRateScale: number)` | 444 | ✍ Scales all three damping rates relative to their default constants. |
| `VehicleMotor:setGearChangeTime(gearChangeTime: number)` | 453 | ✍ Sets the gear change duration. A time of 0 marks the transmission as powershift, any other value as default. |
| `VehicleMotor:setAutoGearChangeTime(autoGearChangeTime: number)` | 464 | ✍ Sets the minimum delay between automatic gear changes and clamps the running timer to it. |
| `VehicleMotor:getPeakTorque() → number` | 472 | ✍ Returns the maximum torque of the torque curve. |
| `VehicleMotor:getBrakeForce() → number` | 479 | ✍ Returns the configured brake force. |
| `VehicleMotor:getMinRpm() → number` | 486 | ✍ Returns the minimum (idle) RPM. |
| `VehicleMotor:getMaxRpm() → number` | 493 | ✍ Returns the maximum RPM. |
| `VehicleMotor:getRequiredMotorRpmRange() → number, number` | 501 | ✍ Returns min and max RPM the motor must run at: the lower bound is raised to the PTO-driven RPM when a PTO consumer demands it, otherwise it is idle RPM. |
| `VehicleMotor:getLastMotorRpm() → number` | 512 | ✍ Returns the smoothed motor RPM last stored by `setLastRpm`. |
| `VehicleMotor:getLastModulatedMotorRpm() → number` | 519 | ✍ Returns the smoothed RPM plus a load-dependent oscillation and minus a drop after load increases. Intended for cosmetic use such as sound; returns 0 when the RPM is 0. |
| `VehicleMotor:getLastRealMotorRpm() → number` | 543 | ✍ Returns the unsmoothed RPM last given to `setLastRpm`. |
| `VehicleMotor:getSmoothLoadPercentage() → number` | 550 | ✍ Returns the smoothed motor load with a small modulation offset applied (cosmetic variation). |
| `VehicleMotor:getClutchPedal() → number` | 558 | ✍ Returns the clutch pedal value: the manual value on clients or in manual-clutch mode, otherwise an estimate from the gap between clutch and motor speed (0 to 1, with a 50 RPM tolerance). |
| `VehicleMotor:getSmoothedClutchPedal() → number` | 574 | ✍ Returns the low-pass smoothed clutch pedal value. |
| `VehicleMotor:getManualClutchPedal() → number` | 581 | ✍ Returns the manual clutch value in manual-clutch mode, otherwise 0. |
| `VehicleMotor:getGearToDisplay(isDashboard: any) → string` | 592 | ✍ Returns the gear label for the HUD or dashboard (gear name, reverse name or N). Without gear tables it returns D or R from the driving direction. |
| `VehicleMotor:getGearInfoToDisplay() → string, boolean, boolean, string, string, string, string, boolean` | 630 | ✍ Returns the current gear name, whether gear display is available, whether the transmission is automatic, the previous and next two gear names, and whether a gear change is in progress. |
| `VehicleMotor:getDrivingDirection()` | 694 | ✍ Returns the driving direction (1, -1 or 0): from the selected direction in manual cases, otherwise from the vehicle moving direction when faster than 0.95 km/h, else 0. |
| `VehicleMotor:getGearGroupToDisplay(isDashboard: any) → string, boolean` | 710 | ✍ Returns the active gear group label and whether group display is available (N and false when there are no groups). |
| `VehicleMotor:readGearDataFromStream(streamId: any)` | 734 | ✍ Reads direction, target gear, gear-changing flag, gear table and group from a network stream. Raises `onGearChanged` and `onGearGroupChanged` when the values differ from the local state. |
| `VehicleMotor:writeGearDataToStream(streamId: any)` | 774 | ✍ Writes direction, target gear, gear-changing flag, forward/backward table choice and active group to a network stream, mirroring `readGearDataFromStream`. |
| `VehicleMotor:setLastRpm(lastRpm: number)` | 792 | ✍ Stores the real RPM, smooths it into the displayed RPM, updates the turbo scale and blow-off valve state (raising `onMotorBlowOffValveChanged` when it toggles) and the constant-RPM charge. |
| `VehicleMotor:getMotorAppliedTorque() → number` | 828 | ✍ Returns the torque actually applied this frame, including the externally consumed part. |
| `VehicleMotor:getMotorExternalTorque() → number` | 835 | ✍ Returns the torque taken from the motor but not sent to the wheels, for example by PTO consumers. |
| `VehicleMotor:getMotorAvailableTorque() → number` | 842 | ✍ Returns the torque available to the physics simulation. |
| `VehicleMotor:getEqualizedMotorRpm() → number` | 849 | ✍ Returns the equalized motor RPM value. |
| `VehicleMotor:setEqualizedMotorRpm(rpm: number)` | 856 | ✍ Stores the equalized RPM and also feeds it into `setLastRpm`. |
| `VehicleMotor:getPtoMotorRpmRatio() → number` | 864 | ✍ Returns the ratio between motor RPM and PTO RPM. |
| `VehicleMotor:setExternalTorqueVirtualMultiplicator(externalTorqueVirtualMultiplicator: any) → number` | 871 | ✍ Sets a virtual multiplier applied to the external torque (defaults to 1 when nil). |
| `VehicleMotor:getNonClampedMotorRpm() → number` | 878 | ✍ Returns the motor RPM converted from rotation speed, without clamping to min/max. |
| `VehicleMotor:getMotorRotSpeed() → number` | 885 | ✍ Returns the motor rotation speed in rad/s. |
| `VehicleMotor:getClutchRpm() → number` | 892 | ✍ Returns the RPM on the wheel side of the clutch (differential speed times gear ratio). |
| `VehicleMotor:getClutchRotSpeed() → number` | 899 | ✍ Returns the clutch rotation speed in rad/s (differential speed times gear ratio). |
| `VehicleMotor:getTorqueCurve() → table` | 906 | ✍ Returns the torque curve object. |
| `VehicleMotor:getTorque(acceleration: number) → number` | 914 | ✍ Returns the torque for the current motor speed (clamped to min/max RPM) scaled by the absolute acceleration value. |
| `VehicleMotor:getTorqueCurveValue(rpm: number) → number` | 925 | ✍ Returns the curve torque at an RPM, reduced by vehicle damage through `VehicleMotor.DAMAGE_TORQUE_REDUCTION`. |
| `VehicleMotor:getTorqueAndSpeedValues()` | 932 | ✍ Returns two arrays built from the torque curve keyframes: damage-adjusted torques and rotation speeds in rad/s. |
| `VehicleMotor:getMaximumForwardSpeed() → number` | 946 | ✍ Returns the maximum forward speed in m/s. |
| `VehicleMotor:getMaximumBackwardSpeed() → number` | 953 | ✍ Returns the maximum backward speed in m/s. |
| `VehicleMotor:calculatePhysicalMaximumForwardSpeed() → number` | 960 | ✍ Computes the theoretical top forward speed from the minimum forward ratio or gears and max RPM. |
| `VehicleMotor:calculatePhysicalMaximumBackwardSpeed() → number` | 967 | ✍ Computes the theoretical top backward speed from backward gears, or forward gears if there are none. |
| `VehicleMotor.calculatePhysicalMaximumSpeed(minGearRatio: number, gears: table, maxRpm: integer) → number` | 977 | ✍ Static helper: top speed in m/s from max RPM and the smallest gear ratio. Prints a call stack and returns 0 if neither ratio nor gears are given. |
| `VehicleMotor:update(dt: number)` | 997 | ✍ Main per-frame update: reads motor rotation speed, torque and gear ratio from the engine node, tracks clutch slipping, PTO RPM and load percentage (server side), and updates smoothed load, start gear values and modulation. Without a motorized node it derives speeds from the wheels. |
| `VehicleMotor:updateSmoothLoadPercentage(dt: number, rawLoadPercentage: number)` | 1174 | ✍ Low-pass filters the raw load percentage with a speed-dependent factor (slower when load falls) and accumulates the load-change charge used for RPM drop effects. |
| `VehicleMotor:updateStartGearValues(dt: table) → integer` | 1219 | ✍ Recomputes the data that rates start gears: total mass, tool force demand, mass on the ground, direction difference of attached tools, available power after PTO, and slope. Also blocks idle gear changes briefly while the mass changes. |
| `VehicleMotor:getBestStartGear(gears: table) → integer` | 1324 | ✍ Chooses the best start gear (and group when groups exist) by scoring each with `getStartInGearFactor` against the start threshold. Returns the gear and the group index. |
| `VehicleMotor:getRequiredRpmAtSpeedLimit(ratio: number) → number` | 1391 | ✍ Returns the RPM needed to reach the current speed limit (vehicle limit, cruise control and motor max speed) with a given gear ratio. |
| `VehicleMotor:getStartInGearFactor(ratio: number) → number` | 1407 | ✍ Returns a difficulty factor for starting in a gear ratio, from mass, slope, available power and ratio; math.huge if the gear would not reach a useful RPM at the speed limit. Lower is better. |
| `VehicleMotor:getBestGearRatio(wheelSpeedRpm: number, minRatio: number, maxRatio: number, accSafeMotorRpm: number, requiredMotorPower: number, requiredMotorRpm: number) → number` | 1433 | ✍ For continuous (CVT-like) ratio ranges, returns the ratio giving the best power at the wheel speed, or one matching a required motor RPM when that is given, clamped to the allowed ratio range. |
| `VehicleMotor:getBestGear(acceleration: number, wheelSpeedRpm: number, accSafeMotorRpm: number, requiredMotorPower: number, requiredMotorRpm: number) → number, number` | 1478 | ✍ Returns the direction (1 or -1) and gear ratio to use for the requested acceleration, using the ratio range or the first gear depending on the transmission type. |
| `VehicleMotor:findGearChangeTargetGearPrediction(curGear: any, gears: any, gearSign: any, gearChangeTimer: any, acceleratorPedal: any, dt: any)` | 1510 | ✍ Predicts the speed after a gear change and scores each valid gear on power, RPM preference and change penalty, returning the best target gear. It writes debug values into the gear tables in transmission debug mode. |
| `VehicleMotor:applyTargetGear()` | 1769 | ✍ Makes the target gear the active gear, sets min/max gear ratio from it (outside manual-clutch mode), resets the gear change time and raises `onGearChanged`. |
| `VehicleMotor:updateGear(acceleratorPedal: number, brakePedal: any, dt: any) → number` | 1793 | ✍ Core gear logic called each physics update: advances change timers, handles automatic start-gear and shift selection and group shifts, manual-clutch ratio and stalling (stops the motor), and returns the adjusted accelerator and brake pedals. |
| `VehicleMotor:shiftGear(up: any)` | 2065 | ✍ Manual shift one gear up or down in the current direction, clamped to the gear table. May flip direction when going below the first gear, then calls `setGear`; raises `onClutchCreaking` if the clutch forbids it. |
| `VehicleMotor:selectGear(gearIndex: any, activation: any)` | 2109 | ✍ Selects a gear directly (H-shifter style). On activation sets the gear if allowed and the gear exists, otherwise raises `onClutchCreaking`; on release goes to neutral. |
| `VehicleMotor:setGear(gearIndex: any, isLocked: any)` | 2130 | ✍ Sets the target gear, starts the gear change timer (or applies directly in manual-clutch mode) and raises `onGearChanged`. Does nothing if the gear is unchanged. |
| `VehicleMotor:shiftGroup(up: any)` | 2160 | ✍ Manually shifts the gear group up or down, clamped to the existing groups, if allowed; raises `onClutchCreaking` if the clutch forbids it. |
| `VehicleMotor:selectGroup(groupIndex: any, activation: any)` | 2181 | ✍ Selects a gear group directly if allowed and it exists, otherwise raises `onClutchCreaking`; releasing activation sets group 0 (neutral). |
| `VehicleMotor:setGearGroup(groupIndex: any, isLocked: any)` | 2202 | ✍ Applies a new active gear group: adjusts direction when groups encode direction, starts the group change timer or applies the gear at once for powershift groups, and raises `onGearGroupChanged`. |
| `VehicleMotor:changeDirection(direction: any, force: any)` | 2238 | ✍ Changes driving direction (toggle when nil, or forced). Depending on configuration it uses a backward gear, a group or inverted gears, starts the direction timer, and raises `onGearDirectionChanged`, `onGearChanged` and possibly `onGearGroupChanged`. |
| `VehicleMotor:onManualClutchChanged(clutchValue: number)` | 2318 | ✍ Stores the manual clutch pedal value (0 to 1). |
| `VehicleMotor:getIsGearChangeAllowed() → boolean` | 2325 | ✍ Returns whether a manual gear change is allowed: in manual-clutch mode on a non-powershift gearbox the clutch must be pressed beyond 0.5, otherwise always true. |
| `VehicleMotor:getIsGearGroupChangeAllowed() → boolean` | 2338 | ✍ Same rule as for gears but for groups; returns false when no gear groups exist. |
| `VehicleMotor:setTransmissionDirection(direction: integer)` | 2355 | ✍ Sets the transmission direction; a negative value swaps forward and backward speeds and gear ratio ranges with their stored original values. |
| `VehicleMotor:getMinMaxGearRatio() → number, number` | 2381 | ✍ Returns the minimum and maximum gear ratio in effect, adjusted for clutch slipping (widens the maximum or blends toward the slipping ratio). |
| `VehicleMotor:getGearRatio()` | 2401 | ✍ Returns the gear ratio last read from the engine. |
| `VehicleMotor:getGearRatioMultiplier() → number` | 2408 | ✍ Returns the group and direction factor multiplied into gear ratios (0 if the group is neutral). |
| `VehicleMotor:getIsInNeutral()` | 2426 | ✍ Returns true when a gear table exists and both current and target gear are 0. |
| `VehicleMotor:getCanMotorRun()` | 2438 | ✍ In manual-clutch mode, with the motor off and a gear engaged, returns false and `REASON_CLUTCH_NOT_ENGAGED` when the clutch would stall it; otherwise true. |
| `VehicleMotor:getCurMaxRpm() → integer` | 2464 | ✍ Returns the highest allowed RPM now: the motor maximum, lowered by speed limit through the current gear ratio and by the RPM limit. |
| `VehicleMotor:setSpeedLimit(limit: number)` | 2487 | ✍ Sets the speed limit in km/h, never below the motor minimum speed. |
| `VehicleMotor:getSpeedLimit()` | 2493 | ✍ Returns the speed limit in km/h. |
| `VehicleMotor:setAccelerationLimit(accelerationLimit: any)` | 2499 | ✍ Sets the acceleration limit in m/s^2. |
| `VehicleMotor:getAccelerationLimit()` | 2505 | ✍ Returns the acceleration limit in m/s^2. |
| `VehicleMotor:setRpmLimit(rpmLimit: number)` | 2512 | ✍ Sets an upper RPM limit. |
| `VehicleMotor:setMotorRotationAccelerationLimit(limit: any)` | 2519 | ✍ Sets the limit of motor rotation acceleration in rad/s^2. |
| `VehicleMotor:getMotorRotationAccelerationLimit()` | 2525 | ✍ Returns the limit of motor rotation acceleration in rad/s^2. |
| `VehicleMotor:setDirectionChangeMode(directionChangeMode: any)` | 2531 | ✍ Sets the direction change mode (manual or automatic). |
| `VehicleMotor:setGearShiftMode(gearShiftMode: any)` | 2537 | ✍ Sets the gear shift mode. The manual-clutch mode is downgraded to plain manual on powershift gearboxes. |
| `VehicleMotor:getUseAutomaticGearShifting()` | 2550 | ✍ True in automatic mode, or when the vehicle has no manual gear shifting. |
| `VehicleMotor:getUseAutomaticGroupShifting()` | 2564 | ✍ True in automatic mode, or when the vehicle has no manual group shifting. |
