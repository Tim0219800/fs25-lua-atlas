---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Motorbike.lua (generated stub, FS25 Lua Atlas)

---@class Motorbike
Motorbike = {}

---@param specializations any
function Motorbike.prerequisitesPresent(specializations) end

function Motorbike.initSpecialization() end

---@param vehicleType any
function Motorbike.registerFunctions(vehicleType) end

---@param vehicleType any
function Motorbike.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Motorbike.registerEventListeners(vehicleType) end

---@param savegame any
function Motorbike:onLoad(savegame) end

---@param savegame any
function Motorbike:onPostLoad(savegame) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Motorbike:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function Motorbike:onLeaveVehicle() end
