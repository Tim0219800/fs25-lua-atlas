# gui/base/TweenSequence.lua

Source : `dataS/scripts/gui/base/TweenSequence.lua` — FS25 1.25.1.0

- **TweenSequence** hérite de `Tween` (l.19)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TweenSequence.new(functionTarget: any)` | 25 |  |
| `TweenSequence:insertTween(tween: table, instant: number)` | 46 |  |
| `TweenSequence:addTween(tween: table)` | 59 |  |
| `TweenSequence:insertInterval(interval: number, instant: number)` | 68 |  |
| `TweenSequence:addInterval(interval: any)` | 89 |  |
| `TweenSequence:insertCallback(callback: function, callbackState: table, instant: number)` | 98 |  |
| `TweenSequence:addCallback(callback: function, callbackState: table)` | 108 |  |
| `TweenSequence:getDuration()` | 114 |  |
| `TweenSequence:setTarget(target: any)` | 121 |  |
| `TweenSequence:setLooping(isLooping: boolean)` | 128 |  |
| `TweenSequence:start()` | 135 |  |
| `TweenSequence:stop()` | 141 |  |
| `TweenSequence:reset()` | 147 |  |
| `TweenSequence:update(dt: any)` | 162 |  |
| `TweenSequence:updateTweens(lastInstant: number, dt: number)` | 185 |  |
| `TweenSequence:updateCallbacks()` | 202 |  |
