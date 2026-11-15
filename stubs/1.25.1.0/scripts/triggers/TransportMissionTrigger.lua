---@meta
-- FS25 1.25.1.0 : triggers/TransportMissionTrigger.lua (generated stub, FS25 Lua Atlas)

---@class TransportMissionTrigger
TransportMissionTrigger = {}

---@param id integer
function TransportMissionTrigger:onCreate(id) end

---@param id integer
---@return table
function TransportMissionTrigger.new(id) end

function TransportMissionTrigger:delete() end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function TransportMissionTrigger:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end
