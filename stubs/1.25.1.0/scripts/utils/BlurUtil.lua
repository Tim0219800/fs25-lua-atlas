---@meta
-- FS25 1.25.1.0 : utils/BlurUtil.lua (generated stub, FS25 Lua Atlas)

--- Generic 2D blur helpers that work on any data reachable through a getter(x, y) and a setter(x, y, value), using a stack-blur style weighted sliding window (triangular weights). Rows and columns are processed independently, either synchronously or as tasks queued on an async task manager. Coordinates are 1-based, and edge values are clamped.
---@class BlurUtil
BlurUtil = {}

--- Queues one task per row, then one per column, on the given async manager (g_asyncTaskManager if nil) and calls the callback in the task of the last column. Note: the callback is invoked unconditionally, so passing nil would error.
---@param dataGetter function
---@param dataSetter function
---@param width integer
---@param height integer
---@param radius integer
---@param asyncManager AsyncTaskManager?
---@param callback function
function BlurUtil.stackBlurAsync(dataGetter, dataSetter, width, height, radius, asyncManager, callback) end

--- Blurs every row of the data synchronously, reusing one queue table across rows. Writes results in place through the setter.
---@param dataGetter function
---@param dataSetter function
---@param width integer
---@param height integer
---@param radius integer
function BlurUtil.stackBlurHorizontal(dataGetter, dataSetter, width, height, radius) end

--- Blurs every column of the data synchronously, reusing one queue table across columns. Writes results in place through the setter.
---@param dataGetter function
---@param dataSetter function
---@param width integer
---@param height integer
---@param radius integer
function BlurUtil.stackBlurVertical(dataGetter, dataSetter, width, height, radius) end

--- Blurs the single row y: primes the window with the first value, then slides along x. Reads beyond the right edge are clamped to the last column. An optional queue table can be reused.
---@param dataGetter function
---@param dataSetter function
---@param width integer
---@param radius integer
---@param y integer
---@param queue table
function BlurUtil.stackBlurRow(dataGetter, dataSetter, width, radius, y, queue) end

--- Blurs the single column x: primes the window with the first value, then slides along y. Reads beyond the bottom edge are clamped to the last row. An optional queue table can be reused.
---@param dataGetter function
---@param dataSetter function
---@param height integer
---@param radius integer
---@param x integer
---@param queue table
function BlurUtil.stackBlurColumn(dataGetter, dataSetter, height, radius, x, queue) end

--- Fills the queue with the edge value and returns the initial weighted sum, incoming sum and outgoing sum for a kernel of the given size. Used at the start of each row or column.
---@param queue table
---@param kernelSize integer
---@param radius integer
---@param edgeValue number
---@return number
---@return number
---@return number
function BlurUtil.recalculateBlurQueueAndSums(queue, kernelSize, radius, edgeValue) end

--- Internal step: writes the averaged value at (x, y), then updates the queue and the three running sums with the next sample, and returns the new sums and counter. Not meant to be called from outside this class.
---@param dataGetter function
---@param dataSetter function
---@param queue table
---@param kernelSize integer
---@param stackSize integer
---@param radius integer
---@param sum number
---@param inSum number
---@param outSum number
---@param queueCounter integer
---@param x integer
---@param y integer
---@return number
---@return number
---@return number
---@return integer
function BlurUtil.iterateStackBlur(dataGetter, dataSetter, queue, kernelSize, stackSize, radius, sum, inSum, outSum, queueCounter, x, y) end
