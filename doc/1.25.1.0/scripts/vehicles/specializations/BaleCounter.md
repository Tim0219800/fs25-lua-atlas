# vehicles/specializations/BaleCounter.lua

*[Version française](../../../fr/scripts/vehicles/specializations/BaleCounter.md)*

Source: `dataS/scripts/vehicles/specializations/BaleCounter.lua` — FS25 1.25.1.0

✍ Specialization that counts the bales dropped by a baler: a resettable session counter and a lifetime counter, both saved with the vehicle and sent to joining clients. It requires the Baler specialization, overrides `dropBale`, exposes both counters as dashboard values and shows them through a HUD extension. A reset input exists inside the vehicle and at an external trigger, and the reset is sent through BaleCounterResetEvent. The onDelete and onDraw handlers are registered but have no body in the SDK dump: UNVERIFIED.


## Functions

| Function | Line | Description |
|---|---|---|
| `BaleCounter.prerequisitesPresent(specializations: table) → boolean` | 23 | ✍ Returns true only if the vehicle type includes the Baler specialization. |
| `BaleCounter.initSpecialization()` | 29 | ✍ Registers the dashboard XML paths for `vehicle.baleCounter.dashboards` (sessionCounter, lifetimeCounter) and the two savegame counters. |
| `BaleCounter.registerFunctions(vehicleType: any)` | 44 | ✍ Registers the vehicle function `doBaleCounterReset`. |
| `BaleCounter.registerOverwrittenFunctions(vehicleType: any)` | 50 | ✍ Overrides `dropBale` so every dropped bale increments the counters. |
| `BaleCounter.registerEventListeners(vehicleType: any)` | 56 | ✍ Subscribes to onLoad, onDelete, onDraw, onRegisterDashboardValueTypes, onReadStream, onWriteStream, onRegisterActionEvents and onRegisterExternalActionEvents. |
| `BaleCounter:onLoad(savegame: any)` | 69 | ✍ Zeroes both counters, restores them from a non-reset savegame, and creates the BaleCounterHUDExtension for the vehicle. |
| `BaleCounter:onRegisterDashboardValueTypes()` | 100 | ✍ Registers the dashboard value types `baleCounter.sessionCounter` and `baleCounter.lifetimeCounter`, bound to the spec fields and not polled (updated explicitly). |
| `BaleCounter:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 116 | ✍ Saves the session and lifetime counters as attributes of the vehicle's `baleCounter` entry. |
| `BaleCounter:onReadStream(streamId: integer, connection: Connection)` | 126 | ✍ Client join: reads both counters from the stream with `BaleCounter.SEND_NUM_BITS` bits each. |
| `BaleCounter:onWriteStream(streamId: integer, connection: Connection)` | 136 | ✍ Server side of a client join: writes both counters to the stream with `BaleCounter.SEND_NUM_BITS` bits each. |
| `BaleCounter:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 144 | ✍ On clients, registers the powered BALE_COUNTER_RESET input with high text priority when the vehicle is active for input, ignoring selection. |
| `BaleCounter:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 158 | ✍ When an external trigger is named `baleCounterReset`, registers the external action event callbacks for it. |
| `BaleCounter.actionEventResetCounter(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 166 | ✍ Input callback for the in-vehicle reset: calls `doBaleCounterReset`. |
| `BaleCounter.externalActionEventRegister(data: any, vehicle: any)` | 172 | ✍ Registers the BALE_COUNTER_RESET input for an external trigger, resetting the counter of the given vehicle, with high text priority. |
| `BaleCounter.externalActionEventUpdate(data: any, vehicle: any)` | 184 | ✍ Empty update hook for the external action event; does nothing. |
| `BaleCounter:doBaleCounterReset(noEventSend: any)` | 189 | ✍ Sets the session counter to 0 (the lifetime counter is kept) and sends BaleCounterResetEvent unless `noEventSend` is set. The dashboard value is not refreshed here. |
| `BaleCounter:dropBale(superFunc: any, baleIndex: any)` | 199 | ✍ Calls the parent `dropBale`, then adds 1 to both counters and refreshes the two dashboard values if dashboards are available. There is no server check in this function. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `doBaleCounterReset` | 45 |
| registerOverwrittenFunction | `dropBale` | 51 |
| registerEventListener | `onLoad` | 57 |
| registerEventListener | `onDelete` | 58 |
| registerEventListener | `onDraw` | 59 |
| registerEventListener | `onRegisterDashboardValueTypes` | 60 |
| registerEventListener | `onReadStream` | 61 |
| registerEventListener | `onWriteStream` | 62 |
| registerEventListener | `onRegisterActionEvents` | 63 |
| registerEventListener | `onRegisterExternalActionEvents` | 64 |
