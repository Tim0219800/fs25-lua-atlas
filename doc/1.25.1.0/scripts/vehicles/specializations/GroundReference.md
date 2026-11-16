# vehicles/specializations/GroundReference.lua

*[Version française](../../../fr/scripts/vehicles/specializations/GroundReference.md)*

Source: `dataS/scripts/vehicles/specializations/GroundReference.lua` — FS25 1.25.1.0

✍ Vehicle specialization for soil-working tools: it declares reference nodes and tracks whether each one is at or below the terrain surface (or the height-map material surface), and optionally only while the tool is lowered. The result drives the power multiplier (load) and lets speed-rotating parts such as wheels or tines turn only while touching the ground. The state is computed on the server and sent to clients in the update stream.

- **GroundReference** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `GroundReference.prerequisitesPresent(specializations: any)` | 16 | ✍ Always returns true: no prerequisite on other specializations. |
| `GroundReference.initSpecialization()` | 22 | ✍ Registers the XML schema of a ground reference node (node, threshold, only-when-lowered, charge value, force factor, max activation depth) and the groundReferenceNodeIndex attribute on speed rotating parts. The base path constant is defined outside this file (UNVERIFIED). |
| `GroundReference.registerEvents(vehicleType: any)` | 43 | ✍ Empty: the specialization registers no custom events. |
| `GroundReference.registerFunctions(vehicleType: any)` | 48 | ✍ Registers the node loading, update and query functions (including forward speed) on the vehicle type. |
| `GroundReference.registerOverwrittenFunctions(vehicleType: any)` | 59 | ✍ Overrides getPowerMultiplier, loadSpeedRotatingPartFromXML and getIsSpeedRotatingPartActive so ground contact influences load and rotating parts. |
| `GroundReference.registerEventListeners(vehicleType: any)` | 67 | ✍ Subscribes to onLoad, onReadUpdateStream, onWriteUpdateStream and onUpdateTick. |
| `GroundReference:onLoad(savegame: any)` | 76 | ✍ Loads all groundReferenceNode entries, then normalizes the charge values and force factors so each set sums to 1. If no node exists, removes the onUpdateTick listener. |
| `GroundReference:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 124 | ✍ Client side: reads one boolean per reference node from the stream and stores it as the node's active state. |
| `GroundReference:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 135 | ✍ Server side: writes the active state of every reference node into the update stream sent to clients. |
| `GroundReference:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 146 | ✍ Every tick, refreshes the active state of every ground reference node. |
| `GroundReference:loadGroundReferenceNode(xmlFile: any, baseName: any, entry: any)` | 155 | ✍ Loads one reference node from XML (node, threshold, lowered-only flag, charge value, force factor, max depth). Returns true on success, false when the node is missing. Marks the vehicle as using force factors if any is given. |
| `GroundReference:updateGroundReferenceNode(groundReferenceNode: any)` | 179 | ✍ Server only. A node is active when the tool is lowered (if required) and the node lies below terrain height, or below the height-map material height, by the threshold but not deeper than the max activation depth. |
| `GroundReference:getGroundReferenceNodeFromIndex(refNodeIndex: any)` | 213 | ✍ Returns the reference node table at the given 1-based index, or nil. |
| `GroundReference:getIsGroundReferenceNodeActive(groundReferenceNode: any)` | 220 | ✍ Returns whether the given reference node is currently active (touching the ground). |
| `GroundReference:getIsGroundReferenceNodeThreshold(groundReferenceNode: any)` | 226 | ✍ Returns the threshold height of the given reference node, in meters. |
| `GroundReference:getGroundReferenceNodeForwardSpeed(groundReferenceNodeIndex: any)` | 232 | ✍ Returns the vehicle's last speed if the indexed node is active and the vehicle moves forward, otherwise 0. Used by rotating parts tied to a reference node. |
| `GroundReference:getPowerMultiplier(superFunc: any)` | 246 | ✍ Scales the parent power multiplier by the ground contact: the sum of force factors of active nodes if any are configured, else the charge value of the last active node. Note: with no active node the factor is 0. |
| `GroundReference:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 274 | ✍ Extends the parent loader to read groundReferenceNodeIndex for a speed rotating part, warning if the index is 0 since indices start at 1. |
| `GroundReference:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 292 | ✍ Returns false for a rotating part whose linked reference node is inactive. Warns and clears the link if the index is unknown, then falls back to the parent check. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadGroundReferenceNode` | 49 |
| registerFunction | `updateGroundReferenceNode` | 50 |
| registerFunction | `getGroundReferenceNodeFromIndex` | 51 |
| registerFunction | `getIsGroundReferenceNodeActive` | 52 |
| registerFunction | `getIsGroundReferenceNodeThreshold` | 53 |
| registerFunction | `getGroundReferenceNodeForwardSpeed` | 54 |
| registerOverwrittenFunction | `getPowerMultiplier` | 60 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 61 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 62 |
| registerEventListener | `onLoad` | 68 |
| registerEventListener | `onReadUpdateStream` | 69 |
| registerEventListener | `onWriteUpdateStream` | 70 |
| registerEventListener | `onUpdateTick` | 71 |
