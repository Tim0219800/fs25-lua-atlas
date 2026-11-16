# placeables/Placeable.lua

*[Version française](../../fr/scripts/placeables/Placeable.md)*

Source: `dataS/scripts/placeables/Placeable.lua` — FS25 1.25.1.0

✍ Base class of every placeable (buildings, fences, production points and so on), derived from `Object`. It runs the multi-step loading (pre-load, i3d load, load finished, synchronized), owns the XML schemas for placeable and savegame data, writes and reads network streams for joining clients, saves to the savegame, and raises lifecycle events (`onLoad`, `onFinalizePlacement`, `onDelete`, hourly or daily events and more) to the specializations of its placeable type. Functionality is supplied by specializations; economy, farmland and shop data come from the store item. Several helpers it calls live elsewhere or are missing from the dump (UNVERIFIED), for example `getMonetaryValue`, `getIsOnFarmland`, `getFarmlandId`, `getIsPreplaced`, `updateOwnership`, `PlaceableSystem:markPlaceableForDeletion`.

- **Placeable** inherits from `Object` (l.18)

## Functions

| Function | Line | Description |
|---|---|---|
| `Placeable.registerEvents(placeableType: any)` | 68 | ✍ Declares the events specializations can listen to on a placeable type: load steps, register, delete, save, network streams, placement, update, day/hour/minute/period/weather changes, farmland, buy, sell and owner changes. |
| `Placeable.registerFunctions(placeableType: any)` | 103 | ✍ Registers the base placeable functions (position, farmland, pose, owner, loading step and state, physics, naming, price, destruction, overlay color, visibility and similar) on the placeable type so that specializations can override them. |
| `Placeable.init()` | 145 | ✍ Fills the placeable XML schema and the savegame schema (base data, store data, i3d mappings, unique id, name, position, age, price, farm id, overwrite flags and so on), lets each specialization register its own paths, adds the `placeableSlots` store spec and registers the color configuration type. |
| `Placeable.postInit()` | 206 | ✍ Registers the XML and savegame paths of every configuration item class once all configuration types are known, including the legacy `boughtConfiguration` savegame path. |
| `Placeable.new(isServer: any, isClient: any, customMt: any)` | 227 | ✍ Creates a placeable object for the given server/client role with default state: loading step CREATED, state OK, property state OWNED, age 0, price 0, no unique id. |
| `Placeable:setFilename(filename: any)` | 260 | ✍ Stores the config XML filename, its clean name, and the mod name and base directory derived from the path. |
| `Placeable:setConfigurations(configurations: any, boughtConfigurations: any, configurationData: any)` | 269 | ✍ Stores selected and bought configurations plus optional configuration data, and builds an alphabetically sorted list of configuration names. |
| `Placeable:setType(typeDef: any)` | 289 | ✍ Applies the placeable type (specialization set) to this object. A `placeableType` configuration item may replace the given type; unknown names log a warning. Requires `setFilename` first. |
| `Placeable:setLoadCallback(loadCallbackFunction: any, loadCallbackFunctionTarget: any, loadCallbackFunctionArguments: any)` | 311 | ✍ Stores the function, target and arguments to call when loading finishes or fails. |
| `Placeable:loadCallback()` | 319 | ✍ Calls the stored load callback with the placeable, its loading state and the arguments, then clears target and arguments. |
| `Placeable:load(placeableLoadingData: any)` | 329 | ✍ Starts loading from a `PlaceableLoadingData`: opens the XML, resolves the store item, repairs configurations against the store item and configuration sets, creates spec environments, raises `onPreLoad`, then loads the i3d asynchronously or takes the preplaced node. Returns false on failure. |
| `Placeable:i3dFileLoaded(i3dNode: any, failedReason: any, args: any, i3dLoadingId: any)` | 463 | ✍ Callback when the i3d is ready: on failure sets the ERROR state and calls the load callback; if the placeable was deleted meanwhile sets CANCELED; otherwise stores the root node and queues `loadFinished` as an async task. |
| `Placeable:onFinishedLoading()` | 610 | ✍ Final loading step: makes the placeable visible and, on the server with savegame data, calls each specialization's `loadFromXMLFile` and reads name, image, age, price, farm id and overwrite flags. Then raises `onLoadFinished`, finalizes placement for savegame loads, marks it synchronized on the server, registers it if requested and calls the load callback. |
| `Placeable:onLoadingError(msg: any, ...: any)` | 702 | ✍ Logs the error (XML-aware when the XML is open) and closes the XML file, sets the ERROR loading state and calls the load callback. |
| `Placeable:createLoadingTask(target: any) → table` | 719 | ✍ Creates a loading task for the given target through `SpecializationUtil.createLoadingTask`; the placeable finishes loading only after its tasks are done. |
| `Placeable:finishLoadingTask(task: table)` | 726 | ✍ Marks a loading task as done via `SpecializationUtil.finishLoadingTask`, which can trigger `onFinishedLoading` once everything is ready. |
| `Placeable:finalizePlacement()` | 732 | ✍ Called when the placeable is actually placed: raises the pre, finalize and post-finalize events, adds it to physics, the placeable system and the owned items, registers pick nodes, handles farmland ownership and subscribes to day, hour, minute, weather and period messages as needed. |
| `Placeable:delete(immediate: any)` | 780 | ✍ Deletes the placeable. Unless `immediate` is true (or the game is exiting) it is only queued via the placeable system. Otherwise raises `onPreDelete` and `onDelete`, unsubscribes messages, removes it from systems, frees the i3d and XML, and calls the parent delete. Logs an error if already deleted. |
| `Placeable:readStream(streamId: integer, connection: table, objectId: any)` | 865 | ✍ Client side on join: reads whether it is preplaced (index) or its filename, position and rotation, then configurations and property state, builds a `PlaceableLoadingData` and starts the client-side load. Logs an error if loading was already started. |
| `Placeable:writeStream(streamId: integer, connection: table)` | 925 | ✍ Server side on join: writes the preplaced flag and index, or filename, translation and rotation of the root node, then configurations and property state. |
| `Placeable:postReadStream(streamId: integer, connection: table)` | 951 | ✍ Client side once loaded: finalizes placement, raises `onReadStream` (with per-spec bit counts when `Placeable.DEBUG_NETWORK` is set), reads optional custom name, l10n key and custom image, marks the placeable synchronized and requests updates. |
| `Placeable:postWriteStream(streamId: integer, connection: table)` | 989 | ✍ Server side after the client has loaded the placeable: raises `onWriteStream` (with debug sizes if enabled) and writes optional custom name, l10n key and custom image filename. |
| `Placeable:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 1021 | ✍ Client side network update: raises `onReadUpdateStream` for specializations (with per-spec bit counts when `Placeable.DEBUG_NETWORK_UPDATE` is set). |
| `Placeable:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 1041 | ✍ Server side network update: raises `onWriteUpdateStream` with the dirty mask (with debug sizes when `Placeable.DEBUG_NETWORK_UPDATE` is set). |
| `Placeable:saveToXMLFile(xmlFile: string, key: any, usedModNames: any) → string, string` | 1061 | ✍ Writes the placeable to the savegame XML: unique id, filename, position and rotation (unless preplaced), age, price, farm id, tour id, custom name (if renamable), name l10n key, overwrite flags, custom image, configurations, then each specialization's own data. |
| `Placeable:setPropertyState(state: any)` | 1121 | ✍ Sets the property state (for example owned or construction preview). |
| `Placeable:getPropertyState()` | 1127 | ✍ Returns the property state. |
| `Placeable:setVisibility(state: any)` | 1173 | ✍ Shows or hides all component root nodes of the placeable. |
| `Placeable:getIsSynchronized()` | 1181 | ✍ Returns true when the loading step has reached SYNCHRONIZED. |
| `Placeable:getNeedsSaving()` | 1191 | ✍ Returns true; the base placeable is always saved (the system also skips preplaced ones separately). |
| `Placeable:getUniqueId() → string` | 1198 | ✍ Returns the placeable's unique id, or nil if none was set. |
| `Placeable:setUniqueId(uniqueId: string)` | 1205 | ✍ Sets the unique id. It should not be changed once set (checked only in debug builds). |
| `Placeable:update(dt: any)` | 1213 | ✍ Per-frame update; raises `onUpdate` with the delta time for specializations. |
| `Placeable:updateTick(dt: any)` | 1219 | ✍ Network tick update; raises `onUpdateTick` with the delta time. |
| `Placeable:draw()` | 1225 | ✍ Draw callback; raises `onDraw` for specializations. |
| `Placeable:drawDebug()` | 1231 | ✍ Debug draw; raises `onDrawDebug` (only active with the scriptDebug start parameter, per the source comment). |
| `Placeable:getName() → string` | 1238 | ✍ Returns the display name: player custom name first, then the mapper's l10n name, then the store item name. |
| `Placeable:getImageFilename()` | 1244 | ✍ Returns the custom image filename if set, else the store item's image. |
| `Placeable:getCanBeRenamedByFarm(farmId: any)` | 1250 | ✍ Returns true if the placeable can be renamed and is owned by the given farm id. |
| `Placeable:setName(name: string, noEventSend: boolean) → boolean` | 1259 | ✍ Sets or resets (nil) the custom name when renaming is allowed, sending a `PlaceableNameEvent` unless `noEventSend`, and notifies loading and unloading station changes. Returns false if not renamable or the name is blank. |
| `Placeable:setNameL10nKey(nameL10nKey: string)` | 1278 | ✍ Stores a name localization key (without the `$l10n_` prefix) and the translated text if the key exists for the map's custom environment; otherwise does nothing. |
| `Placeable:onBuy()` | 1289 | ✍ Raises `onBuy`, counts the placeables owned by the local farm and tries to unlock the NumPlaceables achievement. |
| `Placeable:onSell()` | 1304 | ✍ Publishes `FARM_PROPERTY_CHANGED` for the owner farm and raises `onSell`. |
| `Placeable:getPrice()` | 1311 | ✍ Returns the stored purchase price. |
| `Placeable:canBuy() → boolean` | 1319 | ✍ Returns true unless the store item has a max item count already reached by the local farm. |
| `Placeable:getCanBePlacedAt(x: any, y: any, z: any, farmId: any)` | 1335 | ✍ Base check for placing at a position for a farm: always returns true, nil (specializations may override). |
| `Placeable:canBeSold()` | 1341 | ✍ Base check: always returns true, nil (second value is presumably an optional reason, UNVERIFIED). |
| `Placeable:getDestructionMethod()` | 1347 | ✍ Returns `Placeable.DESTRUCTION.SELL`, the default way of removing the placeable. |
| `Placeable:previewNodeDestructionNodes(node: any)` | 1353 | ✍ Base hook returning nil; specializations can return the nodes that would be destroyed for a given node. |
| `Placeable:performNodeDestruction(node: integer) → boolean, boolean` | 1362 | ✍ Base hook returning false, false (nothing destroyed, placeable not to be removed); specializations override it. |
| `Placeable:onFarmlandStateChanged(farmlandId: any, farmId: any, loadFromSavegame: any)` | 1368 | ✍ On farmland ownership change, calls `updateOwnership` if the placeable is bought with farmland and sits on that farmland. |
| `Placeable:register(alreadySent: any)` | 1381 | ✍ Registers the object via the parent class and raises `onRegistered`. |
| `Placeable:setOwnerFarmId(farmId: any, noEventSend: any)` | 1394 | ✍ Sets the owner farm: updates farmland ownership if it buys farmland, calls the parent, raises `onOwnerChanged` after the load step, and re-registers the owned item (except in construction preview). |
| `Placeable:setLoadingState(loadingState: any)` | 1441 | ✍ Sets the loading state if valid; otherwise prints the call stack and logs an error. |
| `Placeable:collectPickObjects(node: integer)` | 1455 | ✍ Recursively collects nodes with a rigid body into `pickObjects`, used to map nodes back to the placeable. |
| `Placeable:setLoadingStep(loadingStep: SpecializationLoadStep)` | 1468 | ✍ Sets the loading step through `SpecializationUtil.setLoadingStep`, which logs an error for an invalid step. |
| `Placeable:setOverlayColor(r: any, g: any, b: any, alpha: any)` | 1474 | ✍ Sets the `placeableColorScale` shader parameter (r, g, b, alpha) on all shapes that support it, finding them once and caching them. |
| `Placeable:setOverlayColorNodes(node: integer, nodeTable: table)` | 1489 | ✍ Recursively collects shape nodes that have the `placeableColorScale` parameter and are not terrain decals into the given table. |
| `Placeable:getDailyUpkeep() → integer` | 1503 | ✍ Returns the daily upkeep from the store item and configurations, increased with age up to `EconomyManager.MAX_DAILYUPKEEP_MULTIPLIER` when the item has a lifetime. |
| `Placeable:getSellPrice() → integer, boolean` | 1519 | ✍ Returns the sell price and a flag. Within `Placeable.UNDO_DURATION` after placement (and after the construction screen was opened) it returns the full price and true, else `getMonetaryValue()` and false. |
| `Placeable:getSellAction() → integer` | 1544 | ✍ Returns `Placeable.SELL_AND_SPECTATOR_FARM` for preplaced placeables on public land or that cannot be deleted, or when the savegame forbids deletion; otherwise `Placeable.SELL_AND_DELETE`. |
| `Placeable:addToPhysics()` | 1563 | ✍ Adds the root node to the physics world if it exists. |
| `Placeable:removeFromPhysics()` | 1571 | ✍ Removes the root node from the physics world if it exists. |
| `Placeable:setPreviewPosition(x: any, y: any, z: any, rotX: any, rotY: any, rotZ: any)` | 1579 | ✍ Moves the root node to a world position and sets only the Y rotation (rotX and rotZ are ignored). |
| `Placeable:getNeedWeatherChanged()` | 1586 | ✍ Returns false; specializations override it to receive weather changes. |
| `Placeable:weatherChanged()` | 1592 | ✍ Message handler for day/night changes (subscribed to `DAY_NIGHT_CHANGED`); raises `onWeatherChanged`. |
| `Placeable:getNeedHourChanged()` | 1598 | ✍ Returns false; specializations override it to receive hour changes. |
| `Placeable:hourChanged(hour: any)` | 1604 | ✍ Message handler for hour changes; raises `onHourChanged` with the hour. |
| `Placeable:getNeedMinuteChanged()` | 1610 | ✍ Returns false; specializations override it to receive minute changes. |
| `Placeable:minuteChanged(minute: any)` | 1616 | ✍ Message handler for minute changes; raises `onMinuteChanged` with the minute. |
| `Placeable:getNeedDayChanged()` | 1622 | ✍ Returns false; specializations override it to receive day changes. |
| `Placeable:dayChanged(day: any)` | 1628 | ✍ Message handler for day changes; raises `onDayChanged` with the day. |
| `Placeable:periodChanged(period: any)` | 1634 | ✍ Message handler for period changes: increases the placeable's age by 1 (months) and raises `onPeriodChanged`. |
| `Placeable.getSpecValueSlots(storeItem: any, realItem: any)` | 1641 | ✍ Store spec text for the slots used: formats the slot usage of the store item (first copy or not) as '+N $SLOTS$'. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onPreLoad` | 69 |
| registerEvent | `onLoad` | 70 |
| registerEvent | `onPostLoad` | 71 |
| registerEvent | `onPreLoadFinished` | 72 |
| registerEvent | `onLoadFinished` | 73 |
| registerEvent | `onRegistered` | 74 |
| registerEvent | `onPreDelete` | 75 |
| registerEvent | `onDelete` | 76 |
| registerEvent | `onSave` | 77 |
| registerEvent | `onReadStream` | 78 |
| registerEvent | `onWriteStream` | 79 |
| registerEvent | `onReadUpdateStream` | 80 |
| registerEvent | `onWriteUpdateStream` | 81 |
| registerEvent | `onDirtyMaskCleared` | 82 |
| registerEvent | `onPreFinalizePlacement` | 83 |
| registerEvent | `onFinalizePlacement` | 84 |
| registerEvent | `onPostFinalizePlacement` | 85 |
| registerEvent | `onUpdate` | 86 |
| registerEvent | `onUpdateTick` | 87 |
| registerEvent | `onDraw` | 88 |
| registerEvent | `onDrawDebug` | 89 |
| registerEvent | `onHourChanged` | 90 |
| registerEvent | `onMinuteChanged` | 91 |
| registerEvent | `onDayChanged` | 92 |
| registerEvent | `onPeriodChanged` | 93 |
| registerEvent | `onWeatherChanged` | 94 |
| registerEvent | `onFarmlandStateChanged` | 95 |
| registerEvent | `onBuy` | 96 |
| registerEvent | `onSell` | 97 |
| registerEvent | `onOwnerChanged` | 98 |
| registerFunction | `register` | 104 |
| registerFunction | `getPosition` | 105 |
| registerFunction | `getIsOnFarmland` | 106 |
| registerFunction | `getFarmlandId` | 107 |
| registerFunction | `setPose` | 108 |
| registerFunction | `setOwnerFarmId` | 109 |
| registerFunction | `setLoadingStep` | 110 |
| registerFunction | `setLoadingState` | 111 |
| registerFunction | `addToPhysics` | 112 |
| registerFunction | `removeFromPhysics` | 113 |
| registerFunction | `collectPickObjects` | 114 |
| registerFunction | `getNeedWeatherChanged` | 115 |
| registerFunction | `getNeedHourChanged` | 116 |
| registerFunction | `getNeedMinuteChanged` | 117 |
| registerFunction | `getNeedDayChanged` | 118 |
| registerFunction | `getName` | 119 |
| registerFunction | `getImageFilename` | 120 |
| registerFunction | `getCanBeRenamedByFarm` | 121 |
| registerFunction | `setName` | 122 |
| registerFunction | `getPrice` | 123 |
| registerFunction | `canBuy` | 124 |
| registerFunction | `getCanBePlacedAt` | 125 |
| registerFunction | `canBeSold` | 126 |
| registerFunction | `getDestructionMethod` | 127 |
| registerFunction | `previewNodeDestructionNodes` | 128 |
| registerFunction | `performNodeDestruction` | 129 |
| registerFunction | `updateOwnership` | 130 |
| registerFunction | `setOverlayColor` | 131 |
| registerFunction | `setOverlayColorNodes` | 132 |
| registerFunction | `getDailyUpkeep` | 133 |
| registerFunction | `getSellPrice` | 134 |
| registerFunction | `setPreviewPosition` | 135 |
| registerFunction | `setPropertyState` | 136 |
| registerFunction | `getPropertyState` | 137 |
| registerFunction | `setVisibility` | 138 |
| registerFunction | `getIsSynchronized` | 139 |
| registerFunction | `getIsPreplaced` | 140 |

## Messages

- subscribes `MessageType.FARMLAND_OWNER_CHANGED` (l.754)
- subscribes `MessageType.DAY_NIGHT_CHANGED` (l.761)
- subscribes `MessageType.HOUR_CHANGED` (l.764)
- subscribes `MessageType.MINUTE_CHANGED` (l.767)
- subscribes `MessageType.DAY_CHANGED` (l.770)
- subscribes `MessageType.PERIOD_CHANGED` (l.772)
- publishes `MessageType.FARM_PROPERTY_CHANGED` (l.774)
- publishes `MessageType.PLACEABLE_PRE_DELETE` (l.822)
- publishes `MessageType.UNLOADING_STATIONS_CHANGED` (l.1268)
- publishes `MessageType.LOADING_STATIONS_CHANGED` (l.1269)
- publishes `MessageType.FARM_PROPERTY_CHANGED` (l.1305)
