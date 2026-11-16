---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayer.lua (generated stub, FS25 Lua Atlas)

--- Main vehicle specialization of Precision Farming for sprayers, spreaders and related tools (requires Sprayer and PrecisionFarmingStatistic). It adapts lime and fertilizer rates to the soil pH and nitrogen maps, in automatic or manual mode, optionally per nozzle with pulse width modulation. It overrides Sprayer functions, tracks usage statistics, shows the HUD/minimap extension, and syncs the settings over the network (ExtendedSprayerAmountEvent, ExtendedSprayerDefaultFruitTypeEvent). Several helper functions it calls (updateWorkAreaSubSectionData, processWorkAreaSubSectionData, registerFunctions, onLoad) are not in this dump (UNVERIFIED).
---@class ExtendedSprayer
ExtendedSprayer = {}

--- True only if the vehicle has both the Sprayer and PrecisionFarmingStatistic specializations.
---@param specializations table
---@return boolean
function ExtendedSprayer.prerequisitesPresent(specializations) end

--- Registers the 'pulseWidthModulation' configuration type and the XML keys pulseWidthModulationConfigurations#isAlwaysActive (default false) and speedDependentApplication#isSupported.
function ExtendedSprayer.initSpecialization() end

--- Restores the auto-mode flag and manual spray amount from the savegame, unless vehicles are being reset.
---@param savegame any
function ExtendedSprayer:onPostLoad(savegame) end

--- Deletes the HUD extension if one was created.
function ExtendedSprayer:onDelete() end

--- Saves the auto-mode flag (sprayAmountAutoMode) and the manual amount (sprayAmountManual).
---@param xmlFile any
---@param key any
---@param usedModNames any
function ExtendedSprayer:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side on join: reads the auto-mode flag and the manual amount (NitrogenMap.NUM_BITS bits) and applies them without resending events.
---@param streamId integer
---@param connection Connection
function ExtendedSprayer:onReadStream(streamId, connection) end

--- Server side on join: writes the auto-mode flag and the manual amount.
---@param streamId integer
---@param connection Connection
function ExtendedSprayer:onWriteStream(streamId, connection) end

--- Client side: when the server flagged it, reads pH and nitrogen actual/target values, the last touched soil type (3 bits) and the optional auto-mode fruit type.
---@param streamId any
---@param timestamp any
---@param connection any
function ExtendedSprayer:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: when the usage-values dirty flag is set, writes the same values that onReadUpdateStream reads, in the same order.
---@param streamId any
---@param connection any
---@param dirtyMask any
function ExtendedSprayer:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Server: on the first update reads the liming/fertilizing mode, then after the ground update distance samples soil data for sprayer, sowing machine and cultivator work areas (including Nexat DLC cultivator extensions). Client: adds the HUD extension when it should show.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ExtendedSprayer:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client: refreshes the spray effect state while turned on. Re-reads the liming/fertilizing mode and updates action events if it changed. For the active vehicle updates minimap state and mission-work state.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ExtendedSprayer:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Recomputes the maximum manual spray amount from the pH map (solid sprayer with lime) or the nitrogen map (otherwise), minus one.
---@param fillUnitIndex any
---@param fillTypeIndex any
---@param oldFillTypeIndex any
function ExtendedSprayer:onChangedFillType(fillUnitIndex, fillTypeIndex, oldFillTypeIndex) end

--- Client side: forces a spray effect state refresh.
function ExtendedSprayer:onTurnedOn() end

--- Client side: forces a spray effect state refresh.
function ExtendedSprayer:onTurnedOff() end

--- Flags attachStateChanged when the vehicle is attached or detached.
---@param state any
---@param data any
function ExtendedSprayer:onStateChange(state, data) end

--- Updates the crop sensor working width of every vehicle in the root vehicle's tree that has CropSensor, and on the client refreshes the spray effect state.
function ExtendedSprayer:onVariableWorkWidthSectionChanged() end

