---@meta
-- FS25 1.25.1.0 : objects/Bale.lua (generated stub, FS25 Lua Atlas)

---@class Bale : MountableObject
Bale = {}

---@class BaleActivatable
BaleActivatable = {}

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function Bale.new(isServer, isClient, customMt) end

function Bale:delete() end

---@param streamId integer
---@param timestamp integer
---@param connection table
function Bale:readUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Bale:writeUpdateStream(streamId, connection, dirtyMask) end

---@param streamId integer
---@param connection table
function Bale:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function Bale:writeStream(streamId, connection) end

---@param object table
---@param node integer
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
function Bale:mount(object, node, x, y, z, rx, ry, rz) end

function Bale:unmount() end

---@param object table
---@param node integer
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
function Bale:mountKinematic(object, node, x, y, z, rx, ry, rz) end

function Bale:unmountKinematic() end

---@param object any
---@param objectActorId any
---@param jointNode any
---@param mountType any
---@param forceAcceleration any
function Bale:mountDynamic(object, objectActorId, jointNode, mountType, forceAcceleration) end

---@param isDelete any
function Bale:unmountDynamic(isDelete) end

---@param isActive any
function Bale:setBaleAIObstacle(isActive) end

---@param i3dFilename string
function Bale:createNode(i3dFilename) end

---@param xmlFilename string
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
---@param uniqueId any
function Bale:loadFromConfigXML(xmlFilename, x, y, z, rx, ry, rz, uniqueId) end

---@param xmlFile table
function Bale:loadBaleAttributesFromXML(xmlFile) end

---@param diameter number
---@param width number
---@param height number
---@param length number
---@return boolean
function Bale:getBaleMatchesSize(diameter, width, height, length) end

---@return boolean
function Bale:getSupportsWrapping() end

---@param xmlFile XMLFile
---@param key string
---@param resetVehicles boolean
---@return boolean
function Bale:loadFromXMLFile(xmlFile, key, resetVehicles) end

---@param attributes any
---@param xmlFile any
---@param key any
---@param resetVehicles any
function Bale.loadBaleAttributesFromXMLFile(attributes, xmlFile, key, resetVehicles) end

function Bale:getBaleAttributes() end

---@param attributes any
---@param xmlFile any
---@param key any
function Bale.saveBaleAttributesToXMLFile(attributes, xmlFile, key) end

---@param attributes any
function Bale:applyBaleAttributes(attributes) end

---@param xmlFile any
---@param key any
function Bale:saveToXMLFile(xmlFile, key) end

function Bale:getNeedsSaving() end

function Bale:getAutoLoadIsSupported() end

function Bale:getAutoLoadIsAllowed() end

function Bale:getAutoLoadSize() end

---@param autoLoader any
---@param node any
---@param posX any
---@param posZ any
---@param sizeX any
---@param sizeZ any
function Bale:autoLoad(autoLoader, node, posX, posZ, sizeX, sizeZ) end

function Bale:getValue() end

function Bale:getMass() end

function Bale:getDefaultMass() end

---@return integer
function Bale:getFillType() end

---@param state any
function Bale:setReducedComponentMass(state) end

function Bale:getAllowComponentMassReduction() end

---@param fillTypeIndex any
---@param fillBale any
function Bale:setFillType(fillTypeIndex, fillBale) end

---@param variationIndex any
function Bale:setVariationIndex(variationIndex) end

---@param variationId any
function Bale:setVariationId(variationId) end

function Bale:getVariationId() end

---@return integer
function Bale:getCapacity() end

---@return integer
function Bale:getFillLevel() end

---@param fillLevel integer
function Bale:setFillLevel(fillLevel) end

---@param fillTypeIndex integer
---@return table
function Bale:getFillTypeInfo(fillTypeIndex) end

---@param canBeSold boolean
function Bale:setCanBeSold(canBeSold) end

---@return boolean
function Bale:getCanBeSold() end

---@param wrappingState number
---@param updateFermentation boolean
function Bale:setWrappingState(wrappingState, updateFermentation) end

---@param diffuse string
---@param normal string
function Bale:setWrapTextures(diffuse, normal) end

---@param r number
---@param g number
---@param b number
function Bale:setColor(r, g, b) end

---@param state any
function Bale:setIsMissionBale(state) end

function Bale:getMeshNodes() end

function Bale:getSupportsTensionBelts() end

function Bale:getTensionBeltNodeId() end

function Bale:getBaleSupportsBaleLoader() end

function Bale:getAllowPickup() end

function Bale:getAdditionalMountingDistance() end

function Bale:getIsFermenting() end

function Bale:getFermentingPercentage() end

---@param percentage any
function Bale:onFermentationUpdate(percentage) end

function Bale:onFermentationEnd() end

function Bale:getCanBeOpened() end

function Bale:getInteractionPosition() end

function Bale:getCanInteract() end

function Bale:open() end

function Bale:resetDetailVisibilityCut() end

---@param node any
---@param axis any
---@param direction any
function Bale:setDetailVisibilityCutNode(node, axis, direction) end

---@param baleMesh any
---@param node any
---@param axis any
---@param direction any
---@param recursively any
function Bale.setBaleMeshVisibilityCut(baleMesh, node, axis, direction, recursively) end

---@param func any
---@param target any
function Bale:doDensityMapItemAreaUpdate(func, target, ...) end

---@param box any
function Bale:showInfo(box) end

---@param xmlFilename string
---@param fillTypeIndex integer
---@param variationId string
---@param wrappingState number?
---@param wrappingColor table?
---@return integer
---@return integer
function Bale.createDummyBale(xmlFilename, fillTypeIndex, variationId, wrappingState, wrappingColor) end

---@param fillTypes table
---@param xmlFile table
---@param baseDirectory string
function Bale.loadFillTypesFromXML(fillTypes, xmlFile, baseDirectory) end

---@param variations table
---@param xmlFile table
---@param baseDirectory string
function Bale.loadVariationsFromXML(variations, xmlFile, baseDirectory) end

---@param meshes table
---@param fillTypes table
---@param fillTypeIndex integer
function Bale.setFillTypeTextures(meshes, fillTypes, fillTypeIndex) end

---@param meshes table
---@param variations table
---@param id string
function Bale.setVariationTextures(meshes, variations, id) end

---@param nodeId integer
---@param textureData table
function Bale.setTexturesForNode(nodeId, textureData) end

---@param rootNode integer
---@param xmlFile table
---@param baseDirectory string
---@return table
---@return table
function Bale.loadVisualMeshesFromXML(rootNode, xmlFile, baseDirectory) end

---@param meshes table
---@param fillTypeIndex integer
---@param isWrapped boolean
function Bale.updateVisualMeshVisibility(meshes, fillTypeIndex, isWrapped) end

---@param meshes table
---@param wrappingState number
---@param wrappingColor table
function Bale.updateVisualMeshWrappingState(meshes, wrappingState, wrappingColor) end

---@param bale any
function BaleActivatable.new(bale) end

function BaleActivatable:getIsActivatable() end

---@param posX any
---@param posY any
---@param posZ any
function BaleActivatable:getDistance(posX, posY, posZ) end

function BaleActivatable:run() end
