# placeables/specializations/PlaceableNPCSpot.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableNPCSpot.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableNPCSpot.lua` — FS25 1.25.1.0

✍ Placeable specialization that lets a building define NPC spots (positions where non-player characters can stand). Spots are built from the XML on load and registered with g_npcManager once the placement is final. NPCSpot and the NPC manager are defined elsewhere.

- **PlaceableNPCSpot** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableNPCSpot.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specialization is required. |
| `PlaceableNPCSpot.registerEventListeners(placeableType: any)` | 24 | ✍ Subscribes to onLoad, onDelete and onFinalizePlacement. |
| `PlaceableNPCSpot.registerXMLPaths(schema: any, basePath: any)` | 32 | ✍ Declares the npcSpots.spot XML entries by delegating to NPCSpot.registerXMLPaths. |
| `PlaceableNPCSpot:onLoad(savegame: table)` | 41 | ✍ Creates one NPCSpot per npcSpots.spot entry with a unique id built from the placeable's unique id and the index; spots that fail to load are deleted. Stores the list only if it is not empty. |
| `PlaceableNPCSpot:onFinalizePlacement()` | 64 | ✍ Adds each spot to the NPC manager. |
| `PlaceableNPCSpot:onDelete()` | 75 | ✍ Removes each spot from the NPC manager. Note: the spots themselves are not deleted here. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 25 |
| registerEventListener | `onDelete` | 26 |
| registerEventListener | `onFinalizePlacement` | 27 |
