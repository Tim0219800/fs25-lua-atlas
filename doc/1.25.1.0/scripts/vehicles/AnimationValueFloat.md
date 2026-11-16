# vehicles/AnimationValueFloat.lua

*[Version française](../../fr/scripts/vehicles/AnimationValueFloat.md)*

Source: `dataS/scripts/vehicles/AnimationValueFloat.lua` — FS25 1.25.1.0

✍ One animated property made of one or several numbers, driven by an animation part of the AnimatedVehicle specialization. It loads start and end values from XML, then each update moves the current values towards the target at a speed derived from the remaining duration, and applies them through a `set` callback with linear, step or spline interpolation. AnimationValueBool inherits from it. Consecutive parts that animate the same property are linked so the next part starts from the previous end value.

- **AnimationValueFloat** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AnimationValueFloat.new(vehicle: any, animation: any, part: any, startName: any, endName: any, name: any, initialUpdate: any, get: any, set: any, extraLoad: any, customMt: any)` | 25 | ✍ Constructor. Stores the vehicle, animation, part, XML attribute names, and the `get`, `set` and `extraLoad` callbacks, and prepares empty tables for compare parameters and cached values and speeds. |
| `AnimationValueFloat:load(xmlFile: any, key: any)` | 56 | ✍ Reads start and end values from XML (number, boolean, string or table, normalized to a table of numbers), runs `extraLoad`, then resolves the `tangentType` attribute (linear by default, step or spline variants). Returns true on success. |
| `AnimationValueFloat:addCompareParameters(...: any)` | 138 | ✍ Appends field names that `init` compares between two values of different parts: two values are only chained if all these fields are equal. |
| `AnimationValueFloat:setWarningInformation(info: any)` | 147 | ✍ Sets the text used to identify this value in XML warning messages. |
| `AnimationValueFloat:init(index: any, numParts: any)` | 153 | ✍ Looks at later parts of the same animation with the same direction for a value with the same end attribute and matching compare parameters, then links them as previous and next. Logs an XML warning on overlapping parts and may copy this end value as the next start value. |
| `AnimationValueFloat:postInit()` | 194 | ✍ If an end value exists but no start value was given in XML, captures the start value from the vehicle through the `get` callback. |
| `AnimationValueFloat:reset()` | 202 | ✍ Keeps the last current values and speeds for reuse, then clears the active ones so the next update re-initializes the movement. |
| `AnimationValueFloat:initValues(targetValue: any, durationToEnd: any, fixedTimeUpdate: any, ...: any)` | 212 | ✍ Sets the current values, computes per-value speed as remaining distance over the remaining duration (minimum 0.001), and stores spline start values. With a fixed-time update it starts from the part start or end value depending on playback direction. Returns the `initialUpdate` flag. |
| `AnimationValueFloat:update(durationToEnd: any, dtToUse: any, realDt: any, fixedTimeUpdate: any)` | 252 | ✍ Moves the current values towards the target (end value, or start value when playing backwards) using real dt, then calls `set` with the linear, spline or step result. Returns true if values were applied. Does nothing without a start value or when the part is not active. |
