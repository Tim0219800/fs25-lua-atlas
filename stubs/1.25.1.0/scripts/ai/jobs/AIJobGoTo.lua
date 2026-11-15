---@meta
-- FS25 1.25.1.0 : ai/jobs/AIJobGoTo.lua (stub généré, atlas Lua FS25)

---@class AIJobGoTo : AIJob
AIJobGoTo = {}

---@param isServer any
---@param customMt any
function AIJobGoTo.new(isServer, customMt) end

---@param farmId any
function AIJobGoTo:start(farmId) end

---@param aiMessage any
function AIJobGoTo:stop(aiMessage) end

function AIJobGoTo:getTarget() end

---@param vehicle any
function AIJobGoTo:getIsAvailableForVehicle(vehicle) end

function AIJobGoTo:getTitle() end

---@param vehicle any
---@param mission any
---@param farmId any
---@param isDirectStart any
function AIJobGoTo:applyCurrentState(vehicle, mission, farmId, isDirectStart) end

function AIJobGoTo:setValues() end

---@param farmId any
function AIJobGoTo:validate(farmId) end

function AIJobGoTo:getDescription() end

---@param connection any
function AIJobGoTo:getIsStartable(connection) end

---@param state any
function AIJobGoTo.getIsStartErrorText(state) end
