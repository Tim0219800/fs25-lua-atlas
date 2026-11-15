---@meta
-- FS25 1.25.1.0 : vehicles/specializations/BaleWrapper.lua (generated stub, FS25 Lua Atlas)

---@class BaleWrapper
BaleWrapper = {}

---@param specializations table
---@return boolean
function BaleWrapper.prerequisitesPresent(specializations) end

function BaleWrapper.initSpecialization() end

---@param schema any
---@param basePath any
function BaleWrapper.registerWrapperXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
---@param name any
function BaleWrapper.registerWrapperAnimationXMLPaths(schema, basePath, name) end

---@param schema any
---@param basePath any
function BaleWrapper.registerWrapperFoilAnimationXMLPaths(schema, basePath) end

---@param vehicleType any
function BaleWrapper.registerFunctions(vehicleType) end

---@param vehicleType any
function BaleWrapper.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function BaleWrapper.registerEventListeners(vehicleType) end

---@param savegame table
function BaleWrapper:onLoad(savegame) end

---@param savegame any
function BaleWrapper:onPostLoad(savegame) end

---@param wrapper any
---@param xmlFile any
---@param baseKey any
---@param wrapperName any
function BaleWrapper:loadWrapperFromXML(wrapper, xmlFile, baseKey, wrapperName) end

---@param target any
---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param animationsKey any
---@param parentAnimations any
function BaleWrapper:loadWrapperAnimationsFromXML(target, xmlFile, baseKey, configKey, animationsKey, parentAnimations) end

---@param target any
---@param xmlFile any
---@param baseKey any
function BaleWrapper:loadWrapperAnimCurveFromXML(target, xmlFile, baseKey) end

---@param target any
---@param xmlFile any
---@param baseKey any
function BaleWrapper:loadWrapperAnimNodesFromXML(target, xmlFile, baseKey) end

---@param target any
---@param xmlFile any
---@param baseKey any
function BaleWrapper:loadWrapperWrapNodesFromXML(target, xmlFile, baseKey) end

---@param target any
---@param xmlFile any
---@param baseKey any
function BaleWrapper:loadWrapperStateCurveFromXML(target, xmlFile, baseKey) end

---@param target any
---@param xmlFile any
---@param baseKey any
---@param animTime any
function BaleWrapper:loadWrapperAnimationNodesFromXML(target, xmlFile, baseKey, animTime) end

---@param target any
---@param xmlFile any
---@param baseKey any
---@param isDefault any
function BaleWrapper:loadWrapperFoilAnimationFromXML(target, xmlFile, baseKey, isDefault) end

---@param savegame table
function BaleWrapper:onLoadFinished(savegame) end

function BaleWrapper:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function BaleWrapper:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function BaleWrapper:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BaleWrapper:onWriteStream(streamId, connection) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function BaleWrapper:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function BaleWrapper:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function BaleWrapper:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function BaleWrapper:baleGrabberTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

---@return boolean
function BaleWrapper:allowsGrabbingBale() end

---@param isWrapping boolean
---@param isEmpty boolean
---@param t number
---@param wrapperRot number
function BaleWrapper:updateWrapNodes(isWrapping, isEmpty, t, wrapperRot) end

---@param wrappingTime number
---@param noEventSend boolean
function BaleWrapper:updateWrappingState(wrappingTime, noEventSend) end

---@param bale table
function BaleWrapper:playMoveToWrapper(bale) end

---@param isRoundBaleWrapper boolean
---@param baleTypeIndex integer
function BaleWrapper:setBaleWrapperType(isRoundBaleWrapper, baleTypeIndex) end

---@param baleTypes table
---@param bale table
function BaleWrapper:getMatchingBaleTypeIndex(baleTypes, bale) end

---@param id integer
---@param nearestBaleServerId integer
function BaleWrapper:doStateChange(id, nearestBaleServerId) end

---@param bale table
---@return table
function BaleWrapper:getIsBaleWrappable(bale) end

