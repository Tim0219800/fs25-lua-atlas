# placeables/specializations/activatables/VehicleBuyingStationActivatable.lua

*[Version française](../../../../fr/scripts/placeables/specializations/activatables/VehicleBuyingStationActivatable.md)*

Source: `dataS/scripts/placeables/specializations/activatables/VehicleBuyingStationActivatable.lua` — FS25 1.25.1.0

✍ Activatable object for a vehicle buying station placeable. It takes a prompt text and a callback, is available to players who can access the placeable, and running it simply calls the callback (the vehicle shop dialog is opened there).

- **VehicleBuyingStationActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleBuyingStationActivatable.new(placeable: any, callbackFunc: any, text: any)` | 15 | ✍ Creates the activatable for a placeable with a callback function and prompt text. |
| `VehicleBuyingStationActivatable:getIsActivatable()` | 27 | ✍ Returns whether the local player may access the placeable according to the access handler. |
| `VehicleBuyingStationActivatable:run()` | 33 | ✍ Calls the stored callback with no arguments. |
