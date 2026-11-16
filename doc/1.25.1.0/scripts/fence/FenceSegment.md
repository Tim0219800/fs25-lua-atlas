# fence/FenceSegment.lua

*[Version française](../../fr/scripts/fence/FenceSegment.md)*

Source: `dataS/scripts/fence/FenceSegment.lua` — FS25 1.25.1.0

✍ One straight run of a fence: a start and end world position, optional start/end poles and a chain of panels built from the segment template metadata. This dump only keeps the XML schema, savegame position saving, network streaming and position getters; the mesh building, finalize, delete and validation methods that other fence files call (updateMeshes, finalize, getPrice, getCanBeBuilt...) are not present, so their behaviour is UNVERIFIED. FenceGate extends this class.

- **FenceSegment** (l.33)

## Functions

| Function | Line | Description |
|---|---|---|
| `FenceSegment.registerXMLPaths(schema: any, basePath: any)` | 37 | ✍ Registers the per-segment XML keys: slope/vertical angle limits, snap distances, parallel snapping and extending settings, `#price`, `poles.pole(?)` (variation, node, radius, height) and `panels` (maxScale, useRandomization, `panel(?)` with node, collisionNode, length, width, height, alignY, scaleZ). |
| `FenceSegment:saveToXMLFile(xmlFile: any, key: any)` | 370 | ✍ Writes the start and end positions as translations under `#start` and `#end`. Returns false (with a dev log) if either position is unset, which makes the caller skip the segment. |
| `FenceSegment:readStream(streamId: integer, connection: table, lastSegment: FenceSegment)` | 387 | ✍ Reads the segment from a stream: the UInt16 id (only when the sender is the server), a start position or, if the Bool is false, the previous segment's end, then the compressed end position, pole flags if the template has poles, and the split-rebuild flag. Registers terrain-height callbacks. |
| `FenceSegment:writeStream(streamId: integer, connection: table, lastSegment: FenceSegment)` | 426 | ✍ Mirror of readStream: writes the id (when sending to a client), skips the start position when it equals the previous segment's end, then the compressed end position, pole flags and the split-rebuild flag. |
| `FenceSegment:getStartPos() → number, number, number` | 563 | ✍ Returns the start position as three numbers (x, y, z). |
| `FenceSegment:getStartPosVector() → vector?` | 570 | ✍ Returns the start position as a vector, or nil if it is not set yet. |
| `FenceSegment:getEndPos() → number, number, number` | 622 | ✍ Returns the end position as three numbers (x, y, z). |
| `FenceSegment:getSegmentPartStartEnd(node: integer) → number?, number?, number?, number?, number?, number?, boolean?, boolean?` | 1193 | ✍ Resolves a node to its segment part (via getSegmentPartFromNode, not in this file, UNVERIFIED) and returns its start and end world positions plus whether it is the first or last part of the segment (0.01 distance tolerance). Returns nil if no part is found. |
