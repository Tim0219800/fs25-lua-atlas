---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolFlashlight.lua (stub généré, atlas Lua FS25)

---@class HandToolFlashlight
HandToolFlashlight = {}

---@param xmlSchema any
function HandToolFlashlight.registerXMLPaths(xmlSchema) end

---@param handToolType any
function HandToolFlashlight.registerFunctions(handToolType) end

---@param handToolType any
function HandToolFlashlight.registerEventListeners(handToolType) end

---@param specializations any
function HandToolFlashlight.prerequisitesPresent(specializations) end

---@param xmlFile any
function HandToolFlashlight:onLoad(xmlFile) end

function HandToolFlashlight:onDelete() end

---@param dt any
function HandToolFlashlight:onUpdate(dt) end

function HandToolFlashlight:onHeldEnd() end

---@param isActive any
---@param noEventSend any
function HandToolFlashlight:setFlashlightIsActive(isActive, noEventSend) end

---@param isHeld any
function HandToolFlashlight:updateTransform(isHeld) end
