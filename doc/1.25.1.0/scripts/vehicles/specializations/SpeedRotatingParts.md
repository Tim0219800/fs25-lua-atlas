# vehicles/specializations/SpeedRotatingParts.lua

*[Version française](../../../fr/scripts/vehicles/specializations/SpeedRotatingParts.md)*

Source: `dataS/scripts/vehicles/specializations/SpeedRotatingParts.lua` — FS25 1.25.1.0

✍ Specialization for non-wheel parts that rotate or scroll with the driving speed (belts, drums, reels, steering-following rollers, texture scrolling via shader parameters). Each `vehicle.speedRotatingParts.speedRotatingPart` takes its speed from a wheel group, a speed reference node or the vehicle speed, accumulates an `xDrive` angle, and applies it to nodes, shader parameters and optionally tire tracks. Parts are only updated within a camera distance, fade out when inactive, and "versatile Y rotation" angles are sent from server to clients. It has no prerequisites; other specializations (e.g. RidgeMarker) extend loading and activity through the overridable functions.

- **SpeedRotatingParts** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `SpeedRotatingParts.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Always returns true: no other specialization is required. |
| `SpeedRotatingParts.initSpecialization()` | 26 | ✍ Declares the large `speedRotatingPart` XML schema: nodes and shader nodes, shader scroll settings, wheel references, direction nodes, steering and Y rotation options, radius and wheel scale, activity, fade-out and activation speed, tire track options and max update distance. |
| `SpeedRotatingParts.registerFunctions(vehicleType: any)` | 79 | ✍ Registers `loadSpeedRotatingPartFromXML`, `getIsSpeedRotatingPartActive`, `getSpeedRotatingPartDirection` and `updateSpeedRotatingPart`. |
| `SpeedRotatingParts.registerOverwrittenFunctions(vehicleType: any)` | 88 | ✍ Overrides `validateWashableNode` so that tire-linked rotating part nodes use the wheel's dirt data. |
| `SpeedRotatingParts.registerEventListeners(vehicleType: any)` | 94 | ✍ Subscribes to onLoad, onReadStream, onWriteStream, onReadUpdateStream, onWriteUpdateStream, onUpdate and onUpdateTick. |
| `SpeedRotatingParts:onLoad(savegame: table)` | 107 | ✍ Loads every `speedRotatingPart` (removing the tire track node of a failed one), tracks whether parts use different max update distances, allocates the dirty flag, and removes all stream and update listeners if no part loaded. |
| `SpeedRotatingParts:onReadStream(streamId: integer, connection: Connection)` | 150 | ✍ Client on join: reads a 9-bit steering angle for every part with versatile Y rotation. |
| `SpeedRotatingParts:onWriteStream(streamId: integer, connection: Connection)` | 165 | ✍ Server on join: writes the steering angle of every versatile Y rotation part, quantised to 9 bits over a full turn. |
| `SpeedRotatingParts:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 181 | ✍ Client side: when the server flagged an update, reads the 9-bit steering angle of each versatile part. |
| `SpeedRotatingParts:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 202 | ✍ Server side: if the part dirty flag is set, writes true followed by the quantised steering angle of each versatile part; otherwise writes false. |
| `SpeedRotatingParts:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 222 | ✍ Every frame, for parts within their update distance, calls `updateSpeedRotatingPart` when the part is active or still spinning down (unless it stops immediately when inactive). |
| `SpeedRotatingParts:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 242 | ✍ Refreshes each in-range part's `isActive` flag from `getIsSpeedRotatingPartActive`. |
| `SpeedRotatingParts:loadSpeedRotatingPartFromXML(speedRotatingPart: table, xmlFile: XMLFile, key: string) → boolean` | 261 | ✍ Loads one part (represent/shader nodes, shader parameter type, drive node, wheels, tire tracks, direction, steering options, wheel scale, fade-out, update distance). Returns false with a warning on invalid node, missing wheels, missing tire track wheel, bad versatile setup or speed reference equal to the drive node. Wheels used get contact sync enabled. |
| `SpeedRotatingParts:getIsSpeedRotatingPartActive(speedRotatingPart: table) → boolean` | 456 | ✍ Default activity test: true, except false when the part is limited to the lowered state and the vehicle is raised. Overridden by other specializations to add conditions. |
| `SpeedRotatingParts:getSpeedRotatingPartDirection(speedRotatingPart: table) → integer` | 472 | ✍ Returns 1 by default: the direction multiplier applied to the rotation of a part, meant to be overridden. |
| `SpeedRotatingParts:updateSpeedRotatingPart(speedRotatingPart: any, dt: any, isPartActive: any)` | 478 | ✍ Per-frame update of one part: measures speed (from a reference node, the average wheel rotation of wheels in contact, or vehicle speed) and direction, or slows it down when inactive, advances `xDrive`, updates versatile steering (server, networked through the dirty flag) or direction alignment, rotates the nodes and writes shader scroll/rotation parameters. Note: with `dirRefNode` and without alignDirection it indexes `wheels[1]`, which would fail if no wheel is configured (UNVERIFIED in practice). |
| `SpeedRotatingParts:validateWashableNode(superFunc: any, node: any)` | 677 | ✍ For nodes belonging to a rotating part linked to wheels and carrying the dirt shader parameter, returns false plus the wheel dirt update function and node data copied from that wheel (dirt multipliers, wetness factor, colour change speed, snow node); otherwise defers to the parent. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadSpeedRotatingPartFromXML` | 80 |
| registerFunction | `getIsSpeedRotatingPartActive` | 81 |
| registerFunction | `getSpeedRotatingPartDirection` | 82 |
| registerFunction | `updateSpeedRotatingPart` | 83 |
| registerOverwrittenFunction | `validateWashableNode` | 89 |
| registerEventListener | `onLoad` | 95 |
| registerEventListener | `onReadStream` | 96 |
| registerEventListener | `onWriteStream` | 97 |
| registerEventListener | `onReadUpdateStream` | 98 |
| registerEventListener | `onWriteUpdateStream` | 99 |
| registerEventListener | `onUpdate` | 100 |
| registerEventListener | `onUpdateTick` | 101 |
