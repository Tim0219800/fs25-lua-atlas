---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ConnectionHoses.lua (stub généré, atlas Lua FS25)

---@class ConnectionHoses
ConnectionHoses = {}

---@param specializations any
function ConnectionHoses.prerequisitesPresent(specializations) end

function ConnectionHoses.initSpecialization() end

---@param schema any
---@param basePath any
function ConnectionHoses.registerConnectionHoseXMLPaths(schema, basePath) end

---@param schema XMLSchema
---@param basePath string
function ConnectionHoses.registerHoseTargetNodesXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function ConnectionHoses.registerHoseNodesXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function ConnectionHoses.registerCustomHoseNodesXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function ConnectionHoses.registerCustomHoseTargetNodesXMLPaths(schema, basePath) end

---@param vehicleType any
function ConnectionHoses.registerFunctions(vehicleType) end

---@param vehicleType any
function ConnectionHoses.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function ConnectionHoses.registerEventListeners(vehicleType) end

---@param savegame any
function ConnectionHoses:onPreLoad(savegame) end

---@param savegame any
function ConnectionHoses:onPostLoad(savegame) end

---@param savegame any
function ConnectionHoses:onLoadFinished(savegame) end

function ConnectionHoses:onDelete() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function ConnectionHoses:onUpdateInterpolation(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ConnectionHoses:onUpdateEnd(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function ConnectionHoses:getConnectionHoseConfigIndex() end

---@param attacherVehicle any
function ConnectionHoses:updateAttachedConnectionHoses(attacherVehicle) end

---@param hose any
---@param index any
function ConnectionHoses:updateConnectionHose(hose, index) end

---@param node any
---@param cX any
---@param cY any
---@param cZ any
---@param eX any
---@param eY any
---@param eZ any
---@param useWorldSpace any
function ConnectionHoses:getCenterPointAngle(node, cX, cY, cZ, eX, eY, eZ, useWorldSpace) end

---@param node any
---@param cX any
---@param cY any
---@param cZ any
---@param eX any
---@param eY any
---@param eZ any
---@param angle1 any
---@param angle2 any
---@param targetAngle any
---@param useWorldSpace any
function ConnectionHoses:getCenterPointAngleRegulation(node, cX, cY, cZ, eX, eY, eZ, angle1, angle2, targetAngle, useWorldSpace) end

---@param xmlFile any
---@param key any
function ConnectionHoses:loadConnectionHosesFromXML(xmlFile, key) end

---@param xmlFile any
---@param targetKey any
---@param entry any
function ConnectionHoses:loadHoseSkipNode(xmlFile, targetKey, entry) end

---@param xmlFile any
---@param targetKey any
---@param entry any
function ConnectionHoses:loadToolConnectorHoseNode(xmlFile, targetKey, entry) end

---@param xmlFile any
---@param key any
function ConnectionHoses:addHoseTargetNodes(xmlFile, key) end

---@param isHose any
---@param targetTable any
---@param attacherJointMapping any
---@param inputAttacherJointMapping any
---@param xmlFile any
---@param key any
function ConnectionHoses:loadCustomHosesFromXML(isHose, targetTable, attacherJointMapping, inputAttacherJointMapping, xmlFile, key) end

---@param xmlFile any
---@param targetKey any
---@param entry any
function ConnectionHoses:loadHoseTargetNode(xmlFile, targetKey, entry) end

---@param xmlFile any
---@param hoseKey any
---@param entry any
---@param isBaseHose any
function ConnectionHoses:loadHoseNode(xmlFile, hoseKey, entry, isBaseHose) end

---@param sourceHose any
---@param skipNode any
function ConnectionHoses:getClonedSkipHoseNode(sourceHose, skipNode) end

---@param attacherJointIndex any
---@param type any
---@param specType any
---@param excludeToolConnections any
function ConnectionHoses:getConnectionTarget(attacherJointIndex, type, specType, excludeToolConnections) end

---@param func any
---@param attacherJointIndex any
---@param type any
---@param specType any
---@param excludeToolConnections any
function ConnectionHoses:iterateConnectionTargets(func, attacherJointIndex, type, specType, excludeToolConnections) end

---@param desc any
function ConnectionHoses:getIsConnectionTargetUsed(desc) end

---@param desc any
function ConnectionHoses:getIsConnectionHoseUsed(desc) end

---@param skipNode any
function ConnectionHoses:getIsSkipNodeAvailable(skipNode) end

---@param inputJointDescIndex any
function ConnectionHoses:getConnectionHosesByInputAttacherJoint(inputJointDescIndex) end

---@param sourceHose any
---@param targetObject any
---@param targetHose any
---@param updateToolConnections any
function ConnectionHoses:connectHose(sourceHose, targetObject, targetHose, updateToolConnections) end

---@param hose any
function ConnectionHoses:disconnectHose(hose) end

---@param sourceObject any
---@param sourceHose any
---@param targetObject any
---@param targetHose any
---@param visibility any
function ConnectionHoses:updateToolConnectionHose(sourceObject, sourceHose, targetObject, targetHose, visibility) end

---@param sourceObject any
---@param sourceHose any
---@param targetObject any
---@param targetHose any
function ConnectionHoses:addHoseToDelayedMountings(sourceObject, sourceHose, targetObject, targetHose) end

---@param sourceHose any
---@param targetObject any
---@param skipNode any
---@param childHose any
---@param childVehicle any
function ConnectionHoses:connectHoseToSkipNode(sourceHose, targetObject, skipNode, childHose, childVehicle) end

---@param attacherVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param updateToolConnections any
---@param excludeVehicle any
function ConnectionHoses:connectHosesToAttacherVehicle(attacherVehicle, inputJointDescIndex, jointDescIndex, updateToolConnections, excludeVehicle) end

---@param updateToolConnections any
---@param excludeVehicle any
function ConnectionHoses:retryHoseSkipNodeConnections(updateToolConnections, excludeVehicle) end

---@param attacherVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
function ConnectionHoses:connectCustomHosesToAttacherVehicle(attacherVehicle, inputJointDescIndex, jointDescIndex) end

---@param customHose any
---@param customTarget any
---@param targetObject any
function ConnectionHoses:connectCustomHoseNode(customHose, customTarget, targetObject) end

---@param customHose any
---@param customTarget any
function ConnectionHoses:updateCustomHoseNode(customHose, customTarget) end

---@param customHose any
---@param customTarget any
function ConnectionHoses:disconnectCustomHoseNode(customHose, customTarget) end

---@param connectionHosesActive any
function ConnectionHoses:setConnectionHosesActive(connectionHosesActive) end

---@param superFunc any
---@param xmlFile any
---@param baseName any
---@param entry any
function ConnectionHoses:loadExtraDependentParts(superFunc, xmlFile, baseName, entry) end

---@param superFunc any
---@param part any
---@param dt any
function ConnectionHoses:updateExtraDependentParts(superFunc, part, dt) end

---@param attacherVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
function ConnectionHoses:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

---@param attacherVehicle any
---@param implement any
function ConnectionHoses:onPreDetach(attacherVehicle, implement) end

---@param vehicle any
---@param attacherJointIndex any
function ConnectionHoses.consoleCommandTestSockets(vehicle, attacherJointIndex) end

---@param vehicle any
---@param toolConnectionIndex any
function ConnectionHoses.consoleCommandTestToolConnection(vehicle, toolConnectionIndex) end
