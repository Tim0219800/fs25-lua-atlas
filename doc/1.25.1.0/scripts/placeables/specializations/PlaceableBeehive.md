# placeables/specializations/PlaceableBeehive.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableBeehive.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableBeehive.lua` — FS25 1.25.1.0

✍ Placeable specialization for a beehive. It reads the action radius and daily honey production from the XML, registers itself with `g_currentMission.beehiveSystem`, plays optional effects and an idle sound while the system reports its FX as active, and produces honey that the system hands to a pallet spawner. It also counts owned beehives for an achievement when bought.

- **PlaceableBeehive** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableBeehive.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: this specialization has no prerequisite specializations. |
| `PlaceableBeehive.registerFunctions(placeableType: any)` | 24 | ✍ Registers the placeable functions `getBeehiveInfluenceFactor`, `updateBeehiveState` and `getHoneyAmountToSpawn`. |
| `PlaceableBeehive.registerOverwrittenFunctions(placeableType: any)` | 32 | ✍ Overrides the placeable `updateInfo` function to add beehive lines to the info HUD. |
| `PlaceableBeehive.registerEventListeners(placeableType: any)` | 38 | ✍ Subscribes to the `onLoad`, `onDelete`, `onFinalizePlacement` and `onBuy` events. |
| `PlaceableBeehive.registerXMLPaths(schema: any, basePath: any)` | 47 | ✍ Declares the XML keys `beehive#actionRadius` and `beehive#litersHoneyPerDay`, plus the effect and `idle` sound sample paths under `beehive`. |
| `PlaceableBeehive:onLoad(savegame: table)` | 61 | ✍ Reads the action radius (default 25) and honey per day (default 10, stored per hour), caches the squared radius and world position, and prepares info HUD entries. On clients it also loads the effects and the idle sound. |
| `PlaceableBeehive:onDelete()` | 96 | ✍ Deletes the effects and sound samples and removes this beehive from `beehiveSystem`. |
| `PlaceableBeehive:onFinalizePlacement()` | 106 | ✍ Records the current day time as the last honey spawn time, adds the beehive to `beehiveSystem` and refreshes its state. |
| `PlaceableBeehive:getBeehiveInfluenceFactor(wx: any, wz: any)` | 118 | ✍ Returns a factor between 0 and 1 for a world position (wx, wz): 0 outside the action radius, otherwise a value falling off with the squared distance (at the edge it stays about 0.15). |
| `PlaceableBeehive:updateBeehiveState()` | 131 | ✍ Copies the production flag from `beehiveSystem` and, when the FX flag changes, starts or stops the effects and idle sound on clients. |
| `PlaceableBeehive:getHoneyAmountToSpawn()` | 153 | ✍ Returns the liters of honey produced since the last call (elapsed hours capped at 1, scaled by `environment.timeAdjustment`) and resets the timer; returns 0 if production is inactive. |
| `PlaceableBeehive:updateInfo(superFunc: any, infoTable: any)` | 166 | ✍ Adds the range line to the info HUD and, for the local farm owner, shows either a warning that no pallet location exists or a note that honey appears at the pallet location. |
| `PlaceableBeehive:onBuy()` | 185 | ✍ Counts the beehives owned by the local farm and reports the number to the achievement manager (`NumBeehives`). Note: it compares against the local farm id, named `serverFarmId` in the code. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getBeehiveInfluenceFactor` | 25 |
| registerFunction | `updateBeehiveState` | 26 |
| registerFunction | `getHoneyAmountToSpawn` | 27 |
| registerOverwrittenFunction | `updateInfo` | 33 |
| registerEventListener | `onLoad` | 39 |
| registerEventListener | `onDelete` | 40 |
| registerEventListener | `onFinalizePlacement` | 41 |
| registerEventListener | `onBuy` | 42 |