--- Client side: on the valid sprayer of the vehicle tree registers auto-mode toggle, spray amount change and (without a sowing machine) default fruit requirement actions, and refreshes their state and the minimap.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function ExtendedSprayer:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Returns the first vehicle in the root vehicle's tree that passes getIsVehicleValid, or nil.
---@param self any
function ExtendedSprayer.getValidSprayerToUse(self) end

--- True if the vehicle has ExtendedSprayer and WorkArea, at least one work area, and is not a manure barrel with an attached tool.
---@param vehicle any
function ExtendedSprayer.getIsVehicleValid(vehicle) end

--- Input callback: toggles the automatic spray amount mode.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function ExtendedSprayer.actionEventToggleAuto(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: changes the manual spray amount by one step in the direction of the input value.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function ExtendedSprayer.actionEventChangeSprayAmount(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: moves to the next default fruit requirement of the nitrogen map and applies it.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function ExtendedSprayer.actionEventChangeDefaultFruitRequirement(self, actionName, inputValue, callbackState, isAnalog) end

--- Enables the auto-toggle action when liming or fertilizing and sets its text by mode. Enables the amount action only in manual mode while liming or fertilizing.
---@param self any
function ExtendedSprayer.updateActionEventState(self) end

--- Enables the default fruit requirement action only when fertilizing in auto mode and no valid auto-mode fruit type is known.
---@param self any
function ExtendedSprayer.updateActionEventAutoModeDefault(self) end

--- Returns the vehicle and fill unit index to read the product from. If the sprayer is empty it searches its supported fill sources for one with content, or an empty compatible one. An AI-driven sprayer with zero capacity falls back to the first empty source.
---@param sprayer any
function ExtendedSprayer.getFillTypeSourceVehicle(sprayer) end

--- Returns isLiming, isFertilizing from the current fill type: lime gives true, false; a fertilizer type gives false, true; herbicide and others give false, false. With nothing loaded an AI worker counts as fertilizing.
function ExtendedSprayer:getCurrentSprayerMode() end

--- Returns 0; hook that other specializations such as ManureSensor override to shift the nitrogen level.
---@param lastChangeLevels any
function ExtendedSprayer:getCurrentNitrogenLevelOffset(lastChangeLevels) end

--- Returns 0; hook that other specializations such as ManureSensor override to shift the nitrogen used in the rate calculation.
---@param lastChangeLevels any
function ExtendedSprayer:getCurrentNitrogenUsageLevelOffset(lastChangeLevels) end

--- True if the vehicle has the WorkArea specialization with at least one work area.
function ExtendedSprayer:getUseExtendedSprayerHudExtension() end

--- Client only. False when a manure barrel has a tool, or (except slurry tankers and manure spreaders) when the source is empty without AI or the machine is neither liming nor fertilizing.
function ExtendedSprayer:getShowExtendedSprayerHudExtension() end

--- Always returns true. ManureSensor overrides it for manure sprayers.
function ExtendedSprayer:getIsUsingExactNitrogenAmount() end

--- Shows the pH minimap when liming or the nitrogen minimap when fertilizing, only on a field with product (or AI), and sets the mission-work state for nitrogen.
---@param self any
function ExtendedSprayer.updateMinimapActiveState(self) end

--- Returns whether spraying should happen. Always true for missions and manual mode. In auto mode it is false when pH or nitrogen already reaches the target (without PWM) and true when no soil data is uncovered yet.
function ExtendedSprayer:getIsPrecisionSprayingRequired() end

--- Starts or stops the sprayer's standard effects, animations and sounds, for the fill type and active spray type, when the combined state (precision spraying required, effects visible, turned on) changes or force is set.
---@param self any
---@param force any
function ExtendedSprayer.updateSprayerEffectState(self, force) end

--- Override. After the parent, splits a work area into sub-sections (two halves for central spreaders, with offset tables) and resets its sampled pH, nitrogen, crop and soil values. Forces a ground data refresh.
---@param superFunc integer
---@param workAreaIndex integer
---@param workArea any
function ExtendedSprayer:updateWorkAreaWidth(superFunc, workAreaIndex, workArea) end

--- Override. When turned on and liming or fertilizing, computes liters per update from the pH or nitrogen map using work width, speed and the wanted change (auto or manual, scaled by active nozzles). Mission work keeps the default rate, and AI gets a minimum usage. Note: the fertilizing branch reads pHMap.realisticSpreadOutputEnabled rather than a nitrogen map field.
---@param superFunc any
---@param fillType any
---@param dt any
function ExtendedSprayer:getSprayerUsage(superFunc, fillType, dt) end

--- Override. When liming or fertilizing with product left, updates the pH or nitrogen state of the area and sub-section data (server), runs the parent only if precision spraying is required, flags the nitrogen minimap for refresh and sets the spray ground type layer. Otherwise calls the parent.
---@param superFunc any
---@param workArea any
---@param dt any
function ExtendedSprayer:processSprayerArea(superFunc, workArea, dt) end

--- Override. After the parent, forces a ground data refresh so nitrogen requirements update without moving.
---@param superFunc any
function ExtendedSprayer:changeSeedIndex(superFunc, ...) end

--- Override. Always returns false, false: the double application rate is disabled because the amount can be set precisely.
---@param superFunc any
---@param sprayTypeIndex any
function ExtendedSprayer:getSprayerDoubledAmountActive(superFunc, sprayTypeIndex) end

--- Override with an empty body: the base sprayer effect update is suppressed. Effects are driven by updateSprayerEffectState instead.
---@param superFunc any
---@param force any
function ExtendedSprayer:updateSprayerEffects(superFunc, force) end

--- Override. After the parent, turns a nozzle off if PWM or spot spray is active, the machine limes or fertilizes, and there is no field ground 1 m in front of the nozzle.
---@param superFunc any
---@param effectData any
---@param dt any
---@param isTurnedOn any
---@param lastSpeed any
function ExtendedSprayer:updateExtendedSprayerNozzleEffectState(superFunc, effectData, dt, isTurnedOn, lastSpeed) end

--- Override. After the parent, replaces the AI spray level restrictions: forbids already treated ground for fertilizer or lime, and forbids fully grown crops (grass excluded) for herbicide, fertilizer or lime.
---@param superFunc any
---@param fillType any
function ExtendedSprayer:setSprayerAITerrainDetailProhibitedRange(superFunc, fillType) end

--- Server only: for under-root fertilizing machines, updates the nitrogen level of the area using the fertilizer spray type, then processes sub-section data.
---@param workArea any
---@param dt any
function ExtendedSprayer:preProcessExtUnderRootFertilizerArea(workArea, dt) end

--- Server only: when the sprayer is on and working, adds the actual and regular usage to the statistic matching the fill type (lime, mineral or liquid fertilizer, manure, liquid manure/digestate).
---@param dt any
---@param hasProcessed any
function ExtendedSprayer:onEndWorkAreaProcessing(dt, hasProcessed) end

--- Sets or toggles auto mode (nil toggles), forced to false when changing is not allowed, updates the action events and sends ExtendedSprayerAmountEvent.
---@param state any
---@param noEventSend any
function ExtendedSprayer:setSprayAmountAutoMode(state, noEventSend) end

--- Sets the manual amount clamped between the min and max limits, updates the action events and sends ExtendedSprayerAmountEvent.
---@param value any
---@param noEventSend any
function ExtendedSprayer:setSprayAmountManualValue(value, noEventSend) end

--- Stores the fruit type used by auto mode, looks up whether it needs the default mode in the nitrogen map and refreshes the action state. Does nothing if unchanged.
---@param index any
function ExtendedSprayer:setSprayAmountAutoFruitTypeIndex(index) end

--- Stores the default fruit requirement index, forces a ground data refresh and sends ExtendedSprayerDefaultFruitTypeEvent.
---@param index any
---@param noEventSend any
function ExtendedSprayer:setSprayAmountDefaultFruitRequirementIndex(index, noEventSend) end

--- Debug output: appends to values a description of the detected N, pH, crop, growth state and soil of each work area (sprayer, sowing machine, cultivator) and its sub-sections.
---@param values any
function ExtendedSprayer:updateDebugValues(values) end
