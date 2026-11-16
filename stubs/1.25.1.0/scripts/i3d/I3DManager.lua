---@meta
-- FS25 1.25.1.0 : i3d/I3DManager.lua (generated stub, FS25 Lua Atlas)

--- Manager reachable as `g_i3DManager` that wraps the engine functions for loading i3d files: synchronous or asynchronous, shared (reference-counted cache) or not. It also offers cache pinning and clearing, artificial loading delays for testing, and three console commands (`gsI3DLoadingDelaySet`, `gsI3DCacheShow`, `gsI3DPrintActiveLoadings`). Engine functions it calls (`loadSharedI3DFile`, `streamI3DFile`, ...) are not in the dump, so their internals are UNVERIFIED.
---@class I3DManager
I3DManager = {}

--- Creates the manager and registers the three console commands for loading delay, cache display and active loadings listing.
---@param customMt table?
---@return I3DManager
function I3DManager.new(customMt) end

--- Reads the `i3dLoadingDelay` start parameter (milliseconds) and, if positive, applies it as a loading delay and adds a caption. With the `scriptDebug` start parameter it calls `setupDebugLoading`, which is not in this file (UNVERIFIED).
function I3DManager:init() end

--- Synchronously loads an i3d through the shared cache. `callOnCreate` and `addToPhysics` default to false. Returns the root node, the shared load request id (to pass to `releaseSharedI3DFile`) and a failure reason.
---@param filename string
---@param callOnCreate boolean?
---@param addToPhysics boolean?
---@return integer
---@return integer
---@return integer
function I3DManager:loadSharedI3DFile(filename, callOnCreate, addToPhysics) end

--- Starts an asynchronous shared load; the callback is invoked as (target, node, failedReason, arguments) once done. Asserts that the filename and a function callback are given. Returns the shared load request id.
---@param filename string
---@param callOnCreate boolean?
---@param addToPhysics boolean?
---@param asyncCallbackFunction function
---@param asyncCallbackObject table
---@param asyncCallbackArguments table?
---@return integer
function I3DManager:loadSharedI3DFileAsync(filename, callOnCreate, addToPhysics, asyncCallbackFunction, asyncCallbackObject, asyncCallbackArguments) end

--- Internal engine callback for the async shared load: unpacks the stored callback data and calls the user callback with node, failure reason and arguments.
---@param nodeId integer
---@param failedReason integer
---@param arguments table
function I3DManager:loadSharedI3DFileAsyncFinished(nodeId, failedReason, arguments) end

--- Synchronous, non-shared load of an i3d file (no cache). Both flags default to false. Returns the node, which is 0 when loading failed.
---@param filename string
---@param callOnCreate boolean?
---@param addToPhysics boolean?
---@return integer
function I3DManager:loadI3DFile(filename, callOnCreate, addToPhysics) end

--- Starts an asynchronous non-shared load; the callback receives (target, node, failedReason, arguments). Returns a request id usable with `cancelStreamI3DFile`. Asserts on missing filename or callback.
---@param filename string
---@param callOnCreate boolean?
---@param addToPhysics boolean?
---@param asyncCallbackFunction function
---@param asyncCallbackObject table?
---@param asyncCallbackArguments any
---@return integer
function I3DManager:loadI3DFileAsync(filename, callOnCreate, addToPhysics, asyncCallbackFunction, asyncCallbackObject, asyncCallbackArguments) end

--- Internal engine callback for `loadI3DFileAsync` (despite its name it handles the non-shared path): forwards node, failure reason and arguments to the stored user callback.
---@param nodeId integer
---@param failedReason integer
---@param arguments any
function I3DManager:loadSharedI3DFileFinished(nodeId, failedReason, arguments) end

--- Cancels a pending async load by request id. Logs an error with a callstack if the id is nil.
---@param loadingRequestId integer
function I3DManager:cancelStreamI3DFile(loadingRequestId) end

--- Releases one reference of a shared i3d; the file leaves the cache when no references remain. Logs an error and callstack if the id is nil.
---@param sharedLoadRequestId integer
---@param warnIfInvalid boolean?
function I3DManager:releaseSharedI3DFile(sharedLoadRequestId, warnIfInvalid) end

--- Pins a filename in the shared cache, but only when its reference count is below zero according to the engine (the exact meaning of that value is UNVERIFIED). Logs an error if the filename is nil.
---@param filename string
function I3DManager:pinSharedI3DFileInCache(filename) end

--- Removes the cache pin for a filename. Logs an error and callstack if the filename is nil.
---@param filename string
function I3DManager:unpinSharedI3DFileInCache(filename) end

--- Empties the whole shared i3d cache. With `verbose` true it first lists each cached file and its reference count in dev warnings.
---@param verbose boolean?
function I3DManager:clearEntireSharedI3DFileCache(verbose) end

--- Sets artificial min/max delays (seconds) for async loads, separately for cached and uncached shared files, for testing. Missing values fall back to the previous ones; logs the result.
---@param minDelaySeconds number?
---@param maxDelaySeconds number?
---@param minDelayCachedSeconds number?
---@param maxDelayCachedSeconds number?
function I3DManager:setLoadingDelay(minDelaySeconds, maxDelaySeconds, minDelayCachedSeconds, maxDelayCachedSeconds) end

--- Console handler for `gsI3DLoadingDelaySet`: parses up to four numeric arguments (defaulting to 0 or the earlier ones) and calls `setLoadingDelay`.
---@param minDelaySec number?
---@param maxDelaySec number?
---@param minDelayCachedSec number?
---@param maxDelayCachedSec number?
function I3DManager:consoleCommandSetLoadingDelay(minDelaySec, maxDelaySec, minDelayCachedSec, maxDelayCachedSec) end

--- Console handler for `gsI3DCacheShow`: toggles the cache overlay by adding or removing the manager from `g_debugManager` drawables and prints the new state.
function I3DManager:consoleCommandShowCache() end

--- Console handler for `gsI3DPrintActiveLoadings`: prints progress, elapsed time, file and callback of every pending non-shared and shared async loading, or none.
function I3DManager:consoleCommandPrintActiveLoadings() end
