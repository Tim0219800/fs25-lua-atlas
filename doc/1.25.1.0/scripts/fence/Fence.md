# fence/Fence.lua

*[Version française](../../fr/scripts/fence/Fence.md)*

Source: `dataS/scripts/fence/Fence.lua` — FS25 1.25.1.0

✍ Container object of a fence placeable: it owns the list of FenceSegment (and FenceGate) instances and the segment templates, and handles their XML schema, savegame writing and join-time network streaming. In this dump many methods used elsewhere (createNewSegment, getSegmentById, removeSegment, deleteSegmentPart...) are not present in the file, so their behaviour is UNVERIFIED.

- **Fence** (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `Fence.registerXMLPaths(schema: XMLSchema, basePath: string)` | 37 | ✍ Registers the placeable XML paths `fence.segment(?)#id` and `#class` (both required), then delegates to FenceSegment and FenceGate to register their own per-segment keys. Uses the "Fence" specialization type. |
| `Fence.registerSavegameXMLPaths(schema: XMLSchema, basePath: string)` | 54 | ✍ Registers the savegame XML paths for a fence: `segment(?)#id` (the id from the config XML) plus the savegame keys of FenceSegment and FenceGate. |
| `Fence:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 234 | ✍ Saves each segment under `segment(i)`. Segments whose `needsSaving` is false are skipped, and the `#id` attribute and index counter advance only when the segment's own save returns true. |
| `Fence:readStream(streamId: integer, connection: table)` | 251 | ✍ Client join: reads a UInt16 segment count, then per segment a UInt8 template index and its data (each chained to the previous segment), updates meshes (true, false) and finalizes it with true. |
| `Fence:writeStream(streamId: integer, connection: table)` | 269 | ✍ Server join: writes the UInt16 segment count, then per segment its UInt8 template index (found from its id) and its data, passing the previous segment for chaining. Mirror of readStream. |
