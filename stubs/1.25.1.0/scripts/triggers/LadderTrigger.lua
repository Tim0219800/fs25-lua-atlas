---@meta
-- FS25 1.25.1.0 : triggers/LadderTrigger.lua (stub généré, atlas Lua FS25)

---@class LadderTrigger
LadderTrigger = {}

---@param id integer
function LadderTrigger:onCreate(id) end

---@param node integer
---@return table
function LadderTrigger.new(node) end

function LadderTrigger:delete() end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function LadderTrigger:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end
