---@meta
-- FS25 1.25.1.0 : triggers/LoadTrigger.lua (stub généré, atlas Lua FS25)

---@class LoadTrigger : Object
LoadTrigger = {}

---@class LoadTriggerActivatable
LoadTriggerActivatable = {}

---@param schema any
---@param basePath any
function LoadTrigger.registerXMLPaths(schema, basePath) end

---@param isServer any
---@param isClient any
---@param customMt any
function LoadTrigger.new(isServer, isClient, customMt) end

---@param components any
---@param xmlFile any
---@param xmlNode any
---@param i3dMappings any
---@param rootNode any
function LoadTrigger:load(components, xmlFile, xmlNode, i3dMappings, rootNode) end

function LoadTrigger:delete() end

---@param object any
function LoadTrigger:setSource(object) end

function LoadTrigger:raiseActive() end

---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function LoadTrigger:loadTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

---@param fillableObject any
function LoadTrigger:farmIdForFillableObject(fillableObject) end

function LoadTrigger:getIsFillableObjectAvailable() end

function LoadTrigger:toggleLoading() end

---@param fillType any
function LoadTrigger:onFillTypeSelection(fillType) end

---@param isLoading any
---@param targetObject any
---@param fillUnitIndex any
---@param fillType any
---@param noEventSend any
function LoadTrigger:setIsLoading(isLoading, targetObject, fillUnitIndex, fillType, noEventSend) end

---@param fillableObject any
function LoadTrigger:getAllowsActivation(fillableObject) end

---@param fillType any
---@param fillableObject any
---@param fillUnitIndex any
function LoadTrigger:startLoading(fillType, fillableObject, fillUnitIndex) end

function LoadTrigger:stopLoading() end

---@param dt any
function LoadTrigger:update(dt) end

function LoadTrigger:getCurrentFillType() end

function LoadTrigger:getFillTargetNode() end

---@param state any
function LoadTrigger:setFillSoundIsPlaying(state) end

---@param vehicle any
function LoadTrigger:onDeleteObject(vehicle) end

---@param fillType any
function LoadTrigger:getIsFillTypeSupported(fillType) end

function LoadTrigger:getSupportAILoading() end

function LoadTrigger:getAITargetPositionAndDirection() end

---@param loadTrigger any
function LoadTriggerActivatable.new(loadTrigger) end

---@param text any
function LoadTriggerActivatable:setText(text) end

function LoadTriggerActivatable:getIsActivatable() end

function LoadTriggerActivatable:run() end
