# collections/ValueInterpolator.lua

Source: `dataS/scripts/collections/ValueInterpolator.lua` — FS25 1.25.1.0

- **ValueInterpolator** (l.12)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ValueInterpolator.new(customKey: any, get: function, set: function, target: array, duration: number?, speed: number?, customMt: table?) → ValueInterpolator?` | 24 |  |
| `ValueInterpolator:setUpdateFunc(updateFunc: any, updateTarget: any, ...: any)` | 66 |  |
| `ValueInterpolator:setFinishedFunc(finishedFunc: any, finishedTarget: any, ...: any)` | 74 |  |
| `ValueInterpolator:setDeleteListenerObject(object: any)` | 82 |  |
| `ValueInterpolator:delete()` | 91 |  |
| `ValueInterpolator:getTarget()` | 96 |  |
| `ValueInterpolator:updateSpeed()` | 102 |  |
| `ValueInterpolator:update(dt: any)` | 115 |  |
| `ValueInterpolator.removeInterpolator(key: any)` | 153 |  |
| `ValueInterpolator.hasInterpolator(key: any)` | 161 |  |
| `ValueInterpolator:onDeleteParent()` | 167 |  |
