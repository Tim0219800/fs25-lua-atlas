---@meta
-- FS25 1.25.1.0 : vehicles/specializations/MultipleItemPurchase.lua (generated stub, FS25 Lua Atlas)

---@class MultipleItemPurchase
MultipleItemPurchase = {}

function MultipleItemPurchase.initSpecialization() end

---@param specializations any
function MultipleItemPurchase.prerequisitesPresent(specializations) end

---@param vehicleType any
function MultipleItemPurchase.registerFunctions(vehicleType) end

---@param vehicleType any
function MultipleItemPurchase.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function MultipleItemPurchase.registerEventListeners(vehicleType) end

---@param savegame table
function MultipleItemPurchase:onLoad(savegame) end

---@param savegame table
function MultipleItemPurchase:onPreLoadFinished(savegame) end

---@param position any
function MultipleItemPurchase:loadItemAtPosition(position) end

---@param vehicles any
---@param vehicleLoadState any
---@param loadingTask any
function MultipleItemPurchase:onFinishLoadingVehicle(vehicles, vehicleLoadState, loadingTask) end

function MultipleItemPurchase:onDelete() end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function MultipleItemPurchase:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param superFunc any
---@param onlyGivenVehicle any
function MultipleItemPurchase:getTotalMass(superFunc, onlyGivenVehicle) end

---@param superFunc any
---@param fillUnitIndex any
function MultipleItemPurchase:getFillUnitCapacity(superFunc, fillUnitIndex) end

---@param superFunc any
---@param state any
function MultipleItemPurchase:setVisibility(superFunc, state) end

---@param superFunc any
function MultipleItemPurchase:addToPhysics(superFunc) end

---@param superFunc any
function MultipleItemPurchase:removeFromPhysics(superFunc) end
