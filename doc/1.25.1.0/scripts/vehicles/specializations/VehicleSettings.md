# vehicles/specializations/VehicleSettings.lua

Source : `dataS/scripts/vehicles/specializations/VehicleSettings.lua` — FS25 1.25.1.0

- **VehicleSettings** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleSettings.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `VehicleSettings.initSpecialization()` | 25 |  |
| `VehicleSettings.registerFunctions(vehicleType: any)` | 30 |  |
| `VehicleSettings.registerEvents(vehicleType: any)` | 39 |  |
| `VehicleSettings.registerEventListeners(vehicleType: any)` | 45 |  |
| `VehicleSettings:onPreLoad(savegame: table)` | 55 |  |
| `VehicleSettings:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 71 |  |
| `VehicleSettings:registerVehicleSetting(gameSettingId: string, isBool: boolean)` | 96 |  |
| `VehicleSettings:forceVehicleSettingsUpdate()` | 116 |  |
| `VehicleSettings:setVehicleSettingState(settingIndex: integer, state: any, noEventSend: boolean)` | 129 |  |
| `VehicleSettings:getVehicleSettingState(gameSettingId: integer) → any` | 151 |  |
| `VehicleSettings:onStateChange(state: any, vehicle: any, isControlling: any)` | 163 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `registerVehicleSetting` | 31 |
| registerFunction | `setVehicleSettingState` | 32 |
| registerFunction | `getVehicleSettingState` | 33 |
| registerFunction | `forceVehicleSettingsUpdate` | 34 |
| registerEvent | `onVehicleSettingChanged` | 40 |
| registerEventListener | `onPreLoad` | 46 |
| registerEventListener | `onUpdateTick` | 47 |
| registerEventListener | `onStateChange` | 48 |
| registerEventListener | `onPreAttach` | 49 |

## Messages

- écoute `MessageType.SETTING_CHANGED` (l.109)
