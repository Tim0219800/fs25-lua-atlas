# vehicles/specializations/ConnectionHoses.lua

Source: `dataS/scripts/vehicles/specializations/ConnectionHoses.lua` — FS25 1.25.1.0

- **ConnectionHoses** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ConnectionHoses.prerequisitesPresent(specializations: any)` | 19 |  |
| `ConnectionHoses.initSpecialization()` | 25 |  |
| `ConnectionHoses.registerConnectionHoseXMLPaths(schema: any, basePath: any)` | 57 |  |
| `ConnectionHoses.registerHoseTargetNodesXMLPaths(schema: XMLSchema, basePath: string)` | 90 |  |
| `ConnectionHoses.registerHoseNodesXMLPaths(schema: any, basePath: any)` | 111 |  |
| `ConnectionHoses.registerCustomHoseNodesXMLPaths(schema: any, basePath: any)` | 149 |  |
| `ConnectionHoses.registerCustomHoseTargetNodesXMLPaths(schema: any, basePath: any)` | 163 |  |
| `ConnectionHoses.registerFunctions(vehicleType: any)` | 176 |  |
| `ConnectionHoses.registerOverwrittenFunctions(vehicleType: any)` | 212 |  |
| `ConnectionHoses.registerEventListeners(vehicleType: any)` | 219 |  |
| `ConnectionHoses:onPreLoad(savegame: any)` | 232 |  |
| `ConnectionHoses:onPostLoad(savegame: any)` | 272 |  |
| `ConnectionHoses:onLoadFinished(savegame: any)` | 341 |  |
| `ConnectionHoses:onDelete()` | 352 |  |
| `ConnectionHoses:onUpdateInterpolation(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 380 |  |
| `ConnectionHoses:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 412 |  |
| `ConnectionHoses:getConnectionHoseConfigIndex()` | 419 |  |
| `ConnectionHoses:updateAttachedConnectionHoses(attacherVehicle: any)` | 425 |  |
| `ConnectionHoses:updateConnectionHose(hose: any, index: any)` | 449 |  |
| `ConnectionHoses:getCenterPointAngle(node: any, cX: any, cY: any, cZ: any, eX: any, eY: any, eZ: any, useWorldSpace: any)` | 635 |  |
| `ConnectionHoses:getCenterPointAngleRegulation(node: any, cX: any, cY: any, cZ: any, eX: any, eY: any, eZ: any, angle1: any, angle2: any, targetAngle: any, useWorldSpace: any)` | 658 |  |
| `ConnectionHoses:loadConnectionHosesFromXML(xmlFile: any, key: any)` | 688 |  |
| `ConnectionHoses:loadHoseSkipNode(xmlFile: any, targetKey: any, entry: any)` | 750 |  |
| `ConnectionHoses:loadToolConnectorHoseNode(xmlFile: any, targetKey: any, entry: any)` | 784 |  |
| `ConnectionHoses:addHoseTargetNodes(xmlFile: any, key: any)` | 853 |  |
| `ConnectionHoses:loadCustomHosesFromXML(isHose: any, targetTable: any, attacherJointMapping: any, inputAttacherJointMapping: any, xmlFile: any, key: any)` | 882 |  |
| `ConnectionHoses:loadHoseTargetNode(xmlFile: any, targetKey: any, entry: any)` | 983 |  |
| `ConnectionHoses:loadHoseNode(xmlFile: any, hoseKey: any, entry: any, isBaseHose: any)` | 1047 |  |
| `ConnectionHoses:getClonedSkipHoseNode(sourceHose: any, skipNode: any)` | 1221 |  |
| `ConnectionHoses:getConnectionTarget(attacherJointIndex: any, type: any, specType: any, excludeToolConnections: any)` | 1275 |  |
| `ConnectionHoses:iterateConnectionTargets(func: any, attacherJointIndex: any, type: any, specType: any, excludeToolConnections: any)` | 1317 |  |
| `ConnectionHoses:getIsConnectionTargetUsed(desc: any)` | 1363 |  |
| `ConnectionHoses:getIsConnectionHoseUsed(desc: any)` | 1369 |  |
| `ConnectionHoses:getIsSkipNodeAvailable(skipNode: any)` | 1375 |  |
| `ConnectionHoses:getConnectionHosesByInputAttacherJoint(inputJointDescIndex: any)` | 1395 |  |
| `ConnectionHoses:connectHose(sourceHose: any, targetObject: any, targetHose: any, updateToolConnections: any)` | 1407 |  |
| `ConnectionHoses:disconnectHose(hose: any)` | 1498 |  |
| `ConnectionHoses:updateToolConnectionHose(sourceObject: any, sourceHose: any, targetObject: any, targetHose: any, visibility: any)` | 1558 |  |
| `ConnectionHoses:addHoseToDelayedMountings(sourceObject: any, sourceHose: any, targetObject: any, targetHose: any)` | 1752 |  |
| `ConnectionHoses:connectHoseToSkipNode(sourceHose: any, targetObject: any, skipNode: any, childHose: any, childVehicle: any)` | 1768 |  |
| `ConnectionHoses:connectHosesToAttacherVehicle(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any, updateToolConnections: any, excludeVehicle: any)` | 1843 |  |
| `ConnectionHoses:retryHoseSkipNodeConnections(updateToolConnections: any, excludeVehicle: any)` | 1874 |  |
| `ConnectionHoses:connectCustomHosesToAttacherVehicle(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 1890 |  |
| `ConnectionHoses:connectCustomHoseNode(customHose: any, customTarget: any, targetObject: any)` | 1941 |  |
| `ConnectionHoses:updateCustomHoseNode(customHose: any, customTarget: any)` | 1962 |  |
| `ConnectionHoses:disconnectCustomHoseNode(customHose: any, customTarget: any)` | 1973 |  |
| `ConnectionHoses:setConnectionHosesActive(connectionHosesActive: any)` | 1995 |  |
| `ConnectionHoses:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 2018 |  |
| `ConnectionHoses:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 2043 |  |
| `ConnectionHoses:onPostAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 2082 |  |
| `ConnectionHoses:onPreDetach(attacherVehicle: any, implement: any)` | 2091 |  |
| `ConnectionHoses.consoleCommandTestSockets(vehicle: any, attacherJointIndex: any)` | 2279 |  |
| `ConnectionHoses.consoleCommandTestToolConnection(vehicle: any, toolConnectionIndex: any)` | 2369 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getConnectionHoseConfigIndex` | 177 |
| registerFunction | `updateAttachedConnectionHoses` | 178 |
| registerFunction | `updateConnectionHose` | 179 |
| registerFunction | `getCenterPointAngle` | 180 |
| registerFunction | `getCenterPointAngleRegulation` | 181 |
| registerFunction | `loadConnectionHosesFromXML` | 182 |
| registerFunction | `loadHoseSkipNode` | 183 |
| registerFunction | `loadToolConnectorHoseNode` | 184 |
| registerFunction | `addHoseTargetNodes` | 185 |
| registerFunction | `loadCustomHosesFromXML` | 186 |
| registerFunction | `loadHoseTargetNode` | 187 |
| registerFunction | `loadHoseNode` | 188 |
| registerFunction | `getClonedSkipHoseNode` | 189 |
| registerFunction | `getConnectionTarget` | 190 |
| registerFunction | `iterateConnectionTargets` | 191 |
| registerFunction | `getIsConnectionTargetUsed` | 192 |
| registerFunction | `getIsConnectionHoseUsed` | 193 |
| registerFunction | `getIsSkipNodeAvailable` | 194 |
| registerFunction | `getConnectionHosesByInputAttacherJoint` | 195 |
| registerFunction | `connectHose` | 196 |
| registerFunction | `disconnectHose` | 197 |
| registerFunction | `updateToolConnectionHose` | 198 |
| registerFunction | `addHoseToDelayedMountings` | 199 |
| registerFunction | `connectHoseToSkipNode` | 200 |
| registerFunction | `connectHosesToAttacherVehicle` | 201 |
| registerFunction | `retryHoseSkipNodeConnections` | 202 |
| registerFunction | `connectCustomHosesToAttacherVehicle` | 203 |
| registerFunction | `connectCustomHoseNode` | 204 |
| registerFunction | `updateCustomHoseNode` | 205 |
| registerFunction | `disconnectCustomHoseNode` | 206 |
| registerFunction | `setConnectionHosesActive` | 207 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 213 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 214 |
| registerEventListener | `onPreLoad` | 220 |
| registerEventListener | `onPostLoad` | 221 |
| registerEventListener | `onLoadFinished` | 222 |
| registerEventListener | `onDelete` | 223 |
| registerEventListener | `onUpdateInterpolation` | 224 |
| registerEventListener | `onUpdateEnd` | 225 |
| registerEventListener | `onPostAttach` | 226 |
| registerEventListener | `onPreDetach` | 227 |
