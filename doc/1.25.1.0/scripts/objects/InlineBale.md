# objects/InlineBale.lua

*[Version française](../../fr/scripts/objects/InlineBale.md)*

Source: `dataS/scripts/objects/InlineBale.lua` — FS25 1.25.1.0

✍ Network object (extends Object) representing a chain of wrapped bales laid end to end, as made by an inline bale wrapper. It keeps the ordered list of InlineBaleSingle bales, links neighbours with physics joints that stiffen over time, spawns connector visuals and tracks the wrapping progress. It can be cut open by a player through InlineBaleActivatable, is saved/loaded by uniqueId of its bales and is synchronised with dirty flags for bales and wrapper. Config is read from an inlineBale XML (maxOpenDistance, connector, replacementBale, textures, wrapping keys, joint limits).

- **InlineBale** inherits from `Object` (l.21)
- **InlineBaleActivatable** (l.942)

## Functions

| Function | Line | Description |
|---|---|---|
| `InlineBale.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 66 | ✍ Creates the inline bale object: empty bale and joint tables, default joint limits and lock time (5000 ms), registers it with the item system and the class-name registry, and creates its activatable and dirty flags. |
| `InlineBale:delete()` | 111 | ✍ Removes the activatable and the item-system entry, unregisters the class name, then calls the parent delete. Does not delete the individual bales. |
| `InlineBale:loadFromConfigXML(configFileName: configFileName) → table` | 123 | ✍ Loads the inline bale XML: open distance, connector file/axis/offset, optional replacement bale, wrap diffuse and normal textures (required), wrapping-state keyframes and joint limits/lock time. Returns false on a missing file or texture. |
| `InlineBale:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 199 | ✍ Savegame loading: reads the config filename and uniqueId, loads the config, then queues the uniqueIds of the saved bales in balesToLoad. If none were saved the inline bale is flagged for removal. |
| `InlineBale:saveToXMLFile(xmlFile: any, key: any)` | 243 | ✍ Writes config filename, uniqueId and the uniqueId of each bale. Skipped entirely when the only bale is still the pending one. |
| `InlineBale:readStream(streamId: integer, connection: table)` | 262 | ✍ Client-side join: reads the config filename, loads the config, calls the parent readStream, registers in the item system and reads the bale list. |
| `InlineBale:writeStream(streamId: integer, connection: table)` | 276 | ✍ Server-side join: writes the config filename, calls the parent writeStream and writes the bale list. |
| `InlineBale:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 289 | ✍ Client-side update read (only from the server connection): optionally reads the bale list and the current wrapper node object, according to two flags. |
| `InlineBale:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 305 | ✍ Server-side update write: sends the bale list when the bale dirty flag is set and the current wrapper when the wrapper dirty flag is set. |
| `InlineBale:readBales(streamId: any, timestamp: any, connection: any)` | 318 | ✍ Reads the bale count and object ids from a stream. Removes connectors from the old bales, clears the list, queues the ids in balesToLoad and registers the activatable if any bale exists. |
| `InlineBale:writeBales(streamId: any, connection: any, dirtyMask: any)` | 345 | ✍ Writes the bale count and node objects to a stream. The last bale is skipped while a pending bale exists because it is about to be replaced; stores the sent count in numBalesSent. |
| `InlineBale:update(dt: number)` | 363 | ✍ Empty override, does nothing. |
| `InlineBale:updateTick(dt: number)` | 369 | ✍ Main tick. Server: resolves queued savegame bales by uniqueId, advances joint stiffening, computes per-bale wrapping state along the wrapper position, flags bale changes for sync, handles delayed wake-up and deletion of empty objects. Client: resolves queued network ids, adds the bales and rebuilds connectors. |
| `InlineBale:addBale(bale: any, baleType: any)` | 488 | ✍ Adds a bale to the chain. On the server it requires no pending bale and getIsBaleAllowed, then marks it pending, links it and listens for its deletion; on the client it just appends it. Returns true on success and applies any waiting wrapper info. |
| `InlineBale:getIsBaleAllowed(bale: any, baleType: any)` | 532 | ✍ Returns true for the first bale; otherwise false when the maximum count (InlineBale.MAX_NUM_BALES, defined outside this file) is reached or the bale type's inline config differs from this one. |
| `InlineBale:replacePendingBale(spawnNode: any, color: any)` | 550 | ✍ Server-side: swaps the pending bale for a new InlineBaleSingle created at spawnNode with the same attributes, wrap textures and optional color. Deletes the old one and returns replaced (boolean) and the new network object id. |
| `InlineBale:getPendingBale()` | 590 | ✍ Returns the bale currently waiting to be connected, or nil. |
| `InlineBale:connectPendingBale()` | 596 | ✍ Registers the activatable and, if a pending bale exists, joins it to the previous bale when there are at least two, then clears the pending slot. Returns true if a bale was pending. The filename argument passed by one caller is ignored. |
| `InlineBale:connectBale(bale: any)` | 613 | ✍ Creates the physics joint and the visual connector between the second-to-last bale and the given last bale. |
| `InlineBale:createBaleJoint(bale1: any, bale2: any)` | 623 | ✍ Builds a physics joint between two bales with collision enabled, using the starting rotation and translation limits, and stores it with a timer keyed by the first bale. |
| `InlineBale:updateBaleJoints(dt: any)` | 648 | ✍ Advances each joint's timer up to lockTime and interpolates its limits from start to end values, so the chain gradually stiffens. |
| `InlineBale:setBaleJointLimits(jointIndex: any, alpha: any)` | 661 | ✍ Applies rotation and translation limits to a joint, linearly interpolated between the start and end limit tables by alpha (0 to 1). |
| `InlineBale:loadBaleConnector(bale1: any, bale2: any, filename: any)` | 675 | ✍ Attaches a connector visual to bale2 relative to bale1 if a filename is given and bale2 has none. Returns true on success, otherwise false. |
| `InlineBale:removeBaleConnector(bale: any)` | 691 | ✍ Removes the connector from the given bale if not nil. |
| `InlineBale:setCurrentWrapperInfo(wrapper: any, wrappingNode: any)` | 699 | ✍ Stores the wrapping node, wakes the object and, when the wrapper changed, updates it and raises the wrapper dirty flag for network sync. |
| `InlineBale:getNumberOfBales()` | 711 | ✍ Returns the number of bales in the chain. |
| `InlineBale:getBales()` | 717 | ✍ Returns the ordered table of bales. |
| `InlineBale:setWrappingState(state: any)` | 733 | ✍ Sets the same wrapping state on every bale and on the inline bale itself. |
| `InlineBale:wakeUp(delay: any)` | 743 | ✍ Wakes the physics of all bales now, or after the given delay in ms (processed in updateTick on the server). |
| `InlineBale:getCanInteract()` | 756 | ✍ True if bales exist, no wrapper is active and the player's interaction position is within maxOpenDistance of the first or last bale. |
| `InlineBale:getInteractionPosition()` | 789 | ✍ Returns the local player's position, or nothing if the player is in a vehicle or lacks access to the first bale. |
| `InlineBale:getCanBeOpened()` | 803 | ✍ True only when every bale is fully wrapped and none is still fermenting. |
| `InlineBale:openBaleAtPosition(x: any, y: any, z: any)` | 815 | ✍ Opens the end bale (first or last) nearest to the given world position. |
| `InlineBale:openBale(bale: any, isFirst: any, replaceBale: any)` | 838 | ✍ Detaches an end bale: removes its joint and connector, updates the list, clears its inline link and, unless replaceBale is false, replaces it with a normal opened Bale with the same attributes. Deletes the inline bale when empty. |
| `InlineBale:onBaleDeleted(bale: any)` | 902 | ✍ Delete listener. If a bale in the chain is removed, opens (detaches) the bales on the shorter side up to it so the chain stays consistent. Does nothing while a bale is pending. |
| `InlineBaleActivatable.new(inlineBale: any)` | 946 | ✍ Creates the activatable for an inline bale and loads the 'action_cutBale' text. |
| `InlineBaleActivatable:getIsActivatable()` | 957 | ✍ Active only if the player can interact and the bales can be opened. |
| `InlineBaleActivatable:run()` | 969 | ✍ Cuts open the bale nearest to the player: directly on the server, otherwise by sending an InlineBaleOpenEvent (defined elsewhere) to the server. |
