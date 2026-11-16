# gui/base/MultiValueTween.lua

*[Version française](../../../fr/scripts/gui/base/MultiValueTween.md)*

Source: `dataS/scripts/gui/base/MultiValueTween.lua` — FS25 1.25.1.0

✍ Subclass of Tween that animates several numeric values at once. Start and end values are arrays and the setter receives them unpacked, optionally preceded by a target object. Used for UI animations such as position or size.

- **MultiValueTween** inherits from `Tween` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `MultiValueTween.new(setterFunction: function, startValues: table, endValues: table, duration: number, customMt: number)` | 24 | ✍ Creates the tween through `Tween.new` and keeps a working copy of the start values. The setter is called as setter(v1..vn), or setter(target, v1..vn) when a target is set; duration is in milliseconds. |
| `MultiValueTween:setTarget(target: any)` | 35 | ✍ Sets or clears the callback target and keeps the values array in sync by inserting, removing or replacing the target as first entry. The setter must then accept the target first. |
| `MultiValueTween:tweenValue(t: any)` | 50 | ✍ Interpolates each start/end pair linearly with the factor shaped by the curve function at progress t, stores it in the values array (after the target slot if any) and returns that array. |
| `MultiValueTween:applyValue()` | 64 | ✍ Calls the setter with the current values unpacked, including the target as first argument when one was set. |
