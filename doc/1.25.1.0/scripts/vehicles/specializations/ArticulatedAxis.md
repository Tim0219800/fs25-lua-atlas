# vehicles/specializations/ArticulatedAxis.lua

*[Version française](../../../fr/scripts/vehicles/specializations/ArticulatedAxis.md)*

Source: `dataS/scripts/vehicles/specializations/ArticulatedAxis.lua` — FS25 1.25.1.0

✍ Specialization for vehicles that steer by bending a component joint (articulated loaders, dumpers, and similar). It requires Drivable. The XML under vehicle.articulatedAxis gives the joint index, rotation speed and limits, a rotation node, optional rotating visual parts, wheel lists and a steering sound. It extends the steering time limits, computes a maximum turning radius from the wheels, and overrides the curvature/radius conversions used by steering and AI. The joint is only physically rotated on the server; visuals and sound run on clients.

- **ArticulatedAxis** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ArticulatedAxis.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Returns true only if the vehicle type has the Drivable specialization. |
| `ArticulatedAxis.initSpecialization()` | 23 | ✍ Registers the vehicle.articulatedAxis XML keys (joint index, rotSpeed, rotMax, rotMin, anchorActor, rotNode, aiReverserNode, maxTurningRadius, custom wheel indices, rotatingPart entries) and the steering sound paths. |
| `ArticulatedAxis.registerOverwrittenFunctions(vehicleType: any)` | 52 | ✍ Overrides getSteeringRotTimeByCurvature, getTurningRadiusByRotTime and getAIReverserNode. The getAIReverserNode body is not in the dump (UNVERIFIED). |
| `ArticulatedAxis.registerEventListeners(vehicleType: any)` | 60 | ✍ Subscribes to onLoad, onPostLoad, onDelete, onDeactivate and onUpdate. |
| `ArticulatedAxis:onLoad(savegame: table)` | 71 | ✍ Reads the axis settings (component joint index starts at 1) and rotating parts, then widens the vehicle's min/max steering time. It sets maxRotation and wheelSteeringDuration and estimates maxTurningRadius from wheel and joint angles, unless the XML overrides it. Warns if fewer than 2 wheels are found per component. Loads the steering sound on clients. |
| `ArticulatedAxis:onPostLoad()` | 233 | ✍ If a component joint is configured, calls updateArticulatedAxisRotation (when defined) once with angle 0 and a large dt. Otherwise removes the onUpdate listener. |
| `ArticulatedAxis:onDelete()` | 246 | ✍ On clients, deletes the loaded steering samples. |
| `ArticulatedAxis:onDeactivate()` | 255 | ✍ On clients, stops the steering sound and resets its playing flag. |
| `ArticulatedAxis:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 268 | ✍ Each frame converts rotatedTime into a clamped steering angle (optionally filtered by updateArticulatedAxisRotation), plays or stops the steering sound, and tracks an interpolated time for the camera. On change the server rotates the joint node and updates the component joint frame, and clients interpolate the rotating parts. |
| `ArticulatedAxis:getSteeringRotTimeByCurvature(superFunc: any, curvature: any)` | 328 | ✍ Override: converts a path curvature into a steering time using wheelSteeringDuration, an arctangent mapping and maxTurningRadius. |
| `ArticulatedAxis:getTurningRadiusByRotTime(superFunc: any, rotTime: any)` | 334 | ✍ Override: converts a steering time into a signed turning radius (1/curvature, math.huge when straight). Defers to the parent if there is no component joint or the rotation speed is 0. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `getSteeringRotTimeByCurvature` | 53 |
| registerOverwrittenFunction | `getTurningRadiusByRotTime` | 54 |
| registerOverwrittenFunction | `getAIReverserNode` | 55 |
| registerEventListener | `onLoad` | 61 |
| registerEventListener | `onPostLoad` | 62 |
| registerEventListener | `onDelete` | 63 |
| registerEventListener | `onDeactivate` | 64 |
| registerEventListener | `onUpdate` | 65 |
