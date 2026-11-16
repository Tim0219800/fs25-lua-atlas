# ai/parameters/AIParameterLoadingStation.lua

*[Version française](../../../fr/scripts/ai/parameters/AIParameterLoadingStation.md)*

Source: `dataS/scripts/ai/parameters/AIParameterLoadingStation.lua` — FS25 1.25.1.0

✍ AI job parameter holding a reference to a loading station, stored as a network object id and chosen from a list of valid stations. It is saved by owning placeable unique id plus station index, and resolved lazily after savegame placeables have loaded.

- **AIParameterLoadingStation** inherits from `AIParameter` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIParameterLoadingStation.new(customMt: any)` | 16 | ✍ Creates the parameter with type LOADING_STATION, no selection and an empty list. |
| `AIParameterLoadingStation:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 29 | ✍ Writes `#stationUniqueId` (owning placeable) and `#stationIndex` for the selected station, only if both can be determined. |
| `AIParameterLoadingStation:loadFromXMLFile(xmlFile: any, key: any)` | 48 | ✍ Reads unique id and index and resolves the station; if the placeable is not loaded yet, subscribes one-shot to `LOADED_ALL_SAVEGAME_PLACEABLES` to retry. |
| `AIParameterLoadingStation:onPlaceableLoaded(args: any)` | 61 | ✍ Message callback that retries resolving the station from the stored unique id and index. |
| `AIParameterLoadingStation:setLoadingStationFromUniqueId(uniqueId: any, index: any)` | 67 | ✍ Looks up the placeable by unique id and its loading station by index in the storage system, selects it and returns true; returns false if the placeable is not found. |
| `AIParameterLoadingStation:readStream(streamId: any, connection: any)` | 81 | ✍ Reads an optional network node object id for the station. |
| `AIParameterLoadingStation:writeStream(streamId: any, connection: any)` | 89 | ✍ Writes a presence flag and, if set, the network node object id. |
| `AIParameterLoadingStation:setLoadingStation(loadingStation: any)` | 97 | ✍ Stores the network object id of the given station. |
| `AIParameterLoadingStation:getLoadingStation()` | 103 | ✍ Resolves the station from its id; returns it only if its owning placeable exists and is synchronized, otherwise nil. |
| `AIParameterLoadingStation:getString()` | 114 | ✍ Returns the station name, or an empty string. |
| `AIParameterLoadingStation:setValidLoadingStations(loadingStationIds: any)` | 125 | ✍ Replaces the selectable stations by their network ids, keeping the current one if still present, otherwise selecting the first. |
| `AIParameterLoadingStation:setNextItem()` | 144 | ✍ Selects the next station in the list, wrapping around. |
| `AIParameterLoadingStation:setPreviousItem()` | 161 | ✍ Selects the previous station in the list, wrapping around. |
| `AIParameterLoadingStation:validate(fillTypeIndex: any, farmId: any)` | 178 | ✍ Fails with localized errors if none is selected, it no longer exists, the fill type is not AI-supported, or its fill level for the farm is 0 or less. Fill type checks only run when a fill type index is given. |
