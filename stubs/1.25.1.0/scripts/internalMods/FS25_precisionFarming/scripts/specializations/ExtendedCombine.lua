---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/ExtendedCombine.lua (generated stub, FS25 Lua Atlas)

--- Precision Farming specialization added to combines (requires Combine and PrecisionFarmingStatistic). It shows the yield map on the minimap while harvesting on a field, adds a HUD help extension, and synchronises the last yield weight, yield percentage and yield potential from server to clients. The class doc comment in the source says it toggles minimap zoom.
---@class ExtendedCombine
ExtendedCombine = {}

--- Returns true when the vehicle type has both Combine and PrecisionFarmingStatistic.
---@param specializations table
---@return boolean
function ExtendedCombine.prerequisitesPresent(specializations) end

--- Deletes the HUD extension if one was created.
function ExtendedCombine:onDelete() end

--- Client side: if the server sent a flag, reads the last yield weight (tenths), yield percentage and yield potential percentage.
---@param streamId any
---@param timestamp any
---@param connection any
function ExtendedCombine:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: when the usage values dirty flag is set, writes the three yield values, each capped at its maximum bit range.
---@param streamId any
---@param connection any
---@param dirtyMask any
function ExtendedCombine:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- When the vehicle is active for input (ignoring AI), adds its HUD extension to the HUD help.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ExtendedCombine:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client only: while active for input (ignoring AI), refreshes the minimap yield map display state.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ExtendedCombine:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client only: refreshes the minimap state, forcing it off when the vehicle is not active for input.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function ExtendedCombine:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Tells the yield map whether the minimap should show it: true when the combine is on a field with an attached cutter and no mission, unless a state is forced. Does nothing if there is no yield map.
---@param self any
---@param forcedState any
function ExtendedCombine.updateMinimapActiveState(self, forcedState) end

--- Stores the last yield weight, percentage and potential and raises the dirty flag for network sync only if one of them changed.
---@param lastYieldWeight any
---@param lastYieldPercentage any
---@param lastYieldPotential any
function ExtendedCombine:setLastYieldValues(lastYieldWeight, lastYieldPercentage, lastYieldPotential) end
