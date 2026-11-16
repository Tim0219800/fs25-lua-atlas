# handTools/specializations/HandToolChainsaw.lua

*[Version française](../../../fr/scripts/handTools/specializations/HandToolChainsaw.md)*

Source: `dataS/scripts/handTools/specializations/HandToolChainsaw.lua` — FS25 1.25.1.0

✍ Hand tool specialization for the chainsaw. It requires HandToolMotorized. The owning player aims at a tree (split shape); a ring indicator shows whether a cut is valid, and holding the activate input cuts through the trunk over a time proportional to its section, then slices it (directly on the server, or via ChainsawCutEvent from a client). With no tree targeted it revs up and delimbs, removing split shape attachments on the server. State is synchronised in the update stream. Constants such as distances and thresholds are defined elsewhere (UNVERIFIED values).

- **HandToolChainsaw** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolChainsaw.registerXMLPaths(xmlSchema: any)` | 52 | ✍ Registers the `handTool.chainsaw` XML keys: work style preset, maximum cut and delimb diameter, cut time per square metre, ring selector i3d, cut and hand nodes, chain animation, effects and cut sounds. |
| `HandToolChainsaw.registerFunctions(handToolType: any)` | 70 | ✍ Registers the cut plane, validity test, cutting, delimbing, state, animation, split plane and ring selector functions on the hand tool type. |
| `HandToolChainsaw.registerEventListeners(handToolType: any)` | 88 | ✍ Subscribes to load, post-load, delete, update, draw, update stream read/write, held start/end and action events registration. |
| `HandToolChainsaw.prerequisitesPresent(specializations: any)` | 103 | ✍ Returns true only if HandToolMotorized is among the specializations. |
| `HandToolChainsaw:onLoad(xmlFile: any, baseDirectory: any)` | 109 | ✍ Creates shared compression parameters on first use, reads limits, cut time (stored in ms), nodes and optional ring i3d (async load), creates guide, camera rotation and split plane nodes, and loads effects, chain animation, cut sounds and crosshair on clients. Sets `walkMultiplier` to 0.5. |
| `HandToolChainsaw:onPostLoad(savegame: any)` | 231 | ✍ Sets the motor's RPM gain rate so that full RPM is reached over the startup time, and the loss rate to 1.2 times that. |
| `HandToolChainsaw:onRingLoadFinished(ringNode: any, failedReason: any)` | 243 | ✍ Async load callback: finishes the loading task, takes the first child of the loaded i3d as the ring indicator, hides it and links it under the camera rotation node. Logs an error on failure. |
| `HandToolChainsaw:onDelete()` | 263 | ✍ Releases the shared ring i3d, animations, effects, sounds, helper nodes and crosshair, and removes this target type from the carrying player's targeter. |
| `HandToolChainsaw:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 307 | ✍ When the dirty flag is set, writes the cut state (and vertical flag when cutting). From a client to the server during delimbing it writes the compressed plane position, normal and up vectors; the server writes whether attachments were removed. |
| `HandToolChainsaw:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 337 | ✍ Reads the cut state and applies it unless the local player owns the tool. The server reads the delimb plane data; a client reads the removed-attachment flag and, for the owner, triggers the delimb effect timing. |
| `HandToolChainsaw:onUpdate(dt: any)` | 377 | ✍ Main loop. For the owner: updates target tree, split plane, roll and tool orientation, checks cut validity, updates action text and ring, and runs the cutting update. While delimbing, computes the plane; the server removes split shape attachments in it. Clients start or stop effects, sounds and chain animation. |
| `HandToolChainsaw:onDraw()` | 524 | ✍ Draws the crosshair only while idle. |
| `HandToolChainsaw:onHeldStart()` | 534 | ✍ For the owner, adds a tree target type with a filter for split-shape meshes; for others resets the graphical node. Applies the work style preset and the chainsaw flag to the carrying player. |
| `HandToolChainsaw:onHeldEnd()` | 560 | ✍ Removes the target type, restores the player work style, stops any delimbing or cutting, stops chain animation, hides the ring and clears roll input. |
| `HandToolChainsaw:onRegisterActionEvents()` | 593 | ✍ Registers AXIS_ROTATE_HANDTOOL (roll the cut plane) and ACTIVATE_HANDTOOL (cut or rev), with texts and priority. Skipped if the tool is not active for input. |
| `HandToolChainsaw:onRollAction(_: any, inputDelta: any)` | 612 | ✍ Input callback: accumulates the roll input applied in the next update. |
| `HandToolChainsaw:onCutAction(_: any, inputValue: any)` | 619 | ✍ Input callback. On release it stops cutting or delimbing and returns to idle. On press it starts cutting if a tree is targeted, falling back to delimbing (revving) when the cut cannot start, or delimbing when no tree is targeted. |
| `HandToolChainsaw:setCurrentCutState(cutState: any, isVerticalCut: any)` | 656 | ✍ Stores the cut state and vertical flag, flags a network update on the server or the owning player, and tells the carrying player whether a cut is in progress. |
| `HandToolChainsaw:testIfCutAllowed(treeNode: any, cutX: any, cutZ: any)` | 676 | ✍ Returns true only if a player carries the tool, has the CUT_TREES farm permission and the split shape manager allows cutting that shape at the position. |
| `HandToolChainsaw:testIfCutValid(treeNode: any, cutX: any, cutZ: any, minY: any, maxY: any, minZ: any, maxZ: any)` | 696 | ✍ Returns true if the cut is not too low (`testIfTooLow`) and the plane bounds are below the maximum cut diameter on both axes. |
| `HandToolChainsaw:testIfTooLow(treeNode: integer, minY: number, maxY: number, minZ: number, maxZ: number) → boolean` | 719 | ✍ Checks the four corners of the cut bounds. For a still rooted (static) tree each must be above a roots height threshold and a ground distance threshold; felled trees always pass. Returns false for missing tree or bounds; draws debug when enabled. |
| `HandToolChainsaw:getChainSpeedFactor()` | 797 | ✍ Returns a 0..1 factor from the current RPM, remapped between 0.3 and 1 of the RPM range. |
| `HandToolChainsaw:beginDelimbing()` | 804 | ✍ Owner only: enters the DELIMBING state, resets load, targets max RPM and hides the action text. |
| `HandToolChainsaw:stopDelimbing()` | 823 | ✍ Returns to IDLE, ends the effect timer, resets load and sets target RPM to idle. |
| `HandToolChainsaw:beginCutting()` | 837 | ✍ Owner only. Checks a possible tree and permission (else shows a warning), enters CUTTING, computes the cut duration from the oval section area plus spin-up, sets start/end positions, links the tool to the cut guide and locks player input. |
| `HandToolChainsaw:stopCutting(sliceTree: any)` | 900 | ✍ Owner only. Returns to IDLE, resets load and RPM, unlocks input and relinks the tool. If `sliceTree` is true, slices the shape: directly on the server, or by sending a ChainsawCutEvent from a client. |
| `HandToolChainsaw:updateCutting(dt: any)` | 945 | ✍ Per-frame cutting step: animates the tool, targets max RPM, advances cut time, aborts if the player's look point is too far from the cut, and slices the tree when the target time is reached. |
| `HandToolChainsaw:updateCuttingAnimation(dt: any)` | 976 | ✍ Moves the cut guide node. During spin-up it approaches the cut start at zero load; afterwards it follows the cut line with a bezier-smoothed progress, derives the load from smoothed versus linear speed and keeps the effects alive. |
| `HandToolChainsaw:updateSplitPlane()` | 1024 | ✍ Orients the camera rotation node (camera-based while delimbing, yaw-only otherwise), applies the roll, then recomputes the cut bounds with `testSplitShape` for the current or targeted tree. |
| `HandToolChainsaw:updateRingSelector(targetedTree: any, isCutPossible: any, cutMinimumY: any, cutMaximumY: any, cutMinimumZ: any, cutMaximumZ: any)` | 1076 | ✍ Shows or hides the ring indicator, colours it valid or invalid, scales it to the trunk section and centres it on the cut bounds. |
| `HandToolChainsaw:calculateCutPlane()` | 1113 | ✍ Returns the split plane position, its down and left directions, and the plane width and depth (maximum cut diameter plus an offset constant). |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `calculateCutPlane` | 71 |
| registerFunction | `getChainSpeedFactor` | 72 |
| registerFunction | `testIfTooLow` | 73 |
| registerFunction | `testIfCutAllowed` | 74 |
| registerFunction | `testIfCutValid` | 75 |
| registerFunction | `beginCutting` | 76 |
| registerFunction | `stopCutting` | 77 |
| registerFunction | `beginDelimbing` | 78 |
| registerFunction | `stopDelimbing` | 79 |
| registerFunction | `setCurrentCutState` | 80 |
| registerFunction | `updateCutting` | 81 |
| registerFunction | `updateCuttingAnimation` | 82 |
| registerFunction | `updateSplitPlane` | 83 |
| registerFunction | `updateRingSelector` | 84 |
| registerEventListener | `onDelete` | 89 |
| registerEventListener | `onLoad` | 90 |
| registerEventListener | `onPostLoad` | 91 |
| registerEventListener | `onUpdate` | 92 |
| registerEventListener | `onDraw` | 93 |
| registerEventListener | `onWriteUpdateStream` | 94 |
| registerEventListener | `onReadUpdateStream` | 95 |
| registerEventListener | `onHeldStart` | 96 |
| registerEventListener | `onHeldEnd` | 97 |
| registerEventListener | `onRegisterActionEvents` | 98 |
