---@meta
-- FS25 1.25.1.0 : vehicles/specializations/GroundReference.lua (stub généré, atlas Lua FS25)

---@class GroundReference
GroundReference = {}

---@param specializations any
function GroundReference.prerequisitesPresent(specializations) end

function GroundReference.initSpecialization() end

---@param vehicleType any
function GroundReference.registerEvents(vehicleType) end

---@param vehicleType any
function GroundReference.registerFunctions(vehicleType) end

---@param vehicleType any
function GroundReference.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function GroundReference.registerEventListeners(vehicleType) end

---@param savegame any
function GroundReference:onLoad(savegame) end

---@param streamId any
---@param timestamp any
---@param connection any
function GroundReference:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function GroundReference:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function GroundReference:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param xmlFile any
---@param baseName any
---@param entry any
function GroundReference:loadGroundReferenceNode(xmlFile, baseName, entry) end

---@param groundReferenceNode any
function GroundReference:updateGroundReferenceNode(groundReferenceNode) end

---@param refNodeIndex any
function GroundReference:getGroundReferenceNodeFromIndex(refNodeIndex) end

---@param groundReferenceNode any
function GroundReference:getIsGroundReferenceNodeActive(groundReferenceNode) end

---@param groundReferenceNode any
function GroundReference:getIsGroundReferenceNodeThreshold(groundReferenceNode) end

---@param groundReferenceNodeIndex any
function GroundReference:getGroundReferenceNodeForwardSpeed(groundReferenceNodeIndex) end

---@param superFunc any
function GroundReference:getPowerMultiplier(superFunc) end

---@param superFunc any
---@param speedRotatingPart any
---@param xmlFile any
---@param key any
function GroundReference:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

---@param superFunc any
---@param speedRotatingPart any
function GroundReference:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end
