---@meta
-- FS25 1.25.1.0 : triggers/WoodUnloadTrigger.lua (generated stub, FS25 Lua Atlas)

---@class WoodUnloadTrigger : UnloadTrigger
WoodUnloadTrigger = {}

---@param schema any
---@param basePath any
function WoodUnloadTrigger.registerXMLPaths(schema, basePath) end

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function WoodUnloadTrigger.new(isServer, isClient, customMt) end

---@param components table
---@param xmlFile table
---@param xmlNode string
---@param target table
---@param extraAttributes table
---@param i3dMappings table
---@return boolean
function WoodUnloadTrigger:load(components, xmlFile, xmlNode, target, extraAttributes, i3dMappings) end

function WoodUnloadTrigger:delete() end

---@param farmId any
---@param noEventSend any
function WoodUnloadTrigger:processWood(farmId, noEventSend) end

---@param objectId any
function WoodUnloadTrigger:calculateWoodBaseValue(objectId) end

---@param volume any
---@param splitType any
---@param sizeX any
---@param sizeY any
---@param sizeZ any
---@param numConvexes any
---@param numAttachments any
function WoodUnloadTrigger:calculateWoodBaseValueForData(volume, splitType, sizeX, sizeY, sizeZ, numConvexes, numAttachments) end

---@param dt any
function WoodUnloadTrigger:update(dt) end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function WoodUnloadTrigger:woodTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

function WoodUnloadTrigger:getWoodLogs() end

---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function WoodUnloadTrigger:woodSellTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end
