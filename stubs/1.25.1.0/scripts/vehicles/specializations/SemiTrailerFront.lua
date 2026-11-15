---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SemiTrailerFront.lua (stub généré, atlas Lua FS25)

---@class SemiTrailerFront
SemiTrailerFront = {}

---@param specializations table
---@return boolean
function SemiTrailerFront.prerequisitesPresent(specializations) end

---@param vehicleType any
function SemiTrailerFront.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function SemiTrailerFront.registerEventListeners(vehicleType) end

---@param savegame table
function SemiTrailerFront:onLoad(savegame) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function SemiTrailerFront:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param superFunc any
---@return boolean
function SemiTrailerFront:isDetachAllowed(superFunc) end

---@param attachable table
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function SemiTrailerFront:onPostAttachImplement(attachable, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

---@param implement integer
function SemiTrailerFront:onPreDetachImplement(implement) end

---@param attacherVehicle table
---@param implement table
function SemiTrailerFront:onPreDetach(attacherVehicle, implement) end

---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function SemiTrailerFront:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end