---@return boolean
---@return string
function BaleWrapper:getIsBaleDropAllowed() end

---@param nodeId any
function BaleWrapper:onBaleWrapperDropOverlapCallback(nodeId) end

---@return boolean
function BaleWrapper:getIsBaleWrappingAllowed() end

---@param nodeId any
function BaleWrapper:onBaleWrapperBlockOverlapCallback(nodeId) end

---@param bale table
---@param baleTypeIndex integer
function BaleWrapper:pickupWrapperBale(bale, baleTypeIndex) end

---@param self integer
---@param refNode integer
---@param distance number
---@return table
---@return integer
function BaleWrapper.getBaleInRange(self, refNode, distance) end

---@param state any
---@param noEventSend any
function BaleWrapper:setBaleWrapperAutomaticDrop(state, noEventSend) end

---@param dropAnimationIndex any
function BaleWrapper:setBaleWrapperDropAnimation(dropAnimationIndex) end

---@param superFunc boolean
---@param direction any
---@param onAiTurnOn boolean
---@return boolean
function BaleWrapper:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

---@param superFunc any
function BaleWrapper:getCanBeSelected(superFunc) end

---@param superFunc any
---@param typeName any
function BaleWrapper:getShowConsumableEmptyWarning(superFunc, typeName) end

---@param superFunc any
function BaleWrapper:getRequiresPower(superFunc) end

---@param superFunc any
function BaleWrapper:getStandaloneMotorTargetRpm(superFunc) end

---@param superFunc any
function BaleWrapper:getStandaloneMotorLoad(superFunc) end

---@param superFunc any
---@return boolean
function BaleWrapper:addToPhysics(superFunc) end

---@param superFunc any
---@return boolean
function BaleWrapper:removeFromPhysics(superFunc) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function BaleWrapper:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param trigger any
---@param name any
---@param xmlFile any
---@param key any
function BaleWrapper:onRegisterExternalActionEvents(trigger, name, xmlFile, key) end

function BaleWrapper:onDeactivate() end

---@param direction any
---@param moveToMiddle any
function BaleWrapper:onFoldStateChanged(direction, moveToMiddle) end

---@param variationIndex any
---@param metaData any
function BaleWrapper:onConsumableVariationChanged(variationIndex, metaData) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function BaleWrapper.actionEventEmpty(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function BaleWrapper.actionEventToggleAutomaticDrop(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function BaleWrapper.actionEventDrop(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
function BaleWrapper.updateActionEvents(self) end

---@param data any
---@param vehicle any
function BaleWrapper.externalActionEventUnloadRegister(data, vehicle) end

---@param data any
---@param vehicle any
function BaleWrapper.externalActionEventUnloadUpdate(data, vehicle) end

---@param data any
---@param vehicle any
function BaleWrapper.externalActionEventAutomaticUnloadRegister(data, vehicle) end

---@param data any
---@param vehicle any
function BaleWrapper.externalActionEventAutomaticUnloadUpdate(data, vehicle) end

---@param data any
---@param vehicle any
function BaleWrapper.externalActionEventWarningsRegister(data, vehicle) end

---@param data any
---@param vehicle any
function BaleWrapper.externalActionEventWarningsUpdate(data, vehicle) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
---@param roundBaleWrapper any
function BaleWrapper.loadSpecValueBaleSize(xmlFile, customEnvironment, baseDir, roundBaleWrapper) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
---@param roundBaleWrapper any
function BaleWrapper.getSpecValueBaleSize(storeItem, realItem, configurations, saleItem, returnValues, returnRange, roundBaleWrapper) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function BaleWrapper.loadSpecValueBaleSizeRound(xmlFile, customEnvironment, baseDir) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function BaleWrapper.loadSpecValueBaleSizeSquare(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function BaleWrapper.getSpecValueBaleSizeRound(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function BaleWrapper.getSpecValueBaleSizeSquare(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
