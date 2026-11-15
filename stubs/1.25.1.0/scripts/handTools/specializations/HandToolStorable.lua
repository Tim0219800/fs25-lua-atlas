---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolStorable.lua (stub généré, atlas Lua FS25)

---@class HandToolStorable
HandToolStorable = {}

---@param xmlSchema any
function HandToolStorable.registerXMLPaths(xmlSchema) end

---@param handToolType any
function HandToolStorable.registerFunctions(handToolType) end

---@param handToolType any
function HandToolStorable.registerEventListeners(handToolType) end

---@param specializations any
function HandToolStorable.prerequisitesPresent(specializations) end

---@param xmlFile any
function HandToolStorable:onLoad(xmlFile) end

---@param typeName any
function HandToolStorable:getHolsterNodeByType(typeName) end
