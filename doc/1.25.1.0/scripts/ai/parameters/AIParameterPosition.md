# ai/parameters/AIParameterPosition.lua

*[Version française](../../../fr/scripts/ai/parameters/AIParameterPosition.md)*

Source: `dataS/scripts/ai/parameters/AIParameterPosition.lua` — FS25 1.25.1.0

✍ AI job parameter holding a 2D world position (x, z). It is saved as XML float attributes, streamed as two float32 values, and validated against the AI system's reachability check. `AIParameterPositionAngle` extends it with a heading.

- **AIParameterPosition** inherits from `AIParameter` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIParameterPosition.new(customMt: any)` | 16 | ✍ Creates the parameter with type POSITION and no position. |
| `AIParameterPosition:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 29 | ✍ Writes `#x` and `#z` when a position is set. |
| `AIParameterPosition:loadFromXMLFile(xmlFile: any, key: any)` | 38 | ✍ Reads `#x` and `#z`, keeping current values if absent. |
| `AIParameterPosition:readStream(streamId: any, connection: any)` | 45 | ✍ Reads a presence flag and, if set, x and z as float32. |
| `AIParameterPosition:writeStream(streamId: any, connection: any)` | 55 | ✍ Writes a presence flag and, if a position is set, x and z as float32. |
| `AIParameterPosition:setPosition(x: any, z: any)` | 64 | ✍ Stores the x and z world coordinates. |
| `AIParameterPosition:getPosition()` | 71 | ✍ Returns x and z, both nil when unset. |
| `AIParameterPosition:getString()` | 77 | ✍ Returns the position formatted as "< x , z >" with one decimal. It errors if the position is nil (no nil check). |
| `AIParameterPosition:validate()` | 83 | ✍ Returns false with a localized error if the position is missing or `aiSystem:getIsPositionReachable(x, 0, z)` says it is blocked; otherwise true and nil. That AI system method is not in this file (UNVERIFIED). |
