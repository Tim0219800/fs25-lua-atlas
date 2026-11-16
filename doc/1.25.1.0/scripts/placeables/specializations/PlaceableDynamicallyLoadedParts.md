# placeables/specializations/PlaceableDynamicallyLoadedParts.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableDynamicallyLoadedParts.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableDynamicallyLoadedParts.lua` — FS25 1.25.1.0

✍ Placeable specialization that loads extra parts from external i3d files at load time and links them into the placeable. Per part, the XML gives the file, source node, link node, position, rotation, a shader parameter and object changes; skinned meshes are validated so a mesh and its bones are always linked together, which avoids an engine crash.

- **PlaceableDynamicallyLoadedParts** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableDynamicallyLoadedParts.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specializations. |
| `PlaceableDynamicallyLoadedParts.registerFunctions(placeableType: any)` | 24 | ✍ Registers `onDynamicallyPartI3DLoaded`, the async load callback. |
| `PlaceableDynamicallyLoadedParts.registerEventListeners(placeableType: any)` | 30 | ✍ Subscribes to `onLoad`, `onDelete` and `onFinalizePlacement`; no `onFinalizePlacement` body appears in the dump (UNVERIFIED). |
| `PlaceableDynamicallyLoadedParts.registerXMLPaths(schema: any, basePath: any)` | 38 | ✍ Declares `dynamicallyLoadedParts.dynamicallyLoadedPart(?)` keys: `filename`, `node`, `linkNode`, `position`, `rotationNode`, `rotation`, `shaderParameterName`, `shaderParameter`, plus object-change keys. |
| `PlaceableDynamicallyLoadedParts:onLoad(savegame: table)` | 60 | ✍ For each part with a filename, creates a loading task and requests the shared i3d asynchronously (callback `onDynamicallyPartI3DLoaded`); warns about parts without a filename. |
| `PlaceableDynamicallyLoadedParts:onDynamicallyPartI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 88 | ✍ Async callback: finds the node, rejects the part if skinned shapes and their bones are not all included, then removes it from physics, applies position, rotation, shader parameter and object changes, links it under the link node and records it. Always finishes the loading task; returns true on success, false otherwise. |
| `PlaceableDynamicallyLoadedParts:onDelete()` | 237 | ✍ Releases the shared i3d load requests and deletes the nodes of all loaded parts. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onDynamicallyPartI3DLoaded` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onDelete` | 32 |
| registerEventListener | `onFinalizePlacement` | 33 |
