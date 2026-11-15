---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WoodCrusher.lua (generated stub, FS25 Lua Atlas)

---@class WoodCrusher
WoodCrusher = {}

---@param specializations table
---@return boolean
function WoodCrusher.prerequisitesPresent(specializations) end

function WoodCrusher.initSpecialization() end

---@param schema any
---@param key any
function WoodCrusher.registerWoodCrusherXMLPaths(schema, key) end

---@param vehicleType any
function WoodCrusher.registerFunctions(vehicleType) end

---@param vehicleType any
function WoodCrusher.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function WoodCrusher.registerEventListeners(vehicleType) end

---@param savegame table
function WoodCrusher:onLoad(savegame) end

function WoodCrusher:onDelete() end

---@param streamId integer
---@param timestamp integer
---@param connection table
function WoodCrusher:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function WoodCrusher:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function WoodCrusher:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function WoodCrusher:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function WoodCrusher:onTurnedOn() end

function WoodCrusher:onTurnedOff() end

---@param superFunc any
---@return boolean
function WoodCrusher:getCanBeTurnedOn(superFunc) end

---@param superFunc any
function WoodCrusher:getConsumingLoad(superFunc) end

---@param superFunc any
function WoodCrusher:getRequiresPower(superFunc) end

---@param superFunc any
---@return number
function WoodCrusher:getDirtMultiplier(superFunc) end

---@param superFunc any
---@return number
function WoodCrusher:getWearMultiplier(superFunc) end

---@param splitType table
---@param volume number
function WoodCrusher:onCrushedSplitShape(splitType, volume) end

---@param self table
---@param woodCrusher table
---@param xmlFile XMLFile
---@param rootNode integer
---@param i3dMappings table
function WoodCrusher.loadWoodCrusher(self, woodCrusher, xmlFile, rootNode, i3dMappings) end

---@param self any
---@param woodCrusher any
function WoodCrusher.deleteWoodCrusher(self, woodCrusher) end

---@param self number
---@param woodCrusher any
---@param dt number
---@param isTurnedOn any
function WoodCrusher.updateWoodCrusher(self, woodCrusher, dt, isTurnedOn) end

---@param self number
---@param woodCrusher any
---@param dt number
---@param isTurnedOn any
function WoodCrusher.updateTickWoodCrusher(self, woodCrusher, dt, isTurnedOn) end

---@param self any
---@param woodCrusher any
function WoodCrusher.turnOnWoodCrusher(self, woodCrusher) end

---@param self any
---@param woodCrusher any
function WoodCrusher.turnOffWoodCrusher(self, woodCrusher) end

---@param self integer
---@param woodCrusher any
---@param shape integer
function WoodCrusher.crushSplitShape(self, woodCrusher, shape) end

---@param self integer
---@param shape integer
---@param isBelow boolean
---@param isAbove boolean
---@param minY number
---@param maxY number
---@param minZ number
---@param maxZ number
function WoodCrusher.woodCrusherSplitShapeCallback(self, shape, isBelow, isAbove, minY, maxY, minZ, maxZ) end

---@param self integer
---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function WoodCrusher.woodCrusherMoveTriggerCallback(self, triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

---@param self integer
---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function WoodCrusher.woodCrusherDownForceTriggerCallback(self, triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end
