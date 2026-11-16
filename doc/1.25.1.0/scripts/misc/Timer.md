# misc/Timer.lua

*[Version française](../../fr/scripts/misc/Timer.md)*

Source: `dataS/scripts/misc/Timer.lua` — FS25 1.25.1.0

✍ Small countdown timer object driven by the mission update loop: while running it is registered as an updateable on g_currentMission and subtracts the frame delta (optionally scaled) from the time left. Durations are in milliseconds. A finish callback can be set, and the remaining time can be sent over a network stream.

- **Timer** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Timer.new(duration: any)` | 15 | ✍ Creates a timer with the given duration (ms), no callback, not running, with the full duration as time left. |
| `Timer:delete()` | 28 | ✍ Cleans up the timer by calling reset, which unregisters it from the mission updateables. |
| `Timer:reset()` | 34 | ✍ Removes the timer from the mission updateables and marks it as not running. Time left is not restored. |
| `Timer:start(noReset: any)` | 41 | ✍ Starts the timer and registers it for updates. Time left is reset to the full duration unless noReset is true. Logs an error with a callstack and does nothing if no duration is set. |
| `Timer:startIfNotRunning()` | 58 | ✍ Calls start only when the timer is not already running, so a running countdown is not restarted. |
| `Timer:stop()` | 66 | ✍ Unregisters the timer from the mission updateables and marks it as stopped, keeping the time left (a later start with noReset can resume). |
| `Timer:finish()` | 73 | ✍ Ends the timer: unregisters it, sets time left to 0, marks it stopped and invokes the finish callback with the timer as argument, if any. |
| `Timer:getIsRunning()` | 84 | ✍ Returns whether the timer is currently running. |
| `Timer:setFinishCallback(callback: any)` | 90 | ✍ Sets the function called when the timer finishes and returns the timer itself for chaining. |
| `Timer:getTimePassed()` | 97 | ✍ Returns the elapsed time in milliseconds, computed as duration minus time left. |
| `Timer:update(dt: any)` | 113 | ✍ Per-frame update called by the mission while running: subtracts dt multiplied by the optional scaleFunc() result from the time left and calls finish when it reaches 0 or below. |
| `Timer.createOneshot(duration: any, callback: any, scaleFunc: any)` | 133 | ✍ Creates and starts a timer that calls callback once after the duration, then deletes itself. Note: it calls timer:setScaleFunction, which is not defined in this file (UNVERIFIED, would error if absent elsewhere); scaleFunc is nominally an optional time-scale getter. |
| `Timer:getDuration()` | 147 | ✍ Returns the configured duration in milliseconds. |
| `Timer:setDuration(duration: any)` | 153 | ✍ Sets the duration (ms), effective at the next start, and returns the timer for chaining. |
| `Timer:writeUpdateStream(streamId: any)` | 160 | ✍ Writes the time left to a network stream as a 32-bit integer (fractional part is not preserved). |
| `Timer:readUpdateStream(streamId: any)` | 166 | ✍ Reads the time left from a network stream as a 32-bit integer. |
