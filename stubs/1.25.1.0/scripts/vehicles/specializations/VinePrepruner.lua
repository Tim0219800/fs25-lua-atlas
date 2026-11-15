---@meta
-- FS25 1.25.1.0 : vehicles/specializations/VinePrepruner.lua (generated stub, FS25 Lua Atlas)

---@class VinePrepruner
VinePrepruner = {}

function VinePrepruner.initSpecialization() end

---@param specializations any
function VinePrepruner.prerequisitesPresent(specializations) end

---@param vehicleType any
function VinePrepruner.registerFunctions(vehicleType) end

---@param vehicleType any
function VinePrepruner.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function VinePrepruner.registerEventListeners(vehicleType) end

---@param savegame any
function VinePrepruner:onLoad(savegame) end

function VinePrepruner:onDelete() end

---@param streamId any
---@param connection any
function VinePrepruner:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function VinePrepruner:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function VinePrepruner:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function VinePrepruner:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param self any
---@param streamId any
---@param forceState any
function VinePrepruner.readPrePrunerFromStream(self, streamId, forceState) end

---@param self any
---@param streamId any
function VinePrepruner.writePrePrunerToStream(self, streamId) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function VinePrepruner:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end
