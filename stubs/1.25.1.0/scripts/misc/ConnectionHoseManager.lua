---@meta
-- FS25 1.25.1.0 : misc/ConnectionHoseManager.lua (generated stub, FS25 Lua Atlas)

---@class ConnectionHoseManager : AbstractManager
ConnectionHoseManager = {}

---@param customMt any
---@return table
function ConnectionHoseManager.new(customMt) end

function ConnectionHoseManager:initDataStructures() end

---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function ConnectionHoseManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

---@return boolean
function ConnectionHoseManager:unloadMapData() end

---@param xmlFilename string
---@param customEnvironment string
---@param baseDirectory string
function ConnectionHoseManager:addModConnectionHoses(xmlFilename, customEnvironment, baseDirectory) end

---@param xmlFilename string
---@param customEnvironment string
---@param baseDirectory string
function ConnectionHoseManager:loadConnectionHosesFromXML(xmlFilename, customEnvironment, baseDirectory) end

---@param i3dNode string
---@param failedReason any
---@param args any
function ConnectionHoseManager:basicHoseI3DFileLoaded(i3dNode, failedReason, args) end

---@param i3dNode string
---@param failedReason any
---@param args any
function ConnectionHoseManager:adapterI3DFileLoaded(i3dNode, failedReason, args) end

---@param i3dNode string
---@param failedReason any
---@param args any
function ConnectionHoseManager:materialI3DFileLoaded(i3dNode, failedReason, args) end

---@param i3dNode string
---@param failedReason any
---@param args any
function ConnectionHoseManager:socketI3DFileLoaded(i3dNode, failedReason, args) end

---@param typeName any
---@param customEnvironment any
function ConnectionHoseManager:getHoseTypeByName(typeName, customEnvironment) end

---@param hoseType any
---@param adapterName any
---@param customEnvironment any
function ConnectionHoseManager:getHoseAdapterByName(hoseType, adapterName, customEnvironment) end

---@param hoseType any
---@param materialName any
---@param customEnvironment any
function ConnectionHoseManager:getHoseMaterialByName(hoseType, materialName, customEnvironment) end

---@param socketName any
---@param customEnvironment any
function ConnectionHoseManager:getSocketByName(socketName, customEnvironment) end

---@param typeName any
---@param adapterName any
---@param customEnvironment any
---@param detached any
function ConnectionHoseManager:getClonedAdapterNode(typeName, adapterName, customEnvironment, detached) end

---@param typeName any
---@param hoseName any
---@param length any
---@param diameter any
---@param vehicleMaterial any
---@param customEnvironment any
function ConnectionHoseManager:getClonedHoseNode(typeName, hoseName, length, diameter, vehicleMaterial, customEnvironment) end

---@param length any
---@param diameter any
function ConnectionHoseManager:getClonedBasicHose(length, diameter) end

---@param socketName any
---@param node any
---@param customEnvironment any
---@param socketMaterial any
function ConnectionHoseManager:linkSocketToNode(socketName, node, customEnvironment, socketMaterial) end

---@param socket any
---@param defaultTarget any
function ConnectionHoseManager:getSocketTarget(socket, defaultTarget) end

---@param socket any
function ConnectionHoseManager:openSocket(socket) end

---@param socket any
function ConnectionHoseManager:closeSocket(socket) end

---@param schema any
function ConnectionHoseManager:registerXMLPaths(schema) end
