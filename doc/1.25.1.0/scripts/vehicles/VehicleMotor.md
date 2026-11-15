# vehicles/VehicleMotor.lua

Source : `dataS/scripts/vehicles/VehicleMotor.lua` — FS25 1.25.1.0

- **VehicleMotor** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleMotor.new(vehicle: integer, minRpm: integer, maxRpm: integer, maxForwardSpeed: number, maxBackwardSpeed: number, torqueCurve: table, brakeForce: number, forwardGears: number, backwardGears: number, minForwardGearRatio: number, maxForwardGearRatio: number, minBackwardGearRatio: number, maxBackwardGearRatio: number, ptoMotorRpmRatio: integer, minSpeed: any) → table` | 66 |  |
| `VehicleMotor:postLoad(savegame: table)` | 317 |  |
| `VehicleMotor:delete()` | 325 |  |
| `VehicleMotor:setGearGroups(gearGroups: table, groupType: any, groupChangeTime: any)` | 332 |  |
| `VehicleMotor:setDirectionChange(directionChangeUseGear: table, directionChangeGearIndex: any, directionChangeUseGroup: any, directionChangeGroupIndex: any, directionChangeTime: any)` | 364 |  |
| `VehicleMotor:setManualShift(manualShiftGears: boolean, manualShiftGroups: boolean)` | 377 |  |
| `VehicleMotor:setStartGearThreshold(startGearThreshold: number)` | 386 |  |
| `VehicleMotor:setLowBrakeForce(lowBrakeForceScale: number, lowBrakeForceSpeedLimit: number)` | 394 |  |
| `VehicleMotor:getMaxClutchTorque() → number` | 402 |  |
| `VehicleMotor:getRotInertia() → number` | 409 |  |
| `VehicleMotor:setRotInertia(rotInertia: number)` | 416 |  |
| `VehicleMotor:getDampingRateFullThrottle() → number` | 423 |  |
| `VehicleMotor:getDampingRateZeroThrottleClutchEngaged() → number` | 430 |  |
| `VehicleMotor:getDampingRateZeroThrottleClutchDisengaged() → number` | 437 |  |
| `VehicleMotor:setDampingRateScale(dampingRateScale: number)` | 444 |  |
| `VehicleMotor:setGearChangeTime(gearChangeTime: number)` | 453 |  |
| `VehicleMotor:setAutoGearChangeTime(autoGearChangeTime: number)` | 464 |  |
| `VehicleMotor:getPeakTorque() → number` | 472 |  |
| `VehicleMotor:getBrakeForce() → number` | 479 |  |
| `VehicleMotor:getMinRpm() → number` | 486 |  |
| `VehicleMotor:getMaxRpm() → number` | 493 |  |
| `VehicleMotor:getRequiredMotorRpmRange() → number, number` | 501 |  |
| `VehicleMotor:getLastMotorRpm() → number` | 512 |  |
| `VehicleMotor:getLastModulatedMotorRpm() → number` | 519 |  |
| `VehicleMotor:getLastRealMotorRpm() → number` | 543 |  |
| `VehicleMotor:getSmoothLoadPercentage() → number` | 550 |  |
| `VehicleMotor:getClutchPedal() → number` | 558 |  |
| `VehicleMotor:getSmoothedClutchPedal() → number` | 574 |  |
| `VehicleMotor:getManualClutchPedal() → number` | 581 |  |
| `VehicleMotor:getGearToDisplay(isDashboard: any) → string` | 592 |  |
| `VehicleMotor:getGearInfoToDisplay() → string, boolean, boolean, string, string, string, string, boolean` | 630 |  |
| `VehicleMotor:getDrivingDirection()` | 694 |  |
| `VehicleMotor:getGearGroupToDisplay(isDashboard: any) → string, boolean` | 710 |  |
| `VehicleMotor:readGearDataFromStream(streamId: any)` | 734 |  |
| `VehicleMotor:writeGearDataToStream(streamId: any)` | 774 |  |
| `VehicleMotor:setLastRpm(lastRpm: number)` | 792 |  |
| `VehicleMotor:getMotorAppliedTorque() → number` | 828 |  |
| `VehicleMotor:getMotorExternalTorque() → number` | 835 |  |
| `VehicleMotor:getMotorAvailableTorque() → number` | 842 |  |
| `VehicleMotor:getEqualizedMotorRpm() → number` | 849 |  |
| `VehicleMotor:setEqualizedMotorRpm(rpm: number)` | 856 |  |
| `VehicleMotor:getPtoMotorRpmRatio() → number` | 864 |  |
| `VehicleMotor:setExternalTorqueVirtualMultiplicator(externalTorqueVirtualMultiplicator: any) → number` | 871 |  |
| `VehicleMotor:getNonClampedMotorRpm() → number` | 878 |  |
| `VehicleMotor:getMotorRotSpeed() → number` | 885 |  |
| `VehicleMotor:getClutchRpm() → number` | 892 |  |
| `VehicleMotor:getClutchRotSpeed() → number` | 899 |  |
| `VehicleMotor:getTorqueCurve() → table` | 906 |  |
| `VehicleMotor:getTorque(acceleration: number) → number` | 914 |  |
| `VehicleMotor:getTorqueCurveValue(rpm: number) → number` | 925 |  |
| `VehicleMotor:getTorqueAndSpeedValues()` | 932 |  |
| `VehicleMotor:getMaximumForwardSpeed() → number` | 946 |  |
| `VehicleMotor:getMaximumBackwardSpeed() → number` | 953 |  |
| `VehicleMotor:calculatePhysicalMaximumForwardSpeed() → number` | 960 |  |
| `VehicleMotor:calculatePhysicalMaximumBackwardSpeed() → number` | 967 |  |
| `VehicleMotor.calculatePhysicalMaximumSpeed(minGearRatio: number, gears: table, maxRpm: integer) → number` | 977 |  |
| `VehicleMotor:update(dt: number)` | 997 |  |
| `VehicleMotor:updateSmoothLoadPercentage(dt: number, rawLoadPercentage: number)` | 1174 |  |
| `VehicleMotor:updateStartGearValues(dt: table) → integer` | 1219 |  |
| `VehicleMotor:getBestStartGear(gears: table) → integer` | 1324 |  |
| `VehicleMotor:getRequiredRpmAtSpeedLimit(ratio: number) → number` | 1391 |  |
| `VehicleMotor:getStartInGearFactor(ratio: number) → number` | 1407 |  |
| `VehicleMotor:getBestGearRatio(wheelSpeedRpm: number, minRatio: number, maxRatio: number, accSafeMotorRpm: number, requiredMotorPower: number, requiredMotorRpm: number) → number` | 1433 |  |
| `VehicleMotor:getBestGear(acceleration: number, wheelSpeedRpm: number, accSafeMotorRpm: number, requiredMotorPower: number, requiredMotorRpm: number) → number, number` | 1478 |  |
| `VehicleMotor:findGearChangeTargetGearPrediction(curGear: any, gears: any, gearSign: any, gearChangeTimer: any, acceleratorPedal: any, dt: any)` | 1510 |  |
| `VehicleMotor:applyTargetGear()` | 1769 |  |
| `VehicleMotor:updateGear(acceleratorPedal: number, brakePedal: any, dt: any) → number` | 1793 |  |
| `VehicleMotor:shiftGear(up: any)` | 2065 |  |
| `VehicleMotor:selectGear(gearIndex: any, activation: any)` | 2109 |  |
| `VehicleMotor:setGear(gearIndex: any, isLocked: any)` | 2130 |  |
| `VehicleMotor:shiftGroup(up: any)` | 2160 |  |
| `VehicleMotor:selectGroup(groupIndex: any, activation: any)` | 2181 |  |
| `VehicleMotor:setGearGroup(groupIndex: any, isLocked: any)` | 2202 |  |
| `VehicleMotor:changeDirection(direction: any, force: any)` | 2238 |  |
| `VehicleMotor:onManualClutchChanged(clutchValue: number)` | 2318 |  |
| `VehicleMotor:getIsGearChangeAllowed() → boolean` | 2325 |  |
| `VehicleMotor:getIsGearGroupChangeAllowed() → boolean` | 2338 |  |
| `VehicleMotor:setTransmissionDirection(direction: integer)` | 2355 |  |
| `VehicleMotor:getMinMaxGearRatio() → number, number` | 2381 |  |
| `VehicleMotor:getGearRatio()` | 2401 |  |
| `VehicleMotor:getGearRatioMultiplier() → number` | 2408 |  |
| `VehicleMotor:getIsInNeutral()` | 2426 |  |
| `VehicleMotor:getCanMotorRun()` | 2438 |  |
| `VehicleMotor:getCurMaxRpm() → integer` | 2464 |  |
| `VehicleMotor:setSpeedLimit(limit: number)` | 2487 |  |
| `VehicleMotor:getSpeedLimit()` | 2493 |  |
| `VehicleMotor:setAccelerationLimit(accelerationLimit: any)` | 2499 |  |
| `VehicleMotor:getAccelerationLimit()` | 2505 |  |
| `VehicleMotor:setRpmLimit(rpmLimit: number)` | 2512 |  |
| `VehicleMotor:setMotorRotationAccelerationLimit(limit: any)` | 2519 |  |
| `VehicleMotor:getMotorRotationAccelerationLimit()` | 2525 |  |
| `VehicleMotor:setDirectionChangeMode(directionChangeMode: any)` | 2531 |  |
| `VehicleMotor:setGearShiftMode(gearShiftMode: any)` | 2537 |  |
| `VehicleMotor:getUseAutomaticGearShifting()` | 2550 |  |
| `VehicleMotor:getUseAutomaticGroupShifting()` | 2564 |  |
