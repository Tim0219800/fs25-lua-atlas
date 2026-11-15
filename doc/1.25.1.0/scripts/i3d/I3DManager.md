# i3d/I3DManager.lua

Source: `dataS/scripts/i3d/I3DManager.lua` — FS25 1.25.1.0

- **I3DManager** (l.15)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `I3DManager.new(customMt: table?) → I3DManager` | 21 |  |
| `I3DManager:init()` | 33 |  |
| `I3DManager:loadSharedI3DFile(filename: string, callOnCreate: boolean?, addToPhysics: boolean?) → integer, integer, integer` | 88 |  |
| `I3DManager:loadSharedI3DFileAsync(filename: string, callOnCreate: boolean?, addToPhysics: boolean?, asyncCallbackFunction: function, asyncCallbackObject: table, asyncCallbackArguments: table?) → integer` | 107 |  |
| `I3DManager:loadSharedI3DFileAsyncFinished(nodeId: integer, failedReason: integer, arguments: table)` | 132 |  |
| `I3DManager:loadI3DFile(filename: string, callOnCreate: boolean?, addToPhysics: boolean?) → integer` | 148 |  |
| `I3DManager:loadI3DFileAsync(filename: string, callOnCreate: boolean?, addToPhysics: boolean?, asyncCallbackFunction: function, asyncCallbackObject: table?, asyncCallbackArguments: any) → integer` | 166 |  |
| `I3DManager:loadSharedI3DFileFinished(nodeId: integer, failedReason: integer, arguments: any)` | 190 |  |
| `I3DManager:cancelStreamI3DFile(loadingRequestId: integer)` | 203 |  |
| `I3DManager:releaseSharedI3DFile(sharedLoadRequestId: integer, warnIfInvalid: boolean?)` | 216 |  |
| `I3DManager:pinSharedI3DFileInCache(filename: string)` | 235 |  |
| `I3DManager:unpinSharedI3DFileInCache(filename: string)` | 250 |  |
| `I3DManager:clearEntireSharedI3DFileCache(verbose: boolean?)` | 263 |  |
| `I3DManager:setLoadingDelay(minDelaySeconds: number?, maxDelaySeconds: number?, minDelayCachedSeconds: number?, maxDelayCachedSeconds: number?)` | 284 |  |
| `I3DManager:consoleCommandSetLoadingDelay(minDelaySec: number?, maxDelaySec: number?, minDelayCachedSec: number?, maxDelayCachedSec: number?)` | 302 |  |
| `I3DManager:consoleCommandShowCache()` | 313 |  |
| `I3DManager:consoleCommandPrintActiveLoadings()` | 329 |  |
