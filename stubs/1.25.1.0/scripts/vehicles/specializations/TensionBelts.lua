---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TensionBelts.lua (generated stub, FS25 Lua Atlas)

---@class TensionBelts
TensionBelts = {}

---@class TensionBeltsActivatable
TensionBeltsActivatable = {}

---@param specializations any
function TensionBelts.prerequisitesPresent(specializations) end

function TensionBelts.initSpecialization() end

---@param vehicleType any
function TensionBelts.registerFunctions(vehicleType) end

---@param vehicleType any
function TensionBelts.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function TensionBelts.registerEventListeners(vehicleType) end

---@param savegame table
function TensionBelts:onLoad(savegame) end

---@param savegame table
function TensionBelts:onPostLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function TensionBelts:saveToXMLFile(xmlFile, key, usedModNames) end

function TensionBelts:onPreDelete() end

function TensionBelts:onDelete() end

---@param streamId integer
---@param connection Connection
function TensionBelts:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TensionBelts:onWriteStream(streamId, connection) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TensionBelts:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TensionBelts:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TensionBelts:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function TensionBelts:refreshTensionBelts() end

---@param objectId any
---@param objectsToJointTable any
---@param isDynamic any
---@param object any
function TensionBelts:freeTensionBeltObject(objectId, objectsToJointTable, isDynamic, object) end

---@param objectId any
---@param objectsToJointTable any
---@param isDynamic any
---@param jointNode any
---@param object any
function TensionBelts:lockTensionBeltObject(objectId, objectsToJointTable, isDynamic, jointNode, object) end

---@param isActive boolean
---@param beltId integer
---@param noEventSend boolean
---@param playSound boolean
function TensionBelts:setTensionBeltsActive(isActive, beltId, noEventSend, playSound) end

---@param isActive any
---@param noEventSend any
function TensionBelts:setAllTensionBeltsActive(isActive, noEventSend) end

function TensionBelts:updateFastenState() end

---@param belt table
---@param isDummy boolean
---@param objects table
---@param playSound boolean
function TensionBelts:createTensionBelt(belt, isDummy, objects, playSound) end

---@param belt table
---@param playSound boolean
function TensionBelts:removeTensionBelt(belt, playSound) end

---@param belt table
---@return table
---@return integer
function TensionBelts:getObjectToMount(belt) end

---@param belt table
---@return table
---@return integer
function TensionBelts:getObjectsToUnmount(belt) end

---@param transformId integer
function TensionBelts:objectOverlapCallback(transformId) end

---@param object any
function TensionBelts:getTensionBeltObjectCanBeMounted(object) end

---@return boolean
---@return table
function TensionBelts:getIsPlayerInTensionBeltsRange() end

---@param node any
function TensionBelts:getIsDynamicallyMountedNode(node) end

---@param superFunc any
function TensionBelts:getIsReadyForAutomatedTrainTravel(superFunc) end

---@param superFunc any
function TensionBelts:getCanBeSelected(superFunc) end

---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function TensionBelts:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function TensionBelts:loadMovingToolFromXML(superFunc, xmlFile, key, entry) end

---@param superFunc any
---@param movingTool any
function TensionBelts:getIsMovingToolActive(superFunc, movingTool) end

---@param superFunc any
---@param dischargeNode any
function TensionBelts:getCanDischargeToGround(superFunc, dischargeNode) end

---@param superFunc any
---@param dischargeNode any
function TensionBelts:getCanDischargeToObject(superFunc, dischargeNode) end

---@param superFunc any
---@param display any
function TensionBelts:getFillLevelInformation(superFunc, display) end

---@param superFunc table
---@param object table
---@return boolean
function TensionBelts:getHasObjectMounted(superFunc, object) end

---@param superFunc any
---@param component any
function TensionBelts:getAdditionalComponentMass(superFunc, component) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function TensionBelts:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function TensionBelts:tensionBeltActivationTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

---@param oldShape any
---@param shape any
function TensionBelts:onTensionBeltTreeShapeCut(oldShape, shape) end

---@param object any
function TensionBeltsActivatable.new(object) end

function TensionBeltsActivatable:getIsActivatable() end

---@param posX any
---@param posY any
---@param posZ any
function TensionBeltsActivatable:getDistance(posX, posY, posZ) end

function TensionBeltsActivatable:run() end

function TensionBeltsActivatable:updateActivateText() end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function TensionBelts.actionEventToggleTensionBelts(self, actionName, inputValue, callbackState, isAnalog) end

---@param unusedSelf any
function TensionBelts.consoleCommandToggleTensionBeltDebugRendering(unusedSelf) end
