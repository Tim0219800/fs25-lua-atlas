---@meta
-- FS25 1.25.1.0 : economy/Farmland.lua (stub généré, atlas Lua FS25)

---@class Farmland
Farmland = {}

---@param customMt any
---@return table
function Farmland.new(customMt) end

---@param xmlFile XMLFile
---@param key string
---@return boolean
function Farmland:load(xmlFile, key) end

function Farmland:delete() end

---@param xWorldPos number
---@param zWorldPos number
function Farmland:setIndicatorPosition(xWorldPos, zWorldPos) end

---@param areaInHa number
function Farmland:setArea(areaInHa) end
