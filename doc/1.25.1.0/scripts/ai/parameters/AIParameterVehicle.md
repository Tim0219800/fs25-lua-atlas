# ai/parameters/AIParameterVehicle.lua

*[Version française](../../../fr/scripts/ai/parameters/AIParameterVehicle.md)*

Source: `dataS/scripts/ai/parameters/AIParameterVehicle.lua` — FS25 1.25.1.0

✍ AI job parameter that references one vehicle by network object id. It is displayed as the vehicle name and cannot be edited by the player once set. It is saved by vehicle unique id and validates that the vehicle exists and, by default, supports AI targets.

- **AIParameterVehicle** inherits from `AIParameter` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIParameterVehicle.new(customMt: any)` | 16 | ✍ Creates the parameter with type TEXT and no vehicle selected. |
| `AIParameterVehicle:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 27 | ✍ Writes the unique id of the vehicle to `#vehicleUniqueId` when a vehicle is resolved. Nothing is written otherwise. |
| `AIParameterVehicle:readStream(streamId: any, connection: any)` | 36 | ✍ Reads a presence flag and, if set, the network node object id of the vehicle. |
| `AIParameterVehicle:writeStream(streamId: any, connection: any)` | 44 | ✍ Writes a presence flag and, if a vehicle is set, its network node object id. |
| `AIParameterVehicle:getCanBeChanged()` | 52 | ✍ Always returns false: the player cannot change this parameter in the UI. |
| `AIParameterVehicle:getString()` | 58 | ✍ Returns the vehicle name for display, or an empty string if it cannot be resolved. |
| `AIParameterVehicle:setVehicle(vehicle: any)` | 69 | ✍ Stores the network object id of the given vehicle. |
| `AIParameterVehicle:getVehicle()` | 75 | ✍ Resolves the stored id to a vehicle and returns it only if it is synchronized, otherwise nil. |
| `AIParameterVehicle:validate(needsAITarget: any)` | 86 | ✍ Fails if no vehicle is set or it no longer exists. Unless the argument is false, it also requires the vehicle to have `setAITarget`. Returns a boolean and a localized error. |
