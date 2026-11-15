---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TensionBeltObject.lua (stub généré, atlas Lua FS25)

---@class TensionBeltObject
TensionBeltObject = {}

---@param specializations any
function TensionBeltObject.prerequisitesPresent(specializations) end

function TensionBeltObject.initSpecialization() end

---@param vehicleType any
function TensionBeltObject.registerFunctions(vehicleType) end

---@param vehicleType any
function TensionBeltObject.registerEventListeners(vehicleType) end

---@param savegame table
function TensionBeltObject:onLoad(savegame) end

function TensionBeltObject:getSupportsTensionBelts() end

function TensionBeltObject:getMeshNodes() end

function TensionBeltObject:getTensionBeltNodeId() end
