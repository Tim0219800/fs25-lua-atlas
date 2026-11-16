# placeables/specializations/PlaceablePointOfInterest.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceablePointOfInterest.md)*

Source: `dataS/scripts/placeables/specializations/PlaceablePointOfInterest.lua` — FS25 1.25.1.0

✍ Placeable specialization with no prerequisites that attaches one or more PointOfInterest objects to a placeable. Each point is read from placeable.pointOfInterest.point, instantiated from the class named in the XML (default PointOfInterest) and deleted with the placeable. The farm owner is forwarded to every point. What a PointOfInterest does is defined in another class, not in this file.

- **PlaceablePointOfInterest** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceablePointOfInterest.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true; no other specialization is required. |
| `PlaceablePointOfInterest.registerXMLPaths(schema: any, basePath: any)` | 25 | ✍ Declares the XML schema for placeable.pointOfInterest.point(?): a class attribute plus whatever PointOfInterest.registerXMLPaths adds. |
| `PlaceablePointOfInterest.registerOverwrittenFunctions(placeableType: any)` | 34 | ✍ Overrides the placeable's setOwnerFarmId. |
| `PlaceablePointOfInterest.registerEventListeners(placeableType: any)` | 40 | ✍ Subscribes the specialization to onLoad and onDelete. |
| `PlaceablePointOfInterest:onLoad(savegame: table)` | 48 | ✍ Creates a point object for each XML entry using ClassUtil.getClassObject on the class name, then calls its load. Unknown classes log an error; points whose load fails are deleted and skipped. |
| `PlaceablePointOfInterest:onDelete()` | 71 | ✍ Deletes every point of interest held by the placeable. |
| `PlaceablePointOfInterest:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 83 | ✍ Calls the parent setOwnerFarmId, then sets the same farm id on each point of interest. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `setOwnerFarmId` | 35 |
| registerEventListener | `onLoad` | 41 |
| registerEventListener | `onDelete` | 42 |
