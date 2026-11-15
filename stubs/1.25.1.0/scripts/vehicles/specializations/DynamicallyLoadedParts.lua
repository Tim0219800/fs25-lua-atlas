---@meta
-- FS25 1.25.1.0 : vehicles/specializations/DynamicallyLoadedParts.lua (stub généré, atlas Lua FS25)

---@class DynamicallyLoadedParts
DynamicallyLoadedParts = {}

---@param specializations any
function DynamicallyLoadedParts.prerequisitesPresent(specializations) end

function DynamicallyLoadedParts.initSpecialization() end

---@param vehicleType any
function DynamicallyLoadedParts.registerFunctions(vehicleType) end

---@param vehicleType any
function DynamicallyLoadedParts.registerEventListeners(vehicleType) end

---@param savegame any
function DynamicallyLoadedParts:onLoad(savegame) end

function DynamicallyLoadedParts:onDelete() end

---@param i3dNode any
---@param failedReason any
---@param args any
function DynamicallyLoadedParts:onDynamicallyPartI3DLoaded(i3dNode, failedReason, args) end
