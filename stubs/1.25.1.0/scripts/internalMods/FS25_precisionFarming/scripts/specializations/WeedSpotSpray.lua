---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/WeedSpotSpray.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization of Precision Farming for spot spraying herbicide and liquid fertilizer (requires Sprayer and PrecisionFarmingStatistic). It adds a 'weedSpotSpray' configuration, mounts weed sensor models, and overrides sprayer nozzle effect state so that each nozzle only sprays when the density maps under it call for it. It also reports herbicide use to the farmland statistics.
---@class WeedSpotSpray
WeedSpotSpray = {}

--- True only if the vehicle has both the Sprayer and PrecisionFarmingStatistic specializations.
---@param specializations table
---@return boolean
function WeedSpotSpray.prerequisitesPresent(specializations) end

--- Registers the 'weedSpotSpray' vehicle configuration type with its localized name.
function WeedSpotSpray.initSpecialization() end

--- Adds the vehicle functions getIsSpotSprayEnabled and addWeedSpotSpraySensorNodes.
---@param vehicleType any
function WeedSpotSpray.registerFunctions(vehicleType) end

--- Overrides getSprayerUsage, addExtendedSprayerNozzleEffect, updateExtendedSprayerNozzleEffectState and loadWorkAreaFromXML. The nozzle functions come from ExtendedSprayerEffects (not in this file).
---@param vehicleType any
function WeedSpotSpray.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onPreLoad, onLoad and onEndWorkAreaProcessing.
---@param vehicleType any
function WeedSpotSpray.registerEventListeners(vehicleType) end

--- Sets isEnabled to true when the chosen 'weedSpotSpray' configuration index is above 1.
---@param savegame any
function WeedSpotSpray:onPreLoad(savegame) end

--- Builds the set of weed states that herbicide can treat (from weedSystem replacements, ignoring preventive ones), loads sensor nodes from g_precisionFarming when enabled, and caches the weed, ground type and spray type density map ids and channels.
---@param savegame any
function WeedSpotSpray:onLoad(savegame) end

--- Server only, above speed 0.5: when herbicide is being sprayed and a spray vehicle or AI is active, adds the usage to 'usedHerbicide' and the unscaled usage to 'usedHerbicideRegular'.
---@param dt any
function WeedSpotSpray:onEndWorkAreaProcessing(dt) end

--- Returns whether the spot spray configuration is enabled on this vehicle.
function WeedSpotSpray:getIsSpotSprayEnabled() end

--- For each sensor entry found by i3d mapping name, clones a sensor model, links it with the configured translation and rotation, and scales the bracket child when bracketSize differs from 1.
---@param linkData any
function WeedSpotSpray:addWeedSpotSpraySensorNodes(linkData) end

--- Override. Stores the parent's usage as the regular (full-rate) usage, then, if nozzle effects exist, scales the returned usage by the active-nozzle alpha so only active nozzles consume product.
---@param superFunc any
---@param fillType any
---@param dt any
function WeedSpotSpray:getSprayerUsage(superFunc, fillType, dt) end

--- Override that only calls the parent and returns its result; adds no behaviour.
---@param superFunc any
---@param effectData any
---@param effectNode any
---@param linkNode any
---@param linkNodeData any
function WeedSpotSpray:addExtendedSprayerNozzleEffect(superFunc, effectData, effectNode, linkNode, linkNodeData) end

--- Override. Turns a nozzle off when spot spray is on and the vehicle reverses or is slower than 0.25. For herbicide, samples the weed map (enabled) or checks for bare ground (not enabled). For liquid fertilizer, it also skips ground already fertilized.
---@param superFunc any
---@param effectData any
---@param dt any
---@param isTurnedOn any
---@param lastSpeed any
function WeedSpotSpray:updateExtendedSprayerNozzleEffectState(superFunc, effectData, dt, isTurnedOn, lastSpeed) end

--- Override. After the parent loads a work area, sets disableBackwards when spot spray is enabled, because the sensors face forward.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function WeedSpotSpray:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end
