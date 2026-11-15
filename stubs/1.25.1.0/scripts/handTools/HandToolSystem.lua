---@meta
-- FS25 1.25.1.0 : handTools/HandToolSystem.lua (generated stub, FS25 Lua Atlas)

---@class HandToolSystem : AbstractManager
HandToolSystem = {}

---@return HandToolSystem
function HandToolSystem.new() end

---@param handTool any
function HandToolSystem:addHandTool(handTool) end

---@param handTool any
function HandToolSystem:removeHandTool(handTool) end

---@param uniqueId any
function HandToolSystem:getHandToolByUniqueId(uniqueId) end

---@param handToolHolder any
function HandToolSystem:addHandToolHolder(handToolHolder) end

---@param handToolHolder any
function HandToolSystem:removeHandToolHolder(handToolHolder) end

---@param uniqueId any
function HandToolSystem:getHandToolHolderByUniqueId(uniqueId) end

---@param xmlFilename any
---@param usedModNames any
function HandToolSystem:save(xmlFilename, usedModNames) end

---@param handTools any
---@param xmlFile any
---@param usedModNames any
function HandToolSystem:saveToXML(handTools, xmlFile, usedModNames) end

---@param handTool any
---@param xmlFile any
---@param index any
---@param i any
---@param usedModNames any
function HandToolSystem:saveHandToolToXML(handTool, xmlFile, index, i, usedModNames) end

---@param xmlFile any
---@param key any
function HandToolSystem:loadHandToolFromXML(xmlFile, key) end

---@param handTool any
---@param loadingState any
function HandToolSystem:loadHandToolFinished(handTool, loadingState) end

---@param handTool any
function HandToolSystem:addPendingHandToolLoad(handTool) end

---@param handTool any
function HandToolSystem:removePendingHandToolLoad(handTool) end

function HandToolSystem:canStartMission() end
