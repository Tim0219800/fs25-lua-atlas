# placeables/specializations/PlaceableHotspots.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableHotspots.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableHotspots.lua` — FS25 1.25.1.0

✍ Placeable specialization that attaches one or more map hotspots (PlaceableHotspot) to a building, with type, name, world position and optional teleport position. Hotspots are added to the mission on post-finalize and refreshed through updateHotspots when ownership changes. It has no prerequisites.

- **PlaceableHotspots** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableHotspots.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ No prerequisite: always returns true. |
| `PlaceableHotspots.registerFunctions(placeableType: any)` | 24 | ✍ Registers getHotspot, updateHotspots and setHotspotVisible. The last two have no body in the SDK dump (UNVERIFIED). |
| `PlaceableHotspots.registerEventListeners(placeableType: any)` | 32 | ✍ Subscribes to load, delete, post-finalize-placement and owner-changed events. |
| `PlaceableHotspots.registerXMLPaths(schema: any, basePath: any)` | 41 | ✍ Declares hotspot entries: linkNode, teleportNode, type (default UNLOADING), worldPosition, teleportWorldPosition and text. |
| `PlaceableHotspots:onLoad(savegame: table)` | 55 | ✍ Creates one PlaceableHotspot per XML entry. Unknown types fall back to UNLOADING with a warning. Position comes from the link node (or placeable root) unless worldPosition is given; an explicit teleport position is raised to at least the terrain height. Translates the text with the mod's i18n. |
| `PlaceableHotspots:onDelete()` | 108 | ✍ Unsubscribes from the message center, removes each hotspot from the mission map and deletes it. |
| `PlaceableHotspots:onPostFinalizePlacement()` | 122 | ✍ Adds every hotspot to the mission map and calls updateHotspots. |
| `PlaceableHotspots:onOwnerChanged()` | 135 | ✍ Calls updateHotspots after an owner change. |
| `PlaceableHotspots:getHotspot(index: any)` | 159 | ✍ Returns the hotspot at the given 1-based index, or the first one when no index is given. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getHotspot` | 25 |
| registerFunction | `updateHotspots` | 26 |
| registerFunction | `setHotspotVisible` | 27 |
| registerEventListener | `onLoad` | 33 |
| registerEventListener | `onDelete` | 34 |
| registerEventListener | `onPostFinalizePlacement` | 35 |
| registerEventListener | `onOwnerChanged` | 36 |
