# placeables/specializations/PlaceableChargingStation.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableChargingStation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableChargingStation.lua` — FS25 1.25.1.0

✍ Placeable specialization for an electric vehicle charging station, built on top of `PlaceableBuyingStation` (required). It reuses the buying station's load trigger to detect vehicles being charged with ELECTRICCHARGE, drives an indicator node and light (colour, blinking) and shows the remaining charge time to nearby players. The dump contains no `registerEventListeners` for it, so how `onLoad` and `onUpdate` are wired is UNVERIFIED.

- **PlaceableChargingStation** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableChargingStation.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Returns true only if the `PlaceableBuyingStation` specialization is present on the placeable type. |
| `PlaceableChargingStation.registerFunctions(placeableType: any)` | 24 | ✍ Registers `getIsCharging` and `getChargeState`. |
| `PlaceableChargingStation:onLoad(savegame: table)` | 58 | ✍ Reads the charge indicator settings (intensity 20, blink speed 5, colours, interaction radius 5 by default), initializes the indicator shader and light, takes the buying station's load trigger and loads the fill sound, which becomes the trigger's load sound if it has none. |
| `PlaceableChargingStation:getIsCharging()` | 102 | ✍ Returns whether the load trigger is currently loading; false when there is no load trigger. |
| `PlaceableChargingStation:getChargeState()` | 113 | ✍ Returns fill level and capacity of the ELECTRICCHARGE fill unit of the first vehicle in the load trigger; returns 0, 1 when there is none. |
| `PlaceableChargingStation:onUpdate(dt: number)` | 134 | ✍ Client-style update: colours the indicator (full colour above 95 percent charge), sets blinking while loading and sets the light alpha. While loading, shows the remaining time and percentage as extra HUD text for a nearby player or one seated in the charging vehicle. Keeps itself active while a vehicle is present. Note: it calls `localPlayer:getCurrentVehicle()` in a branch reached when `g_localPlayer` is nil. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getIsCharging` | 25 |
| registerFunction | `getChargeState` | 26 |
