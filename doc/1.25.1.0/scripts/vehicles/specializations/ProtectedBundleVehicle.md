# vehicles/specializations/ProtectedBundleVehicle.lua

Source : `dataS/scripts/vehicles/specializations/ProtectedBundleVehicle.lua` — FS25 1.25.1.0

- **ProtectedBundleVehicle** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ProtectedBundleVehicle.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `ProtectedBundleVehicle.initSpecialization()` | 23 |  |
| `ProtectedBundleVehicle.registerOverwrittenFunctions(vehicleType: any)` | 36 |  |
| `ProtectedBundleVehicle.registerEventListeners(vehicleType: any)` | 42 |  |
| `ProtectedBundleVehicle:onLoad(savegame: table)` | 50 |  |
| `ProtectedBundleVehicle:onPostDetach()` | 75 |  |
| `ProtectedBundleVehicle:getReloadXML(superFunc: any) → string` | 84 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `getReloadXML` | 37 |
| registerEventListener | `onLoad` | 43 |
| registerEventListener | `onPostDetach` | 44 |
