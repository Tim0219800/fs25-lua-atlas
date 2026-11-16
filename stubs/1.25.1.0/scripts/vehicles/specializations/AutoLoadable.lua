---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AutoLoadable.lua (generated stub, FS25 Lua Atlas)

--- Marker specialization for vehicles that an AutoLoader vehicle may pick up and mount on its load area. It reports the object's size and bounding box from `self.size` and mounts the object kinematically at a grid position. It has no prerequisite and only sets its flag on the server.
---@class AutoLoadable
AutoLoadable = {}

--- Always returns true: no prerequisite specialization.
---@param specializations any
function AutoLoadable.prerequisitesPresent(specializations) end

--- Registers `getAutoLoadIsSupported`, `getAutoLoadIsAllowed`, `getAutoLoadBoundingBox`, `getAutoLoadSize` and `autoLoad` on the vehicle type.
---@param vehicleType any
function AutoLoadable.registerFunctions(vehicleType) end

--- Subscribes the vehicle to `onLoad`.
---@param vehicleType any
function AutoLoadable.registerEventListeners(vehicleType) end

--- On the server only, marks the vehicle as supported for auto loading. On clients the flag stays unset.
---@param savegame any
function AutoLoadable:onLoad(savegame) end

--- Returns the supported flag set at load time (true on the server, nil elsewhere).
function AutoLoadable:getAutoLoadIsSupported() end

--- Always returns true; other specializations can override it to refuse loading.
function AutoLoadable:getAutoLoadIsAllowed() end

--- Returns the vehicle size as width, height and length, taken from `self.size`.
function AutoLoadable:getAutoLoadSize() end

--- Returns an oriented bounding box in world space: centre, forward and up directions, then half extents. The centre uses the size offsets relative to the root node.
function AutoLoadable:getAutoLoadBoundingBox() end

--- Mounts the vehicle kinematically on the loader's node at the given grid position with zero rotation, and returns true. Note: the Z mount offset adds half of the size height, not the length, which looks like a slip.
---@param autoLoader any
---@param node any
---@param posX any
---@param posZ any
---@param sizeX any
---@param sizeZ any
function AutoLoadable:autoLoad(autoLoader, node, posX, posZ, sizeX, sizeZ) end
