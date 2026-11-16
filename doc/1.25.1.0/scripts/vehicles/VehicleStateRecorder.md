# vehicles/VehicleStateRecorder.lua

*[Version française](../../fr/scripts/vehicles/VehicleStateRecorder.md)*

Source: `dataS/scripts/vehicles/VehicleStateRecorder.lua` — FS25 1.25.1.0

✍ Developer tool that records the transforms and visibility of a vehicle's i3d-mapped nodes over time and writes them to an XML file in a `giantsTools` folder next to the vehicle config. It can run for a fixed duration or follow a named animation by temporarily replacing `SpecializationUtil.raiseEvent`. Console commands start and stop it, and a second simultaneous animation recording is refused.

- **VehicleStateRecorder** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleStateRecorder.new(vehicle: any, name: any, duration: any, animationName: any)` | 18 | ✍ Creates a recorder for a vehicle with an optional name and duration in seconds. With an animation name it hooks `SpecializationUtil.raiseEvent` and starts on `onPlayAnimation`; otherwise it starts at once via `addUpdateable`. |
| `VehicleStateRecorder:update(dt: any)` | 72 | ✍ Per-frame update: stops when the duration has elapsed, otherwise records the current vehicle state and draws an on-screen recording label. |
| `VehicleStateRecorder:finish()` | 89 | ✍ Writes all recorded node states to an XML file (translation, rotation in degrees, visibility, only when changed), then removes the updateable and restores the original `raiseEvent` hook. |
| `VehicleStateRecorder:recordVehicle()` | 154 | ✍ Records the state of every vehicle component node and its child hierarchy. |
| `VehicleStateRecorder:recordNode(node: any, indexPath: any, separator: any)` | 162 | ✍ Recursively records a node if it is listed in the vehicle's `i3dMappings`; a new sample is stored only when translation, rotation or visibility changed. The first sample also stores node name and class id name. |
| `VehicleStateRecorder.consoleCommand(unusedSelf: any, name: any, duration: any)` | 224 | ✍ Console handler that toggles a timed recording on the currently selected vehicle of the local player; a second call finishes the running recording. |
| `VehicleStateRecorder.consoleCommandAnimation(unusedSelf: any, animationName: any)` | 239 | ✍ Console handler that toggles a recording tied to a named animation on the selected vehicle; a second call finishes the running recording. |
