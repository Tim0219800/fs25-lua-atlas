---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolMotorized.lua (stub généré, atlas Lua FS25)

---@class HandToolMotorized
HandToolMotorized = {}

---@param xmlSchema any
function HandToolMotorized.registerXMLPaths(xmlSchema) end

---@param handToolType any
function HandToolMotorized.registerFunctions(handToolType) end

---@param handToolType any
function HandToolMotorized.registerOverwrittenFunctions(handToolType) end

---@param handToolType any
function HandToolMotorized.registerEventListeners(handToolType) end

---@param specializations any
function HandToolMotorized.prerequisitesPresent(specializations) end

---@param xmlFile any
---@param baseDirectory any
function HandToolMotorized:onLoad(xmlFile, baseDirectory) end

---@param savegame any
function HandToolMotorized:onPostLoad(savegame) end

function HandToolMotorized:onDelete() end

---@param streamId any
---@param connection any
---@param dirtyMask any
function HandToolMotorized:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param streamId any
---@param timestamp any
---@param connection any
function HandToolMotorized:onReadUpdateStream(streamId, timestamp, connection) end

function HandToolMotorized:onHeldStart() end

function HandToolMotorized:onHeldEnd() end

---@param dt any
function HandToolMotorized:onUpdate(dt) end

---@param dt any
function HandToolMotorized:updateRPM(dt) end

---@param dt any
function HandToolMotorized:updateSounds(dt) end

---@param dt any
function HandToolMotorized:updateVibrations(dt) end

---@return number
---@return number
---@return number
function HandToolMotorized:getVibrationOffset() end

---@param superFunc function
---@param bobNode table
---@param dt number
---@param isActive boolean
---@param speed number
function HandToolMotorized:updateBobNode(superFunc, bobNode, dt, isActive, speed) end

---@param rpm number
---@return number
function HandToolMotorized:getTimeToReachRPM(rpm) end

function HandToolMotorized:getRPMGainPerSecond() end

---@param rpmGainPerSecond any
function HandToolMotorized:setRPMGainPerSecond(rpmGainPerSecond) end

function HandToolMotorized:getRPMLossPerSecond() end

---@param rpmLossPerSecond any
function HandToolMotorized:setRPMLossPerSecond(rpmLossPerSecond) end

function HandToolMotorized:getCurrentLoad() end

---@param currentLoad any
function HandToolMotorized:setCurrentLoad(currentLoad) end

function HandToolMotorized:getCurrentRPM() end

---@param currentRPM any
function HandToolMotorized:setCurrentRPM(currentRPM) end

function HandToolMotorized:getTargetRPM() end

function HandToolMotorized:getMaxRPM() end

function HandToolMotorized:getMinRPM() end

---@param targetRPM any
function HandToolMotorized:setTargetRPM(targetRPM) end

function HandToolMotorized:setTargetRPMToIdle() end

function HandToolMotorized:setTargetRPMToMax() end

---@param x any
---@param y any
---@param textSize any
function HandToolMotorized:onDebugDraw(x, y, textSize) end
