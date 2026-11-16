# vehicles/specializations/HandToolHolders.lua

*[Version française](../../../fr/scripts/vehicles/specializations/HandToolHolders.md)*

Source: `dataS/scripts/vehicles/specializations/HandToolHolders.lua` — FS25 1.25.1.0

✍ Vehicle specialization that gives a vehicle one or more hand tool holders, created through the HandToolHolder class from the vehicle XML (optionally per configuration). It names each holder after the vehicle and brand, saves and restores their contents, synchronizes them to joining clients, and forwards the owner farm. It raises the events onHandToolStoredInHolder and onHandToolTakenFromHolder. It declares no prerequisitesPresent in this file.

- **HandToolHolders** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolHolders.registerEvents(vehicleType: any)` | 35 | ✍ Registers the vehicle events onHandToolStoredInHolder and onHandToolTakenFromHolder. |
| `HandToolHolders.registerFunctions(vehicleType: any)` | 42 | ✍ Registers onHandToolHolderFinished as a vehicle function, used as the load-finished callback of each holder. |
| `HandToolHolders.registerOverwrittenFunctions(vehicleType: any)` | 48 | ✍ Overrides setOwnerFarmId so the owner is propagated to the holders. |
| `HandToolHolders.registerEventListeners(vehicleType: any)` | 54 | ✍ Subscribes to onLoad, onDelete, saveToXMLFile, onWriteStream, onReadStream and onRegistered. Note: no onRegistered function is defined in this file, so that listener may be UNVERIFIED. |
| `HandToolHolders:onLoad(savegame: any)` | 65 | ✍ Picks the holder configuration (falling back to the plain vehicle.handToolHolders node), builds a display name from brand and vehicle name, and starts loading every handToolHolder asynchronously with a loading task. |
| `HandToolHolders:onHandToolHolderFinished(handToolHolder: any, args: any)` | 103 | ✍ Load-finished callback: sets the holder's owner farm, hooks store and pickup callbacks to the two vehicle events, adds it to the list and restores its saved state matching its index. Always closes the loading task. |
| `HandToolHolders:onDelete()` | 134 | ✍ Deletes every hand tool holder and clears the list. |
| `HandToolHolders:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 147 | ✍ Saves each holder under handToolHolder entries with a 1-based index attribute, delegating the content to the holder. |
| `HandToolHolders:onWriteStream(streamId: any, connection: any)` | 161 | ✍ Server side: writes each holder's network id and state to the connecting client and registers the holder object in that stream. |
| `HandToolHolders:onReadStream(streamId: any, connection: any)` | 176 | ✍ Client side: reads each holder's network id and state, then finishes registering the holder object with the client. |
| `HandToolHolders:setOwnerFarmId(superFunc: any, ownerFarmId: any, noEventSend: any)` | 191 | ✍ Calls the parent, then passes the same owner farm id to every holder without sending another network event. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onHandToolStoredInHolder` | 36 |
| registerEvent | `onHandToolTakenFromHolder` | 37 |
| registerFunction | `onHandToolHolderFinished` | 43 |
| registerOverwrittenFunction | `setOwnerFarmId` | 49 |
| registerEventListener | `onLoad` | 55 |
| registerEventListener | `onDelete` | 56 |
| registerEventListener | `saveToXMLFile` | 57 |
| registerEventListener | `onWriteStream` | 58 |
| registerEventListener | `onReadStream` | 59 |
| registerEventListener | `onRegistered` | 60 |
