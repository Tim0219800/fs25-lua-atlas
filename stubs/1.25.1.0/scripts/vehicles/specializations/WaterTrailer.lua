---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WaterTrailer.lua (stub généré, atlas Lua FS25)

---@class WaterTrailer
WaterTrailer = {}

---@class WaterTrailerActivatable
WaterTrailerActivatable = {}

---@param specializations table
---@return boolean
function WaterTrailer.prerequisitesPresent(specializations) end

function WaterTrailer.initSpecialization() end

---@param vehicleType any
function WaterTrailer.registerFunctions(vehicleType) end

---@param vehicleType any
function WaterTrailer.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function WaterTrailer.registerEventListeners(vehicleType) end

---@param savegame table
function WaterTrailer:onLoad(savegame) end

function WaterTrailer:onDelete() end

---@param streamId integer
---@param connection Connection
function WaterTrailer:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function WaterTrailer:onWriteStream(streamId, connection) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function WaterTrailer:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isFilling boolean
---@param noEventSend boolean
function WaterTrailer:setIsWaterTrailerFilling(isFilling, noEventSend) end

---@param superFunc any
function WaterTrailer:getDrawFirstFillText(superFunc) end

---@param attacherVehicle table
---@param implement table
function WaterTrailer:onPreDetach(attacherVehicle, implement) end

---@param trailer any
function WaterTrailerActivatable.new(trailer) end

function WaterTrailerActivatable:getIsActivatable() end

function WaterTrailerActivatable:run() end

function WaterTrailerActivatable:updateActivateText() end
