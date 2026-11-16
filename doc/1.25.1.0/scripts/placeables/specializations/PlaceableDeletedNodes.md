# placeables/specializations/PlaceableDeletedNodes.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableDeletedNodes.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableDeletedNodes.lua` — FS25 1.25.1.0

✍ Placeable specialization that deletes scene nodes listed in the XML (`deletedNodes.deletedNode`) once loading is finished, typically to remove parts of a shared i3d model. Nodes that are bones of a skinned mesh are skipped with a warning to avoid crashes.

- **PlaceableDeletedNodes** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableDeletedNodes.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specializations. |
| `PlaceableDeletedNodes.registerEventListeners(placeableType: any)` | 24 | ✍ Subscribes to `onLoadFinished`. |
| `PlaceableDeletedNodes.registerXMLPaths(schema: any, basePath: any)` | 30 | ✍ Declares `deletedNodes.deletedNode(?)#node`. |
| `PlaceableDeletedNodes:onLoadFinished(savegame: table)` | 39 | ✍ Collects all bones of skinned shapes, builds the list of nodes to delete (skipping bones of a skinned mesh with a warning, unless the node is the mesh itself), then deletes them in a second pass so index paths stay valid. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoadFinished` | 25 |
