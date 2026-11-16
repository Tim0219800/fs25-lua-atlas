# handTools/HandToolLoadingData.lua

*[Version française](../../fr/scripts/handTools/HandToolLoadingData.md)*

Source: `dataS/scripts/handTools/HandToolLoadingData.lua` — FS25 1.25.1.0

✍ Container of everything needed to load a hand tool: store item or XML filename, owner farm, savegame data, registration, drop and save flags. It resolves the hand tool type and class through `g_handToolTypeManager`, then delegates to `loadHandTool`, which is not defined in this file (UNVERIFIED, probably added elsewhere).

- **HandToolLoadingData** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolLoadingData.new(customMt: any) → table` | 17 | ✍ Creates a loading data object with defaults: invalid, owner `AccessHandler.EVERYONE`, saved, droppable, registered, not forced to server. |
| `HandToolLoadingData:setFilename(filename: string)` | 39 | ✍ Sets the hand tool XML file to load, if the file exists; otherwise logs an error with a call stack. Does not touch `isValid`. |
| `HandToolLoadingData:setStoreItem(storeItem: table)` | 51 | ✍ Sets the store item and takes its XML filename; marks the data valid only if a store item is given, else logs an error. |
| `HandToolLoadingData:setOwnerFarmId(ownerFarmId: integer)` | 66 | ✍ Sets the owner farm id for the loaded hand tool. |
| `HandToolLoadingData:setIsRegistered(isRegistered: boolean)` | 73 | ✍ Sets whether the hand tool is registered after loading. |
| `HandToolLoadingData:setSavegameData(savegameData: table)` | 95 | ✍ Sets the savegame data (table with `xmlFile` and `key`) used when loading from a savegame. |
| `HandToolLoadingData:load(callback: function?, callbackTarget: table?, callbackArguments: table?)` | 104 | ✍ Stores the callback, resolves type and class from the XML; on failure calls the callback with nil and `HandToolLoadingState.ERROR`, otherwise calls `loadHandTool` (loading is probably asynchronous, UNVERIFIED). Callback signature: target, handTool, loadingState, arguments. |
