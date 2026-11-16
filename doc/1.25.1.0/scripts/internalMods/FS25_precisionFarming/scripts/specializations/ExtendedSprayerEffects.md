# internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayerEffects.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayerEffects.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayerEffects.lua` — FS25 1.25.1.0

✍ Vehicle specialization of Precision Farming that replaces a sprayer's standard spray effect with one shader-plane effect per nozzle (requires Sprayer and ExtendedSprayer). Nozzles come from the vehicle XML, a configuration or g_precisionFarming link data. ExtendedSprayer and WeedSpotSpray override the per-nozzle state function. It optionally runs pulse width modulation, fades effects in and out and drives per-side spray sounds.

- **ExtendedSprayerEffects** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ExtendedSprayerEffects.prerequisitesPresent(specializations: table) → boolean` | 24 | ✍ True only if the vehicle has both the Sprayer and ExtendedSprayer specializations. |
| `ExtendedSprayerEffects.initSpecialization()` | 30 | ✍ Registers the XML keys vehicle.sprayer.nozzles(?) (#foldingConfigurationIndex, default 1) and its nozzle(?) children (#node, #translation, #rotation). |
| `ExtendedSprayerEffects.registerFunctions(vehicleType: any)` | 45 | ✍ Adds the vehicle functions for adding, initialising, updating and counting nozzle effects (addExtendedSprayerNozzleEffect(s), initExtendedSprayerNozzleEffect, updateExtendedSprayerNozzleEffect(s)(State), getNumExtendedSprayerNozzleEffectsActive). |
| `ExtendedSprayerEffects.registerOverwrittenFunctions(vehicleType: any)` | 57 | ✍ Overrides getAreEffectsVisible. |
| `ExtendedSprayerEffects.registerEventListeners(vehicleType: any)` | 63 | ✍ Subscribes to onLoad, onPostLoad, onPreInitComponentPlacement, onUpdate and onDelete. |
| `ExtendedSprayerEffects:onLoad(savegame: any)` | 73 | ✍ Detects pulse width modulation (configuration above 1) and individual nozzle control (PWM or spot spray), then adds nozzles from g_precisionFarming link data and from the XML, keeping only those matching the selected folding configuration. Note: nozzleNodesToDelete is a node-keyed table walked with 1..#, so the cleanup loop never deletes anything. |
| `ExtendedSprayerEffects:onPostLoad(savegame: any)` | 129 | ✍ Initialises every nozzle effect (finds its work-width section) and groups the effects by section index. |
| `ExtendedSprayerEffects:onPreInitComponentPlacement(savegame: any)` | 144 | ✍ Without custom effects, removes the onUpdate listener. With them, disables VariableWorkWidth drawing and action events, deletes the standard spray sounds, creates a center node per section and left/right sound nodes averaged from the nozzles, and assigns cloned spray samples per side. |
| `ExtendedSprayerEffects:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 242 | ✍ Each update refreshes nozzle states, per nozzle with individual control or per section otherwise. When a state changed it runs updateExtendedSprayerNozzleEffects and keeps the vehicle active. |
| `ExtendedSprayerEffects:onDelete()` | 271 | ✍ Deletes the left and right spray sound samples. |
| `ExtendedSprayerEffects:addExtendedSprayerNozzleEffects(linkData: any)` | 280 | ✍ Adds a nozzle effect for each entry of linkData.effectNodes whose node name exists in the i3d mappings, cloning an effect node from g_precisionFarming. |
| `ExtendedSprayerEffects:addExtendedSprayerNozzleEffect(effectData: any, effectNode: any, linkNode: any, effectNodeData: any)` | 305 | ✍ Fills the effect data (state off, fade values, shader parameters such as pulsation and random UV offset), links the effect node under the link node with an optional offset and stores its lateral offset. Always returns true; overridden by WeedSpotSpray. |
| `ExtendedSprayerEffects:initExtendedSprayerNozzleEffect(effectData: any)` | 340 | ✍ Assigns the effect a section index from its lateral offset and the VariableWorkWidth left/right sections, or 0 if none matches. Does nothing without VariableWorkWidth sections. |
| `ExtendedSprayerEffects:updateExtendedSprayerNozzleEffectsState(sprayerEffects: any, useFullSection: any, dt: any, isTurnedOn: any, lastSpeed: any)` | 377 | ✍ Updates each effect's active flag and amount scale via updateExtendedSprayerNozzleEffectState. With useFullSection, one active nozzle turns on the whole section. Starts fade in or out on changes and plays or stops the per-side spray sound. |
| `ExtendedSprayerEffects:updateExtendedSprayerNozzleEffectState(effectData: any, dt: any, isTurnedOn: any, lastSpeed: any)` | 464 | ✍ Default per-nozzle rule returning isActive and amountScale. Inactive if its work-width section is off. With PWM, scale is the nozzle's own speed over the speed limit (max 1); otherwise it is off below speed 0.1. Overridden by ExtendedSprayer and WeedSpotSpray. |
| `ExtendedSprayerEffects:updateExtendedSprayerNozzleEffects(dt: any)` | 491 | ✍ Advances the fade of each effect that is turning on or off using dt and the 250 ms fade time, writes the fadeProgress shader parameter and, with PWM, sets the pulse pause from the amount scale. |
| `ExtendedSprayerEffects:getNumExtendedSprayerNozzleEffectsActive()` | 524 | ✍ Returns the number of active nozzle effects and the active fraction of all custom effects. Without custom effects it returns 1, 1. |
| `ExtendedSprayerEffects:getAreEffectsVisible(superFunc: any)` | 542 | ✍ Override. Returns false when custom nozzle effects exist so the standard spray effects stay hidden; otherwise defers to the parent. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `addExtendedSprayerNozzleEffects` | 46 |
| registerFunction | `addExtendedSprayerNozzleEffect` | 47 |
| registerFunction | `initExtendedSprayerNozzleEffect` | 48 |
| registerFunction | `updateExtendedSprayerNozzleEffectsState` | 49 |
| registerFunction | `updateExtendedSprayerNozzleEffectState` | 50 |
| registerFunction | `updateExtendedSprayerNozzleEffects` | 51 |
| registerFunction | `getNumExtendedSprayerNozzleEffectsActive` | 52 |
| registerOverwrittenFunction | `getAreEffectsVisible` | 58 |
| registerEventListener | `onLoad` | 64 |
| registerEventListener | `onPostLoad` | 65 |
| registerEventListener | `onPreInitComponentPlacement` | 66 |
| registerEventListener | `onUpdate` | 67 |
| registerEventListener | `onDelete` | 68 |
