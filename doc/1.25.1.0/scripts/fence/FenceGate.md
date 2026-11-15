# fence/FenceGate.lua

Source: `dataS/scripts/fence/FenceGate.lua` — FS25 1.25.1.0

- **FenceGate** inherits from `FenceSegment` (l.16)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `FenceGate.registerXMLPaths(schema: XMLSchema, basePath: string)` | 22 |  |
| `FenceGate.registerSavegameXMLPaths(schema: XMLSchema, basePath: string)` | 41 |  |
| `FenceGate.new(id: integer, metadata: table, fence: Fence, customMt: table?) → FenceGate` | 55 |  |
| `FenceGate.loadMetadataFromXML(xmlFile: XMLFile, key: string, id: string, fence: Fence) → table` | 127 |  |
| `FenceGate:delete()` | 161 |  |
| `FenceGate:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 189 |  |
| `FenceGate:saveToXMLFile(xmlFile: XMLFile, key: string) → boolean` | 232 |  |
| `FenceGate:readStream(streamId: integer, connection: table, lastSegment: FenceSegment)` | 259 |  |
| `FenceGate:writeStream(streamId: integer, connection: table, lastSegment: FenceSegment)` | 280 |  |
