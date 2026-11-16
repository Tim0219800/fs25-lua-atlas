---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ManureBarrel.lua (generated stub, FS25 Lua Atlas)

--- Specialization for liquid manure barrels that can carry a spreading tool on one attacher joint. Requires Sprayer and AttacherJoints. While a tool is attached on the configured joint (`vehicle.manureBarrel#attacherJointIndex`), the barrel's own spreading effects and work areas are disabled so the attached tool does the work. No network code of its own.
---@class ManureBarrel
ManureBarrel = {}

--- Returns true only if both Sprayer and AttacherJoints specializations are present.
---@param specializations any
function ManureBarrel.prerequisitesPresent(specializations) end

--- Registers the XML path `vehicle.manureBarrel#attacherJointIndex`.
function ManureBarrel.initSpecialization() end

--- Overrides `getAreEffectsVisible` and `getIsWorkAreaActive`.
---@param vehicleType any
function ManureBarrel.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostAttachImplement and onPostDetachImplement.
---@param vehicleType any
function ManureBarrel.registerEventListeners(vehicleType) end

--- Reads the attacher joint index of the tool joint and warns about the deprecated `toolAttachAnimName` element.
---@param savegame any
function ManureBarrel:onLoad(savegame) end

--- Remembers the attached implement when it is attached to the configured tool joint.
---@param attachable any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function ManureBarrel:onPostAttachImplement(attachable, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- Clears the remembered tool when the implement on the configured tool joint is detached.
---@param implementIndex any
function ManureBarrel:onPostDetachImplement(implementIndex) end

--- Override: returns false while a tool is attached on the tool joint, otherwise defers to the parent.
---@param superFunc any
function ManureBarrel:getAreEffectsVisible(superFunc) end

--- Override: returns false while a tool is attached on the tool joint, otherwise defers to the parent.
---@param superFunc any
---@param workArea any
function ManureBarrel:getIsWorkAreaActive(superFunc, workArea) end
