---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSowingMachine.lua (generated stub, FS25 Lua Atlas)

--- Precision Farming specialization added to sowing machines (requires SowingMachine and PrecisionFarmingStatistic). It adds a seed rate mode (automatic from soil type or manual) synchronised by ExtendedSowingMachineRateEvent, scales seed usage by the real rate, records seed statistics, and reads recommended seed rate and tramline width from the maps. It wraps processSowingMachineArea and processOverSeedingArea.
---@class ExtendedSowingMachine
ExtendedSowingMachine = {}

--- Returns true when the vehicle type has both SowingMachine and PrecisionFarmingStatistic.
---@param specializations table
---@return boolean
function ExtendedSowingMachine.prerequisitesPresent(specializations) end

--- Deletes the HUD extension if one was created.
function ExtendedSowingMachine:onDelete() end

--- Once the vehicle moved far enough, samples the soil and tramline maps at the first work area, and stores the recommended seed rate and tramline width (nil if off field). Also adds the HUD extension when active for input.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ExtendedSowingMachine:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Server only: when area was sown, computes seed usage from the fruit's per-sqm usage, usage scale and vehicle damage, for both the adjusted and the regular area, and adds them to the usedSeeds and usedSeedsRegular statistics.
---@param dt any
---@param hasProcessed any
function ExtendedSowingMachine:onEndWorkAreaProcessing(dt, hasProcessed) end

--- Client only: when active for input, registers the auto mode toggle and seed rate change actions (high priority) and updates their state; flags that the attach state changed.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function ExtendedSowingMachine:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Sets or toggles (state nil) the automatic seed rate mode, refreshes action texts on clients and sends ExtendedSowingMachineRateEvent unless noEventSend is set.
---@param state any
---@param noEventSend any
function ExtendedSowingMachine:setSeedRateAutoMode(state, noEventSend) end

--- Clamps the manual seed rate between ExtendedSowingMachine.MIN_SEED_RATE and MAX_SEED_RATE, stores it if changed and sends ExtendedSowingMachineRateEvent unless noEventSend is set.
---@param seedRate any
---@param noEventSend any
function ExtendedSowingMachine:setManualSeedRate(seedRate, noEventSend) end

--- Forces the next onUpdate to resample the ground data by setting the travelled distance counter to infinity.
function ExtendedSowingMachine:onTramlinesChanged() end

--- Override: after the base sowing, asks the seed rate map to update the seed area with the auto or manual rate, and rescales the changed area by the real seed usage ratio. Stores the last seed rate and index, returns the base areas.
---@param superFunc any
---@param workArea any
---@param dt any
function ExtendedSowingMachine:processSowingMachineArea(superFunc, workArea, dt) end

--- Override with the same logic as processSowingMachineArea, applied to over-seeding work areas.
---@param superFunc any
---@param workArea any
---@param dt any
function ExtendedSowingMachine:processOverSeedingArea(superFunc, workArea, dt) end

--- Input callback that toggles the automatic seed rate mode.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function ExtendedSowingMachine.actionEventToggleAuto(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback that changes the manual seed rate by one step in the direction of the input value sign.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function ExtendedSowingMachine.actionEventChangeSeedRate(self, actionName, inputValue, callbackState, isAnalog, ...) end

--- Sets the auto mode action text from the current mode and enables the seed rate change action only when auto mode is off.
---@param self any
function ExtendedSowingMachine.updateActionEventState(self) end
