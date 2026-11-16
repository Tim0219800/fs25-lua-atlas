# animals/husbandry/placeables/PlaceableHusbandryFence.lua

*[Version française](../../../../fr/scripts/animals/husbandry/placeables/PlaceableHusbandryFence.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryFence.lua` — FS25 1.25.1.0

✍ Placeable specialization giving a husbandry a fence built from a separate fence XML and i3D file (`Fence` class). Sections in `placeable.husbandry.fence` define default segments from node positions, optionally one customizable last section the player can place by hand, and extra navigation contour nodes. It validates placement (collisions, unowned land) during preview, syncs the fence in network streams, and overrides navigation mesh creation (the body of several registered methods is not in the SDK dump).

- **PlaceableHusbandryFence** (l.16)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableHusbandryFence.prerequisitesPresent(specializations: table) → boolean` | 26 | ✍ Always returns true: this specialization has no prerequisites. |
| `PlaceableHusbandryFence.registerFunctions(placeableType: any)` | 36 | ✍ Registers the fence methods (customization, default fence, contour positions, segment deletion rules, loading callbacks) on the placeable type. Several registered methods have no body in the SDK dump. |
| `PlaceableHusbandryFence.registerOverwrittenFunctions(placeableType: any)` | 59 | ✍ Registers overrides of `setPreviewPosition`, `getCanBePlacedAt` and `createNavigationMesh`. |
| `PlaceableHusbandryFence.registerEventListeners(placeableType: any)` | 67 | ✍ Subscribes to `onLoad`, `onDelete`, `onPreFinalizePlacement`, `onPostFinalizePlacement`, `onReadStream` and `onWriteStream`. |
| `PlaceableHusbandryFence.registerXMLPaths(schema: XMLSchema, basePath: string)` | 80 | ✍ Registers the XML keys under `husbandry.fence`: fence XML filename, sections (segment id, reversed flag, customizable flag, nodes) and additional navigation mesh nodes. |
| `PlaceableHusbandryFence.registerSavegameXMLPaths(schema: any, basePath: any)` | 94 | ✍ Registers the savegame XML paths under `.fence` by delegating to `Fence.registerSavegameXMLPaths`. |
| `PlaceableHusbandryFence:onLoad(savegame: any)` | 102 | ✍ Resets customization state, then, unless the icon generator is running, loads the fence XML named in the placeable XML and starts an async load of its i3D file. Returns silently with a warning if the file or its i3D path is missing. |
| `PlaceableHusbandryFence:onFenceI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 152 | ✍ Callback of the async i3D load: builds the `Fence`, reads the default sections (each with a valid segment id; a customizable section must be the last) and the navigation contour nodes, and creates the default fence in construction preview. Cleans up the temporary XML and ends the loading task. |
| `PlaceableHusbandryFence:onDelete()` | 236 | ✍ Frees the temporary fence XML, flags the fence as being deleted, deletes the preview segments and the fence itself, and releases the shared i3D file. |
| `PlaceableHusbandryFence:onReadStream(streamId: any, connection: any)` | 270 | ✍ Network read: deletes the existing fence segments, reads the fence and per-segment customizable/default flags, finalizes the fence, then reads the customizing flag and hides the default fence if the user is customizing. |
| `PlaceableHusbandryFence:onWriteStream(streamId: any, connection: any)` | 296 | ✍ Network write: writes the fence, the per-segment customizable and default flags, and whether the user is customizing. |
| `PlaceableHusbandryFence:loadFromXMLFile(xmlFile: XMLFile, key: string)` | 334 | ✍ Loads the fence from the `.fence` key of the savegame if it exists. |
| `PlaceableHusbandryFence:onPreFinalizePlacement()` | 345 | ✍ Server only and only for a newly placed (not savegame) placeable: creates the default fence, rebuilds and finalizes each preview segment, then finalizes the fence. Does nothing if no fence was loaded. |
| `PlaceableHusbandryFence:updateHusbandryFence() → boolean` | 648 | ✍ Positions each preview segment between its section nodes, rebuilds meshes, checks overlaps and ownership, and sets `spec.fenceErrorMessageKey`. Returns false on a mesh error, collision or unowned land. |
| `PlaceableHusbandryFence:setPreviewPosition(superFunc: any, x: any, y: any, z: any, rotX: any, rotY: any, rotZ: any)` | 706 | ✍ Override: calls the parent, then updates the fence and stores in `spec.canBePlaced` whether the fence fits at the new preview position. |
| `PlaceableHusbandryFence:getHasCustomizableFence()` | 717 | ✍ Returns whether the XML defined a customizable section (true or nil). |
| `PlaceableHusbandryFence:getFence()` | 724 | ✍ Returns the `Fence` object, or nil if none was loaded. |
| `PlaceableHusbandryFence:getCanBePlacedAt(superFunc: any, x: any, y: any, z: any, farmId: any)` | 754 | ✍ Override: returns false with the stored fence error text (or a default one) when the fence cannot be placed; otherwise defers to the parent. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getHasCustomizableFence` | 37 |
| registerFunction | `getFence` | 38 |
| registerFunction | `getCustomizeableSectionStartAndEndPositions` | 39 |
| registerFunction | `getDefaultFenceOrientation` | 40 |
| registerFunction | `getFenceContourPositions` | 41 |
| registerFunction | `getCanFinishFenceCustomization` | 42 |
| registerFunction | `updateHusbandryFence` | 43 |
| registerFunction | `finalizeHusbandryFence` | 44 |
| registerFunction | `createDefaultFence` | 45 |
| registerFunction | `deleteCustomizableSegments` | 46 |
| registerFunction | `onFenceI3DLoaded` | 47 |
| registerFunction | `startFenceCustomization` | 48 |
| registerFunction | `finishFenceCustomization` | 49 |
| registerFunction | `onHusbandryFenceUserRemoved` | 50 |
| registerFunction | `hideDefaultFence` | 51 |
| registerFunction | `restoreDefaultFence` | 52 |
| registerFunction | `tryFinalizeFence` | 53 |
| registerFunction | `getAllowFenceSegmentDeletion` | 54 |
| registerOverwrittenFunction | `setPreviewPosition` | 60 |
| registerOverwrittenFunction | `getCanBePlacedAt` | 61 |
| registerOverwrittenFunction | `createNavigationMesh` | 62 |
| registerEventListener | `onLoad` | 68 |
| registerEventListener | `onDelete` | 69 |
| registerEventListener | `onPreFinalizePlacement` | 70 |
| registerEventListener | `onPostFinalizePlacement` | 71 |
| registerEventListener | `onReadStream` | 72 |
| registerEventListener | `onWriteStream` | 73 |
