# vehicles/specializations/FruitExtraObjects.lua

*[Version française](../../../fr/scripts/vehicles/specializations/FruitExtraObjects.md)*

Source: `dataS/scripts/vehicles/specializations/FruitExtraObjects.lua` — FS25 1.25.1.0

✍ Specialization for cutters and mowers that show extra objects or play an animation depending on the fruit or fill type being harvested (for example a header kit for a given crop). Objects are defined under vehicle.cutter or vehicle.mower, one may be the default, and visibility can depend on attachment or mounting on a header trailer. Visual, client side only. The type is supplied by getFruitExtraObjectTypeData, which returns nothing here and must be provided elsewhere.


## Functions

| Function | Line | Description |
|---|---|---|
| `FruitExtraObjects.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specialization. |
| `FruitExtraObjects.initSpecialization()` | 24 | ✍ Declares the fruitExtraObjects XML nodes under vehicle.cutter and vehicle.mower, and the savegame keys lastFruitType and lastFillType. |
| `FruitExtraObjects.registerXMLPaths(schema: any, basePath: any)` | 40 | ✍ Registers the attributes of a fruitExtraObjects block under the given base path: per-object node, animation, speed, isDefault, fruitType, fillType, plus hideOnDetach and hideOnMount. |
| `FruitExtraObjects.registerFunctions(vehicleType: table)` | 54 | ✍ Registers loadFruitExtraObjectFromXML, getFruitExtraObjectTypeData and updateFruitExtraObjects on the vehicle type. |
| `FruitExtraObjects.registerOverwrittenFunctions(vehicleType: table)` | 63 | ✍ Empty: this specialization overrides no function. |
| `FruitExtraObjects.registerEventListeners(vehicleType: table)` | 69 | ✍ Subscribes to post load, dynamic mount type change, pre attach and post detach events. |
| `FruitExtraObjects:onPostLoad(savegame: table)` | 79 | ✍ Client only: loads the extra objects from the cutter and mower XML blocks (one default object allowed), reads hideOnDetach/hideOnMount, restores the last fruit and fill type from the savegame and refreshes. Removes its listeners on servers or when no object exists (it names onLoadFinished, which is not registered here). |
| `FruitExtraObjects:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 144 | ✍ Writes the last fruit type and last fill type names to the savegame when set. |
| `FruitExtraObjects:onDynamicMountTypeChanged(dynamicMountType: any, mountObject: any)` | 157 | ✍ Calls updateFruitExtraObjects when the dynamic mount state changes. |
| `FruitExtraObjects:onPreAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 166 | ✍ Calls updateFruitExtraObjects just before the vehicle is attached. |
| `FruitExtraObjects:onPostDetach(attacherVehicle: table, implement: table)` | 174 | ✍ Calls updateFruitExtraObjects after the vehicle has been detached. |
| `FruitExtraObjects:loadFruitExtraObjectFromXML(xmlFile: any, key: any, extraObject: any)` | 180 | ✍ Loads one extra object (node hidden at load, animation, speed, isDefault, fruit type, fill type). Returns false with a warning if it has neither a type nor isDefault, or both. |
| `FruitExtraObjects:getFruitExtraObjectTypeData()` | 225 | ✍ Default hook returning nil, nil (fruit type, fill type); meant to be overridden by the specialization that knows the current crop, such as a cutter or mower. |
| `FruitExtraObjects:updateFruitExtraObjects()` | 231 | ✍ Picks the extra object matching the current (or last known) fruit or fill type, falling back to the default one, hides it when detached or mounted if configured, and swaps visibility and animations accordingly. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadFruitExtraObjectFromXML` | 55 |
| registerFunction | `getFruitExtraObjectTypeData` | 56 |
| registerFunction | `updateFruitExtraObjects` | 57 |
| registerEventListener | `onPostLoad` | 70 |
| registerEventListener | `onDynamicMountTypeChanged` | 71 |
| registerEventListener | `onPreAttach` | 72 |
| registerEventListener | `onPostDetach` | 73 |
