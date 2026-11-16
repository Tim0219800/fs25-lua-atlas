# vehicles/specializations/BunkerSiloCompacter.lua

*[Version française](../../../fr/scripts/vehicles/specializations/BunkerSiloCompacter.md)*

Source: `dataS/scripts/vehicles/specializations/BunkerSiloCompacter.lua` — FS25 1.25.1.0

✍ Specialization for vehicles that compact bunker silo contents (rollers, tractors with wheels). It stores a compacting scale and an optional speed-limit flag from XML and, on clients, plays a rolling sound on ground contact and a compacting sound when a wheel touches ground-height (density map) contact. The actual compaction in the silo is not done here: it reads the scale elsewhere. Note: the code uses BunkerSiloCompacter.XML_PATH, which is never assigned in this file (UNVERIFIED where it is set).

- **BunkerSiloCompacter** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `BunkerSiloCompacter.prerequisitesPresent(specializations: any)` | 17 | ✍ Always returns true: no other specialization is required. |
| `BunkerSiloCompacter.initSpecialization()` | 23 | ✍ Registers the XML schema entries at XML_PATH: compactingScale, useSpeedLimit and the rolling and compacting sound samples. XML_PATH is not defined in this file, UNVERIFIED. |
| `BunkerSiloCompacter.registerFunctions(vehicleType: any)` | 38 | ✍ Registers loadBunkerSiloCompactorFromXML and getBunkerSiloCompacterScale on the vehicle type. |
| `BunkerSiloCompacter.registerOverwrittenFunctions(vehicleType: any)` | 45 | ✍ Overrides doCheckSpeedLimit on the vehicle type. |
| `BunkerSiloCompacter.registerEventListeners(vehicleType: any)` | 51 | ✍ Registers onLoad, onUpdate and onDelete. |
| `BunkerSiloCompacter:onLoad(savegame: any)` | 59 | ✍ Loads the compactor settings from XML and, on clients, the rolling and compacting samples. Removes the onUpdate listener if the vehicle has no getWheels function. |
| `BunkerSiloCompacter:onDelete()` | 79 | ✍ Deletes the loaded sound samples through the sound manager. |
| `BunkerSiloCompacter:loadBunkerSiloCompactorFromXML(xmlFile: any, key: any)` | 86 | ✍ Reads compactingScale (default 1) and useSpeedLimit (default false) from the given XML file and key into the specialization. |
| `BunkerSiloCompacter:getBunkerSiloCompacterScale()` | 94 | ✍ Returns the compacting scale read from XML (the spelling Compacter is in the source). |
| `BunkerSiloCompacter:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 104 | ✍ Scans the wheels for ground contact and for GROUND_HEIGHT contact (counted as compacting). When either state changes, starts or stops the rolling and compacting sounds accordingly. |
| `BunkerSiloCompacter:doCheckSpeedLimit(superFunc: any) → boolean` | 153 | ✍ When useSpeedLimit is set, returns the parent result or true while compacting, so the speed limit applies during compaction. Otherwise returns the parent result. |
| `BunkerSiloCompacter.getDefaultSpeedLimit() → number` | 165 | ✍ Static helper returning the default speed limit, the constant 5 (unit not stated in the code, probably km/h, UNVERIFIED). |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadBunkerSiloCompactorFromXML` | 39 |
| registerFunction | `getBunkerSiloCompacterScale` | 40 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 46 |
| registerEventListener | `onLoad` | 52 |
| registerEventListener | `onUpdate` | 53 |
| registerEventListener | `onDelete` | 54 |
