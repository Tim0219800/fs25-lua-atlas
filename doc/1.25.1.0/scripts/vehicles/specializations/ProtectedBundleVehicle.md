# vehicles/specializations/ProtectedBundleVehicle.lua

*[Version française](../../../fr/scripts/vehicles/specializations/ProtectedBundleVehicle.md)*

Source: `dataS/scripts/vehicles/specializations/ProtectedBundleVehicle.lua` — FS25 1.25.1.0

✍ Specialization for vehicles made of several parts that must behave as one unit. A bundle root stays selectable and resettable, while a bundle child is hidden from selection and overview. It has no prerequisites and reads its settings from the vehicle XML under vehicle.protectedBundleVehicle.

- **ProtectedBundleVehicle** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ProtectedBundleVehicle.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Always returns true: this specialization has no prerequisite specializations. |
| `ProtectedBundleVehicle.initSpecialization()` | 23 | ✍ Registers the XML schema entries isBundleRoot, isBundleChild (booleans, default false) and bundleFilename (string path) under vehicle.protectedBundleVehicle. |
| `ProtectedBundleVehicle.registerOverwrittenFunctions(vehicleType: any)` | 36 | ✍ Overrides getReloadXML on the vehicle type so a reset can respawn the whole bundle. |
| `ProtectedBundleVehicle.registerEventListeners(vehicleType: any)` | 42 | ✍ Subscribes the specialization to the onLoad and onPostDetach events. |
| `ProtectedBundleVehicle:onLoad(savegame: table)` | 50 | ✍ Reads the XML flags and the bundle file path, and warns if no store item exists for that path. A child gets canBeReset, showInVehicleOverview and allowSelection set to false. The onPostDetach listener is kept only for a child on the server. |
| `ProtectedBundleVehicle:onPostDetach()` | 75 | ✍ Deletes this child vehicle after it is detached, unless a reload or teleport is running or it is already being deleted. Only registered for server-side bundle children. |
| `ProtectedBundleVehicle:getReloadXML(superFunc: any) → string` | 84 | ✍ For a bundle root with a bundle file, returns the reload XML with vehicle(0)#filename replaced by the bundle file, so a reset spawns the bundle. Otherwise returns the parent result unchanged. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `getReloadXML` | 37 |
| registerEventListener | `onLoad` | 43 |
| registerEventListener | `onPostDetach` | 44 |
