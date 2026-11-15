---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Cylindered.lua (stub généré, atlas Lua FS25)

---@class Cylindered
Cylindered = {}

---@param specializations table
---@return boolean
function Cylindered.prerequisitesPresent(specializations) end

function Cylindered.initSpecialization() end

---@param schema any
---@param baseKey any
function Cylindered.registerSoundXMLPaths(schema, baseKey) end

---@param schema any
---@param key any
function Cylindered.registerEasyArmControlXMLPaths(schema, key) end

---@param schema any
---@param toolKey any
function Cylindered.registerMovingToolXMLPaths(schema, toolKey) end

---@param schema any
---@param partKey any
function Cylindered.registerMovingPartXMLPaths(schema, partKey) end

---@param schema any
---@param basePath any
function Cylindered.registerDependentComponentJointXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function Cylindered.registerCopyLocalDirectionXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function Cylindered.registerDependentAnimationXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function Cylindered.registerDependentMovingToolXMLPaths(schema, basePath) end

---@param vehicleType any
function Cylindered.registerEvents(vehicleType) end

---@param vehicleType any
function Cylindered.registerFunctions(vehicleType) end

---@param vehicleType any
function Cylindered.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Cylindered.registerEventListeners(vehicleType) end

---@param savegame table
function Cylindered:onLoad(savegame) end

---@param savegame table
function Cylindered:onPostLoad(savegame) end

---@param savegame table
function Cylindered:onLoadFinished(savegame) end

function Cylindered:onRegisterDashboardValueTypes() end

function Cylindered:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function Cylindered:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function Cylindered:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function Cylindered:onWriteStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function Cylindered:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Cylindered:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Cylindered:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param tool any
---@param immediate any
function Cylindered:setDelayedData(tool, immediate) end

---@param tool any
---@param forceLastPosition any
function Cylindered:updateDelayedTool(tool, forceLastPosition) end

---@param xmlFile any
---@param key any
---@param easyArmControl any
function Cylindered:loadEasyArmControlFromXML(xmlFile, key, easyArmControl) end

---@param dt any
---@param updateDelayedNodes any
function Cylindered:updateEasyControl(dt, updateDelayedNodes) end

---@param state any
function Cylindered:setIsEasyControlActive(state) end

---@param value any
function Cylindered:setEasyControlForcedTransMove(value) end

---@param part any
---@param dt any
function Cylindered:updateExtraDependentParts(part, dt) end

---@param part any
---@param dt any
function Cylindered:updateDependentAnimations(part, dt) end

---@param tool any
---@param dependentTool any
function Cylindered:updateDependentToolLimits(tool, dependentTool) end

---@param part any
---@param action any
---@param type any
function Cylindered:onMovingPartSoundEvent(part, action, type) end

---@param tool any
---@param direction any
---@param hitLimit any
---@param wasAtLimit any
function Cylindered:updateMovingToolSoundEvents(tool, direction, hitLimit, wasAtLimit) end

