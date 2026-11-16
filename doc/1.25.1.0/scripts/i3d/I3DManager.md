# i3d/I3DManager.lua

*[Version française](../../fr/scripts/i3d/I3DManager.md)*

Source: `dataS/scripts/i3d/I3DManager.lua` — FS25 1.25.1.0

✍ Manager reachable as `g_i3DManager` that wraps the engine functions for loading i3d files: synchronous or asynchronous, shared (reference-counted cache) or not. It also offers cache pinning and clearing, artificial loading delays for testing, and three console commands (`gsI3DLoadingDelaySet`, `gsI3DCacheShow`, `gsI3DPrintActiveLoadings`). Engine functions it calls (`loadSharedI3DFile`, `streamI3DFile`, ...) are not in the dump, so their internals are UNVERIFIED.

- **I3DManager** (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `I3DManager.new(customMt: table?) → I3DManager` | 21 | ✍ Creates the manager and registers the three console commands for loading delay, cache display and active loadings listing. |
| `I3DManager:init()` | 33 | ✍ Reads the `i3dLoadingDelay` start parameter (milliseconds) and, if positive, applies it as a loading delay and adds a caption. With the `scriptDebug` start parameter it calls `setupDebugLoading`, which is not in this file (UNVERIFIED). |
| `I3DManager:loadSharedI3DFile(filename: string, callOnCreate: boolean?, addToPhysics: boolean?) → integer, integer, integer` | 88 | ✍ Synchronously loads an i3d through the shared cache. `callOnCreate` and `addToPhysics` default to false. Returns the root node, the shared load request id (to pass to `releaseSharedI3DFile`) and a failure reason. |
| `I3DManager:loadSharedI3DFileAsync(filename: string, callOnCreate: boolean?, addToPhysics: boolean?, asyncCallbackFunction: function, asyncCallbackObject: table, asyncCallbackArguments: table?) → integer` | 107 | ✍ Starts an asynchronous shared load; the callback is invoked as (target, node, failedReason, arguments) once done. Asserts that the filename and a function callback are given. Returns the shared load request id. |
| `I3DManager:loadSharedI3DFileAsyncFinished(nodeId: integer, failedReason: integer, arguments: table)` | 132 | ✍ Internal engine callback for the async shared load: unpacks the stored callback data and calls the user callback with node, failure reason and arguments. |
| `I3DManager:loadI3DFile(filename: string, callOnCreate: boolean?, addToPhysics: boolean?) → integer` | 148 | ✍ Synchronous, non-shared load of an i3d file (no cache). Both flags default to false. Returns the node, which is 0 when loading failed. |
| `I3DManager:loadI3DFileAsync(filename: string, callOnCreate: boolean?, addToPhysics: boolean?, asyncCallbackFunction: function, asyncCallbackObject: table?, asyncCallbackArguments: any) → integer` | 166 | ✍ Starts an asynchronous non-shared load; the callback receives (target, node, failedReason, arguments). Returns a request id usable with `cancelStreamI3DFile`. Asserts on missing filename or callback. |
| `I3DManager:loadSharedI3DFileFinished(nodeId: integer, failedReason: integer, arguments: any)` | 190 | ✍ Internal engine callback for `loadI3DFileAsync` (despite its name it handles the non-shared path): forwards node, failure reason and arguments to the stored user callback. |
| `I3DManager:cancelStreamI3DFile(loadingRequestId: integer)` | 203 | ✍ Cancels a pending async load by request id. Logs an error with a callstack if the id is nil. |
| `I3DManager:releaseSharedI3DFile(sharedLoadRequestId: integer, warnIfInvalid: boolean?)` | 216 | ✍ Releases one reference of a shared i3d; the file leaves the cache when no references remain. Logs an error and callstack if the id is nil. |
| `I3DManager:pinSharedI3DFileInCache(filename: string)` | 235 | ✍ Pins a filename in the shared cache, but only when its reference count is below zero according to the engine (the exact meaning of that value is UNVERIFIED). Logs an error if the filename is nil. |
| `I3DManager:unpinSharedI3DFileInCache(filename: string)` | 250 | ✍ Removes the cache pin for a filename. Logs an error and callstack if the filename is nil. |
| `I3DManager:clearEntireSharedI3DFileCache(verbose: boolean?)` | 263 | ✍ Empties the whole shared i3d cache. With `verbose` true it first lists each cached file and its reference count in dev warnings. |
| `I3DManager:setLoadingDelay(minDelaySeconds: number?, maxDelaySeconds: number?, minDelayCachedSeconds: number?, maxDelayCachedSeconds: number?)` | 284 | ✍ Sets artificial min/max delays (seconds) for async loads, separately for cached and uncached shared files, for testing. Missing values fall back to the previous ones; logs the result. |
| `I3DManager:consoleCommandSetLoadingDelay(minDelaySec: number?, maxDelaySec: number?, minDelayCachedSec: number?, maxDelayCachedSec: number?)` | 302 | ✍ Console handler for `gsI3DLoadingDelaySet`: parses up to four numeric arguments (defaulting to 0 or the earlier ones) and calls `setLoadingDelay`. |
| `I3DManager:consoleCommandShowCache()` | 313 | ✍ Console handler for `gsI3DCacheShow`: toggles the cache overlay by adding or removing the manager from `g_debugManager` drawables and prints the new state. |
| `I3DManager:consoleCommandPrintActiveLoadings()` | 329 | ✍ Console handler for `gsI3DPrintActiveLoadings`: prints progress, elapsed time, file and callback of every pending non-shared and shared async loading, or none. |
