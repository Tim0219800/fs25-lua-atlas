# placeables/specializations/PlaceablePlacement.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceablePlacement.md)*

Source: `dataS/scripts/placeables/specializations/PlaceablePlacement.lua` — FS25 1.25.1.0

✍ Placeable specialization with no prerequisites that holds the data used when a building is positioned by the player: test boxes for overlap checks, position and rotation snapping, optional terrain alignment and place/destroy sounds. It registers many functions (overlap mask, valid overlap node, water check, density-height overlap, area blocked) whose bodies are absent from the dump, so those are UNVERIFIED. XML keys are read under placeable.placement.

- **PlaceablePlacement** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceablePlacement.prerequisitesPresent(specializations: table) → boolean` | 23 | ✍ Always returns true, so this specialization can be added to any placeable type. |
| `PlaceablePlacement.registerFunctions(placeableType: any)` | 29 | ✍ Registers the placement functions on the placeable type, including several (getPlacementOverlapMask, isValidOverlapNode, getCanBePlacedInWater, getIsAreaBlocked, getHasOverlapWithDensityHeight, getIsOnOwnedFarmland) that are not defined in this file's dump. |
| `PlaceablePlacement.registerEventListeners(placeableType: any)` | 54 | ✍ Subscribes the specialization to the onLoad, onDelete and onPreFinalizePlacement events. |
| `PlaceablePlacement.registerXMLPaths(schema: any, basePath: any)` | 62 | ✍ Declares the XML schema for placeable.placement: the three terrain-alignment nodes, test areas (start/end nodes), random/manual rotation flags, alignToWorldY, position and rotation snap values, and the place, placeLayered and destroy sounds. |
| `PlaceablePlacement:onLoad(savegame: table)` | 88 | ✍ Loads the test areas, rotation flags, snap sizes (absolute values) and alignToWorldY from XML; falls back to world-Y alignment with a warning if the three position nodes are missing. On the client, when Platform.hasContruction is set, it also loads the 2D place sounds. |
| `PlaceablePlacement:onDelete()` | 136 | ✍ On the client, deletes the loaded placement sound samples. |
| `PlaceablePlacement:loadTestArea(xmlFile: any, key: any, area: any)` | 145 | ✍ Reads one test area from XML. The end node must be a direct child of the start node; computes box size, center relative to the root node and Y rotation, with a 5 cm downward safety offset. Returns false (with a warning) if invalid. |
| `PlaceablePlacement:getPlacementRotation(x: any, y: any, z: any)` | 195 | ✍ Takes the proposed rotation and snaps the Y component to the configured snap angle if one is set; returns x, y, z. |
| `PlaceablePlacement:getPlacementPosition(x: any, y: any, z: any)` | 207 | ✍ Snaps x and z to the configured grid size (floor, then plus the snap offset) when a snap size is set; y is untouched. Returns x, y, z. |
| `PlaceablePlacement:getPositionSnapSize()` | 222 | ✍ Returns the position snap grid size from the XML. |
| `PlaceablePlacement:getPositionSnapOffset()` | 228 | ✍ Returns the position snap offset from the XML. |
| `PlaceablePlacement:getRotationSnapAngle()` | 234 | ✍ Returns the rotation snap angle in radians from the XML. |
| `PlaceablePlacement:onPreFinalizePlacement()` | 240 | ✍ Server only, when alignToWorldY is false: drops the root onto the terrain height and rotates it so the three position nodes follow the terrain slope. Clients receive the resulting transform through sync. |
| `PlaceablePlacement:getIsAreaOwnedByFarm(sx: any, sz: any, wx: any, wz: any, hx: any, hz: any, farmId: any)` | 267 | ✍ Returns true only if the farm owns the land along all four edges of the parallelogram defined by the corner points (via g_farmlandManager). |
| `PlaceablePlacement:startPlacementCheck(x: any, y: any, z: any, rotY: any)` | 284 | ✍ Empty hook called with the proposed position and Y rotation; specializations or mods can override it. |
| `PlaceablePlacement:getHasOverlap(x: any, y: any, z: any, rotY: any, checkFunc: any)` | 343 | ✍ Tests every test area for a blocked area, then runs an overlapBox (box lowered to 0.5 m under the lowest terrain corner) against the placement mask and a density-height check. Returns true plus the hit node, or false, nil. |
| `PlaceablePlacement:getHasOverlapWithPlaces(places: any, x: any, y: any, z: any, rotY: any)` | 422 | ✍ Returns true if any corner of any test area, at the given position and rotation, lies inside one of the given placement places. |
| `PlaceablePlacement:getHasOverlapWithZones(zones: any, x: any, y: any, z: any, rotY: any)` | 450 | ✍ Returns true if a test-area corner is inside a restricted zone (with a water check unless the placeable may stand in water) or outside the placeable system boundary. |
| `PlaceablePlacement:getTestParallelogramAtWorldPosition(testArea: any, x: any, z: any, rotY: any)` | 498 | ✍ Computes the four world-space XZ corners of a test area for a placement position and Y rotation. Returns the start, width, height and opposite corners as x, z pairs. |
| `PlaceablePlacement:playPlaceSound()` | 531 | ✍ Client only: plays the place and placeLayered samples. |
| `PlaceablePlacement:playDestroySound(onlyIfNotPlaying: any)` | 541 | ✍ Client only: plays the destroy sample, optionally skipping it if it is already playing. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadTestArea` | 30 |
| registerFunction | `getIsAreaOwnedByFarm` | 31 |
| registerFunction | `getIsOnOwnedFarmland` | 32 |
| registerFunction | `startPlacementCheck` | 33 |
| registerFunction | `getPlacementRotation` | 34 |
| registerFunction | `getPlacementPosition` | 35 |
| registerFunction | `getPositionSnapSize` | 36 |
| registerFunction | `getPositionSnapOffset` | 37 |
| registerFunction | `getRotationSnapAngle` | 38 |
| registerFunction | `getPlacementOverlapMask` | 39 |
| registerFunction | `isValidOverlapNode` | 40 |
| registerFunction | `getHasOverlap` | 41 |
| registerFunction | `getHasOverlapWithPlaces` | 42 |
| registerFunction | `getCanBePlacedInWater` | 43 |
| registerFunction | `getHasOverlapWithZones` | 44 |
| registerFunction | `getTestParallelogramAtWorldPosition` | 45 |
| registerFunction | `playPlaceSound` | 46 |
| registerFunction | `playDestroySound` | 47 |
| registerFunction | `getIsAreaBlocked` | 48 |
| registerFunction | `getHasOverlapWithDensityHeight` | 49 |
| registerEventListener | `onLoad` | 55 |
| registerEventListener | `onDelete` | 56 |
| registerEventListener | `onPreFinalizePlacement` | 57 |
