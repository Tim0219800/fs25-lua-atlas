---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FrontloaderAttacher.lua (generated stub, FS25 Lua Atlas)

--- Specialization for tractors with a selectable frontloader attacher configuration. On the server, attaching a frontloader-type implement locks the configured front axis component joint (rotation limits set to 0), and detaching restores the saved limits. Requires AttacherJoints.
---@class FrontloaderAttacher
FrontloaderAttacher = {}

--- Requires the AttacherJoints specialization.
---@param specializations any
function FrontloaderAttacher.prerequisitesPresent(specializations) end

--- Subscribes to load, pre-attach implement and pre-detach implement events.
---@param vehicleType any
function FrontloaderAttacher.registerEventListeners(vehicleType) end

--- Registers the "frontloader" vehicle configuration type and the XML attributes frontAxisLimitJoint and frontAxisJoint of a frontloader configuration's attacherJoint.
function FrontloaderAttacher.initSpecialization() end

--- Reads the active frontloader configuration to find the front axis component joint that should be limited while a frontloader is attached (index must exist, else XML warning). Removes the attach/detach listeners on clients or when no such joint is set.
---@param savegame any
function FrontloaderAttacher:onLoad(savegame) end

--- Server: when a frontloader-type implement is detached, restores the front axis joint's rotation limits saved at attach time on all three axes.
---@param implement any
function FrontloaderAttacher:onPreDetachImplement(implement) end

--- Server: when a frontloader-type implement is attached, saves the front axis joint's rotation limits and locks its three rotation limits to 0 so the axle no longer pivots.
---@param attachable any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function FrontloaderAttacher:onPreAttachImplement(attachable, inputJointDescIndex, jointDescIndex, loadFromSavegame) end
