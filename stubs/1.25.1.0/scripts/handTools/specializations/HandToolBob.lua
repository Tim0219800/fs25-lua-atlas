---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolBob.lua (stub généré, atlas Lua FS25)

---@class HandToolBob
HandToolBob = {}

---@param xmlSchema table
function HandToolBob.registerXMLPaths(xmlSchema) end

---@param handToolType table
function HandToolBob.registerFunctions(handToolType) end

---@param handToolType table
function HandToolBob.registerEventListeners(handToolType) end

---@param specializations table
---@return boolean
function HandToolBob.prerequisitesPresent(specializations) end

---@param xmlFile table
function HandToolBob:onLoad(xmlFile) end

---@param dt number
function HandToolBob:onUpdate(dt) end

function HandToolBob:onHeldEnd() end

---@return boolean
function HandToolBob:getIsBobActive() end

---@param bobNode table
---@param dt number
---@param isActive boolean
---@param speed number
function HandToolBob:updateBobNode(bobNode, dt, isActive, speed) end

---@param bobNode table
function HandToolBob:resetBobNode(bobNode) end
