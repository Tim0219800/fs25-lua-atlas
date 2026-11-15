---@meta
-- FS25 1.25.1.0 : i3d/I3DManager.lua (stub généré, atlas Lua FS25)

---@class I3DManager
I3DManager = {}

---@param customMt table?
---@return I3DManager
function I3DManager.new(customMt) end

function I3DManager:init() end

---@param filename string
---@param callOnCreate boolean?
---@param addToPhysics boolean?
---@return integer
---@return integer
---@return integer
function I3DManager:loadSharedI3DFile(filename, callOnCreate, addToPhysics) end

---@param filename string
---@param callOnCreate boolean?
---@param addToPhysics boolean?
---@param asyncCallbackFunction function
---@param asyncCallbackObject table
---@param asyncCallbackArguments table?
---@return integer
function I3DManager:loadSharedI3DFileAsync(filename, callOnCreate, addToPhysics, asyncCallbackFunction, asyncCallbackObject, asyncCallbackArguments) end

---@param nodeId integer
---@param failedReason integer
---@param arguments table
function I3DManager:loadSharedI3DFileAsyncFinished(nodeId, failedReason, arguments) end

---@param filename string
---@param callOnCreate boolean?
---@param addToPhysics boolean?
---@return integer
function I3DManager:loadI3DFile(filename, callOnCreate, addToPhysics) end

---@param filename string
---@param callOnCreate boolean?
---@param addToPhysics boolean?
---@param asyncCallbackFunction function
---@param asyncCallbackObject table?
---@param asyncCallbackArguments any
---@return integer
function I3DManager:loadI3DFileAsync(filename, callOnCreate, addToPhysics, asyncCallbackFunction, asyncCallbackObject, asyncCallbackArguments) end

---@param nodeId integer
---@param failedReason integer
---@param arguments any
function I3DManager:loadSharedI3DFileFinished(nodeId, failedReason, arguments) end

---@param loadingRequestId integer
function I3DManager:cancelStreamI3DFile(loadingRequestId) end

---@param sharedLoadRequestId integer
---@param warnIfInvalid boolean?
function I3DManager:releaseSharedI3DFile(sharedLoadRequestId, warnIfInvalid) end

---@param filename string
function I3DManager:pinSharedI3DFileInCache(filename) end

---@param filename string
function I3DManager:unpinSharedI3DFileInCache(filename) end

---@param verbose boolean?
function I3DManager:clearEntireSharedI3DFileCache(verbose) end

---@param minDelaySeconds number?
---@param maxDelaySeconds number?
---@param minDelayCachedSeconds number?
---@param maxDelayCachedSeconds number?
function I3DManager:setLoadingDelay(minDelaySeconds, maxDelaySeconds, minDelayCachedSeconds, maxDelayCachedSeconds) end

---@param minDelaySec number?
---@param maxDelaySec number?
---@param minDelayCachedSec number?
---@param maxDelayCachedSec number?
function I3DManager:consoleCommandSetLoadingDelay(minDelaySec, maxDelaySec, minDelayCachedSec, maxDelayCachedSec) end

function I3DManager:consoleCommandShowCache() end

function I3DManager:consoleCommandPrintActiveLoadings() end
