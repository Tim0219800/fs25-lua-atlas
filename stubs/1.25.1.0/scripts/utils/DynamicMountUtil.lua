---@meta
-- FS25 1.25.1.0 : utils/DynamicMountUtil.lua (stub généré, atlas Lua FS25)

---@class DynamicMountUtil
DynamicMountUtil = {}

---@param mountable table
---@param nodeId integer
---@param object table
---@param objectActorId integer
---@param jointNode integer
---@param mountType integer
---@param forceAcceleration number
---@param jointNode2 integer
---@return boolean
function DynamicMountUtil.mountDynamic(mountable, nodeId, object, objectActorId, jointNode, mountType, forceAcceleration, jointNode2) end

---@param mountable table
---@param remove boolean?
function DynamicMountUtil.unmountDynamic(mountable, remove) end
