# misc/Timer.lua

Source : `dataS/scripts/misc/Timer.lua` — FS25 1.25.1.0

- **Timer** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Timer.new(duration: any)` | 15 |  |
| `Timer:delete()` | 28 |  |
| `Timer:reset()` | 34 |  |
| `Timer:start(noReset: any)` | 41 |  |
| `Timer:startIfNotRunning()` | 58 |  |
| `Timer:stop()` | 66 |  |
| `Timer:finish()` | 73 |  |
| `Timer:getIsRunning()` | 84 |  |
| `Timer:setFinishCallback(callback: any)` | 90 |  |
| `Timer:getTimePassed()` | 97 |  |
| `Timer:update(dt: any)` | 113 |  |
| `Timer.createOneshot(duration: any, callback: any, scaleFunc: any)` | 133 |  |
| `Timer:getDuration()` | 147 |  |
| `Timer:setDuration(duration: any)` | 153 |  |
| `Timer:writeUpdateStream(streamId: any)` | 160 |  |
| `Timer:readUpdateStream(streamId: any)` | 166 |  |
