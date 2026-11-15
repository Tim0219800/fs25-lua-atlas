# internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayerEffects.lua

Source : `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayerEffects.lua` — FS25 1.25.1.0

- **ExtendedSprayerEffects** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ExtendedSprayerEffects.prerequisitesPresent(specializations: table) → boolean` | 24 |  |
| `ExtendedSprayerEffects.initSpecialization()` | 30 |  |
| `ExtendedSprayerEffects.registerFunctions(vehicleType: any)` | 45 |  |
| `ExtendedSprayerEffects.registerOverwrittenFunctions(vehicleType: any)` | 57 |  |
| `ExtendedSprayerEffects.registerEventListeners(vehicleType: any)` | 63 |  |
| `ExtendedSprayerEffects:onLoad(savegame: any)` | 73 |  |
| `ExtendedSprayerEffects:onPostLoad(savegame: any)` | 129 |  |
| `ExtendedSprayerEffects:onPreInitComponentPlacement(savegame: any)` | 144 |  |
| `ExtendedSprayerEffects:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 242 |  |
| `ExtendedSprayerEffects:onDelete()` | 271 |  |
| `ExtendedSprayerEffects:addExtendedSprayerNozzleEffects(linkData: any)` | 280 |  |
| `ExtendedSprayerEffects:addExtendedSprayerNozzleEffect(effectData: any, effectNode: any, linkNode: any, effectNodeData: any)` | 305 |  |
| `ExtendedSprayerEffects:initExtendedSprayerNozzleEffect(effectData: any)` | 340 |  |
| `ExtendedSprayerEffects:updateExtendedSprayerNozzleEffectsState(sprayerEffects: any, useFullSection: any, dt: any, isTurnedOn: any, lastSpeed: any)` | 377 |  |
| `ExtendedSprayerEffects:updateExtendedSprayerNozzleEffectState(effectData: any, dt: any, isTurnedOn: any, lastSpeed: any)` | 464 |  |
| `ExtendedSprayerEffects:updateExtendedSprayerNozzleEffects(dt: any)` | 491 |  |
| `ExtendedSprayerEffects:getNumExtendedSprayerNozzleEffectsActive()` | 524 |  |
| `ExtendedSprayerEffects:getAreEffectsVisible(superFunc: any)` | 542 |  |

## Spécialisation

| Type | Nom | Ligne |
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
