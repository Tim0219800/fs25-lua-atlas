# vehicles/specializations/VehicleSettings.lua

*[Version française](../../../fr/scripts/vehicles/specializations/VehicleSettings.md)*

Source: `dataS/scripts/vehicles/specializations/VehicleSettings.lua` — FS25 1.25.1.0

✍ Specialization that mirrors selected client-side game settings onto a vehicle. Other specializations register a setting by id; the state is updated when the client's setting changes while it controls the vehicle, and is sent to the server through `VehicleSettingsChangeEvent` so server-side logic can read it with `getVehicleSettingState`. It raises `onVehicleSettingChanged`. No prerequisites.

- **VehicleSettings** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleSettings.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Always returns true: no prerequisites. |
| `VehicleSettings.initSpecialization()` | 25 | ✍ Empty: registers nothing in the XML schema. |
| `VehicleSettings.registerFunctions(vehicleType: any)` | 30 | ✍ Adds registerVehicleSetting, setVehicleSettingState, getVehicleSettingState and forceVehicleSettingsUpdate to the vehicle type. |
| `VehicleSettings.registerEvents(vehicleType: any)` | 39 | ✍ Registers the event `onVehicleSettingChanged`. |
| `VehicleSettings.registerEventListeners(vehicleType: any)` | 45 | ✍ Subscribes to onPreLoad, onUpdateTick, onStateChange and onPreAttach. Note: onPreAttach is registered but no `VehicleSettings:onPreAttach` function exists in this file. |
| `VehicleSettings:onPreLoad(savegame: table)` | 55 | ✍ Initializes the empty settings list and dirty flag; on a server it removes the onUpdateTick listener since only clients send settings. |
| `VehicleSettings:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 71 | ✍ Client only: if any setting is dirty and this is a remote client (no local server), sends a `VehicleSettingsChangeEvent` to the server, then clears the vehicle dirty flag (individual setting flags stay set). |
| `VehicleSettings:registerVehicleSetting(gameSettingId: string, isBool: boolean)` | 96 | ✍ Registers a vehicle setting tied to a game setting id and subscribes to that setting's change message. The callback applies the new state only while the local player is active in this vehicle. |
| `VehicleSettings:forceVehicleSettingsUpdate()` | 116 | ✍ Pushes the current value of every registered game setting into the vehicle (without sending an event per setting), marking them dirty so the client sends them to the server. |
| `VehicleSettings:setVehicleSettingState(settingIndex: integer, state: any, noEventSend: boolean)` | 129 | ✍ Sets a setting's state by index, marks it dirty and raises `onVehicleSettingChanged`. Unless `noEventSend`, a remote client first sends the settings event to the server (before the new state is stored). |
| `VehicleSettings:getVehicleSettingState(gameSettingId: integer) → any` | 151 | ✍ Returns the stored state for the given game setting id, or nil if it is not registered or has no state yet. |
| `VehicleSettings:onStateChange(state: any, vehicle: any, isControlling: any)` | 163 | ✍ When the controlling player enters the vehicle (ENTER_VEHICLE), forces an update of all vehicle settings from the current game settings. |

## Specialization

| Type | Name | Line |
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

- subscribes `MessageType.SETTING_CHANGED` (l.109)
