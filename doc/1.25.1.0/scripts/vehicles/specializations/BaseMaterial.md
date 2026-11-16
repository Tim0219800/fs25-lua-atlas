# vehicles/specializations/BaseMaterial.lua

*[Version française](../../../fr/scripts/vehicles/specializations/BaseMaterial.md)*

Source: `dataS/scripts/vehicles/specializations/BaseMaterial.lua` — FS25 1.25.1.0

✍ Empty specialization kept for compatibility. Despite the declared purpose of applying materials from the vehicle XML, the only code is an onLoad that warns about deprecated FS22 XML elements (vehicle.baseMaterial and the old design material configuration blocks) and points to vehicle.designColorConfigurations.

- **BaseMaterial** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `BaseMaterial.prerequisitesPresent(specializations: any)` | 15 | ✍ Always returns true: no other specialization is required. |
| `BaseMaterial.initSpecialization()` | 21 | ✍ Empty hook, registers no XML schema entries. |
| `BaseMaterial.registerFunctions(vehicleType: any)` | 26 | ✍ Empty hook, registers no vehicle functions. |
| `BaseMaterial.registerEventListeners(vehicleType: any)` | 31 | ✍ Registers the onLoad listener only. |
| `BaseMaterial:onLoad(savegame: any)` | 37 | ✍ Checks the vehicle XML for deprecated FS22 elements (baseMaterial, baseMaterialConfigurations, designMaterialConfigurations, designMaterial2/3Configurations) and logs a deprecation message; applies no material itself. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 32 |
