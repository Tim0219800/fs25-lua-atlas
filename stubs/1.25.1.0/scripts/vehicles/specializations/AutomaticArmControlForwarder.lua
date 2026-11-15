---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AutomaticArmControlForwarder.lua (stub généré, atlas Lua FS25)

---@param specializations table
---@return boolean
function AutomaticArmControlForwarder.prerequisitesPresent(specializations) end

function AutomaticArmControlForwarder.initSpecialization() end

---@param schema any
---@param basePath any
function AutomaticArmControlForwarder.registerXMLPaths(schema, basePath) end

---@param vehicleType any
function AutomaticArmControlForwarder.registerFunctions(vehicleType) end

---@param vehicleType any
function AutomaticArmControlForwarder.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AutomaticArmControlForwarder.registerEventListeners(vehicleType) end

---@param savegame any
function AutomaticArmControlForwarder:onLoad(savegame) end

---@param savegame any
function AutomaticArmControlForwarder:onPostLoad(savegame) end

function AutomaticArmControlForwarder:onDelete() end

---@param streamId any
---@param timestamp any
---@param connection any
function AutomaticArmControlForwarder:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function AutomaticArmControlForwarder:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function AutomaticArmControlForwarder:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param treeNodeId any
function AutomaticArmControlForwarder:onAutoLoadForwaderMountedTree(treeNodeId) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function AutomaticArmControlForwarder:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AutomaticArmControlForwarder.actionEvent(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param state any
function AutomaticArmControlForwarder.updateActionEvents(self, state) end

function AutomaticArmControlForwarder:getIsAutoTreeAlignmentAllowed() end

---@param inputValue any
function AutomaticArmControlForwarder:setTreeArmAlignmentInput(inputValue) end

---@param tx any
---@param ty any
---@param tz any
---@param dx any
---@param dy any
---@param dz any
---@param direction any
---@param forceMoveUp any
function AutomaticArmControlForwarder:doTreeArmAlignment(tx, ty, tz, dx, dy, dz, direction, forceMoveUp) end

---@param self any
---@param movingTool any
---@param tx any
---@param ty any
---@param tz any
---@param referenceNode any
---@param threshold any
---@param speedScale any
---@param offset any
---@param allowInversion any
function AutomaticArmControlForwarder.movingToolXAlignment(self, movingTool, tx, ty, tz, referenceNode, threshold, speedScale, offset, allowInversion) end

---@param self any
---@param movingTool any
---@param targetRot any
function AutomaticArmControlForwarder.calculateMovingToolTargetMove(self, movingTool, targetRot) end

function AutomaticArmControlForwarder:resetAutomaticAlignment() end

function AutomaticArmControlForwarder:getIsAutomaticAlignmentActive() end

function AutomaticArmControlForwarder:getIsAutomaticAlignmentFinished() end

function AutomaticArmControlForwarder:getAutomaticAlignmentTargetTree() end

function AutomaticArmControlForwarder:getAutomaticAlignmentAvailableTargetTree() end

function AutomaticArmControlForwarder:getAutomaticAlignmentCurrentTarget() end

---@param referenceNode any
---@param trees any
function AutomaticArmControlForwarder:getBestTreeToAutoAlign(referenceNode, trees) end

---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function AutomaticArmControlForwarder:onTreeAutoTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

---@param node any
---@param radius any
---@param steps any
---@param minRot any
---@param maxRot any
function AutomaticArmControlForwarder.drawDebugCircleRange(node, radius, steps, minRot, maxRot) end
