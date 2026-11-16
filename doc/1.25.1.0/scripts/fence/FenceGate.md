# fence/FenceGate.lua

*[Version française](../../fr/scripts/fence/FenceGate.md)*

Source: `dataS/scripts/fence/FenceGate.lua` — FS25 1.25.1.0

✍ A fence segment that is a gate: subclass of FenceSegment which clones a gate node from the fence's i3d, drives one or more AnimatedObject doors, and optionally registers an AI blocking region so GoTo-AI agents wait and open it. It reads the `fence.segment(?).gate` XML keys (node, alignY, poles, length, depth, depthOffset), saves the reversed flag and animation state, and syncs doors to joining clients. Triggering is limited to farms with access to the farmland owner or its active mission.

- **FenceGate** inherits from `FenceSegment` (l.16)

## Functions

| Function | Line | Description |
|---|---|---|
| `FenceGate.registerXMLPaths(schema: XMLSchema, basePath: string)` | 22 | ✍ Registers the `.gate` XML keys (node, alignY, hasStartPole, hasEndPole, length, depth, depthOffset), the AnimatedObject keys, and per-animation `useAIBlockingRegion` (default false), `aiBlockingRegion#stopDistance` (default 2) and `#openedStateAnimTime` (default 1, normalized 0..1). |
| `FenceGate.registerSavegameXMLPaths(schema: XMLSchema, basePath: string)` | 41 | ✍ Registers savegame keys: the FenceSegment ones, `#reversed`, and `animatedObject(?)` with its `#id` and AnimatedObject savegame keys. |
| `FenceGate.new(id: integer, metadata: table, fence: Fence, customMt: table?) → FenceGate` | 55 | ✍ Creates a gate: reloads the fence i3d privately, detaches the gate node as a hidden root, and builds an AnimatedObject per `animatedObject` entry. Each one is only triggerable by farms allowed to access the farmland owner or mission farm. An AI blocking region is stored only if the gate is wider than FenceGate.MIN_WIDTH_AI_BLOCKING_REGION (defined outside this file, UNVERIFIED). |
| `FenceGate.loadMetadataFromXML(xmlFile: XMLFile, key: string, id: string, fence: Fence) → table` | 127 | ✍ Extends the segment metadata with the class FenceGate and a `gate` table read from `.gate` (length, depth, depthOffset, alignY, pole flags defaulting to true), and registers the shared gate node as a source node of the fence so it leaves the scene and physics. |
| `FenceGate:delete()` | 161 | ✍ Removes each AI blocking region from the AI system and deletes the animated objects, deletes the hidden root node, unsubscribes from FARMLAND_OWNER_CHANGED, then calls the parent delete. Note: `blockingRegionId` is read but never assigned in this file (UNVERIFIED where it is set). |
| `FenceGate:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 189 | ✍ Loads the reversed flag and the parent data, then raises start and end Y to terrain height (always on a new savegame, otherwise only if below terrain) and rebuilds meshes if changed. Then restores each animated object state matched by saved id. Returns false if the parent load fails. |
| `FenceGate:saveToXMLFile(xmlFile: XMLFile, key: string) → boolean` | 232 | ✍ Saves the parent data, `#reversed` only when true, and every animated object under `animatedObject(i)` with its save id. Returns false if the parent save fails. A TODO in the source notes mod names are not handled. |
| `FenceGate:readStream(streamId: integer, connection: table, lastSegment: FenceSegment)` | 259 | ✍ Reads the parent segment data and the reversed Bool; on a client, for each animated object also reads its network object id and state, and finishes registering it with the client. |
| `FenceGate:writeStream(streamId: integer, connection: table, lastSegment: FenceSegment)` | 280 | ✍ Writes the parent segment data and the reversed Bool; for a connection to a client, writes each animated object's network id and state and registers the object in the stream. |
