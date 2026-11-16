# vehicles/specializations/FillTriggerVehicle.lua

*[Version française](../../../fr/scripts/vehicles/specializations/FillTriggerVehicle.md)*

Source: `dataS/scripts/vehicles/specializations/FillTriggerVehicle.lua` — FS25 1.25.1.0

✍ Vehicle specialization that turns a vehicle with a fill unit (fuel, milk, water or slurry trailers, for example) into a fill source: it creates a FillTrigger on a node of the vehicle so other vehicles can be filled from it. Requires the FillUnit specialization. Configured under vehicle.fillTriggerVehicle in the XML.

- **FillTriggerVehicle** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `FillTriggerVehicle.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Returns true only if the FillUnit specialization is present. |
| `FillTriggerVehicle.initSpecialization()` | 23 | ✍ Registers the XML keys triggerNode, fillUnitIndex (default 1) and litersPerSecond (default 200) under vehicle.fillTriggerVehicle. |
| `FillTriggerVehicle.registerOverwrittenFunctions(vehicleType: any)` | 36 | ✍ Overrides getDrawFirstFillText on the vehicle type. |
| `FillTriggerVehicle.registerEventListeners(vehicleType: any)` | 42 | ✍ Subscribes to onLoad, onDelete, onReadStream and onWriteStream. Note: no onReadStream function is defined in this file, so that listener points to nothing here. |
| `FillTriggerVehicle:onLoad(savegame: table)` | 52 | ✍ If a triggerNode is configured, creates the FillTrigger with the fill unit index and flow rate. Outside the shop configuration, the server also registers a finance money type (finance_purchaseFuel) on the trigger. |
| `FillTriggerVehicle:onDelete()` | 72 | ✍ Deletes the fill trigger if one exists. |
| `FillTriggerVehicle:onWriteStream(streamId: any, connection: any)` | 95 | ✍ Server to client: writes the id of the trigger's money change type as a 16-bit integer when a trigger exists. No matching read function exists in this file, so the client side is UNVERIFIED. |
| `FillTriggerVehicle:getDrawFirstFillText(superFunc: any)` | 106 | ✍ On clients, returns true when the configured fill unit is empty but has a non-zero capacity; otherwise defers to the parent implementation. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `getDrawFirstFillText` | 37 |
| registerEventListener | `onLoad` | 43 |
| registerEventListener | `onDelete` | 44 |
| registerEventListener | `onReadStream` | 45 |
| registerEventListener | `onWriteStream` | 46 |
