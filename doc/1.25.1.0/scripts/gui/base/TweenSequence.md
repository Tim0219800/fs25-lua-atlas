# gui/base/TweenSequence.lua

*[Version française](../../../fr/scripts/gui/base/TweenSequence.md)*

Source: `dataS/scripts/gui/base/TweenSequence.lua` — FS25 1.25.1.0

✍ Tween subclass that chains child tweens, pauses and callbacks on one timeline, and can itself be nested in another sequence. It must be started with start() before update() has any effect, also after a reset. Child tweens may overlap through the insert variants; the sequence can loop.

- **TweenSequence** inherits from `Tween` (l.19)

## Functions

| Function | Line | Description |
|---|---|---|
| `TweenSequence.new(functionTarget: any)` | 25 | ✍ Creates an empty, stopped sequence. The optional functionTarget is given as first argument to all child setters and callbacks. |
| `TweenSequence:insertTween(tween: table, instant: number)` | 46 | ✍ Registers a tween to start at the given millisecond instant, extends the total duration if needed and applies the sequence target to the tween. |
| `TweenSequence:addTween(tween: table)` | 59 | ✍ Appends a tween at the current end of the sequence. |
| `TweenSequence:insertInterval(interval: number, instant: number)` | 68 | ✍ Inserts a pause at an instant by shifting every tween and callback at or after it by the interval, and grows the total duration. |
| `TweenSequence:addInterval(interval: any)` | 89 | ✍ Appends a pause at the end of the sequence. |
| `TweenSequence:insertCallback(callback: function, callbackState: table, instant: number)` | 98 | ✍ Registers a callback fired once at the given instant with callbackState (after the target if one is set). Callbacks are keyed by function, so the same function can be registered only once. |
| `TweenSequence:addCallback(callback: function, callbackState: table)` | 108 | ✍ Adds a callback after everything already queued. |
| `TweenSequence:getDuration()` | 114 | ✍ Returns the total duration of the sequence in milliseconds. |
| `TweenSequence:setTarget(target: any)` | 121 | ✍ Sets the target table given to setters and callbacks. Note: it does not propagate to tweens already added. |
| `TweenSequence:setLooping(isLooping: boolean)` | 128 | ✍ Enables or disables looping; on completion a looping sequence resets and restarts, callbacks included. |
| `TweenSequence:start()` | 135 | ✍ Marks the sequence as running so update() advances it. |
| `TweenSequence:stop()` | 141 | ✍ Marks the sequence as finished so it stops updating; elapsed time is kept. |
| `TweenSequence:reset()` | 147 | ✍ Resets elapsed time, every child tween and the called flags of callbacks, and leaves the sequence stopped; call start() to play again. |
| `TweenSequence:update(dt: any)` | 162 | ✍ If running, advances by dt milliseconds, updates the tweens and callbacks, and finishes or loops when time and all tweens are done. |
| `TweenSequence:updateTweens(lastInstant: number, dt: number)` | 185 | ✍ Updates every unfinished child tween whose start instant has passed, limiting its dt to the time since its start. Returns true if all are finished. Iteration uses pairs, so order is not guaranteed. |
| `TweenSequence:updateCallbacks()` | 202 | ✍ Fires each not-yet-called callback whose instant is reached, once, with its state (and the target first if set). |
