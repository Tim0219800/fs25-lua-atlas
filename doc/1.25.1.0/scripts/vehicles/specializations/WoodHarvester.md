# vehicles/specializations/WoodHarvester.lua

*[Version française](../../../fr/scripts/vehicles/specializations/WoodHarvester.md)*

Source: `dataS/scripts/vehicles/specializations/WoodHarvester.lua` — FS25 1.25.1.0

✍ Specialization for tree harvester heads: grab a standing tree or a log, fell it at a cut node, hold it with a physics joint, feed it through a delimbing node, and cut it to the selected length. It requires TurnOnVehicle. The server owns all splitting and joint logic and syncs with events (`WoodHarvesterOnCutTreeEvent`, `WoodHarvesterOnDelimbTreeEvent`, cut-length, drop, tilt and cut events); clients handle effects, sounds, animations, dashboards and input. It raises the vehicle event `onCutTree` and registers a per-vehicle auto-cut setting and a shop spec for maximum tree size.

- **WoodHarvester** (l.18)

## Functions

| Function | Line | Description |
|---|---|---|
| `WoodHarvester.prerequisitesPresent(specializations: any)` | 26 | ✍ Returns true only if the vehicle type has the TurnOnVehicle specialization. |
| `WoodHarvester.initSpecialization()` | 32 | ✍ Adds the `woodHarvesterMaxTreeSize` shop spec and registers the XML schema: cut node, tilt, delimb node, cut lengths, effects, forwarding nodes, sounds, cut and grab animations, tree size measure and dashboards. Also registers the savegame attributes. |
| `WoodHarvester.registerEvents(vehicleType: any)` | 97 | ✍ Registers the vehicle event `onCutTree`. |
| `WoodHarvester.registerFunctions(vehicleType: any)` | 103 | ✍ Registers the public vehicle functions: split shape callback, tree diameter, search in range, cut, delimb, access check, header tilt, cut length selection and tree drop. |
| `WoodHarvester.registerOverwrittenFunctions(vehicleType: any)` | 119 | ✍ Overrides `getCanBeSelected`, `getDoConsumePtoPower`, `getConsumingLoad`, `getIsFoldAllowed` and the three auto tree alignment queries. |
| `WoodHarvester.registerEventListeners(vehicleType: any)` | 131 | ✍ Subscribes to load, delete, stream, update, draw, input, activation, turn on/off, state change, `onCutTree` and vehicle setting events. |
| `WoodHarvester:onLoad(savegame: any)` | 155 | ✍ Initializes the runtime state and reads cut, attach, delimb, cut length (explicit values or min/max/step, 0 meaning unlimited), effects, sounds, animations and texts from XML. Registers the vehicle setting `WOOD_HARVESTER_AUTO_CUT`. |
| `WoodHarvester:onPostLoad(savegame: any)` | 305 | ✍ If a grab animation exists, plays it in reverse and forces it to its end state instantly so the grab starts in a defined position. |
| `WoodHarvester:onLoadFinished(savegame: any)` | 321 | ✍ Restores from a savegame (unless vehicles are reset): cut length index, turned-on state, last tree size, joint position and attach direction. If a tree was held and the head is on, searches again for it and marks it as loaded from the savegame. |
| `WoodHarvester:onRegisterDashboardValueTypes()` | 361 | ✍ Registers three dashboard values: `cutLength` (cm, 9999999 when unlimited), `curCutLength` (cm already fed) and `diameter` (mm of the last tree). |
| `WoodHarvester:onDelete()` | 389 | ✍ Removes the joint holding the tree, deletes the helper node, and frees effects, sounds and animation nodes. |
| `WoodHarvester:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 407 | ✍ Saves cut length index, turned-on flag (also true while a tree is held), attach direction, and, if a tree is held, its size and joint position. |
| `WoodHarvester:onReadStream(streamId: any, connection: any)` | 428 | ✍ Initial sync on the client: reads whether a tree is held (plus grab animation time in 7 bits), whether it is moving, and the cut length index. |
| `WoodHarvester:onWriteStream(streamId: any, connection: any)` | 446 | ✍ Initial sync on the server: writes the held-tree flag with grab animation time, the moving flag and the cut length index. |
| `WoodHarvester:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 460 | ✍ Client side: reads whether the feed effect is active and, if so, whether the delimb effect is active. |
| `WoodHarvester:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 474 | ✍ Server side: writes the feed effect flag and, if set, the delimb effect flag. |
| `WoodHarvester:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 485 | ✍ Server: drops lost shapes (raising `onCutTree` with radius 0), runs the cut when the timer or cut animation is ready (split, attach or pick up, achievements counters), delimbs and feeds the held tree toward the target position, and updates its joint. Client: drives cut and delimb sounds and effects. |
| `WoodHarvester:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 795 | ✍ Resets warnings, then while on and no tree is held, looks for a valid tree and discards it if the cut would be too low. Also relaxes released joints, runs the delayed grab animation, and on clients updates the cut and cut-length input prompts. |
| `WoodHarvester:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 915 | ✍ Shows a blinking warning for the active vehicle while on: tree too thick, too thick at that position, unsupported type, or no access to the land. |
| `WoodHarvester:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 934 | ✍ Client: registers the input actions for cutting, cut length (next and back), dropping the tree and, if a tilt animation exists, header tilt. |
| `WoodHarvester:onDeactivate()` | 965 | ✍ Clears the current candidate tree and resets the displayed diameter. |
| `WoodHarvester:onTurnedOn()` | 973 | ✍ Cancels any pending delayed grab animation, plays the grab animation toward its open position if no tree is held, and resets the diameter. |
| `WoodHarvester:onTurnedOff()` | 990 | ✍ Opens the grab fully with a 500 ms delayed follow-up when no tree is held, and on clients stops effects and sounds. |
| `WoodHarvester:onStateChange(state: any, data: any)` | 1015 | ✍ Server: when the motor turns on while a tree is still held, turns the harvester on again if allowed. |
| `WoodHarvester:getCanSplitShapeBeAccessed(x: any, z: any, shape: any)` | 1029 | ✍ Asks `g_splitShapeManager` whether this farm may cut the shape at position x, z, given the owner connection. |
| `WoodHarvester:loadWoodHarvesterHeaderTiltFromXML(headerTilt: any, xmlFile: any, key: any)` | 1035 | ✍ Reads a header tilt block into the given table (animation name, speed factor, state). Returns false if no animation name is set. |
| `WoodHarvester:getIsWoodHarvesterTiltStateAllowed(headerTilt: any)` | 1050 | ✍ Hook returning true by default; other specializations can override it to forbid tilting. |
| `WoodHarvester:setWoodHarvesterTiltState(state: any, noEventSend: any)` | 1056 | ✍ Sets or toggles (nil) the header tilt, playing the tilt animation forward or backward, then sends `WoodHarvesterHeaderTiltEvent` unless `noEventSend`. |
| `WoodHarvester:setWoodHarvesterCutLengthIndex(index: any, noEventSend: any)` | 1073 | ✍ Selects a cut length by index (updating the current length) and sends `WoodHarvesterCutLengthEvent` unless `noEventSend`. |
| `WoodHarvester:dropWoodHarvesterTree(noEventSend: any)` | 1085 | ✍ Server: removes the joint, releases the held tree, stops delimbing and raises `onCutTree` with radius 0 on all machines. Sends `WoodHarvesterDropTreeEvent` unless `noEventSend`. |
| `WoodHarvester:findSplitShapesInRange(yOffset: number, skipCutAnimation: boolean)` | 1110 | ✍ Looks for a tree or log at the cut node when none is held. Checks harvester allowance, farm access, alignment (15 degrees standing, 40 degrees lying) and max radius, setting warning flags otherwise. Note: the expression `yOffset or 0 + 1` evaluates as `yOffset or 1`, so the one-meter-higher check ignores the offset arithmetic. |
| `WoodHarvester:cutTree(length: any, noEventSend: any)` | 1186 | ✍ Sends `WoodHarvesterCutTreeEvent`; on the server, length 0 starts the cut (instant for logs picked up from the ground), a positive length sets the feed target and starts delimbing. Clears the auto-cut dirty flag. |
| `WoodHarvester:onCutTree(radius: any, isNewTree: any, loadedFromSavegame: any)` | 1222 | ✍ Event handler. With a positive radius, adjusts the grab animation to the tree size, records the diameter and marks a tree as held; otherwise opens the grab, clears the held flag and restores a saved header tilt. Snaps animations when loaded from a savegame. |
| `WoodHarvester:onVehicleSettingChanged(gameSettingId: any, state: any)` | 1274 | ✍ Stores the new value of the `WOOD_HARVESTER_AUTO_CUT` setting as the automatic cutting flag. |
| `WoodHarvester:onDelimbTree(state: any)` | 1282 | ✍ Sets whether the held tree is being fed. When feeding ends, triggers the next cut (`cutTree(0)`) on the server if auto-cut is on, otherwise flags that a manual cut is pending. |
| `WoodHarvester:woodHarvesterSplitShapeCallback(shape: any, isBelow: any, isAbove: any, minY: any, maxY: any, minZ: any, maxZ: any)` | 1303 | ✍ Callback of `splitShape`. Registers the new shape, and if it is the upper part, attaches it to the cut attach node with a locked physics joint, releases configured component joints, resets tilt, records positions and raises `onCutTree` with the tree radius (also broadcast to clients). |
| `WoodHarvester:setLastTreeDiameter(diameter: any)` | 1389 | ✍ Stores the last measured tree diameter (meters) used by the dashboard. |
| `WoodHarvester:getCanBeSelected(superFunc: any)` | 1396 | ✍ Always returns true, so the implement can be selected regardless of the parent result. |
| `WoodHarvester:getDoConsumePtoPower(superFunc: any) → boolean` | 1403 | ✍ Returns true if the parent says so or if the harvester is turned on. |
| `WoodHarvester:getConsumingLoad(superFunc: any)` | 1409 | ✍ Adds full load (1) to the parent value while the held tree is moving or the cut animation plays, and increments the count by one. |
| `WoodHarvester:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1424 | ✍ Returns false with a warning text while a tree is held; otherwise defers to the parent. |
| `WoodHarvester:getSupportsAutoTreeAlignment(superFunc: any)` | 1435 | ✍ Always true: the harvester supports automatic alignment to trees. |
| `WoodHarvester:getIsAutoTreeAlignmentAllowed(superFunc: any)` | 1441 | ✍ Returns false while a tree is held; otherwise defers to the parent. |
| `WoodHarvester:getAutoAlignHasValidTree(superFunc: any, radius: any)` | 1452 | ✍ Returns two booleans: whether a candidate tree exists, and whether the given radius fits the maximum cut radius. |
| `WoodHarvester.actionEventCutTree(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1459 | ✍ Input callback. If on, after a 1 s cooldown: with a tree held and idle it cuts to the selected length (or finishes a pending auto-cut); with a candidate tree it starts the felling cut. If off, shows a warning to turn the tool on first. |
| `WoodHarvester.actionEventSetCutlength(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1485 | ✍ Input callback: moves the cut length index by `callbackState` (+1 or -1) with wrap-around, unless the tree is currently being fed. |
| `WoodHarvester.actionEventDropTree(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1502 | ✍ Input callback: calls `dropWoodHarvesterTree`. |
| `WoodHarvester.actionEventTiltHeader(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1508 | ✍ Input callback: toggles the header tilt if allowed and no tree is held. |
| `WoodHarvester.loadSpecValueMaxTreeSize(xmlFile: any, customEnvironment: any, baseDir: any)` | 1518 | ✍ Shop spec loader: returns the `cutNode#maxRadius` value from the vehicle XML. |
| `WoodHarvester.getSpecValueMaxTreeSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 1524 | ✍ Shop spec getter: turns the stored radius into a diameter in cm (radius x 2 x 100) and returns it with a formatted string, or nil if absent. Return shape depends on `returnValues` and `returnRange`. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onCutTree` | 98 |
| registerFunction | `woodHarvesterSplitShapeCallback` | 104 |
| registerFunction | `setLastTreeDiameter` | 105 |
| registerFunction | `findSplitShapesInRange` | 106 |
| registerFunction | `cutTree` | 107 |
| registerFunction | `onDelimbTree` | 108 |
| registerFunction | `getCanSplitShapeBeAccessed` | 109 |
| registerFunction | `loadWoodHarvesterHeaderTiltFromXML` | 110 |
| registerFunction | `getIsWoodHarvesterTiltStateAllowed` | 111 |
| registerFunction | `setWoodHarvesterTiltState` | 112 |
| registerFunction | `setWoodHarvesterCutLengthIndex` | 113 |
| registerFunction | `dropWoodHarvesterTree` | 114 |
| registerOverwrittenFunction | `getCanBeSelected` | 120 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 121 |
| registerOverwrittenFunction | `getConsumingLoad` | 122 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 123 |
| registerOverwrittenFunction | `getSupportsAutoTreeAlignment` | 124 |
| registerOverwrittenFunction | `getIsAutoTreeAlignmentAllowed` | 125 |
| registerOverwrittenFunction | `getAutoAlignHasValidTree` | 126 |
| registerEventListener | `onLoad` | 132 |
| registerEventListener | `onPostLoad` | 133 |
| registerEventListener | `onLoadFinished` | 134 |
| registerEventListener | `onRegisterDashboardValueTypes` | 135 |
| registerEventListener | `onDelete` | 136 |
| registerEventListener | `onReadStream` | 137 |
| registerEventListener | `onWriteStream` | 138 |
| registerEventListener | `onReadUpdateStream` | 139 |
| registerEventListener | `onWriteUpdateStream` | 140 |
| registerEventListener | `onUpdate` | 141 |
| registerEventListener | `onUpdateTick` | 142 |
| registerEventListener | `onDraw` | 143 |
| registerEventListener | `onRegisterActionEvents` | 144 |
| registerEventListener | `onDeactivate` | 145 |
| registerEventListener | `onTurnedOn` | 146 |
| registerEventListener | `onTurnedOff` | 147 |
| registerEventListener | `onStateChange` | 148 |
| registerEventListener | `onCutTree` | 149 |
| registerEventListener | `onVehicleSettingChanged` | 150 |

## Messages

- publishes `MessageType.TREE_SHAPE_MOUNTED` (l.599)
