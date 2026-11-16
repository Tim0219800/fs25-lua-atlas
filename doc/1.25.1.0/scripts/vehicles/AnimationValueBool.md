# vehicles/AnimationValueBool.lua

*[Version française](../../fr/scripts/vehicles/AnimationValueBool.md)*

Source: `dataS/scripts/vehicles/AnimationValueBool.lua` — FS25 1.25.1.0

✍ Boolean variant of the animated-vehicle value classes. It inherits from AnimationValueFloat but replaces loading and updating: instead of interpolating over time, it switches a property to a fixed boolean as soon as the animation touches the part. Used by the AnimatedVehicle specialization, which owns the animation parts.

- **AnimationValueBool** inherits from `AnimationValueFloat` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AnimationValueBool.new(vehicle: any, animation: any, part: any, startName: any, endName: any, name: any, initialUpdate: any, get: any, set: any, extraLoad: any, customMt: any)` | 16 | ✍ Constructor. Simply delegates to `AnimationValueFloat.new` with the same arguments, using this class metatable unless a custom one is given. No boolean-specific state is created here. |
| `AnimationValueBool:load(xmlFile: any, key: any)` | 22 | ✍ Reads the target boolean from the XML attribute named by `startName` on the given key and keeps the XML file and key for warnings. Returns true only if the value exists and the `extraLoad` callback succeeds. |
| `AnimationValueBool:init(index: any, numParts: any)` | 33 | ✍ Intentionally empty override. The part-chaining logic of the float parent class does not apply to booleans. |
| `AnimationValueBool:postInit()` | 38 | ✍ Intentionally empty override. No start value is captured from the vehicle, unlike the float parent. |
| `AnimationValueBool:reset()` | 43 | ✍ Clears the cached current value so the next update re-reads it through the `get` callback. |
| `AnimationValueBool:update(durationToEnd: any, dtToUse: any, realDt: any)` | 49 | ✍ Reads the current value via `get` on first call, then if it differs from the target calls `set` with the target. Returns true when a change was applied, false otherwise. The time arguments are ignored. |
