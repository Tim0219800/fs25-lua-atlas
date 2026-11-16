# vehicles/specializations/CylinderedFoldable.lua

*[Version française](../../../fr/scripts/vehicles/specializations/CylinderedFoldable.md)*

Source: `dataS/scripts/vehicles/specializations/CylinderedFoldable.lua` — FS25 1.25.1.0

✍ Small glue specialization for vehicles that have both Cylindered (moving tools) and Foldable. It lets the moving tool states be applied at a chosen moment, once the fold animation has reached a given time, and it repairs the network sync order between the two. It requires Cylindered and Foldable and reads two attributes under vehicle.cylindered in the vehicle XML.

- **CylinderedFoldable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `CylinderedFoldable.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Returns true only if the vehicle type has both the Cylindered and Foldable specializations. |
| `CylinderedFoldable.initSpecialization()` | 23 | ✍ Registers the XML schema entries vehicle.cylindered#loadMovingToolStatesAfterFolding (bool, default false) and vehicle.cylindered#loadMovingToolStatesFoldTime (float). |
| `CylinderedFoldable.registerEventListeners(vehicleType: any)` | 35 | ✍ Subscribes the specialization to onLoad, onPreInitComponentPlacement, onReadStream and onWriteStream. |
| `CylinderedFoldable:onLoad(savegame: table)` | 45 | ✍ Reads the two XML settings (reload flag and target fold time) into spec_cylinderedFoldable. |
| `CylinderedFoldable:onPreInitComponentPlacement(savegame: any)` | 54 | ✍ If the reload flag is set and either no fold time is configured or the current fold animation time equals it, it calls Cylindered.onPostLoad again so the moving tool states are applied after folding. |
| `CylinderedFoldable:onReadStream(streamId: any, connection: any)` | 66 | ✍ Client-side join sync: finishes the fold animation instantly, then reads a bool and, if true, re-runs Cylindered.onReadStream (Foldable overrode it). On the client side of the connection it also refreshes dependent animations of dirty moving tools. |
| `CylinderedFoldable:onWriteStream(streamId: any, connection: any)` | 88 | ✍ Writes a bool telling whether the fold time matches the configured one (or none is configured), and only in that case calls Cylindered.onWriteStream. Mirrors the read logic. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 36 |
| registerEventListener | `onPreInitComponentPlacement` | 37 |
| registerEventListener | `onReadStream` | 38 |
| registerEventListener | `onWriteStream` | 39 |
