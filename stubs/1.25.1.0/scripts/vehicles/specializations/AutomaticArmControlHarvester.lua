---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AutomaticArmControlHarvester.lua (generated stub, FS25 Lua Atlas)

---@param specializations table
---@return boolean
function AutomaticArmControlHarvester.prerequisitesPresent(specializations) end

function AutomaticArmControlHarvester.initSpecialization() end

---@param schema any
---@param basePath any
function AutomaticArmControlHarvester.registerXMLPaths(schema, basePath) end

---@param vehicleType any
function AutomaticArmControlHarvester.registerFunctions(vehicleType) end

---@param vehicleType any
function AutomaticArmControlHarvester.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AutomaticArmControlHarvester.registerEventListeners(vehicleType) end

---@param savegame any
function AutomaticArmControlHarvester:onLoad(savegame) end

---@param savegame any
function AutomaticArmControlHarvester:onPostLoad(savegame) end

function AutomaticArmControlHarvester:onDelete() end

---@param streamId any
---@param timestamp any
---@param connection any
function AutomaticArmControlHarvester:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function AutomaticArmControlHarvester:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function AutomaticArmControlHarvester:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function AutomaticArmControlHarvester:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AutomaticArmControlHarvester.actionEvent(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param state any
function AutomaticArmControlHarvester.updateActionEvents(self, state) end

---@param rootVehicle table
function AutomaticArmControlHarvester:onRootVehicleChanged(rootVehicle) end

---@param self any
---@param direction any
function AutomaticArmControlHarvester.actionControllerEvent(self, direction) end

function AutomaticArmControlHarvester:getSupportsAutoTreeAlignment() end

function AutomaticArmControlHarvester:getIsAutoTreeAlignmentAllowed() end

---@param radius any
function AutomaticArmControlHarvester:getAutoAlignHasValidTree(radius) end

---@param foundRadius any
---@param checkChildren any
function AutomaticArmControlHarvester:getAutoAlignTreeMarkerState(foundRadius, checkChildren) end

---@param inputValue any
function AutomaticArmControlHarvester:setTreeArmAlignmentInput(inputValue) end

---@param tx any
---@param ty any
---@param tz any
---@param direction any
function AutomaticArmControlHarvester:doTreeArmAlignment(tx, ty, tz, direction) end

---@param self any
---@param movingTool any
---@param targetRot any
function AutomaticArmControlHarvester.calculateMovingToolTargetMove(self, movingTool, targetRot) end

---@param self any
---@param direction any
function AutomaticArmControlHarvester.prepareAlignment(self, direction) end

function AutomaticArmControlHarvester:getIsAutomaticAlignmentActive() end

function AutomaticArmControlHarvester:getAutomaticAlignmentCurrentTarget() end

function AutomaticArmControlHarvester:getAutomaticAlignmentInvalidTreeReason() end

---@param referenceNode any
---@param trees any
function AutomaticArmControlHarvester:getBestTreeToAutoAlign(referenceNode, trees) end

---@param objectId any
function AutomaticArmControlHarvester:onTreeAutoOverlapCallback(objectId, ...) end

function AutomaticArmControlHarvester:getTreeAutomaticOverwrites() end

---@param node any
---@param radius any
---@param steps any
---@param minRot any
---@param maxRot any
function AutomaticArmControlHarvester.drawDebugCircleRange(node, radius, steps, minRot, maxRot) end
