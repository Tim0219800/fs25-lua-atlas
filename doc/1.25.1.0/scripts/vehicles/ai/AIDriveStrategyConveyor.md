# vehicles/ai/AIDriveStrategyConveyor.lua

*[Version française](../../../fr/scripts/vehicles/ai/AIDriveStrategyConveyor.md)*

Source: `dataS/scripts/vehicles/ai/AIDriveStrategyConveyor.lua` — FS25 1.25.1.0

✍ AI drive strategy (subclass of AIDriveStrategy) that drives a vehicle with an aiConveyorBelt definition back and forth between two world targets, using wheel nodes of that vehicle as references. It suits conveyor-type machines that sweep sideways while moving, and relies on vehicle.aiConveyorBelt fields (wheel indices, current angle, speed).

- **AIDriveStrategyConveyor** inherits from `AIDriveStrategy` (l.8)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIDriveStrategyConveyor.new(reconstructionData: any, customMt: any)` | 12 | ✍ Constructor, only builds the object from the parent class with the strategy metatable. |
| `AIDriveStrategyConveyor:setAIVehicle(vehicle: any)` | 20 | ✍ Calls the parent method, then from the back and center wheel nodes and the belt angle computes the distance to cover and two world targets (left and right). Resets the target index and moved distance. |
| `AIDriveStrategyConveyor:update(dt: any)` | 47 | ✍ Empty override, does nothing. |
| `AIDriveStrategyConveyor:getDriveData(dt: any, vX: any, vY: any, vZ: any)` | 52 | ✍ Accumulates the distance moved by the back wheel, toggles between the two targets (and flips direction) once the distance is reached, the first time doubling it. Returns target x, z, direction and a speed scaled by a sine of progress (clamped to 0.1 to 0.5, then doubled). |
