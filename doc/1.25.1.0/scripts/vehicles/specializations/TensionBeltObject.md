# vehicles/specializations/TensionBeltObject.lua

*[Version française](../../../fr/scripts/vehicles/specializations/TensionBeltObject.md)*

Source: `dataS/scripts/vehicles/specializations/TensionBeltObject.lua` — FS25 1.25.1.0

✍ Marks a vehicle as an object that tension belts can strap down, with no prerequisites. It reads vehicle.tensionBeltObject: a supports flag and a list of mesh nodes used for belt calculation. Mesh nodes must be shapes with the CPU-Mesh flag, otherwise they are skipped with an XML warning. Used by the TensionBelts specialization of the carrying vehicle.

- **TensionBeltObject** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `TensionBeltObject.prerequisitesPresent(specializations: any)` | 15 | ✍ Always returns true: no prerequisite specialization. |
| `TensionBeltObject.initSpecialization()` | 21 | ✍ Registers the XML schema: supportsTensionBelts (default true) and the list of mesh nodes. |
| `TensionBeltObject.registerFunctions(vehicleType: any)` | 33 | ✍ Registers getSupportsTensionBelts, getMeshNodes and getTensionBeltNodeId. |
| `TensionBeltObject.registerEventListeners(vehicleType: any)` | 41 | ✍ Subscribes to onLoad. |
| `TensionBeltObject:onLoad(savegame: table)` | 48 | ✍ Reads the support flag and collects the valid mesh nodes, skipping (with XML warnings) missing nodes, non-shapes and shapes lacking the CPU-Mesh flag. |
| `TensionBeltObject:getSupportsTensionBelts()` | 76 | ✍ Returns whether this vehicle may be strapped with tension belts. |
| `TensionBeltObject:getMeshNodes()` | 82 | ✍ Returns the list of valid mesh nodes used for belt calculation. |
| `TensionBeltObject:getTensionBeltNodeId()` | 88 | ✍ Returns the node of the first component, used as the belt reference node. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getSupportsTensionBelts` | 34 |
| registerFunction | `getMeshNodes` | 35 |
| registerFunction | `getTensionBeltNodeId` | 36 |
| registerEventListener | `onLoad` | 42 |
