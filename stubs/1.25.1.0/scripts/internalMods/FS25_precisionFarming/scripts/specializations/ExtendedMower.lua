---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMower.lua (generated stub, FS25 Lua Atlas)

--- Precision Farming specialization added to mowers (requires Mower and PrecisionFarmingStatistic). It shows the yield map on the minimap while on a field and wraps processMowerArea with the harvest extension's pre and post processing. The class doc comment in the source says it toggles minimap zoom.
---@class ExtendedMower
ExtendedMower = {}

--- Returns true when the vehicle type has both Mower and PrecisionFarmingStatistic.
---@param specializations table
---@return boolean
function ExtendedMower.prerequisitesPresent(specializations) end

--- Client only: while active for input (ignoring AI), refreshes the minimap yield map display state.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ExtendedMower:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client only: refreshes the minimap state, forcing it off when the vehicle is not active for input.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function ExtendedMower:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Tells the yield map to show on the minimap when the mower is on a field, unless a state is forced. Note: unlike ExtendedCombine, it does not check that the yield map is non-nil.
---@param self any
---@param forcedState any
function ExtendedMower.updateMinimapActiveState(self, forcedState) end

--- Override: calls preProcessMowerArea and postProcessMowerArea of g_precisionFarming.harvestExtension around the base function, skipped for far clients beyond Mower.CLIENT_DM_UPDATE_RADIUS. Returns the base changed and total area.
---@param superFunc any
---@param workArea any
---@param dt any
function ExtendedMower:processMowerArea(superFunc, workArea, dt) end
