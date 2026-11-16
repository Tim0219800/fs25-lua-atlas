# vehicles/wheels/WheelChock.lua

*[Version française](../../../fr/scripts/vehicles/wheels/WheelChock.md)*

Source: `dataS/scripts/vehicles/wheels/WheelChock.lua` — FS25 1.25.1.0

✍ A wheel chock (cale de roue) attached to a wheel: loads a shared i3d model, then either parks it on a parking node or places it against the tire, computing position from the wheel radius and chock height. Created per wheel and driven by the vehicle (which decides whether chocks are allowed).

- **WheelChock** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `WheelChock.new(wheel: any, customMt: any)` | 16 | ✍ Creates a chock for the given wheel; starts not in parking position with a zero wheel radius offset. |
| `WheelChock:delete()` | 29 | ✍ Deletes the chock node and releases the shared i3d load request. |
| `WheelChock:loadFromXML(xmlObject: any, key: any)` | 43 | ✍ Reads filename, parking node, scale, inversion, default parked state, offset and material from XML, calls the vehicle `onLoadWheelChockFromXML` hook and starts the shared i3d load. Returns false on an invalid filename. |
| `WheelChock:onI3DLoaded(i3dNode: integer, failedReason: table, args: table)` | 76 | ✍ Callback after the i3d is loaded: takes the first child as the chock node, reads `posRefNode`, `parkedNode` and `linkedNode` user attributes, applies scale and material, then calls `update`. Warns if `posRefNode` is missing. |
| `WheelChock:update(isInParkingPosition: any)` | 106 | ✍ Places the chock either in its parking node or against the wheel (computed from tire radius, chock height and offsets) and toggles visibility of the parked/linked helper nodes. Forced to parking if the vehicle does not allow chocks. Returns true when a node exists. |
| `WheelChock.registerXMLPaths(schema: any, key: any)` | 173 | ✍ Registers the XML schema paths of a wheel chock (filename, scale, parking node, inversion, default parked, offset) plus the vehicle material paths. |
