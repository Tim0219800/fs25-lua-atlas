# placeables/specializations/PlaceableVehicleBuyingStation.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableVehicleBuyingStation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableVehicleBuyingStation.lua` — FS25 1.25.1.0

✍ Placeable specialization for a vehicle shop point. It reads a player trigger, a list of store items with price and transport cost, spawn places and result messages, then opens a vehicle shop dialog through a VehicleBuyingStationActivatable when the player has the buy-vehicle permission. Configured under `placeable.vehicleBuyingStation`.

- **PlaceableVehicleBuyingStation** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableVehicleBuyingStation.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Always returns true: no prerequisite specialization. |
| `PlaceableVehicleBuyingStation:onLoad(savegame: table)` | 55 | ✍ Loads the trigger node, store items (price defaults to the store price, transport costs to 15000), spawn places, messages, title and texts, then creates the activatable. Returns false without spawn places. `vehicleShopCallback` and the trigger callback are not defined in this file (UNVERIFIED). |
| `PlaceableVehicleBuyingStation:onDelete()` | 141 | ✍ Removes the trigger node if it was created. |
