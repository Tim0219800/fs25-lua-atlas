# vehicles/specializations/VineCutter.lua

*[Version française](../../../fr/scripts/vehicles/specializations/VineCutter.md)*

Source: `dataS/scripts/vehicles/specializations/VineCutter.lua` — FS25 1.25.1.0

✍ Specialization for vine cutters (grape harvest tools). It depends on a vine detection specialization (`VineDetector`) providing `raycastCallbackVineDetection`, adds the `vineCutter` configuration type and reads the input fruit type and optional fruit type converter, from which it derives the output fill type and conversion factor. Only onLoad and onDraw have bodies in this file; the other registered functions are not defined here in the dump (UNVERIFIED).

- **VineCutter** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `VineCutter.initSpecialization()` | 16 | ✍ Adds the `vineCutter` configuration type and registers the XML paths `fruitType` and `fruitTypeConverter`, both at base level and per configuration. |
| `VineCutter.prerequisitesPresent(specializations: any)` | 33 | ✍ Always returns true: no prerequisites (the vine detection dependency is checked at load time instead). |
| `VineCutter.registerFunctions(vehicleType: any)` | 39 | ✍ Registers `getCombine` and `harvestCallback` on the vehicle type. Their implementations are not present in this file (UNVERIFIED). |
| `VineCutter.registerOverwrittenFunctions(vehicleType: any)` | 46 | ✍ Registers overrides for doCheckSpeedLimit, getCanStartVineDetection, getIsValidVinePlaceable, handleVinePlaceable, clearCurrentVinePlaceable and getAIImplementUseVineSegment. Bodies are not present in this file (UNVERIFIED). |
| `VineCutter.registerEventListeners(vehicleType: any)` | 57 | ✍ Subscribes to onLoad, onPostLoad, onDraw and onTurnedOff. Only onLoad and onDraw are defined in this file. |
| `VineCutter:onLoad(savegame: any)` | 66 | ✍ Warns and returns if no `raycastCallbackVineDetection` exists. Otherwise picks the fruit type from the configuration or base XML (default `FruitType.GRAPE`), loads an optional fruit type converter, and sets the output fill type and conversion factor (1 without converter). |
| `VineCutter:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 128 | ✍ Shows the blinking warning that the player has no access to this land while the `showFarmlandNotOwnedWarning` flag is set. Note: if onLoad returned early the spec fields are nil and this would fail on the flag check (inferred from the code). |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getCombine` | 40 |
| registerFunction | `harvestCallback` | 41 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 47 |
| registerOverwrittenFunction | `getCanStartVineDetection` | 48 |
| registerOverwrittenFunction | `getIsValidVinePlaceable` | 49 |
| registerOverwrittenFunction | `handleVinePlaceable` | 50 |
| registerOverwrittenFunction | `clearCurrentVinePlaceable` | 51 |
| registerOverwrittenFunction | `getAIImplementUseVineSegment` | 52 |
| registerEventListener | `onLoad` | 58 |
| registerEventListener | `onPostLoad` | 59 |
| registerEventListener | `onDraw` | 60 |
| registerEventListener | `onTurnedOff` | 61 |