function Cylindered:updateControlGroups() end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Cylindered:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Cylindered:onUpdateEnd(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Cylindered:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Cylindered:onPostUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param updateSound any
function Cylindered:updateDirtyMovingParts(dt, updateSound) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Cylindered:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param xmlFile any
---@param key any
function Cylindered:loadMovingPartsFromXML(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param entry any
function Cylindered:loadMovingPartFromXML(xmlFile, key, entry) end

---@param xmlFile any
---@param key any
function Cylindered:loadMovingToolsFromXML(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param entry any
function Cylindered:loadMovingToolFromXML(xmlFile, key, entry) end

---@param xmlFile XMLFile
---@param baseName string
---@param entry table
function Cylindered:loadDependentMovingTools(xmlFile, baseName, entry) end

---@param xmlFile XMLFile
---@param baseName string
---@param entry table
function Cylindered:loadDependentParts(xmlFile, baseName, entry) end

---@param dependentPartData table
---@param referenceNodes table
function Cylindered:resolveDependentPartData(dependentPartData, referenceNodes) end

---@param xmlFile XMLFile
---@param baseName string
---@param entry table
function Cylindered:loadDependentComponentJoints(xmlFile, baseName, entry) end

---@param xmlFile XMLFile
---@param baseName string
---@param entry table
function Cylindered:loadDependentAttacherJoints(xmlFile, baseName, entry) end

---@param xmlFile XMLFile
---@param baseName string
---@param entry table
function Cylindered:loadDependentWheels(xmlFile, baseName, entry) end

---@param xmlFile XMLFile
---@param baseName string
---@param entry table
function Cylindered:loadDependentTranslatingParts(xmlFile, baseName, entry) end

---@param xmlFile any
---@param baseName any
---@param entry any
function Cylindered:loadExtraDependentParts(xmlFile, baseName, entry) end

---@param xmlFile any
---@param baseName any
---@param entry any
function Cylindered:loadDependentAnimations(xmlFile, baseName, entry) end

---@param xmlFile XMLFile
---@param baseName string
---@param entry table
function Cylindered:loadCopyLocalDirectionParts(xmlFile, baseName, entry) end

---@param xmlFile any
---@param key any
---@param tool any
function Cylindered:loadRotationBasedLimits(xmlFile, key, tool) end

---@param xmlFile any
---@param key any
function Cylindered:loadActionSoundsFromXML(xmlFile, key) end

---@param node any
---@param movingPart any
function Cylindered:checkMovingPartDirtyUpdateNode(node, movingPart) end

---@param node integer
---@param forceUpdate boolean
---@param dt number
function Cylindered:setMovingToolDirty(node, forceUpdate, dt) end

---@param movingPartNode integer
---@param referenceNode integer
---@param isActiveDirty any
function Cylindered:setMovingPartReferenceNode(movingPartNode, referenceNode, isActiveDirty) end

---@param movingPartNode any
---@param dt any
function Cylindered:updateMovingPartByNode(movingPartNode, dt) end

---@param placeComponents boolean
---@param keepDirty any
function Cylindered:updateCylinderedInitial(placeComponents, keepDirty) end

---@param superFunc any
---@return boolean
function Cylindered:allowLoadMovingToolStates(superFunc) end

---@param node any
function Cylindered:getMovingToolByNode(node) end

---@param node any
function Cylindered:getMovingPartByNode(node) end

---@param node any
function Cylindered:getTranslatingPartByNode(node) end

---@param movingTool any
function Cylindered:getIsMovingToolActive(movingTool) end

---@param movingPart any
function Cylindered:getIsMovingPartActive(movingPart) end

---@param movingTool any
function Cylindered:getMovingToolMoveValue(movingTool) end

---@param superFunc function
---@return boolean
---@return string?
function Cylindered:isDetachAllowed(superFunc) end

---@param superFunc XMLFile
---@param xmlFile XMLFile
---@param key string
---@param node integer
---@param object table
function Cylindered:loadObjectChangeValuesFromXML(superFunc, xmlFile, key, node, object) end

---@param superFunc table
---@param object table
---@param isActive boolean
function Cylindered:setObjectChangeValues(superFunc, object, isActive) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function Cylindered:loadDischargeNode(superFunc, xmlFile, key, entry) end

---@param superFunc any
---@param dischargeNode any
function Cylindered:getDischargeNodeEmptyFactor(superFunc, dischargeNode) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function Cylindered:loadShovelNode(superFunc, xmlFile, key, entry) end

---@param superFunc any
---@param shovelNode any
function Cylindered:getShovelNodeIsActive(superFunc, shovelNode) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function Cylindered:loadDynamicMountGrabFromXML(superFunc, xmlFile, key, entry) end

---@param superFunc any
---@param grab any
function Cylindered:getIsDynamicMountGrabOpened(superFunc, grab) end

---@param superFunc any
---@param jointDesc any
---@param anchorActor any
function Cylindered:setComponentJointFrame(superFunc, jointDesc, anchorActor) end

---@param superFunc any
function Cylindered:getAdditionalSchemaText(superFunc) end

---@param superFunc any
---@return number
function Cylindered:getWearMultiplier(superFunc) end

---@param superFunc any
---@return boolean
function Cylindered:getDoConsumePtoPower(superFunc) end

---@param superFunc any
function Cylindered:getConsumingLoad(superFunc) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Cylindered:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function Cylindered:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

---@param subSelectionIndex any
function Cylindered:onSelect(subSelectionIndex) end

function Cylindered:onUnselect() end

function Cylindered:onDeactivate() end

---@param node any
function Cylindered:onAnimationPartChanged(node) end

function Cylindered:onAIImplementStart() end

---@param gameSettingId any
---@param state any
function Cylindered:onVehicleSettingChanged(gameSettingId, state) end

function Cylindered:onRegisterAnimationValueTypes() end

---@param self table
---@param tool table
---@param transSpeed number
---@param dt number
---@param delta any
---@return boolean
function Cylindered.setToolTranslation(self, tool, transSpeed, dt, delta) end

---@param self table
---@param tool table
---@param translation number
function Cylindered.setAbsoluteToolTranslation(self, tool, translation) end

---@param self table
---@param tool table
---@param rotSpeed number
---@param dt number
---@param delta number
---@return boolean
function Cylindered.setToolRotation(self, tool, rotSpeed, dt, delta) end

---@param self table
---@param tool table
---@param rotation number
---@param updateDelayedNodes boolean
function Cylindered.setAbsoluteToolRotation(self, tool, rotation, updateDelayedNodes) end

---@param self table
---@param tool table
---@param animSpeed number
---@param dt number
---@return boolean
function Cylindered.setToolAnimation(self, tool, animSpeed, dt) end

---@param self table
---@param tool table
---@return number
function Cylindered.getMovingToolState(self, tool) end

---@param self table
---@param part table
function Cylindered.setDirty(self, part) end

---@param self table
---@param part table
function Cylindered.updateWheels(self, part) end

---@param self table
---@param part table
---@param placeComponents boolean?
---@param updateDependentParts boolean?
---@param isActive boolean?
---@param updateSounds any
function Cylindered.updateMovingPart(self, part, placeComponents, updateDependentParts, isActive, updateSounds) end

---@param self table
---@param entry table
---@param placeComponents boolean
function Cylindered.updateComponentJoints(self, entry, placeComponents) end

---@param self table
---@param entry table
function Cylindered.updateAttacherJoints(self, entry) end

---@param first any
---@param second any
---@param alpha any
function Cylindered.limitInterpolator(first, second, alpha) end

---@param self any
---@param tool any
---@param dependentTool any
function Cylindered.updateRotationBasedLimits(self, tool, dependentTool) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function Cylindered.actionEventInput(self, actionName, inputValue, callbackState, isAnalog, isMouse) end

---@param self any
---@param dashboard any
function Cylindered.getMovingToolDashboardState(self, dashboard) end

---@param self any
---@param xmlFile any
---@param key any
---@param dashboard any
---@param components any
---@param i3dMappings any
function Cylindered.movingToolDashboardAttributes(self, xmlFile, key, dashboard, components, i3dMappings) end
