---@meta
-- FS25 1.25.1.0 : vehicles/specializations/CylinderedFoldable.lua (generated stub, FS25 Lua Atlas)

---@class CylinderedFoldable
CylinderedFoldable = {}

---@param specializations table
---@return boolean
function CylinderedFoldable.prerequisitesPresent(specializations) end

function CylinderedFoldable.initSpecialization() end

---@param vehicleType any
function CylinderedFoldable.registerEventListeners(vehicleType) end

---@param savegame table
function CylinderedFoldable:onLoad(savegame) end

---@param savegame any
function CylinderedFoldable:onPreInitComponentPlacement(savegame) end

---@param streamId any
---@param connection any
function CylinderedFoldable:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function CylinderedFoldable:onWriteStream(streamId, connection) end
