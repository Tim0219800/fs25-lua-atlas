---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SupportVehicle.lua (generated stub, FS25 Lua Atlas)

---@class SupportVehicle
SupportVehicle = {}

---@param specializations any
function SupportVehicle.prerequisitesPresent(specializations) end

function SupportVehicle.initSpecialization() end

---@param vehicleType any
function SupportVehicle.registerFunctions(vehicleType) end

---@param vehicleType any
function SupportVehicle.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function SupportVehicle.registerEventListeners(vehicleType) end

---@param savegame any
function SupportVehicle:onLoad(savegame) end

function SupportVehicle:onDelete() end

---@param attacherVehicle table
---@param implement table
function SupportVehicle:onPostDetach(attacherVehicle, implement) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function SupportVehicle:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isDetach any
function SupportVehicle:addSupportVehicle(isDetach) end

---@param vehicles any
---@param vehicleLoadState any
---@param asyncCallbackArguments any
function SupportVehicle:supportVehicleLoaded(vehicles, vehicleLoadState, asyncCallbackArguments) end

function SupportVehicle:enableSupportVehicle() end

function SupportVehicle:removeSupportVehicle() end

---@param superFunc any
function SupportVehicle:getAllowMultipleAttachments(superFunc) end

---@param superFunc any
function SupportVehicle:resolveMultipleAttachments(superFunc) end

---@param superFunc any
function SupportVehicle:getShowAttachableMapHotspot(superFunc) end

---@param superFunc any
function SupportVehicle:getIsReadyToFinishDetachProcess(superFunc) end

---@param superFunc any
---@param noEventSend any
function SupportVehicle:startDetachProcess(superFunc, noEventSend) end
