---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/ManureSensor.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization of Precision Farming for manure sensors on sprayers/spreaders (requires Sprayer and PrecisionFarmingStatistic). It registers a 'manureSensor' configuration, attaches a sensor model, and overrides the nitrogen offset functions so that with a sensor the applied amount is exact and without one it drifts over time.
---@class ManureSensor
ManureSensor = {}

--- True only if the vehicle has both the Sprayer and PrecisionFarmingStatistic specializations.
---@param specializations table
---@return boolean
function ManureSensor.prerequisitesPresent(specializations) end

--- Registers the 'manureSensor' configuration type and the XML keys linkNode#node and linkNode#type (DEFAULT, LARGE, SMALL or STANDALONE) in the vehicle schema.
function ManureSensor.initSpecialization() end

--- Initialises a random curve offset and checks if any fill unit accepts liquid manure or digestate (sensor required). Links the sensor from the selected configuration, and for configs above 1 uses linkage data from g_precisionFarming by config file name.
---@param savegame any
function ManureSensor:onLoad(savegame) end

--- Clones a sensor node of the given type for each link node (found by node or i3d mapping name), links it, applies optional translation, rotation and scale, then marks the sensor as available.
---@param linkData any
function ManureSensor:linkManureSensor(linkData) end

--- Computes a time-varying nitrogen offset from three summed sine waves over g_time, scaled by lastChangeLevels and MAX_NITROGEN_OFFSET_PCT, rounded to whole steps and sign-preserved. Simulates uncertain manure nitrogen content.
---@param lastChangeLevels any
function ManureSensor:getManureSensorNitrogenOffset(lastChangeLevels) end

--- Override. Without a required sensor it calls the parent. If a sensor is required but missing it returns the drifting offset; with a sensor it returns 0.
---@param superFunc any
---@param lastChangeLevels any
function ManureSensor:getCurrentNitrogenLevelOffset(superFunc, lastChangeLevels) end

--- Override. Without a required sensor it calls the parent. With a sensor it returns the drifting offset, without one it returns 0 (the opposite of the level offset above).
---@param superFunc any
---@param lastChangeLevels any
function ManureSensor:getCurrentNitrogenUsageLevelOffset(superFunc, lastChangeLevels) end

--- Override. Returns the parent value if no sensor is required, otherwise whether a sensor is available.
---@param superFunc any
function ManureSensor:getIsUsingExactNitrogenAmount(superFunc) end
