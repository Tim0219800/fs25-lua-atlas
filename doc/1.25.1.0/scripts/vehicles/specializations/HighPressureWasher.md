# vehicles/specializations/HighPressureWasher.lua

*[Version française](../../../fr/scripts/vehicles/specializations/HighPressureWasher.md)*

Source: `dataS/scripts/vehicles/specializations/HighPressureWasher.lua` — FS25 1.25.1.0

✍ Vehicle specialization for a high pressure washer station that provides animation nodes, effects and start, stop and work sounds on the client. It reacts to the events of HandToolHolders (hand tool stored in or taken from a holder), but this file defines no handler for them. The actual washing behaviour is not in this file (UNVERIFIED).


## Functions

| Function | Line | Description |
|---|---|---|
| `HighPressureWasher.prerequisitesPresent(specializations: any)` | 15 | ✍ Always returns true: no prerequisite on other specializations. |
| `HighPressureWasher.initSpecialization()` | 21 | ✍ Registers the XML paths under vehicle.highPressureWasher for animation nodes, effects and the start, stop and work sound samples. |
| `HighPressureWasher.registerEventListeners(vehicleType: any)` | 36 | ✍ Subscribes to onLoad, onDelete, onHandToolStoredInHolder and onHandToolTakenFromHolder. Note: the two hand tool handlers are not defined in this file (UNVERIFIED). |
| `HighPressureWasher:onLoad(savegame: table)` | 46 | ✍ Client only: loads animation nodes, effects and the three sound samples from the XML. On a dedicated server it removes the onDelete and onUpdate listeners. |
| `HighPressureWasher:onDelete()` | 67 | ✍ Client only: deletes the sound samples, animation nodes and effects created in onLoad. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 37 |
| registerEventListener | `onDelete` | 38 |
| registerEventListener | `onHandToolStoredInHolder` | 39 |
| registerEventListener | `onHandToolTakenFromHolder` | 40 |
