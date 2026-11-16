# ai/parameters/AIParameterPositionAngle.lua

*[Version française](../../../fr/scripts/ai/parameters/AIParameterPositionAngle.md)*

Source: `dataS/scripts/ai/parameters/AIParameterPositionAngle.lua` — FS25 1.25.1.0

✍ AI job parameter that stores a map position plus a heading angle (radians). It extends AIParameterPosition, adds XML and network persistence of the angle, and snaps the angle to a configurable step. Validation requires an angle in addition to the position checks of the parent.

- **AIParameterPositionAngle** inherits from `AIParameterPosition` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIParameterPositionAngle.new(snappingAngle: any, customMt: any)` | 16 | ✍ Creates the parameter with type POSITION_ANGLE, no angle yet, and a snapping step (absolute value of the argument, default 5 degrees in radians). |
| `AIParameterPositionAngle:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 29 | ✍ Calls the parent save, then writes the angle to the `#angle` attribute of the key if one is set. |
| `AIParameterPositionAngle:loadFromXMLFile(xmlFile: any, key: any)` | 38 | ✍ Calls the parent load, then reads `#angle` from the key, keeping the current value if the attribute is absent. |
| `AIParameterPositionAngle:readStream(streamId: any, connection: any)` | 46 | ✍ Reads the parent data, then an optional angle sent as a 9-bit integer in degrees, converted to radians via setAngle. |
| `AIParameterPositionAngle:writeStream(streamId: any, connection: any)` | 57 | ✍ Writes the parent data, then a presence flag and the angle converted to degrees as a 9-bit integer. Precision is limited to whole degrees (UNVERIFIED rounding in the engine write call). |
| `AIParameterPositionAngle:setAngle(angleRad: any)` | 68 | ✍ Normalizes the angle to the range 0 to 2 pi, then rounds it to the nearest multiple of the snapping step when that step is above zero, and stores it. |
| `AIParameterPositionAngle:getAngle()` | 85 | ✍ Returns the stored angle in radians, or nil if none was set. |
| `AIParameterPositionAngle:getDirection()` | 91 | ✍ Returns the x and z components of the unit direction for the stored angle (via MathUtil), or nil, nil when no angle is set. |
| `AIParameterPositionAngle:setSnappingAngle(angle: any)` | 103 | ✍ Sets the snapping step in radians, stored as an absolute value. It does not re-snap an angle already stored. |
| `AIParameterPositionAngle:getSnappingAngle()` | 109 | ✍ Returns the current snapping step in radians. |
| `AIParameterPositionAngle:getString()` | 115 | ✍ Builds a display string with the x and z coordinates and the angle in degrees. Note: it formats the angle unconditionally, so it errors if no angle is set. |
| `AIParameterPositionAngle:validate(fillTypeIndex: any, farmId: any)` | 121 | ✍ Runs the parent validation first, then fails with the localized no-angle message if the angle is nil. Returns a boolean and an optional error text. |
