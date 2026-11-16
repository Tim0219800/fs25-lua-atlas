---@meta
-- FS25 1.25.1.0 : handTools/HandToolHolderActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable (interaction prompt) object attached to a `HandToolHolder`. It lets the local player take the stored hand tool or store the one currently held, depending on which side is empty. It can optionally require that the holder is the one targeted by the player's targeter.
---@class HandToolHolderActivatable
HandToolHolderActivatable = {}

--- Creates the activatable for a holder with its take and store texts (format strings receiving the tool type description) and a flag saying whether targeting is required.
---@param handToolHolder any
---@param takeText any
---@param storeText any
---@param needTargeting any
function HandToolHolderActivatable.new(handToolHolder, takeText, storeText, needTargeting) end

--- Returns true when the local player can take the holder's tool (hands empty, holder full) or store their held tool (holder empty); sets `activateText` accordingly. With targeting on, the holder must be the targeted one.
function HandToolHolderActivatable:getIsActivatable() end

--- Returns 0 if targeting is required and the prompt is currently activatable; otherwise the distance from the given position to the holder node.
---@param positionX any
---@param positionY any
---@param positionZ any
function HandToolHolderActivatable:getDistance(positionX, positionY, positionZ) end

--- Executes the interaction: either sets the holder's tool to the local player and makes it the current hand tool, or sets the held tool's holder to this holder. Local player only.
function HandToolHolderActivatable:run() end
