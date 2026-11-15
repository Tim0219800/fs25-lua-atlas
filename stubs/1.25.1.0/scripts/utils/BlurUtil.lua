---@meta
-- FS25 1.25.1.0 : utils/BlurUtil.lua (generated stub, FS25 Lua Atlas)

---@class BlurUtil
BlurUtil = {}

---@param dataGetter function
---@param dataSetter function
---@param width integer
---@param height integer
---@param radius integer
---@param asyncManager AsyncTaskManager?
---@param callback function
function BlurUtil.stackBlurAsync(dataGetter, dataSetter, width, height, radius, asyncManager, callback) end

---@param dataGetter function
---@param dataSetter function
---@param width integer
---@param height integer
---@param radius integer
function BlurUtil.stackBlurHorizontal(dataGetter, dataSetter, width, height, radius) end

---@param dataGetter function
---@param dataSetter function
---@param width integer
---@param height integer
---@param radius integer
function BlurUtil.stackBlurVertical(dataGetter, dataSetter, width, height, radius) end

---@param dataGetter function
---@param dataSetter function
---@param width integer
---@param radius integer
---@param y integer
---@param queue table
function BlurUtil.stackBlurRow(dataGetter, dataSetter, width, radius, y, queue) end

---@param dataGetter function
---@param dataSetter function
---@param height integer
---@param radius integer
---@param x integer
---@param queue table
function BlurUtil.stackBlurColumn(dataGetter, dataSetter, height, radius, x, queue) end

---@param queue table
---@param kernelSize integer
---@param radius integer
---@param edgeValue number
---@return number
---@return number
---@return number
function BlurUtil.recalculateBlurQueueAndSums(queue, kernelSize, radius, edgeValue) end

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
