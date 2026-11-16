# collections/ValueInterpolator.lua

*[Version française](../../fr/scripts/collections/ValueInterpolator.md)*

Source: `dataS/scripts/collections/ValueInterpolator.lua` — FS25 1.25.1.0

✍ Helper that moves a list of numeric values toward targets over time. It reads current values through a getter, writes them back through a setter every update and registers itself as an updateable on g_currentMission under a custom key. It removes itself when every value reaches its target and can run update and finished callbacks. The updateable mechanism is part of the mission class, which is not in this dump (UNVERIFIED).

- **ValueInterpolator** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `ValueInterpolator.new(customKey: any, get: function, set: function, target: array, duration: number?, speed: number?, customMt: table?) → ValueInterpolator?` | 24 | ✍ Starts an interpolation: current values come from get(), and speeds are derived from duration (ms) or from speed per second (default 1). Returns nil if all speeds are near zero; otherwise registers as an updateable with customKey and returns itself. |
| `ValueInterpolator:setUpdateFunc(updateFunc: any, updateTarget: any, ...: any)` | 66 | ✍ Sets a callback run after each update step, called as func(target, ...) with the extra arguments given here. |
| `ValueInterpolator:setFinishedFunc(finishedFunc: any, finishedTarget: any, ...: any)` | 74 | ✍ Sets a callback run once when all values have reached their targets, called as func(target, ...) with the extra arguments given here. |
| `ValueInterpolator:setDeleteListenerObject(object: any)` | 82 | ✍ If the object derives from Object, registers a delete listener so the interpolator stops (onDeleteParent) when that object is deleted. Other values are ignored. |
| `ValueInterpolator:delete()` | 91 | ✍ Empty function that exists to satisfy the updateable interface. |
| `ValueInterpolator:getTarget()` | 96 | ✍ Returns the table of target values. |
| `ValueInterpolator:updateSpeed()` | 102 | ✍ Recomputes per-value speeds as remaining distance divided by remaining duration, when duration is a number; otherwise uses the duration value itself as the speed table. |
| `ValueInterpolator:update(dt: any)` | 115 | ✍ Advances every value toward its target by speed times dt (ms) without overshooting, calls the setter and update callback, and shortens the remaining duration (minimum 1). When all values arrive it removes the updateable and calls the finished callback. |
| `ValueInterpolator.removeInterpolator(key: any)` | 153 | ✍ Removes the updateable registered under the given key from the current mission, if there is one. |
| `ValueInterpolator.hasInterpolator(key: any)` | 161 | ✍ Returns whether the current mission still has an updateable registered under the given key. |
| `ValueInterpolator:onDeleteParent()` | 167 | ✍ Delete-listener callback that removes this interpolator's updateable from the mission when the watched parent object is deleted. |
