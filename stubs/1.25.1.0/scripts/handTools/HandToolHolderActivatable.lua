---@meta
-- FS25 1.25.1.0 : handTools/HandToolHolderActivatable.lua (generated stub, FS25 Lua Atlas)

---@class HandToolHolderActivatable
HandToolHolderActivatable = {}

---@param handToolHolder any
---@param takeText any
---@param storeText any
---@param needTargeting any
function HandToolHolderActivatable.new(handToolHolder, takeText, storeText, needTargeting) end

function HandToolHolderActivatable:getIsActivatable() end

---@param positionX any
---@param positionY any
---@param positionZ any
function HandToolHolderActivatable:getDistance(positionX, positionY, positionZ) end

function HandToolHolderActivatable:run() end
