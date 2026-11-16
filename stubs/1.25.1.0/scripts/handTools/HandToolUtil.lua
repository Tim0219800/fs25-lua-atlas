---@meta
-- FS25 1.25.1.0 : handTools/HandToolUtil.lua (generated stub, FS25 Lua Atlas)

--- Static helper class for hand tools: targeting of holders and node placement helpers. It uses constants (`HOLDER_DEFAULT_*_DISTANCE`, `CLICK_BOX_TARGET_MASK`) and `transformRelativeToParent` that are not defined in this file (UNVERIFIED).
---@class HandToolUtil
HandToolUtil = {}

--- Registers `HandToolHolder` as a target type on a player targeter, with optional min and max distances (defaults from `HandToolUtil` constants), filtered so that only nodes that are click boxes of a known holder in `handToolSystem` count.
---@param playerTargeter PlayerTargeter
---@param minDistance number?
---@param maxDistance number?
function HandToolUtil.addHandToolHolderTarget(playerTargeter, minDistance, maxDistance) end

--- Links `rootNode` under `parentNode`, then calls `HandToolUtil.transformRelativeToParent` so that `childNode` ends up at the parent's position and rotation (that function is UNVERIFIED here).
---@param rootNode integer
---@param childNode integer
---@param parentNode integer
function HandToolUtil.linkAndTransformRelativeToParent(rootNode, childNode, parentNode) end
