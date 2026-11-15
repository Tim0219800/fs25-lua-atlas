---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolTethered.lua (stub généré, atlas Lua FS25)

---@class HandToolTethered
HandToolTethered = {}

---@param xmlSchema any
function HandToolTethered.registerXMLPaths(xmlSchema) end

---@param handToolType any
function HandToolTethered.registerFunctions(handToolType) end

---@param vehicleType any
function HandToolTethered.registerOverwrittenFunctions(vehicleType) end

---@param handToolType any
function HandToolTethered.registerEventListeners(handToolType) end

---@param specializations any
function HandToolTethered.prerequisitesPresent(specializations) end

---@param xmlFile any
---@param baseDirectory any
function HandToolTethered:onLoad(xmlFile, baseDirectory) end

function HandToolTethered:onDelete() end

---@param dt any
function HandToolTethered:onPreUpdate(dt) end

---@param holder any
function HandToolTethered:setAttachedHolder(holder) end

function HandToolTethered:onCarryingPlayerLeftGame() end

function HandToolTethered:onCarryingPlayerEnteredVehicle() end

---@param superFunc any
---@param holder any
---@param noEventSend any
function HandToolTethered:setHolder(superFunc, holder, noEventSend) end

---@param noEventSend any
function HandToolTethered:returnToHolder(noEventSend) end

---@param holderPlayerDistance any
function HandToolTethered:showRangeWarning(holderPlayerDistance) end
