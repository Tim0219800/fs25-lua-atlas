---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolHorseBrush.lua (stub généré, atlas Lua FS25)

---@class HandToolHorseBrush
HandToolHorseBrush = {}

---@param xmlSchema any
function HandToolHorseBrush.registerXMLPaths(xmlSchema) end

---@param handToolType any
function HandToolHorseBrush.registerEventListeners(handToolType) end

---@param specializations any
function HandToolHorseBrush.prerequisitesPresent(specializations) end

---@param xmlFile any
function HandToolHorseBrush:onLoad(xmlFile) end

function HandToolHorseBrush:onDelete() end

---@param dt any
function HandToolHorseBrush:onUpdate(dt) end

function HandToolHorseBrush:onDraw() end

function HandToolHorseBrush:onRegisterActionEvents() end

---@param _ any
---@param inputValue any
function HandToolHorseBrush:onBrushAction(_, inputValue) end

function HandToolHorseBrush:onHeldStart() end

---@param carryingPlayer any
---@param node any
function HandToolHorseBrush.getHusbandryAndClusterFromNode(carryingPlayer, node) end
