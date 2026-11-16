---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayerEffects.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization of Precision Farming that replaces a sprayer's standard spray effect with one shader-plane effect per nozzle (requires Sprayer and ExtendedSprayer). Nozzles come from the vehicle XML, a configuration or g_precisionFarming link data. ExtendedSprayer and WeedSpotSpray override the per-nozzle state function. It optionally runs pulse width modulation, fades effects in and out and drives per-side spray sounds.
---@class ExtendedSprayerEffects
ExtendedSprayerEffects = {}

--- True only if the vehicle has both the Sprayer and ExtendedSprayer specializations.
---@param specializations table
---@return boolean
function ExtendedSprayerEffects.prerequisitesPresent(specializations) end

--- Registers the XML keys vehicle.sprayer.nozzles(?) (#foldingConfigurationIndex, default 1) and its nozzle(?) children (#node, #translation, #rotation).
function ExtendedSprayerEffects.initSpecialization() end

--- Adds the vehicle functions for adding, initialising, updating and counting nozzle effects (addExtendedSprayerNozzleEffect(s), initExtendedSprayerNozzleEffect, updateExtendedSprayerNozzleEffect(s)(State), getNumExtendedSprayerNozzleEffectsActive).
---@param vehicleType any
function ExtendedSprayerEffects.registerFunctions(vehicleType) end

--- Overrides getAreEffectsVisible.
---@param vehicleType any
function ExtendedSprayerEffects.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onPreInitComponentPlacement, onUpdate and onDelete.
---@param vehicleType any
function ExtendedSprayerEffects.registerEventListeners(vehicleType) end

--- Detects pulse width modulation (configuration above 1) and individual nozzle control (PWM or spot spray), then adds nozzles from g_precisionFarming link data and from the XML, keeping only those matching the selected folding configuration. Note: nozzleNodesToDelete is a node-keyed table walked with 1..#, so the cleanup loop never deletes anything.
---@param savegame any
function ExtendedSprayerEffects:onLoad(savegame) end

--- Initialises every nozzle effect (finds its work-width section) and groups the effects by section index.
---@param savegame any
function ExtendedSprayerEffects:onPostLoad(savegame) end

--- Without custom effects, removes the onUpdate listener. With them, disables VariableWorkWidth drawing and action events, deletes the standard spray sounds, creates a center node per section and left/right sound nodes averaged from the nozzles, and assigns cloned spray samples per side.
---@param savegame any
function ExtendedSprayerEffects:onPreInitComponentPlacement(savegame) end

--- Each update refreshes nozzle states, per nozzle with individual control or per section otherwise. When a state changed it runs updateExtendedSprayerNozzleEffects and keeps the vehicle active.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function ExtendedSprayerEffects:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Deletes the left and right spray sound samples.
function ExtendedSprayerEffects:onDelete() end

--- Adds a nozzle effect for each entry of linkData.effectNodes whose node name exists in the i3d mappings, cloning an effect node from g_precisionFarming.
---@param linkData any
function ExtendedSprayerEffects:addExtendedSprayerNozzleEffects(linkData) end

--- Fills the effect data (state off, fade values, shader parameters such as pulsation and random UV offset), links the effect node under the link node with an optional offset and stores its lateral offset. Always returns true; overridden by WeedSpotSpray.
---@param effectData any
---@param effectNode any
---@param linkNode any
---@param effectNodeData any
function ExtendedSprayerEffects:addExtendedSprayerNozzleEffect(effectData, effectNode, linkNode, effectNodeData) end

--- Assigns the effect a section index from its lateral offset and the VariableWorkWidth left/right sections, or 0 if none matches. Does nothing without VariableWorkWidth sections.
---@param effectData any
function ExtendedSprayerEffects:initExtendedSprayerNozzleEffect(effectData) end

--- Updates each effect's active flag and amount scale via updateExtendedSprayerNozzleEffectState. With useFullSection, one active nozzle turns on the whole section. Starts fade in or out on changes and plays or stops the per-side spray sound.
---@param sprayerEffects any
---@param useFullSection any
---@param dt any
---@param isTurnedOn any
---@param lastSpeed any
function ExtendedSprayerEffects:updateExtendedSprayerNozzleEffectsState(sprayerEffects, useFullSection, dt, isTurnedOn, lastSpeed) end

--- Default per-nozzle rule returning isActive and amountScale. Inactive if its work-width section is off. With PWM, scale is the nozzle's own speed over the speed limit (max 1); otherwise it is off below speed 0.1. Overridden by ExtendedSprayer and WeedSpotSpray.
---@param effectData any
---@param dt any
---@param isTurnedOn any
---@param lastSpeed any
function ExtendedSprayerEffects:updateExtendedSprayerNozzleEffectState(effectData, dt, isTurnedOn, lastSpeed) end

--- Advances the fade of each effect that is turning on or off using dt and the 250 ms fade time, writes the fadeProgress shader parameter and, with PWM, sets the pulse pause from the amount scale.
---@param dt any
function ExtendedSprayerEffects:updateExtendedSprayerNozzleEffects(dt) end

--- Returns the number of active nozzle effects and the active fraction of all custom effects. Without custom effects it returns 1, 1.
function ExtendedSprayerEffects:getNumExtendedSprayerNozzleEffectsActive() end

--- Override. Returns false when custom nozzle effects exist so the standard spray effects stay hidden; otherwise defers to the parent.
---@param superFunc any
function ExtendedSprayerEffects:getAreEffectsVisible(superFunc) end
