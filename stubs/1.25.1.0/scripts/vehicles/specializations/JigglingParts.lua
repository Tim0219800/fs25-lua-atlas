---@meta
-- FS25 1.25.1.0 : vehicles/specializations/JigglingParts.lua (stub généré, atlas Lua FS25)

---@class JigglingParts
JigglingParts = {}

---@param specializations any
function JigglingParts.prerequisitesPresent(specializations) end

function JigglingParts.initSpecialization() end

---@param vehicleType any
function JigglingParts.registerFunctions(vehicleType) end

---@param vehicleType any
function JigglingParts.registerEventListeners(vehicleType) end

---@param savegame any
function JigglingParts:onLoad(savegame) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function JigglingParts:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param jigglingPart any
---@param xmlFile any
---@param key any
function JigglingParts:loadJigglingPartsFromXML(jigglingPart, xmlFile, key) end

---@param jigglingPart any
function JigglingParts:isJigglingPartActive(jigglingPart) end

---@param jigglingPart any
---@param dt any
---@param groundContact any
function JigglingParts:updateJigglingPart(jigglingPart, dt, groundContact) end
