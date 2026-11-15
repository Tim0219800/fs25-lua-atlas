---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SpeedRotatingParts.lua (stub généré, atlas Lua FS25)

---@class SpeedRotatingParts
SpeedRotatingParts = {}

---@param specializations table
---@return boolean
function SpeedRotatingParts.prerequisitesPresent(specializations) end

function SpeedRotatingParts.initSpecialization() end

---@param vehicleType any
function SpeedRotatingParts.registerFunctions(vehicleType) end

---@param vehicleType any
function SpeedRotatingParts.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function SpeedRotatingParts.registerEventListeners(vehicleType) end

---@param savegame table
function SpeedRotatingParts:onLoad(savegame) end

---@param streamId integer
---@param connection Connection
function SpeedRotatingParts:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SpeedRotatingParts:onWriteStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function SpeedRotatingParts:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function SpeedRotatingParts:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function SpeedRotatingParts:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function SpeedRotatingParts:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param speedRotatingPart table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function SpeedRotatingParts:loadSpeedRotatingPartFromXML(speedRotatingPart, xmlFile, key) end

---@param speedRotatingPart table
---@return boolean
function SpeedRotatingParts:getIsSpeedRotatingPartActive(speedRotatingPart) end

---@param speedRotatingPart table
---@return integer
function SpeedRotatingParts:getSpeedRotatingPartDirection(speedRotatingPart) end

---@param speedRotatingPart any
---@param dt any
---@param isPartActive any
function SpeedRotatingParts:updateSpeedRotatingPart(speedRotatingPart, dt, isPartActive) end

---@param superFunc any
---@param node any
function SpeedRotatingParts:validateWashableNode(superFunc, node) end
