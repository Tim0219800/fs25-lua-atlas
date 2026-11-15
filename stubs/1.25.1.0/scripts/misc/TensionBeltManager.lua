---@meta
-- FS25 1.25.1.0 : misc/TensionBeltManager.lua (generated stub, FS25 Lua Atlas)

---@class TensionBeltManager
TensionBeltManager = {}

---@param customMt any
---@return table
function TensionBeltManager.new(customMt) end

function TensionBeltManager:initDataStructures() end

function TensionBeltManager:unloadMapData() end

---@param _ any
---@param id any
function TensionBeltManager.onCreateTensionBelt(_, id) end

---@param beltName any
function TensionBeltManager:getType(beltName) end

---@param beltName any
function TensionBeltManager:getBeltData(beltName) end
