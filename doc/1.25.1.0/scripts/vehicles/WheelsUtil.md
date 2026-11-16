# vehicles/WheelsUtil.lua

*[Version française](../../fr/scripts/vehicles/WheelsUtil.md)*

Source: `dataS/scripts/vehicles/WheelsUtil.lua` — FS25 1.25.1.0

✍ Utility table for wheel and drive physics. It registers tire types with friction coefficients per ground type (dry, wet, snow), maps terrain information to a ground type, and `updateWheelsPhysics` turns the driver's acceleration request into accelerator and brake pedals and drives the vehicle motor and brakes. The constants `WheelsUtil.tireTypes`, `NUM_GROUNDS`, `GROUND_*` and `SMOOTHING_SPEED_SCALE` are defined outside the functions shown (UNVERIFIED).

- **WheelsUtil** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `WheelsUtil.registerTireType(name: string, frictionCoeffs: table, frictionCoeffsWet: table, frictionCoeffsSnow: any)` | 27 | ✍ Registers a tire type under an upper-cased name with friction tables for dry, wet and snow. Missing entries are filled from the previous ground type (first one defaults to 1.15 or the first given value). Warns and ignores duplicates. |
| `WheelsUtil.unregisterTireType(name: any)` | 63 | ✍ Removes the first tire type with this name from the registry, if present. |
| `WheelsUtil.getTireType(name: string) → integer` | 77 | ✍ Returns the registry index of a tire type by name (case-insensitive), or nil. |
| `WheelsUtil.getTireTypeName(index: integer) → string` | 91 | ✍ Returns the tire type name for an index, or the string `unknown`. |
| `WheelsUtil.getSmoothedAcceleratorAndBrakePedals(self: any, acceleratorPedal: any, brakePedal: any, dt: any)` | 226 | ✍ Applies ramping to accelerator and brake pedal inputs, storing smoothed values on the vehicle. Pedals rise gradually and fall at a rate that depends on the other pedal; returns the applied accelerator and brake values. |
| `WheelsUtil.updateWheelsPhysics(self: number, dt: number, currentSpeed: number, acceleration: number, doHandbrake: boolean, stopAndGoBraking: boolean)` | 287 | ✍ Converts the requested acceleration into pedals using direction logic, gear updates, automatic low-speed braking, handbrake and over-speed limiting. It raises `onVehiclePhysicsUpdate`, then calls `controlVehicle` and `brake` on the vehicle. Speed is signed, in m/ms. |
| `WheelsUtil.computeDifferentialRotSpeedNonMotor(self: any) → number` | 474 | ✍ Returns the non-motor differential speed: on the server, the mean of axle speed times radius over wheels in ground contact; otherwise the vehicle's last real speed times 1000. |
| `WheelsUtil.getTireFriction(tireType: integer, groundType: integer, wetScale: number, snowScale: any) → number` | 503 | ✍ Returns the tire friction for a tire type and ground type: dry value blended toward the wet and snow values by the wet and snow scales. The snow scale must be given (nil would error). |
| `WheelsUtil.getGroundType(isField: boolean, isRoad: boolean, depth: number) → integer` | 519 | ✍ Maps terrain info to a ground type: field first, then road (flag or depth under 0.1), then soft terrain above 0.8 depth, else hard terrain. |
