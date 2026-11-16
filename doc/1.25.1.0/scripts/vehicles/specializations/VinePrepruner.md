# vehicles/specializations/VinePrepruner.lua

*[Version française](../../../fr/scripts/vehicles/specializations/VinePrepruner.md)*

Source: `dataS/scripts/vehicles/specializations/VinePrepruner.lua` — FS25 1.25.1.0

✍ Specialization for vine prepruners. It requires `VineDetector` as a prerequisite and reads the fruit type (default `FruitType.GRAPE`), pruner nodes that slide according to the detected distance, an optional pole animation and an effect. The server decides the effect state (on for one second after the last work time) and syncs pruner node targets and the effect flag by compressed stream values. The overrides it registers (speed limit, vine detection, AI segment use) and `loadPreprunerNodeFromXML`/`getIsPreprunerNodeActive` have no body in this file (UNVERIFIED).

- **VinePrepruner** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `VinePrepruner.initSpecialization()` | 18 | ✍ Registers the XML paths for the fruit type, pruner nodes (node, offset, axis, direction, min/max translation, speed, sync bits), the pole animation (name, speed scale, pole threshold) and the effect. |
| `VinePrepruner.prerequisitesPresent(specializations: any)` | 44 | ✍ Returns true only if the vehicle type has the `VineDetector` specialization. |
| `VinePrepruner.registerFunctions(vehicleType: any)` | 50 | ✍ Registers `loadPreprunerNodeFromXML` and `getIsPreprunerNodeActive` on the vehicle type; their implementations are not in this file (UNVERIFIED). |
| `VinePrepruner.registerOverwrittenFunctions(vehicleType: any)` | 57 | ✍ Registers overrides for doCheckSpeedLimit, getCanStartVineDetection, getIsValidVinePlaceable, handleVinePlaceable and getAIImplementUseVineSegment (bodies not in this file, UNVERIFIED). |
| `VinePrepruner.registerEventListeners(vehicleType: any)` | 67 | ✍ Subscribes to load, delete, the four stream events, onUpdate, onTurnedOff and onAnimationPartChanged. Only some have bodies here (onTurnedOff and onAnimationPartChanged are not defined in this file). |
| `VinePrepruner:onLoad(savegame: any)` | 81 | ✍ Loads the fruit type, the pruner nodes (through `loadPreprunerNodeFromXML`), the pole animation settings and, on the client, the effects. Allocates a dirty flag and sets `lastWorkTime` far in the past. |
| `VinePrepruner:onDelete()` | 117 | ✍ Deletes the effects through the effect manager (not guarded by isClient, so on a server the effects table is nil; UNVERIFIED whether the manager tolerates nil). |
| `VinePrepruner:onReadStream(streamId: any, connection: any)` | 124 | ✍ Client join: reads pruner node positions and the effect state, forcing the nodes to those positions immediately. |
| `VinePrepruner:onWriteStream(streamId: any, connection: any)` | 130 | ✍ Server side on join: writes the pruner node targets and the effect state. |
| `VinePrepruner:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 136 | ✍ Client: if the server flagged a change, reads the pruner state; targets are approached smoothly in onUpdate. |
| `VinePrepruner:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 146 | ✍ Server: writes a boolean telling whether the dirty flag is set, and the pruner state when it is. |
| `VinePrepruner.readPrePrunerFromStream(self: any, streamId: any, forceState: any)` | 157 | ✍ Reads each node target as an N-bit integer scaled between transMin and transMax, optionally applying it at once (`forceState`), then reads the effect boolean and starts or stops the effects, with the fruit type as effect info. |
| `VinePrepruner.writePrePrunerToStream(self: any, streamId: any)` | 186 | ✍ Writes each node target as an N-bit integer normalized between transMin and transMax, then the effect boolean. |
| `VinePrepruner:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 201 | ✍ Moves each active pruner node toward its target translation at `transSpeed` (the step uses dt directly, so unit handling depends on the XML value). On the server, switches the effect on if work happened within the last second, starts/stops it locally and raises the dirty flag. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadPreprunerNodeFromXML` | 51 |
| registerFunction | `getIsPreprunerNodeActive` | 52 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 58 |
| registerOverwrittenFunction | `getCanStartVineDetection` | 59 |
| registerOverwrittenFunction | `getIsValidVinePlaceable` | 60 |
| registerOverwrittenFunction | `handleVinePlaceable` | 61 |
| registerOverwrittenFunction | `getAIImplementUseVineSegment` | 62 |
| registerEventListener | `onLoad` | 68 |
| registerEventListener | `onDelete` | 69 |
| registerEventListener | `onReadStream` | 70 |
| registerEventListener | `onWriteStream` | 71 |
| registerEventListener | `onReadUpdateStream` | 72 |
| registerEventListener | `onWriteUpdateStream` | 73 |
| registerEventListener | `onUpdate` | 74 |
| registerEventListener | `onTurnedOff` | 75 |
| registerEventListener | `onAnimationPartChanged` | 76 |
