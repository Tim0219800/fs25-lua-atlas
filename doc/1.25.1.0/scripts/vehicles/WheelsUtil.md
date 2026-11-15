# vehicles/WheelsUtil.lua

Source: `dataS/scripts/vehicles/WheelsUtil.lua` — FS25 1.25.1.0

- **WheelsUtil** (l.10)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `WheelsUtil.registerTireType(name: string, frictionCoeffs: table, frictionCoeffsWet: table, frictionCoeffsSnow: any)` | 27 |  |
| `WheelsUtil.unregisterTireType(name: any)` | 63 |  |
| `WheelsUtil.getTireType(name: string) → integer` | 77 |  |
| `WheelsUtil.getTireTypeName(index: integer) → string` | 91 |  |
| `WheelsUtil.getSmoothedAcceleratorAndBrakePedals(self: any, acceleratorPedal: any, brakePedal: any, dt: any)` | 226 |  |
| `WheelsUtil.updateWheelsPhysics(self: number, dt: number, currentSpeed: number, acceleration: number, doHandbrake: boolean, stopAndGoBraking: boolean)` | 287 |  |
| `WheelsUtil.computeDifferentialRotSpeedNonMotor(self: any) → number` | 474 |  |
| `WheelsUtil.getTireFriction(tireType: integer, groundType: integer, wetScale: number, snowScale: any) → number` | 503 |  |
| `WheelsUtil.getGroundType(isField: boolean, isRoad: boolean, depth: number) → integer` | 519 |  |
