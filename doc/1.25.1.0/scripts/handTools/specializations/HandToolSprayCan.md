# handTools/specializations/HandToolSprayCan.lua

*[Version française](../../../fr/scripts/handTools/specializations/HandToolSprayCan.md)*

Source: `dataS/scripts/handTools/specializations/HandToolSprayCan.lua` — FS25 1.25.1.0

✍ Hand tool specialization for the tree marking spray can. The player aims at a tree (split shape) within a short distance; a SprayCanEvent runs on the server and the marker is applied through the mission's tree marker system after a delay. The number of remaining markers is saved to the savegame and synchronised to clients. Several marker types can be cycled.

- **HandToolSprayCan** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolSprayCan.registerXMLPaths(xmlSchema: any)` | 16 | ✍ Registers the `handTool.sprayCan` attributes (shake node, colour material slot, colour, distance, delay, total markers) plus the spraying sound and effects. |
| `HandToolSprayCan.registerSavegameXMLPaths(savegameXMLSchema: any, baseKey: any)` | 31 | ✍ Registers the savegame key `sprayCan#remainingNumMarkers`. |
| `HandToolSprayCan.registerFunctions(handToolType: any)` | 37 | ✍ Registers `tryToAddTreeMarker`, `processDelayedMarker`, `setIsSpraying`, `changeTreeMarkerType`, `getIsSprayingAllowed` and `activateSpraying`. |
| `HandToolSprayCan.registerEventListeners(handToolType: any)` | 48 | ✍ Subscribes to load, post-load, delete, update, draw, full and update stream read/write, action events registration, and held start/end. |
| `HandToolSprayCan.prerequisitesPresent(specializations: any)` | 65 | ✍ Always returns true: no prerequisite. |
| `HandToolSprayCan:onLoad(xmlFile: any)` | 71 | ✍ Reads marker count (valid range 1 to 255, otherwise 255 with a warning), colour, detection distance (default 1.5), delay, colour slot and shake node; loads effects (water type) and sound; resolves the tree marker type and crosshairs. Returns true. |
| `HandToolSprayCan:onPostLoad(savegame: any)` | 146 | ✍ Restores `remainingNumMarkers` from the savegame, clamped between 1 and the maximum, when the savegame has the `sprayCan` key. |
| `HandToolSprayCan:onDelete()` | 158 | ✍ Applies any pending delayed marker, then frees effects, spraying sound and both crosshairs. |
| `HandToolSprayCan:onWriteStream(streamId: any, connection: any, dirtyMask: any)` | 184 | ✍ Server to client initial sync: writes the remaining marker count as a byte. |
| `HandToolSprayCan:onReadStream(streamId: any, connection: any, carryingPlayer: any)` | 193 | ✍ Client side: reads the remaining marker count sent by the server. |
| `HandToolSprayCan:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 202 | ✍ Server to client: when the dirty flag is set, writes the remaining marker count as a byte. |
| `HandToolSprayCan:onReadUpdateStream(streamId: any, timestamp: any, connection: any, carryingPlayer: any)` | 214 | ✍ Client side: reads the remaining marker count if the update flag is set. |
| `HandToolSprayCan:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 225 | ✍ Saves the remaining marker count to `#remainingNumMarkers` under the given key. |
| `HandToolSprayCan:onUpdate(dt: any)` | 233 | ✍ For the owning player, reads the targeted tree and on a fresh press sends a SprayCanEvent to the server if markers remain and the land is accessible; otherwise shows a blinking warning. Also processes the delayed marker, animates the shake and stops spraying after its duration. |
| `HandToolSprayCan:onDraw()` | 302 | ✍ Draws the marker type icon and, if a tree is targeted, the tree crosshair. Draws nothing without a marker type or with no markers left. |
| `HandToolSprayCan:onHeldStart()` | 324 | ✍ For the owning player, adds a TREE target type (0.5 minimum, detection distance) with a filter that keeps only split-shape meshes. |
| `HandToolSprayCan:onRegisterActionEvents()` | 367 | ✍ Registers SPRAYCAN_CHANGE_MARKER (cycles marker type) and ACTIVATE_HANDTOOL (spray), with texts and priority. Skipped if the tool is not active for input. |
| `HandToolSprayCan:activateSpraying(_: any, inputValue: any)` | 382 | ✍ Input callback: records whether the activate input is pressed for this frame. |
| `HandToolSprayCan:tryToAddTreeMarker(treeMarkerTypeIndex: any, splitShapeId: any, x: any, y: any, z: any, hitX: any, hitY: any, hitZ: any)` | 389 | ✍ Called when the server-side event is processed: starts the spray animation, decrements the remaining markers, flags sync on the server and, if a tree is given and allowed, stores a delayed marker to apply after `sprayDelay`. |
| `HandToolSprayCan:processDelayedMarker()` | 419 | ✍ Applies the pending delayed marker via the tree marker system (camera based, with the spray colour) if the shape still exists, then clears it. |
| `HandToolSprayCan:setIsSpraying(isSpraying: any, force: any)` | 445 | ✍ Starts or stops the spray effects and sound. Starting needs the tool to be held and sets the shake end time; stopping can optionally reset the effects when `force` is true. |
| `HandToolSprayCan:changeTreeMarkerType(_: any, inputValue: any)` | 470 | ✍ Input callback: advances to the next tree marker type (wrapping to 1) and rebuilds the marker icon crosshair. |
| `HandToolSprayCan:getIsSprayingAllowed(shape: any)` | 490 | ✍ Returns true for no shape; otherwise true only if the local player's farm may access the land at the shape's position. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `tryToAddTreeMarker` | 38 |
| registerFunction | `processDelayedMarker` | 39 |
| registerFunction | `setIsSpraying` | 40 |
| registerFunction | `changeTreeMarkerType` | 41 |
| registerFunction | `getIsSprayingAllowed` | 42 |
| registerFunction | `activateSpraying` | 43 |
| registerEventListener | `onLoad` | 49 |
| registerEventListener | `onPostLoad` | 50 |
| registerEventListener | `onDelete` | 51 |
| registerEventListener | `onUpdate` | 52 |
| registerEventListener | `onDraw` | 53 |
| registerEventListener | `onWriteStream` | 54 |
| registerEventListener | `onReadStream` | 55 |
| registerEventListener | `onWriteUpdateStream` | 56 |
| registerEventListener | `onReadUpdateStream` | 57 |
| registerEventListener | `onRegisterActionEvents` | 58 |
| registerEventListener | `onHeldStart` | 59 |
| registerEventListener | `onHeldEnd` | 60 |
