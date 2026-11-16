---@meta
-- FS25 1.25.1.0 : utils/DynamicMountUtil.lua (generated stub, FS25 Lua Atlas)

--- Signature only (no body in the SDK dump): helper for mounting objects onto a node with physics joints, normally reached through mountable classes rather than called directly. The mount types it accepts include fork, several auto-attach variants and fixed attach (names taken from the parameter list, UNVERIFIED).
---@class DynamicMountUtil
DynamicMountUtil = {}

--- Signature only (no body in the SDK dump): presumably mounts an object onto a node through a joint of the chosen mount type, with a force acceleration and optional second joint node, and returns a success boolean. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): presumably releases a dynamically mounted object, with an optional flag to remove it. UNVERIFIED.
---@param mountable table
---@param remove boolean?
function DynamicMountUtil.unmountDynamic(mountable, remove) end
