---@meta
-- FS25 1.25.1.0 : vehicles/specializations/CCTDrivable.lua (generated stub, FS25 Lua Atlas)

--- Specialization for vehicles driven as a character controller (CCT) instead of a rigid-body vehicle, such as kinematic animal-like or walking mounts. It reads cctDrivable XML values (radius, height, slope limit, step offset), builds collision groups and masks, and on the server keeps a transform group that follows the vehicle and moves the controller. Several registered functions (getTouchingNode, moveCCTExternal) and the addToPhysics override have no definition in this file, UNVERIFIED.
---@class CCTDrivable
CCTDrivable = {}

--- Always returns true: no other specialization is required.
---@param specializations table
---@return boolean
function CCTDrivable.prerequisitesPresent(specializations) end

--- Opens and closes the CCTDrivable XML specialization type; no keys are registered in this dump.
function CCTDrivable.initSpecialization() end

--- Registers getTouchingNode, moveCCTExternal, moveCCT, getIsCCTOnGround, getCCTCollisionMask, getCCTWorldTranslation and getIsAIMovingObstacle. Note: getTouchingNode and moveCCTExternal are not defined in this file, so they register as nil (UNVERIFIED).
---@param vehicleType table
function CCTDrivable.registerFunctions(vehicleType) end

--- Overrides addToPhysics, removeFromPhysics, setWorldPosition and setWorldPositionQuaternion. Note: CCTDrivable.addToPhysics is not defined in this file (UNVERIFIED).
---@param vehicleType any
function CCTDrivable.registerOverwrittenFunctions(vehicleType) end

--- Registers onLoad and onDelete.
---@param vehicleType table
function CCTDrivable.registerEventListeners(vehicleType) end

--- Reads cctRadius, cctHeight, cctSlopeLimit and cctStepOffset from XML, sets the CCT centre offset to minus the radius, and builds the kinematic and movement collision group and mask (excluding vehicles, water, triggers in some cases, blocking flags). On the server creates the cctDrivable transform group under the root node.
---@param savegame table
function CCTDrivable:onLoad(savegame) end

--- Removes the CCT controller if one exists and deletes the transform group.
function CCTDrivable:onDelete() end

--- Server only: moves the controller by the given offset using the movement collision group and mask, then raises the vehicle active. Does nothing if no controller has been created.
---@param moveX any
---@param moveY any
---@param moveZ any
function CCTDrivable:moveCCT(moveX, moveY, moveZ) end

--- Server only: returns the on-ground flag reported by the engine for the controller, false if client or no controller.
---@return integer
function CCTDrivable:getIsCCTOnGround() end

--- Returns the kinematic collision mask built in onLoad.
---@return integer
function CCTDrivable:getCCTCollisionMask() end

--- Returns x, y, z of the controller centre: the node position with the centre offset added to y.
---@return number
---@return number
---@return number
function CCTDrivable:getCCTWorldTranslation() end

--- Always returns true: AI helpers must consider this vehicle a moving obstacle, even though its rigid body is kinematic.
---@return boolean
function CCTDrivable:getIsAIMovingObstacle() end

--- Calls the parent, then on the server, for component 1, moves the CCT node to the same position shifted by the centre offset. Rotation is not applied to the node.
---@param superFunc number
---@param x number
---@param y number
---@param z number
---@param xRot number
---@param yRot number
---@param zRot number
---@param i integer
---@param changeInterp boolean
function CCTDrivable:setWorldPosition(superFunc, x, y, z, xRot, yRot, zRot, i, changeInterp) end

--- Same as setWorldPosition but with a quaternion rotation: calls the parent, then on the server for component 1 moves the CCT node to the shifted position.
---@param superFunc number
---@param x number
---@param y number
---@param z number
---@param qx number
---@param qy number
---@param qz number
---@param qw number
---@param i integer
---@param changeInterp boolean
function CCTDrivable:setWorldPositionQuaternion(superFunc, x, y, z, qx, qy, qz, qw, i, changeInterp) end

--- On the server, removes the CCT controller before calling the parent implementation and returning its result.
---@param superFunc function
---@return boolean
function CCTDrivable:removeFromPhysics(superFunc) end
