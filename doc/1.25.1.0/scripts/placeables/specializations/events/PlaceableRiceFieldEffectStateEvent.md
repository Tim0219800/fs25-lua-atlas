# placeables/specializations/events/PlaceableRiceFieldEffectStateEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/events/PlaceableRiceFieldEffectStateEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableRiceFieldEffectStateEvent.lua` — FS25 1.25.1.0

✍ Network event that carries the effect visibility of one rice field (filling or emptying water effects) of a PlaceableRiceField, so that the effects appear on the receiving side. It derives from `Event` with the default channel and has no sender helper; it is created by the placeable code, which is not part of this file.

- **PlaceableRiceFieldEffectStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableRiceFieldEffectStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the class metatable, used by the network layer before reading a stream. |
| `PlaceableRiceFieldEffectStateEvent.new(placeableRiceField: any, fieldIndex: any, isFilling: any, isEmptying: any)` | 20 | ✍ Builds the event with the rice field placeable, a field index and two booleans telling whether water effects for filling or emptying are shown. |
| `PlaceableRiceFieldEffectStateEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads the rice field object, a UInt8 field index and the two flags, then runs the event immediately. No server/client branching in the code. |
| `PlaceableRiceFieldEffectStateEvent:writeStream(streamId: integer, connection: Connection)` | 48 | ✍ Writes the rice field object, the UInt8 field index and the two boolean flags, mirroring `readStream`. |
| `PlaceableRiceFieldEffectStateEvent:run(connection: Connection)` | 58 | ✍ Ignored if the rice field is nil or not yet synchronized; otherwise calls `setEffectVisibility` on it with the field index and the filling/emptying flags. |
