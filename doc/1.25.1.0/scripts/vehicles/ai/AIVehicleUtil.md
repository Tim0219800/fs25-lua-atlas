# vehicles/ai/AIVehicleUtil.lua

Source: `dataS/scripts/vehicles/ai/AIVehicleUtil.lua` — FS25 1.25.1.0

- **AIVehicleUtil** (l.10)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AIVehicleUtil.driveToPoint(self: table, dt: number, acceleration: number, allowedToDrive: boolean, moveForwards: boolean, tX: number, tZ: number, maxSpeed: number, doNotSteer: boolean?)` | 26 |  |
| `AIVehicleUtil.driveAlongCurvature(self: any, dt: any, curvature: any, maxSpeed: any, acceleration: any)` | 101 |  |
| `AIVehicleUtil.driveInDirection(self: table, dt: number, steeringAngleLimit: number, acceleration: number, slowAcceleration: number, slowAngleLimit: number, allowedToDrive: boolean, moveForwards: boolean, lx: number, lz: number, maxSpeed: number, slowDownFactor: number)` | 144 |  |
| `AIVehicleUtil.getDriveDirection(refNode: integer, x: number, y: number, z: number) → number, number` | 210 |  |
| `AIVehicleUtil.getAverageDriveDirection(refNode: integer, x: number, y: number, z: number, x2: number, y2: number, z2: number) → number, number` | 233 |  |
| `AIVehicleUtil.getAttachedImplementsAllowTurnBackward(vehicle: table) → boolean` | 248 |  |
| `AIVehicleUtil.getAttachedImplementsBlockTurnBackward(vehicle: table) → boolean` | 279 |  |
| `AIVehicleUtil.getAttachedImplementsMaxTurnRadius(vehicle: any)` | 308 |  |
| `AIVehicleUtil.getAIToolReverserDirectionNode(vehicle: table) → integer?` | 336 |  |
| `AIVehicleUtil.getMaxToolRadius(implement: table) → number` | 357 |  |
| `AIVehicleUtil.updateInvertLeftRightMarkers(rootAttacherVehicle: table, vehicle: table)` | 442 |  |
| `AIVehicleUtil.getValidityOfTurnDirections(vehicle: table, turnData: table) → number, number` | 463 |  |
| `AIVehicleUtil.getAreaDimensions(directionX: any, directionZ: any, leftNode: any, rightNode: any, xOffset: any, zOffset: any, areaSize: any, invertXOffset: any)` | 600 |  |
| `AIVehicleUtil.getIsAreaOwned(vehicle: any, sX: any, sZ: any, wX: any, wZ: any, hX: any, hZ: any)` | 620 |  |
| `AIVehicleUtil.getAIAreaOfVehicle(vehicle: table, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number) → number, number` | 646 |  |
| `AIVehicleUtil.getAIFruitArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, query: table) → number, number` | 673 |  |
| `AIVehicleUtil.getAIDensityHeightArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, densityHeightTypeRequirements: boolean) → number, number` | 690 |  |
