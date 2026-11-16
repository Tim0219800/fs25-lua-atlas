---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FertilizingSowingMachine.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization for seeders that also spread fertilizer during sowing. It requires the SowingMachine and Sprayer specializations and overrides the sowing work-area processing to sow and update the spray density map in one pass, update farm spray statistics and stop AI jobs on missing seed, fertilizer or wrong field type. Note: this file reads FertilizingSowingMachine.CLIENT_DM_UPDATE_RADIUS but does not define it anywhere in the dump (UNVERIFIED where it is set).
---@class FertilizingSowingMachine
FertilizingSowingMachine = {}

--- Returns true only if both the SowingMachine and Sprayer specializations are present.
---@param specializations table
---@return boolean
function FertilizingSowingMachine.prerequisitesPresent(specializations) end

--- Registers the XML key vehicle.fertilizingSowingMachine#needsSetIsTurnedOn (default false).
function FertilizingSowingMachine.initSpecialization() end

--- Overrides processSowingMachineArea, getUseSprayerAIRequirements and getAreEffectsVisible on the vehicle type.
---@param vehicleType any
function FertilizingSowingMachine.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to the onLoad vehicle event.
---@param vehicleType any
function FertilizingSowingMachine.registerEventListeners(vehicleType) end

--- Reads needsSetIsTurnedOn, lets the sprayer run without being filled and without speed limit, and sets needWaterInfo to true on the vehicle.
---@param savegame any
function FertilizingSowingMachine:onLoad(savegame) end

--- Per work area: checks water/land seeding, seed availability, fertilizer source and required field type (stopping AI jobs with an error when needed), erases tire tracks, then sows (normal or direct) and sprays FERTILIZER on the density maps. Updates farm spray statistics. Returns changed and total area, or 0, 0 when nothing is done.
---@param superFunc any
---@param workArea any
---@param dt any
function FertilizingSowingMachine:processSowingMachineArea(superFunc, workArea, dt) end

--- Always returns false, so the sprayer's own AI requirements are not applied to this combined machine.
---@param superFunc any
function FertilizingSowingMachine:getUseSprayerAIRequirements(superFunc) end

--- Effects are visible only if the parent says so and the sprayer fill unit currently holds a known fill type (not UNKNOWN).
---@param superFunc any
function FertilizingSowingMachine:getAreEffectsVisible(superFunc) end
