# ai/parameters/AIParameterUnloadingStation.lua

*[Version française](../../../fr/scripts/ai/parameters/AIParameterUnloadingStation.md)*

Source: `dataS/scripts/ai/parameters/AIParameterUnloadingStation.lua` — FS25 1.25.1.0

✍ AI job parameter that selects an unloading station (for example a sell point or storage) the AI should deliver to. It keeps network object ids, supports cycling through a list of valid stations, and saves the choice by owning placeable unique id plus station index. Related managers are g_currentMission.storageSystem and placeableSystem.

- **AIParameterUnloadingStation** inherits from `AIParameter` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIParameterUnloadingStation.new(customMt: any)` | 16 | ✍ Creates the parameter with type UNLOADING_STATION, no selected station and an empty list of valid station ids. |
| `AIParameterUnloadingStation:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 29 | ✍ Saves the selected station as the unique id of its owning placeable (`#stationUniqueId`) and its index in that placeable (`#stationIndex`). Nothing is written if the station, owner or index cannot be resolved. |
| `AIParameterUnloadingStation:loadFromXMLFile(xmlFile: any, key: any)` | 48 | ✍ Reads the station unique id and index. If the placeable is not loaded yet, it subscribes a one-shot callback on the LOADED_ALL_SAVEGAME_PLACEABLES message to retry. |
| `AIParameterUnloadingStation:onPlaceableLoaded(args: any)` | 61 | ✍ Message callback that retries the station lookup using the unique id and index passed in the args table. |
| `AIParameterUnloadingStation:setUnloadingStationFromUniqueId(uniqueId: any, index: any)` | 67 | ✍ Finds the placeable by unique id, fetches its unloading station at the given index from the storage system and selects it. Returns true if the placeable exists, false otherwise. |
| `AIParameterUnloadingStation:readStream(streamId: any, connection: any)` | 81 | ✍ Reads a presence flag and, if set, the network node object id of the selected station. |
| `AIParameterUnloadingStation:writeStream(streamId: any, connection: any)` | 89 | ✍ Writes a presence flag and, if a station is selected, its network node object id. |
| `AIParameterUnloadingStation:setUnloadingStation(unloadingStation: any)` | 97 | ✍ Selects the given station by storing its network object id. |
| `AIParameterUnloadingStation:getUnloadingStation()` | 103 | ✍ Resolves the stored id to a station object. Returns it only if its owning placeable exists and is synchronized, otherwise nil. |
| `AIParameterUnloadingStation:getString()` | 114 | ✍ Returns the station name for display, or an empty string if it cannot be resolved. |
| `AIParameterUnloadingStation:setValidUnloadingStations(unloadingStations: any)` | 125 | ✍ Replaces the list of selectable stations with the ids of the given stations. Keeps the current selection if it is still in the list, otherwise selects the first entry. |
| `AIParameterUnloadingStation:setNextItem()` | 145 | ✍ Selects the next station in the valid list, wrapping around to the first after the last. |
| `AIParameterUnloadingStation:setPreviousItem()` | 162 | ✍ Selects the previous station in the valid list, wrapping around to the last before the first. |
| `AIParameterUnloadingStation:validate(fillTypeIndex: any, farmId: any)` | 179 | ✍ Fails if no station is selected or it no longer exists. With a fill type, it also requires AI support for that fill type and free capacity for the farm. Returns a boolean and a localized error. |
