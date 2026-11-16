# handTools/HandToolHolder.lua

*[Version française](../../fr/scripts/handTools/HandToolHolder.md)*

Source: `dataS/scripts/handTools/HandToolHolder.lua` — FS25 1.25.1.0

✍ Networked object (child of `Object`) that can store one hand tool, for example a rack on a vehicle or building. It is loaded from `handToolHolder(?)` XML (holder type and node, dummy i3d, click boxes, activation trigger, optional spawned hand tool, take/store texts), registers itself in `g_currentMission.handToolSystem` and uses a `HandToolHolderActivatable` for the player prompt. If a spawned tool filename is set, only that tool can be stored.

- **HandToolHolder** inherits from `Object` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolHolder.registerXMLPaths(schema: any, basePath: any)` | 17 | ✍ Declares the shared XML registration `HandToolHolder`: holder type, node and dummy filename, click box nodes, trigger node, spawned hand tool filename, and take and store texts. |
| `HandToolHolder.registerSavegameXMLPaths(schema: any, basePath: any)` | 34 | ✍ Declares the savegame attribute `#uniqueId`. |
| `HandToolHolder.new(parent: any, isServer: any, isClient: any, customMt: any)` | 40 | ✍ Creates the holder object with its parent, an empty name, no hand tool and the player marked out of range. |
| `HandToolHolder:load(xmlFile: any, key: any, callback: any, callbackTarget: any, callbackArgs: any, components: any, i3dMappings: any, baseDirectory: any, customEnv: any)` | 53 | ✍ Reads the XML: holder type and node, optional dummy i3d (async shared load), click boxes, activation trigger (`onPlayerCallback`), texts, and the optional spawned hand tool, loaded through `HandToolLoadingData` (unregistered). Builds the activatable (targeting required when there is no trigger). Calls `onFinishedLoading` at once unless a spawned tool is still loading. |
| `HandToolHolder:onDummyHandToolI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 110 | ✍ Callback of the dummy i3d load: links the first child under the holder node, deletes the loaded root and refreshes dummy visibility. Does nothing if loading failed (node 0). |
| `HandToolHolder:onSpawnedHandToolLoaded(handTool: any, loadingState: any)` | 121 | ✍ Callback when the spawned tool is loaded: on failure logs an error and calls the load callback with nil; otherwise attaches the tool to this holder, sets it as holder, registers it if the holder is registered, fills `spawnedHandToolFilename` if empty and finishes loading. |
| `HandToolHolder:onFinishedLoading()` | 149 | ✍ Calls the load callback with the holder, adds it to the hand tool system and, when there is no trigger, registers the activatable with the activatable objects system. |
| `HandToolHolder:delete()` | 161 | ✍ Cancels a pending tool load, releases a stored non-spawned tool, deletes the spawned tool, removes the trigger, releases the shared dummy i3d, unregisters from the hand tool system and activatable system, then calls the parent delete. |
| `HandToolHolder:saveToXMLFile(xmlFile: any, key: any)` | 201 | ✍ Writes the holder unique id to `key#uniqueId`. |
| `HandToolHolder:loadFromXMLFile(xmlFile: any, key: any)` | 207 | ✍ Reads `#uniqueId` and applies it if present. |
| `HandToolHolder:writeStream(streamId: integer, connection: Connection)` | 218 | ✍ Server to client: writes whether a spawned hand tool exists and, if so, its object id and post-write data, and registers it in the stream. |
| `HandToolHolder:readStream(streamId: integer, connection: Connection, objectId: integer)` | 234 | ✍ Client from server: if a spawned tool is flagged, reads its object id, calls `postReadStream` on the local spawned tool and finishes its object registration. |
| `HandToolHolder:register(alreadySent: any)` | 247 | ✍ Calls the parent register, then registers the spawned hand tool too if it is not registered yet. |
| `HandToolHolder:getUniqueId() → string` | 260 | ✍ Returns the holder unique id. |
| `HandToolHolder:setUniqueId(uniqueId: string)` | 267 | ✍ Sets the unique id; it should not be changed after the first assignment (only debug assertions check it). |
| `HandToolHolder:getHolderName()` | 275 | ✍ Returns the holder name. |
| `HandToolHolder:setHolderName(name: any)` | 281 | ✍ Sets the holder name. |
| `HandToolHolder:getHandTool()` | 287 | ✍ Returns the hand tool currently stored, or nil. |
| `HandToolHolder:getSpawnedHandTool()` | 293 | ✍ Returns the hand tool spawned by this holder, or nil. |
| `HandToolHolder:getSpawnsHandTool()` | 299 | ✍ Returns true if a spawned hand tool filename is configured. |
| `HandToolHolder:getHolderNodePair(handTool: any)` | 305 | ✍ Returns the holder node and the tool's holster node of this holder's type, to be aligned; returns nil, nil if the tool has no `getHolsterNodeByType` or no matching node. |
| `HandToolHolder:getCanPickupHandToolFromMenu(handTool: any)` | 322 | ✍ Always returns true. |
| `HandToolHolder:getCanPickupHandTool(handTool: any)` | 328 | ✍ Returns true if the holder is empty and the tool is storable (`spec_storable`); with a spawned tool it must be that tool, otherwise the tool needs a holster node of this type and the same owner farm. |
| `HandToolHolder:onPickupHandTool(handTool: any)` | 355 | ✍ Stores a hand tool if allowed: records it, calls the store callback, links its root node to the holder node aligned through `HandToolUtil.linkAndTransformRelativeToParent`, resets the graphical node, and updates the dummy. Returns true on success. |
| `HandToolHolder:setPlayerInRange(isInRange: any)` | 393 | ✍ Stores whether the local player is in range and updates the dummy visibility. |
| `HandToolHolder:updateDummyHandTool()` | 400 | ✍ Shows the dummy tool only when the player is in range and the holder is empty. |
| `HandToolHolder:onDropHandTool(handTool: any)` | 409 | ✍ If the given tool is the stored one, unlinks it, clears the holder, calls the pickup callback, updates the dummy and returns the tool; otherwise does nothing. |
| `HandToolHolder:drawDebug()` | 430 | ✍ Debug: draws gizmos at the holder node and, if a tool is stored, at the tool's holster node. |
| `HandToolHolder:setOwnerFarmId(farmId: any, noEventSend: any)` | 443 | ✍ Calls the parent and propagates the owner farm id to the spawned hand tool (no event sent). |
| `HandToolHolder:setStoreCallback(storeCallback: any)` | 453 | ✍ Sets the function called with the hand tool when it is stored. |
| `HandToolHolder:setPickupCallback(pickupCallback: any)` | 459 | ✍ Sets the function called with the hand tool when it is taken out. |
| `HandToolHolder:onPlayerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 465 | ✍ Trigger callback: for the local player root node, enter adds the activatable and sets in range, leave removes it and clears in range. |
