# vehicles/specializations/AutoLoaderBales.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AutoLoaderBales.md)*

Source: `dataS/scripts/vehicles/specializations/AutoLoaderBales.lua` — FS25 1.25.1.0

✍ Specialization that automatically picks up bales entering a trigger and either mounts them on a spawn node or drops them there as physics objects. It targets tools such as straw blowers or mixer wagons, on platforms that enable automatic loading. Bale types are defined in XML by size (round or square) and optional fill types. Detection and mounting run on the server only, and mounted bales are saved with the vehicle.

- **AutoLoaderBales** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AutoLoaderBales.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specialization. |
| `AutoLoaderBales.initSpecialization()` | 24 | ✍ Registers the XML keys under `vehicle.autoLoaderBales` (pickup trigger, bale types with fill types, dimensions and spawn place settings) and the savegame bale paths. |
| `AutoLoaderBales.registerFunctions(vehicleType: any)` | 50 | ✍ Registers `autoLoaderBalesTriggerCallback`, `getAutoLoadBaleTypeFromBale`, `doAutoLoadBale` and `getIsBaleAutoLoadable`. |
| `AutoLoaderBales.registerOverwrittenFunctions(vehicleType: any)` | 59 | ✍ Empty: this specialization overrides no vehicle function. |
| `AutoLoaderBales.registerEventListeners(vehicleType: any)` | 64 | ✍ Subscribes to onLoad, onLoadFinished, onDelete and onUpdate. |
| `AutoLoaderBales:onLoad(savegame: table)` | 74 | ✍ Initialises the bale tables. On the server it adds the pickup trigger and reads each bale type; a type needs a spawn node and either diameter and width, or width, height and length, otherwise a warning is logged and it is skipped. |
| `AutoLoaderBales:onLoadFinished(savegame: table)` | 123 | ✍ When a non-reset savegame is given, recreates each saved bale, applies its attributes and loads it into a matching bale type; bales without a matching type are deleted. |
| `AutoLoaderBales:onDelete()` | 148 | ✍ Removes the trigger and delete listeners, unmounts every mounted bale and flags it as needing to be saved so it persists in the world. |
| `AutoLoaderBales:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 177 | ✍ Saves each mounted bale through the bale's own save routine under indexed `bale` keys. |
| `AutoLoaderBales:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 193 | ✍ Every update, after a short pickup delay (counted in updates, not time), picks the highest loadable bale in the trigger whose type still has room and loads it, then sets the delay to 10 updates. |
| `AutoLoaderBales.onDeleteAutoLoaderBalesObject(self: any, object: any)` | 227 | ✍ Delete listener for mounted bales: forgets the bale, decrements the mounted count and clears the loaded bale type once none remains. |
| `AutoLoaderBales.onBaleDeleted(self: any, object: any)` | 243 | ✍ Delete listener for bales inside the trigger: removes the bale from the in-trigger table. |
| `AutoLoaderBales:autoLoaderBalesTriggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 256 | ✍ Trigger callback that keeps a per-bale counter of shapes inside the trigger, only for bales the active farm may access and that allow pickup. Any non-enter event, including stay, decrements the counter. |
| `AutoLoaderBales:getAutoLoadBaleTypeFromBale(bale: any)` | 287 | ✍ Returns the first bale type compatible with the bale (same type as already loaded if any, allowed fill type, matching size), or nil if none fits. |
| `AutoLoaderBales:doAutoLoadBale(baleType: any, bale: any)` | 315 | ✍ If the type mounts bales, mounts the bale kinematically on the spawn node, offset by the number already mounted, and records it. Otherwise it teleports the bale to the spawn node and gives it the parent component's velocity. |
| `AutoLoaderBales:getIsBaleAutoLoadable(bale: any)` | 348 | ✍ Returns true if the bale is not currently mounted on any object. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `autoLoaderBalesTriggerCallback` | 51 |
| registerFunction | `getAutoLoadBaleTypeFromBale` | 52 |
| registerFunction | `doAutoLoadBale` | 53 |
| registerFunction | `getIsBaleAutoLoadable` | 54 |
| registerEventListener | `onLoad` | 65 |
| registerEventListener | `onLoadFinished` | 66 |
| registerEventListener | `onDelete` | 67 |
| registerEventListener | `onUpdate` | 68 |
