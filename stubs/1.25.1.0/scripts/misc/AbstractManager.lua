---@meta
-- FS25 1.25.1.0 : misc/AbstractManager.lua (stub généré, atlas Lua FS25)

---@class AbstractManager
AbstractManager = {}

---@param customMt any
---@return table
function AbstractManager.new(customMt) end

function AbstractManager:initDataStructures() end

---@return boolean
function AbstractManager:load() end

---@return boolean
function AbstractManager:loadMapData() end

function AbstractManager:unloadMapData() end
