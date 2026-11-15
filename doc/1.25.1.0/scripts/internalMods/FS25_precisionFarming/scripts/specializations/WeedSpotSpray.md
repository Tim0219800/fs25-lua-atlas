# internalMods/FS25_precisionFarming/scripts/specializations/WeedSpotSpray.lua

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/WeedSpotSpray.lua` — FS25 1.25.1.0

- **WeedSpotSpray** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `WeedSpotSpray.prerequisitesPresent(specializations: table) → boolean` | 22 |  |
| `WeedSpotSpray.initSpecialization()` | 28 |  |
| `WeedSpotSpray.registerFunctions(vehicleType: any)` | 34 |  |
| `WeedSpotSpray.registerOverwrittenFunctions(vehicleType: any)` | 41 |  |
| `WeedSpotSpray.registerEventListeners(vehicleType: any)` | 50 |  |
| `WeedSpotSpray:onPreLoad(savegame: any)` | 58 |  |
| `WeedSpotSpray:onLoad(savegame: any)` | 66 |  |
| `WeedSpotSpray:onEndWorkAreaProcessing(dt: any)` | 98 |  |
| `WeedSpotSpray:getIsSpotSprayEnabled()` | 121 |  |
| `WeedSpotSpray:addWeedSpotSpraySensorNodes(linkData: any)` | 127 |  |
| `WeedSpotSpray:getSprayerUsage(superFunc: any, fillType: any, dt: any)` | 153 |  |
| `WeedSpotSpray:addExtendedSprayerNozzleEffect(superFunc: any, effectData: any, effectNode: any, linkNode: any, linkNodeData: any)` | 169 |  |
| `WeedSpotSpray:updateExtendedSprayerNozzleEffectState(superFunc: any, effectData: any, dt: any, isTurnedOn: any, lastSpeed: any)` | 179 |  |
| `WeedSpotSpray:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 241 |  |

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
