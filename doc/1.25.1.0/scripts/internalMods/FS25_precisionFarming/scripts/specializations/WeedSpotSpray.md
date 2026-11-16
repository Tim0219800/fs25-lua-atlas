# internalMods/FS25_precisionFarming/scripts/specializations/WeedSpotSpray.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/specializations/WeedSpotSpray.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/WeedSpotSpray.lua` — FS25 1.25.1.0

✍ Vehicle specialization of Precision Farming for spot spraying herbicide and liquid fertilizer (requires Sprayer and PrecisionFarmingStatistic). It adds a 'weedSpotSpray' configuration, mounts weed sensor models, and overrides sprayer nozzle effect state so that each nozzle only sprays when the density maps under it call for it. It also reports herbicide use to the farmland statistics.

- **WeedSpotSpray** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `WeedSpotSpray.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ True only if the vehicle has both the Sprayer and PrecisionFarmingStatistic specializations. |
| `WeedSpotSpray.initSpecialization()` | 28 | ✍ Registers the 'weedSpotSpray' vehicle configuration type with its localized name. |
| `WeedSpotSpray.registerFunctions(vehicleType: any)` | 34 | ✍ Adds the vehicle functions getIsSpotSprayEnabled and addWeedSpotSpraySensorNodes. |
| `WeedSpotSpray.registerOverwrittenFunctions(vehicleType: any)` | 41 | ✍ Overrides getSprayerUsage, addExtendedSprayerNozzleEffect, updateExtendedSprayerNozzleEffectState and loadWorkAreaFromXML. The nozzle functions come from ExtendedSprayerEffects (not in this file). |
| `WeedSpotSpray.registerEventListeners(vehicleType: any)` | 50 | ✍ Subscribes to onPreLoad, onLoad and onEndWorkAreaProcessing. |
| `WeedSpotSpray:onPreLoad(savegame: any)` | 58 | ✍ Sets isEnabled to true when the chosen 'weedSpotSpray' configuration index is above 1. |
| `WeedSpotSpray:onLoad(savegame: any)` | 66 | ✍ Builds the set of weed states that herbicide can treat (from weedSystem replacements, ignoring preventive ones), loads sensor nodes from g_precisionFarming when enabled, and caches the weed, ground type and spray type density map ids and channels. |
| `WeedSpotSpray:onEndWorkAreaProcessing(dt: any)` | 98 | ✍ Server only, above speed 0.5: when herbicide is being sprayed and a spray vehicle or AI is active, adds the usage to 'usedHerbicide' and the unscaled usage to 'usedHerbicideRegular'. |
| `WeedSpotSpray:getIsSpotSprayEnabled()` | 121 | ✍ Returns whether the spot spray configuration is enabled on this vehicle. |
| `WeedSpotSpray:addWeedSpotSpraySensorNodes(linkData: any)` | 127 | ✍ For each sensor entry found by i3d mapping name, clones a sensor model, links it with the configured translation and rotation, and scales the bracket child when bracketSize differs from 1. |
| `WeedSpotSpray:getSprayerUsage(superFunc: any, fillType: any, dt: any)` | 153 | ✍ Override. Stores the parent's usage as the regular (full-rate) usage, then, if nozzle effects exist, scales the returned usage by the active-nozzle alpha so only active nozzles consume product. |
| `WeedSpotSpray:addExtendedSprayerNozzleEffect(superFunc: any, effectData: any, effectNode: any, linkNode: any, linkNodeData: any)` | 169 | ✍ Override that only calls the parent and returns its result; adds no behaviour. |
| `WeedSpotSpray:updateExtendedSprayerNozzleEffectState(superFunc: any, effectData: any, dt: any, isTurnedOn: any, lastSpeed: any)` | 179 | ✍ Override. Turns a nozzle off when spot spray is on and the vehicle reverses or is slower than 0.25. For herbicide, samples the weed map (enabled) or checks for bare ground (not enabled). For liquid fertilizer, it also skips ground already fertilized. |
| `WeedSpotSpray:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 241 | ✍ Override. After the parent loads a work area, sets disableBackwards when spot spray is enabled, because the sensors face forward. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getIsSpotSprayEnabled` | 35 |
| registerFunction | `addWeedSpotSpraySensorNodes` | 36 |
| registerOverwrittenFunction | `getSprayerUsage` | 42 |
| registerOverwrittenFunction | `addExtendedSprayerNozzleEffect` | 43 |
| registerOverwrittenFunction | `updateExtendedSprayerNozzleEffectState` | 44 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 45 |
| registerEventListener | `onPreLoad` | 51 |
| registerEventListener | `onLoad` | 52 |
| registerEventListener | `onEndWorkAreaProcessing` | 53 |
