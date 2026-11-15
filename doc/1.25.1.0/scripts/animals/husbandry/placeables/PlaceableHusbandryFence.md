# animals/husbandry/placeables/PlaceableHusbandryFence.lua

Source : `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryFence.lua` — FS25 1.25.1.0

- **PlaceableHusbandryFence** (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryFence.prerequisitesPresent(specializations: table) → boolean` | 26 |  |
| `PlaceableHusbandryFence.registerFunctions(placeableType: any)` | 36 |  |
| `PlaceableHusbandryFence.registerOverwrittenFunctions(placeableType: any)` | 59 |  |
| `PlaceableHusbandryFence.registerEventListeners(placeableType: any)` | 67 |  |
| `PlaceableHusbandryFence.registerXMLPaths(schema: XMLSchema, basePath: string)` | 80 |  |
| `PlaceableHusbandryFence.registerSavegameXMLPaths(schema: any, basePath: any)` | 94 |  |
| `PlaceableHusbandryFence:onLoad(savegame: any)` | 102 |  |
| `PlaceableHusbandryFence:onFenceI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 152 |  |
| `PlaceableHusbandryFence:onDelete()` | 236 |  |
| `PlaceableHusbandryFence:onReadStream(streamId: any, connection: any)` | 270 |  |
| `PlaceableHusbandryFence:onWriteStream(streamId: any, connection: any)` | 296 |  |
| `PlaceableHusbandryFence:loadFromXMLFile(xmlFile: XMLFile, key: string)` | 334 |  |
| `PlaceableHusbandryFence:onPreFinalizePlacement()` | 345 |  |
| `PlaceableHusbandryFence:updateHusbandryFence() → boolean` | 648 |  |
| `PlaceableHusbandryFence:setPreviewPosition(superFunc: any, x: any, y: any, z: any, rotX: any, rotY: any, rotZ: any)` | 706 |  |
| `PlaceableHusbandryFence:getHasCustomizableFence()` | 717 |  |
| `PlaceableHusbandryFence:getFence()` | 724 |  |
| `PlaceableHusbandryFence:getCanBePlacedAt(superFunc: any, x: any, y: any, z: any, farmId: any)` | 754 |  |

## Spécialisation

| Type | Nom | Ligne |
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
