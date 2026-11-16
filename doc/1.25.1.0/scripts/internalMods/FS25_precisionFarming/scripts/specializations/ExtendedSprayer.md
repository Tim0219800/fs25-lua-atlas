# internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayer.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayer.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayer.lua` — FS25 1.25.1.0

✍ Main vehicle specialization of Precision Farming for sprayers, spreaders and related tools (requires Sprayer and PrecisionFarmingStatistic). It adapts lime and fertilizer rates to the soil pH and nitrogen maps, in automatic or manual mode, optionally per nozzle with pulse width modulation. It overrides Sprayer functions, tracks usage statistics, shows the HUD/minimap extension, and syncs the settings over the network (ExtendedSprayerAmountEvent, ExtendedSprayerDefaultFruitTypeEvent). Several helper functions it calls (updateWorkAreaSubSectionData, processWorkAreaSubSectionData, registerFunctions, onLoad) are not in this dump (UNVERIFIED).

- **ExtendedSprayer** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ExtendedSprayer.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ True only if the vehicle has both the Sprayer and PrecisionFarmingStatistic specializations. |
| `ExtendedSprayer.initSpecialization()` | 28 | ✍ Registers the 'pulseWidthModulation' configuration type and the XML keys pulseWidthModulationConfigurations#isAlwaysActive (default false) and speedDependentApplication#isSupported. |
| `ExtendedSprayer:onPostLoad(savegame: any)` | 203 | ✍ Restores the auto-mode flag and manual spray amount from the savegame, unless vehicles are being reset. |
| `ExtendedSprayer:onDelete()` | 214 | ✍ Deletes the HUD extension if one was created. |
| `ExtendedSprayer:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 223 | ✍ Saves the auto-mode flag (sprayAmountAutoMode) and the manual amount (sprayAmountManual). |
| `ExtendedSprayer:onReadStream(streamId: integer, connection: Connection)` | 233 | ✍ Client side on join: reads the auto-mode flag and the manual amount (NitrogenMap.NUM_BITS bits) and applies them without resending events. |
| `ExtendedSprayer:onWriteStream(streamId: integer, connection: Connection)` | 245 | ✍ Server side on join: writes the auto-mode flag and the manual amount. |
| `ExtendedSprayer:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 254 | ✍ Client side: when the server flagged it, reads pH and nitrogen actual/target values, the last touched soil type (3 bits) and the optional auto-mode fruit type. |
| `ExtendedSprayer:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 278 | ✍ Server side: when the usage-values dirty flag is set, writes the same values that onReadUpdateStream reads, in the same order. |
| `ExtendedSprayer:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 300 | ✍ Server: on the first update reads the liming/fertilizing mode, then after the ground update distance samples soil data for sprayer, sowing machine and cultivator work areas (including Nexat DLC cultivator extensions). Client: adds the HUD extension when it should show. |
| `ExtendedSprayer:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 370 | ✍ Client: refreshes the spray effect state while turned on. Re-reads the liming/fertilizing mode and updates action events if it changed. For the active vehicle updates minimap state and mission-work state. |
| `ExtendedSprayer:onChangedFillType(fillUnitIndex: any, fillTypeIndex: any, oldFillTypeIndex: any)` | 404 | ✍ Recomputes the maximum manual spray amount from the pH map (solid sprayer with lime) or the nitrogen map (otherwise), minus one. |
| `ExtendedSprayer:onTurnedOn()` | 417 | ✍ Client side: forces a spray effect state refresh. |
| `ExtendedSprayer:onTurnedOff()` | 425 | ✍ Client side: forces a spray effect state refresh. |
| `ExtendedSprayer:onStateChange(state: any, data: any)` | 433 | ✍ Flags attachStateChanged when the vehicle is attached or detached. |
| `ExtendedSprayer:onVariableWorkWidthSectionChanged()` | 443 | ✍ Updates the crop sensor working width of every vehicle in the root vehicle's tree that has CropSensor, and on the client refreshes the spray effect state. |
| `ExtendedSprayer:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 459 | ✍ Client side: on the valid sprayer of the vehicle tree registers auto-mode toggle, spray amount change and (without a sowing machine) default fruit requirement actions, and refreshes their state and the minimap. |
| `ExtendedSprayer.getValidSprayerToUse(self: any)` | 494 | ✍ Returns the first vehicle in the root vehicle's tree that passes getIsVehicleValid, or nil. |
| `ExtendedSprayer.getIsVehicleValid(vehicle: any)` | 508 | ✍ True if the vehicle has ExtendedSprayer and WorkArea, at least one work area, and is not a manure barrel with an attached tool. |
| `ExtendedSprayer.actionEventToggleAuto(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 530 | ✍ Input callback: toggles the automatic spray amount mode. |
| `ExtendedSprayer.actionEventChangeSprayAmount(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 536 | ✍ Input callback: changes the manual spray amount by one step in the direction of the input value. |
| `ExtendedSprayer.actionEventChangeDefaultFruitRequirement(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 543 | ✍ Input callback: moves to the next default fruit requirement of the nitrogen map and applies it. |
| `ExtendedSprayer.updateActionEventState(self: any)` | 550 | ✍ Enables the auto-toggle action when liming or fertilizing and sets its text by mode. Enables the amount action only in manual mode while liming or fertilizing. |
| `ExtendedSprayer.updateActionEventAutoModeDefault(self: any)` | 566 | ✍ Enables the default fruit requirement action only when fertilizing in auto mode and no valid auto-mode fruit type is known. |
| `ExtendedSprayer.getFillTypeSourceVehicle(sprayer: any)` | 576 | ✍ Returns the vehicle and fill unit index to read the product from. If the sprayer is empty it searches its supported fill sources for one with content, or an empty compatible one. An AI-driven sprayer with zero capacity falls back to the first empty source. |
| `ExtendedSprayer:getCurrentSprayerMode()` | 608 | ✍ Returns isLiming, isFertilizing from the current fill type: lime gives true, false; a fertilizer type gives false, true; herbicide and others give false, false. With nothing loaded an AI worker counts as fertilizing. |
| `ExtendedSprayer:getCurrentNitrogenLevelOffset(lastChangeLevels: any)` | 639 | ✍ Returns 0; hook that other specializations such as ManureSensor override to shift the nitrogen level. |
| `ExtendedSprayer:getCurrentNitrogenUsageLevelOffset(lastChangeLevels: any)` | 645 | ✍ Returns 0; hook that other specializations such as ManureSensor override to shift the nitrogen used in the rate calculation. |
| `ExtendedSprayer:getUseExtendedSprayerHudExtension()` | 651 | ✍ True if the vehicle has the WorkArea specialization with at least one work area. |
| `ExtendedSprayer:getShowExtendedSprayerHudExtension()` | 665 | ✍ Client only. False when a manure barrel has a tool, or (except slurry tankers and manure spreaders) when the source is empty without AI or the machine is neither liming nor fertilizing. |
| `ExtendedSprayer:getIsUsingExactNitrogenAmount()` | 694 | ✍ Always returns true. ManureSensor overrides it for manure sprayers. |
| `ExtendedSprayer.updateMinimapActiveState(self: any)` | 700 | ✍ Shows the pH minimap when liming or the nitrogen minimap when fertilizing, only on a field with product (or AI), and sets the mission-work state for nitrogen. |
| `ExtendedSprayer:getIsPrecisionSprayingRequired()` | 721 | ✍ Returns whether spraying should happen. Always true for missions and manual mode. In auto mode it is false when pH or nitrogen already reaches the target (without PWM) and true when no soil data is uncovered yet. |
| `ExtendedSprayer.updateSprayerEffectState(self: any, force: any)` | 758 | ✍ Starts or stops the sprayer's standard effects, animations and sounds, for the fill type and active spray type, when the combined state (precision spraying required, effects visible, turned on) changes or force is set. |
| `ExtendedSprayer:updateWorkAreaWidth(superFunc: integer, workAreaIndex: integer, workArea: any)` | 810 | ✍ Override. After the parent, splits a work area into sub-sections (two halves for central spreaders, with offset tables) and resets its sampled pH, nitrogen, crop and soil values. Forces a ground data refresh. |
| `ExtendedSprayer:getSprayerUsage(superFunc: any, fillType: any, dt: any)` | 1441 | ✍ Override. When turned on and liming or fertilizing, computes liters per update from the pH or nitrogen map using work width, speed and the wanted change (auto or manual, scaled by active nozzles). Mission work keeps the default rate, and AI gets a minimum usage. Note: the fertilizing branch reads pHMap.realisticSpreadOutputEnabled rather than a nitrogen map field. |
| `ExtendedSprayer:processSprayerArea(superFunc: any, workArea: any, dt: any)` | 1608 | ✍ Override. When liming or fertilizing with product left, updates the pH or nitrogen state of the area and sub-section data (server), runs the parent only if precision spraying is required, flags the nitrogen minimap for refresh and sets the spray ground type layer. Otherwise calls the parent. |
| `ExtendedSprayer:changeSeedIndex(superFunc: any, ...: any)` | 1684 | ✍ Override. After the parent, forces a ground data refresh so nitrogen requirements update without moving. |
| `ExtendedSprayer:getSprayerDoubledAmountActive(superFunc: any, sprayTypeIndex: any)` | 1694 | ✍ Override. Always returns false, false: the double application rate is disabled because the amount can be set precisely. |
| `ExtendedSprayer:updateSprayerEffects(superFunc: any, force: any)` | 1701 | ✍ Override with an empty body: the base sprayer effect update is suppressed. Effects are driven by updateSprayerEffectState instead. |
| `ExtendedSprayer:updateExtendedSprayerNozzleEffectState(superFunc: any, effectData: any, dt: any, isTurnedOn: any, lastSpeed: any)` | 1706 | ✍ Override. After the parent, turns a nozzle off if PWM or spot spray is active, the machine limes or fertilizes, and there is no field ground 1 m in front of the nozzle. |
| `ExtendedSprayer:setSprayerAITerrainDetailProhibitedRange(superFunc: any, fillType: any)` | 1728 | ✍ Override. After the parent, replaces the AI spray level restrictions: forbids already treated ground for fertilizer or lime, and forbids fully grown crops (grass excluded) for herbicide, fertilizer or lime. |
| `ExtendedSprayer:preProcessExtUnderRootFertilizerArea(workArea: any, dt: any)` | 1764 | ✍ Server only: for under-root fertilizing machines, updates the nitrogen level of the area using the fertilizer spray type, then processes sub-section data. |
| `ExtendedSprayer:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 1785 | ✍ Server only: when the sprayer is on and working, adds the actual and regular usage to the statistic matching the fill type (lime, mineral or liquid fertilizer, manure, liquid manure/digestate). |
| `ExtendedSprayer:setSprayAmountAutoMode(state: any, noEventSend: any)` | 1823 | ✍ Sets or toggles auto mode (nil toggles), forced to false when changing is not allowed, updates the action events and sends ExtendedSprayerAmountEvent. |
| `ExtendedSprayer:setSprayAmountManualValue(value: any, noEventSend: any)` | 1842 | ✍ Sets the manual amount clamped between the min and max limits, updates the action events and sends ExtendedSprayerAmountEvent. |
| `ExtendedSprayer:setSprayAmountAutoFruitTypeIndex(index: any)` | 1853 | ✍ Stores the fruit type used by auto mode, looks up whether it needs the default mode in the nitrogen map and refreshes the action state. Does nothing if unchanged. |
| `ExtendedSprayer:setSprayAmountDefaultFruitRequirementIndex(index: any, noEventSend: any)` | 1865 | ✍ Stores the default fruit requirement index, forces a ground data refresh and sends ExtendedSprayerDefaultFruitTypeEvent. |
| `ExtendedSprayer:updateDebugValues(values: any)` | 1876 | ✍ Debug output: appends to values a description of the detected N, pH, crop, growth state and soil of each work area (sprayer, sowing machine, cultivator) and its sub-sections. |
