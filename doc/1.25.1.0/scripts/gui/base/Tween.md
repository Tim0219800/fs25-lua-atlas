# gui/base/Tween.lua

*[Version française](../../../fr/scripts/gui/base/Tween.md)*

Source: `dataS/scripts/gui/base/Tween.lua` — FS25 1.25.1.0

✍ Linear interpolation of one number from a start to an end value over a duration in milliseconds, pushed to a setter callback on every update. The easing can be swapped through a curve function (default Tween.CURVE.LINEAR, defined elsewhere). Base class of TweenSequence.

- **Tween** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `Tween.new(setterFunction: function, startValue: number, endValue: number, duration: number, customMt: table?)` | 21 | ✍ Creates a tween calling setterFunction with the interpolated value. A duration of 0 makes it finished immediately; customMt lets subclasses reuse it. |
| `Tween:getDuration()` | 40 | ✍ Returns the duration in milliseconds. |
| `Tween:getFinished()` | 46 | ✍ Returns true once the tween has reached its end. |
| `Tween:reset()` | 52 | ✍ Rewinds elapsed time to 0 so the tween can play again; it is finished at once only if the duration is 0. |
| `Tween:setTarget(target: any)` | 60 | ✍ Sets a table passed as first argument to the setter; the setter must then accept (target, value). |
| `Tween:update(dt: any)` | 66 | ✍ Advances by dt milliseconds, computes the value and calls the setter; on reaching the duration it applies the exact end value and marks the tween finished. Does nothing once finished. |
| `Tween:tweenValue(t: any)` | 87 | ✍ Returns the value at normalised time t (0..1): a lerp between start and end after passing t through the curve function. |
| `Tween:applyValue(newValue: any)` | 93 | ✍ Calls the setter with the value, prefixed by the target if one was set. |
| `Tween:setCurve(func: any)` | 103 | ✍ Sets the easing function applied to normalised time; nil restores the linear curve. |
