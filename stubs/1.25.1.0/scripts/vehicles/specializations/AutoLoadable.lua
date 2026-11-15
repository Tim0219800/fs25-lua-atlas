---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AutoLoadable.lua (stub généré, atlas Lua FS25)

---@class AutoLoadable
AutoLoadable = {}

---@param specializations any
function AutoLoadable.prerequisitesPresent(specializations) end

---@param vehicleType any
function AutoLoadable.registerFunctions(vehicleType) end

---@param vehicleType any
function AutoLoadable.registerEventListeners(vehicleType) end

---@param savegame any
function AutoLoadable:onLoad(savegame) end

function AutoLoadable:getAutoLoadIsSupported() end

function AutoLoadable:getAutoLoadIsAllowed() end

function AutoLoadable:getAutoLoadSize() end

function AutoLoadable:getAutoLoadBoundingBox() end

---@param autoLoader any
---@param node any
---@param posX any
---@param posZ any
---@param sizeX any
---@param sizeZ any
function AutoLoadable:autoLoad(autoLoader, node, posX, posZ, sizeX, sizeZ) end
