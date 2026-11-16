# vehicles/specializations/TipOccluder.lua

*[Version française](../../../fr/scripts/vehicles/specializations/TipOccluder.md)*

Source: `dataS/scripts/vehicles/specializations/TipOccluder.lua` — FS25 1.25.1.0

✍ Specialization (no prerequisites) that defines ground areas where material must not be tipped, for example under the wheels. Areas come from vehicle.tipOccluder.occlusionArea in XML, and are also auto-built from wheels that share a tipOcclusionAreaGroupId (a box around those wheels' contact zone). Other systems read them through getTipOcclusionAreas.

- **TipOccluder** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `TipOccluder.prerequisitesPresent(specializations: any)` | 16 | ✍ Always returns true: no prerequisite specialization. |
| `TipOccluder.initSpecialization()` | 22 | ✍ Registers the XML schema of occlusionArea entries: start, width and height nodes. |
| `TipOccluder.registerFunctions(vehicleType: any)` | 35 | ✍ Registers getTipOcclusionAreas, getWheelsWithTipOcclisionAreaGroupId and getRequiresTipOcclusionArea. |
| `TipOccluder.registerOverwrittenFunctions(vehicleType: any)` | 43 | ✍ Empty: registers no overridden functions. |
| `TipOccluder.registerEventListeners(vehicleType: any)` | 48 | ✍ Subscribes to onLoad and onLoadFinished. |
| `TipOccluder:onLoad(savegame: any)` | 55 | ✍ Reads every occlusionArea with its three nodes into the list (skipping incomplete ones) and warns about the old FS17-FS19 key. |
| `TipOccluder:onLoadFinished(savegame: any)` | 83 | ✍ For wheels with a tipOcclusionAreaGroupId, creates one area per group (three transform nodes) and resizes it to cover the wheels' contact footprint. Warns in dev mode if the vehicle requires an area but has none. |
| `TipOccluder:getTipOcclusionAreas()` | 158 | ✍ Returns the list of occlusion areas, each with start, width and height nodes. |
| `TipOccluder:getWheelsWithTipOcclisionAreaGroupId(wheels: any, groupId: any)` | 164 | ✍ Returns a new table of the wheels whose physics has the given tipOcclusionAreaGroupId. Note: 'Occlision' is misspelled in the name. |
| `TipOccluder:getRequiresTipOcclusionArea()` | 176 | ✍ Returns false by default; other specializations can override it to demand at least one occlusion area. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getTipOcclusionAreas` | 36 |
| registerFunction | `getWheelsWithTipOcclisionAreaGroupId` | 37 |
| registerFunction | `getRequiresTipOcclusionArea` | 38 |
| registerEventListener | `onLoad` | 49 |
| registerEventListener | `onLoadFinished` | 50 |
