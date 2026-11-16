# placeables/specializations/PlaceableHandToolHolders.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableHandToolHolders.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableHandToolHolders.lua` — FS25 1.25.1.0

✍ Placeable specialization for placeables that contain hand tool holders (racks where hand tools are hung). In this SDK dump only the event registration stub and a setName override are present; the loading of the holders themselves is UNVERIFIED.

- **PlaceableHandToolHolders** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableHandToolHolders.registerEvents(vehicleType: any)` | 28 | ✍ Empty body in this dump: registers no event. Any intended events are UNVERIFIED. |
| `PlaceableHandToolHolders:setName(superFunc: any, name: any, noEventSend: any)` | 183 | ✍ Overrides setName: calls the parent, then forwards the new name to every hand tool holder in spec.handToolHolders so their display matches the placeable. |
