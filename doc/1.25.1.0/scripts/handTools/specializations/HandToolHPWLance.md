# handTools/specializations/HandToolHPWLance.lua

*[Version française](../../../fr/scripts/handTools/specializations/HandToolHPWLance.md)*

Source: `dataS/scripts/handTools/specializations/HandToolHPWLance.lua` — FS25 1.25.1.0

✍ Hand tool specialization for the high pressure washer lance. It requires HandToolTethered. While activated, the owning client raycasts forward against vehicles; the server cleans the targeted vehicle and charges running costs to the farm. State and target are synchronised through the update stream. XML keys are under `handTool.highPressureWasherLance`.

- **HandToolHPWLance** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolHPWLance.registerXMLPaths(xmlSchema: any)` | 14 | ✍ Registers the lance XML entries: raycast node, wash distance, wash multiplier, price per minute, plus effects and the washing sound. |
| `HandToolHPWLance.registerFunctions(handToolType: any)` | 26 | ✍ Registers `onWashAction`, `setIsActivated` and `onLanceCallback` on the hand tool type. |
| `HandToolHPWLance.registerOverwrittenFunctions(vehicleType: any)` | 34 | ✍ Overrides `getCanBeDropped` so the lance can never be dropped. |
| `HandToolHPWLance.registerEventListeners(handToolType: any)` | 40 | ✍ Subscribes to `onLoad`, `onDelete`, `onWriteUpdateStream`, `onReadUpdateStream`, `onUpdate`, `onRegisterActionEvents`, `onHeldEnd` and `onDebugDraw`. |
| `HandToolHPWLance.prerequisitesPresent(specializations: any)` | 53 | ✍ Returns true only if the HandToolTethered specialization is present. |
| `HandToolHPWLance:onLoad(xmlFile: any, baseDirectory: any)` | 59 | ✍ Reads raycast node, wash distance (default 10 m), multiplier (default 1) and price (default 10 per minute, stored per second). On clients loads water-typed effects and the washing sound. Initialises state and a dirty flag. |
| `HandToolHPWLance:onDelete()` | 85 | ✍ Deletes the effects and the washing sound sample. |
| `HandToolHPWLance:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 93 | ✍ Writes the activation flag. When sending to the server, also writes the targeted vehicle object id if there is one. The dirty mask is not consulted, so the flag is written every time. |
| `HandToolHPWLance:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 107 | ✍ Reads the activation flag and, on the server side of the connection, the targeted vehicle id (ignored if the reader is the owning player), then applies the state with `setIsActivated`. |
| `HandToolHPWLance:onUpdate(dt: any)` | 130 | ✍ While activated: the owner fires an asynchronous raycast forward over `washDistance`, updates the action text with the target type and flags changes. On the server it cleans the target vehicle proportionally to the multiplier and `dt`, and charges the farm expenses and a VEHICLE_RUNNING_COSTS money change. |
| `HandToolHPWLance:onLanceCallback(nodeId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 184 | ✍ Raycast callback: ignores hits that are not vehicles and keeps the first vehicle that allows washing by high pressure washer as the target (stops reporting). Otherwise continues; no hit clears the target. |
| `HandToolHPWLance:setIsActivated(isActivated: any)` | 216 | ✍ Sets the activation state, only if it changed and a player carries the tool. The owner marks it for sync. Starts or stops the water effects and washing sound. |
| `HandToolHPWLance:onRegisterActionEvents()` | 248 | ✍ Registers the ACTIVATE_HANDTOOL input (callback on press and release) with very high priority and a text built from the tool's `activateText`. |
| `HandToolHPWLance:onWashAction(_: any, inputValue: any)` | 263 | ✍ Input callback: activates the lance while the input value is positive, deactivates it otherwise. |
| `HandToolHPWLance:getCanBeDropped(superFunc: any)` | 269 | ✍ Overwritten function: always returns false. |
| `HandToolHPWLance:onHeldEnd()` | 275 | ✍ Deactivates the lance and returns the tool to its holder with the flag set to true. |
| `HandToolHPWLance:onDebugDraw(x: any, y: any, textSize: any)` | 282 | ✍ Adds debug lines showing the activation state and the targeted vehicle type name; returns the updated y position. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onWashAction` | 27 |
| registerFunction | `setIsActivated` | 28 |
| registerFunction | `onLanceCallback` | 29 |
| registerOverwrittenFunction | `getCanBeDropped` | 35 |
| registerEventListener | `onLoad` | 41 |
| registerEventListener | `onDelete` | 42 |
| registerEventListener | `onWriteUpdateStream` | 43 |
| registerEventListener | `onReadUpdateStream` | 44 |
| registerEventListener | `onUpdate` | 45 |
| registerEventListener | `onRegisterActionEvents` | 46 |
| registerEventListener | `onHeldEnd` | 47 |
| registerEventListener | `onDebugDraw` | 48 |
