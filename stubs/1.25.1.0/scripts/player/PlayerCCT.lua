---@meta
-- FS25 1.25.1.0 : player/PlayerCCT.lua (generated stub, FS25 Lua Atlas)

--- Thin wrapper around the engine character controller (CCT) capsule of a player, covering creation, removal, movement, position and grounded checks, with debug output. It stores capsule size, slope and step limits and collision groups/masks; `rootNode`, `getSkinWidth`, `getBottomOffsetY`, `setMass` and similar accessors are not defined in this file (UNVERIFIED where they come from). Used by Player as `capsuleController`.
---@class PlayerCCT
PlayerCCT = {}

--- Creates the CCT wrapper with default radius 0.35, slope limit 60, step offset 0.4, mass 0 and the default collision groups and masks. No engine capsule exists until `rebuild` is called.
---@return PlayerCCT
function PlayerCCT.new() end

--- Removes the engine CCT with `removeCCT` if one exists and clears its id.
function PlayerCCT:delete() end

--- Removes any existing capsule and creates a new one with `createCCT` on the root node using the stored size, limits, groups and mass. The current height becomes the desired height.
function PlayerCCT:rebuild() end

--- Moves the capsule by a displacement in metres per axis with `moveCCT`, using the movement collision group and mask.
---@param movementX number
---@param movementY number
---@param movementZ number
function PlayerCCT:move(movementX, movementY, movementZ) end

--- Returns the world position of the player's feet: root node x and z, with y shifted by the bottom offset.
---@return number
---@return number
---@return number
function PlayerCCT:getPosition() end

--- Sets the capsule position from a foot position with `setCCTPosition`; if the last argument is true, the root node is also moved to the matching position.
---@param x number
---@param y number
---@param z number
---@param setNodeTranslation boolean?
function PlayerCCT:setPosition(x, y, z, setNodeTranslation) end

--- Returns the third value of `getCCTCollisionFlags`, i.e. whether the capsule bottom touches the ground.
---@return boolean
function PlayerCCT:calculateIfBottomTouchesGround() end

--- Draws debug text lines for the capsule height, the physics height and the desired height, and returns the next y screen position.
---@param x number
---@param y number
---@param textSize number
---@return number
function PlayerCCT:debugDraw(x, y, textSize) end
