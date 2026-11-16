---@meta
-- FS25 1.25.1.0 : vehicles/specializations/StumpCutter.lua (generated stub, FS25 Lua Atlas)

--- Specialization for stump cutters that grind tree trunks (split shapes) and clear decoration density-map areas. It requires TurnOnVehicle and declares a 'stumpCutter' work area type. Each cut node scans for a split shape in its cut plane, then the server cuts or crushes it after timers; the client drives wood-chip effects, sounds and animations. It also adds dirt/wear and engine load while cutting.
---@class StumpCutter
StumpCutter = {}

--- Returns true only if the vehicle type also has the TurnOnVehicle specialization.
---@param specializations table
---@return boolean
function StumpCutter.prerequisitesPresent(specializations) end

--- Registers the 'stumpCutter' work area type and the XML schema: cut nodes (size, timers, thresholds, work area index, duration, effects), sounds, global effects and animation nodes.
function StumpCutter.initSpecialization() end

--- Registers crushSplitShape, stumpCutterSplitShapeCallback and processStumpCutterArea on the vehicle type.
---@param vehicleType any
function StumpCutter.registerFunctions(vehicleType) end

--- Overrides getDirtMultiplier, getWearMultiplier, getCultivatorLimitToField, getPlowLimitToField, getPlowForceLimitToField and getConsumingLoad.
---@param vehicleType any
function StumpCutter.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onUpdateTick, onDeactivate, onTurnedOn and onTurnedOff.
---@param vehicleType any
function StumpCutter.registerEventListeners(vehicleType) end

--- Reads every vehicle.stumpCutter.cutNode(i) (node, cut sizes, timers, thresholds, work area index, effects) until one is missing, and on clients loads sounds, global effects and animations. Warns on old FS17-FS22 XML keys.
---@param savegame table
function StumpCutter:onLoad(savegame) end

--- Deletes sound samples, animations, the global effects and the effects of every cut node.
function StumpCutter:onDelete() end

--- While turned on, processes one cut node per tick in rotation: finds a split shape in its plane, and on the server counts down and then crushes the tree or splits it. Clients start or stop wood-chip effects and the work sound.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function StumpCutter:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client only: stops the global effects and the effects of every cut node.
function StumpCutter:onDeactivate() end

--- Client only: stops running samples, plays the start sound followed by idle, and starts the animation nodes.
function StumpCutter:onTurnedOn() end

--- Client only: resets the work fade time, stops all effects and samples, plays the stop sound and stops the animations.
function StumpCutter:onTurnedOff() end

--- Server only: deletes the split shape and marks a 10 m square around it dirty in the height collision map and the AI system.
---@param shape integer
function StumpCutter:crushSplitShape(shape) end

--- Callback of splitShape. Crushes the upper piece if shorter than 1 m, otherwise registers it with the tree plant manager. The lower piece is crushed if its cut centre is below terrain, else it is kept as the current shape.
---@param shape integer
---@param isBelow boolean
---@param isAbove boolean
---@param minY number
---@param maxY number
---@param minZ number
---@param maxZ number
function StumpCutter:stumpCutterSplitShapeCallback(shape, isBelow, isAbove, minY, maxY, minZ, maxZ) end

--- Work area callback: for cut nodes tied to this area, clears decoration density-map area (FSDensityMapUtil.clearDecoArea) and refreshes their last work time. Returns area and total area. Distant clients return 0, 0. Note: CLIENT_DM_UPDATE_RADIUS is not defined in this file (UNVERIFIED where it is set).
---@param workArea any
---@param dt any
function StumpCutter:processStumpCutterArea(workArea, dt) end

--- Override adding the work dirt multiplier while a split shape is held in the specialization state.
---@param superFunc any
---@return number
function StumpCutter:getDirtMultiplier(superFunc) end

--- Override adding the work wear multiplier while a split shape is held in the specialization state.
---@param superFunc any
---@return number
function StumpCutter:getWearMultiplier(superFunc) end

--- Override that always returns false.
---@param superFunc any
---@return boolean
function StumpCutter:getCultivatorLimitToField(superFunc) end

--- Returns false: the stump cutter is not limited to fields for plow logic.
---@return boolean
function StumpCutter:getPlowLimitToField() end

--- Returns true, so the limit-to-field choice is forced.
---@return boolean
function StumpCutter:getPlowForceLimitToField() end

--- Override that adds one load entry: 1 if any cut node worked in the last 500 ms, otherwise 0 (idle), and increments the count.
---@param superFunc any
function StumpCutter:getConsumingLoad(superFunc) end
