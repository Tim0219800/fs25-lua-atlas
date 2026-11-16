---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FertilizingCultivator.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization for cultivators that also spread fertilizer in the same pass. It requires both the Cultivator and Sprayer specializations and overrides the cultivator work-area processing so that cultivation and spray density-map updates happen together. It also adjusts the AI prohibited ranges for already-fertilized ground.
---@class FertilizingCultivator
FertilizingCultivator = {}

--- Returns true only if both the Cultivator and Sprayer specializations are present on the vehicle type.
---@param specializations table
---@return boolean
function FertilizingCultivator.prerequisitesPresent(specializations) end

--- Registers the XML key vehicle.fertilizingCultivator#needsSetIsTurnedOn (default false).
function FertilizingCultivator.initSpecialization() end

--- Overrides processCultivatorArea and setSprayerAITerrainDetailProhibitedRange on the vehicle type.
---@param vehicleType any
function FertilizingCultivator.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to the onLoad vehicle event.
---@param vehicleType any
function FertilizingCultivator.registerEventListeners(vehicleType) end

--- Reads needsSetIsTurnedOn, disables the sprayer speed limit, clears the AI terrain-detail required range and refreshes the cultivator AI requirements.
---@param savegame any
function FertilizingCultivator:onLoad(savegame) end

--- Per work area: stops the AI job when its fertilizer source runs out (depending on helper settings), erases tire tracks, cultivates (deep or disc harrow, plus vine and subsoiler) and sprays using the FERTILIZER spray type. Remote clients beyond the update radius return 0, 0. Returns changed and total cultivated area.
---@param superFunc any
---@param workArea any
---@param dt any
function FertilizingCultivator:processCultivatorArea(superFunc, workArea, dt) end

--- Replaces the sprayer version: clears prohibited ranges, then, for the given fill type's spray type, forbids AI work on ground already holding that spray type and on ground at maximum spray level. Does nothing if the vehicle has no AI prohibition support.
---@param superFunc any
---@param fillType any
function FertilizingCultivator:setSprayerAITerrainDetailProhibitedRange(superFunc, fillType) end
