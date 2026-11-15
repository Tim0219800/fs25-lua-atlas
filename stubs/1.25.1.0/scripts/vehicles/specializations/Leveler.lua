---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Leveler.lua (stub généré, atlas Lua FS25)

---@class Leveler
Leveler = {}

---@param specializations table
---@return boolean
function Leveler.prerequisitesPresent(specializations) end

function Leveler.initSpecialization() end

---@param vehicleType any
function Leveler.registerFunctions(vehicleType) end

---@param vehicleType any
function Leveler.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Leveler.registerEventListeners(vehicleType) end

---@param savegame table
function Leveler:onLoad(savegame) end

function Leveler:onDelete() end

---@param streamId integer
---@param timestamp integer
---@param connection table
function Leveler:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Leveler:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Leveler:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param levelerNode table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function Leveler:loadLevelerNodeFromXML(levelerNode, xmlFile, key) end

---@param levelerNode table
---@return boolean
function Leveler:getIsLevelerPickupNodeActive(levelerNode) end

---@param superFunc any
---@return boolean
function Leveler:getIsAttacherJointControlDampingAllowed(superFunc) end

---@param levelerNode integer
---@param hitObjectId integer
---@param x number
---@param y number
---@param z number
---@param distance number
---@param nx number
---@param ny number
---@param nz number
---@param subShapeIndex integer
---@param shapeId integer
---@param isLast boolean
---@return boolean
function Leveler.onLevelerRaycastCallback(levelerNode, hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end
