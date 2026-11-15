---@meta
-- FS25 1.25.1.0 : vehicles/specializations/RidgeFormer.lua (generated stub, FS25 Lua Atlas)

---@param specializations table
---@return boolean
function RidgeFormer.prerequisitesPresent(specializations) end

function RidgeFormer.initSpecialization() end

---@param vehicleType any
function RidgeFormer.registerFunctions(vehicleType) end

---@param vehicleType any
function RidgeFormer.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function RidgeFormer.registerEventListeners(vehicleType) end

---@param savegame any
function RidgeFormer:onLoad(savegame) end

function RidgeFormer:onDelete() end

function RidgeFormer:onDeactivate() end

---@param dt any
function RidgeFormer:onStartWorkAreaProcessing(dt) end

---@param dt any
function RidgeFormer:onEndWorkAreaProcessing(dt) end

---@param workArea any
---@param dt any
function RidgeFormer:processRidgeFormerArea(workArea, dt) end

---@param superFunc any
function RidgeFormer:doCheckSpeedLimit(superFunc) end

---@param superFunc any
function RidgeFormer:getDirtMultiplier(superFunc) end

---@param superFunc any
---@return number
function RidgeFormer:getWearMultiplier(superFunc) end
