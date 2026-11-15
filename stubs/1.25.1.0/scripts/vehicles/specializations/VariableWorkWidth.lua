---@meta
-- FS25 1.25.1.0 : vehicles/specializations/VariableWorkWidth.lua (stub généré, atlas Lua FS25)

---@class VariableWorkWidth
VariableWorkWidth = {}

---@param specializations any
function VariableWorkWidth.prerequisitesPresent(specializations) end

function VariableWorkWidth.initSpecialization() end

---@param schema any
---@param basePath any
function VariableWorkWidth.registerSectionPaths(schema, basePath) end

---@param vehicleType any
function VariableWorkWidth.registerEvents(vehicleType) end

---@param vehicleType any
function VariableWorkWidth.registerFunctions(vehicleType) end

---@param vehicleType any
function VariableWorkWidth.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function VariableWorkWidth.registerEventListeners(vehicleType) end

---@param savegame any
function VariableWorkWidth:onPostLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function VariableWorkWidth:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function VariableWorkWidth:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function VariableWorkWidth:onWriteStream(streamId, connection) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function VariableWorkWidth:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function VariableWorkWidth.actionEventWorkWidthLeft(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function VariableWorkWidth.actionEventWorkWidthRight(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function VariableWorkWidth.actionEventWorkWidthToggle(self, actionName, inputValue, callbackState, isAnalog) end

function VariableWorkWidth:onAIFieldWorkerStart() end

function VariableWorkWidth:onAIImplementStart() end

---@param isActive any
function VariableWorkWidth:setVariableWorkWidthActive(isActive) end

---@param leftSide any
---@param rightSide any
---@param noEventSend any
function VariableWorkWidth:setSectionsActive(leftSide, rightSide, noEventSend) end

---@param sectionNodes any
---@param percentage any
function VariableWorkWidth:setSectionNodePercentage(sectionNodes, percentage) end

function VariableWorkWidth:updateSections() end

---@param sections any
---@param state any
function VariableWorkWidth:updateSectionStates(sections, state) end

---@param node integer
function VariableWorkWidth:getEffectByNode(node) end

---@param isLeft boolean
---@return number
---@return number
---@return boolean
function VariableWorkWidth:getVariableWorkWidth(isLeft) end

---@return number
function VariableWorkWidth:getVariableWorkWidthUsage() end

---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function VariableWorkWidth:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

---@param superFunc any
---@param workArea any
function VariableWorkWidth:getIsWorkAreaActive(superFunc, workArea) end
