# placeables/specializations/PlaceableWeatherStation.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableWeatherStation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableWeatherStation.lua` — FS25 1.25.1.0

✍ Placeable specialization for a weather station building. When finalized it registers itself with the placeable system (`addWeatherStation`) and removes itself on delete; on clients it plays an optional idle sound under `placeable.weatherStation.sounds`. What the placeable system does with the registered stations is UNVERIFIED here.

- **PlaceableWeatherStation** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableWeatherStation.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specialization. |
| `PlaceableWeatherStation.registerEventListeners(placeableType: any)` | 24 | ✍ Subscribes to onLoad, onDelete and onFinalizePlacement. |
| `PlaceableWeatherStation.registerXMLPaths(schema: any, basePath: any)` | 32 | ✍ Declares the sound XML paths of the sample named `idle` under `.weatherStation.sounds`. |
| `PlaceableWeatherStation:onLoad(savegame: table)` | 43 | ✍ Client only: loads the `idle` sound sample from the XML in the environment audio group. |
| `PlaceableWeatherStation:onDelete()` | 54 | ✍ Removes this weather station from the placeable system and, on clients, deletes the sound sample. |
| `PlaceableWeatherStation:onFinalizePlacement()` | 65 | ✍ Adds this weather station to the placeable system and, on clients, starts the idle sound if loaded. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 25 |
| registerEventListener | `onDelete` | 26 |
| registerEventListener | `onFinalizePlacement` | 27 |
