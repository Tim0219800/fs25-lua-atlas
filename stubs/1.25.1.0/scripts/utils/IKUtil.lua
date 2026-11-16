---@meta
-- FS25 1.25.1.0 : utils/IKUtil.lua (generated stub, FS25 Lua Atlas)

--- Registers the target entries below a base path: chain name, target node, translation and rotation offsets, a set-dirty flag (default true), per-index rotation nodes and a pose id.
---@param schema any
---@param basePath any
function IKUtil.registerIKChainTargetsXMLPaths(schema, basePath) end

--- Registers the XML paths of one IK chain: id, target and offsets, chain nodes with per-axis angle limits (default -180 to 180), damping (30), local limits, rotation nodes, poses, iteration counts (20, init double), position threshold 0.005 and dirty-on-load.
---@param schema any
---@param basePath any
function IKUtil.registerIKChainXMLPaths(schema, basePath) end
