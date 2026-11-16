# animals/Dog.lua

*[Version française](../../fr/scripts/animals/Dog.md)*

Source: `dataS/scripts/animals/Dog.lua` — FS25 1.25.1.0

✍ Networked companion dog (subclass of Object) driven by the engine's animal companion manager (createAnimalCompanionManager and the setCompanion* functions, whose internals are UNVERIFIED). The server runs the behaviors (follow, fetch, pet, stay, feed, go home) and syncs the companion state to clients; clients send events (DogFollowEvent, DogFetchItemEvent, DogPetEvent) to request actions. It also handles saving the name, coat texture tile, scope and update priority, an abandon timer that teleports the dog back to its spawn, and a pet activatable.

- **Dog** inherits from `Object` (l.16)

## Functions

| Function | Line | Description |
|---|---|---|
| `Dog.new(isServer: any, isClient: any, customMt: any) → table` | 38 | ✍ Creates the dog object with no engine instance yet, a random-name placeholder, abandon timer defaults (6000 ms, range 100), a forced clip distance of 80, a pet activatable and a dirty flag. It registers the class name for the network. |
| `Dog:load(spawner: any, xmlFilename: any, spawnX: any, spawnY: any, spawnZ: any)` | 72 | ✍ Picks a random name from the animal name system and creates the engine companion at the spawn position, with water detection offset, interaction trigger, collision masks and indoor/outdoor audio setup. Returns false if the engine instance could not be created. |
| `Dog:delete()` | 106 | ✍ Marks the dog as deleted, deletes the engine instance, unsubscribes message listeners (server), unregisters the class name, removes the activatable and the indoor listener, then calls the parent delete. |
| `Dog:loadFromXMLFile(xmlFile: XMLFile, key: string, resetVehicles: boolean) → boolean` | 130 | ✍ Restores the dog name from the savegame XML attribute `#name`. Always returns true. |
| `Dog:saveToXMLFile(xmlFile: table, key: string, usedModNames: table)` | 141 | ✍ Writes the dog name HTML-encoded to `#name`. |
| `Dog:readStream(streamId: integer, connection: table)` | 149 | ✍ Client join: reads spawner, XML filename, spawn position, name and coat tile indices. On first read it loads the companion and links the spawner to the dog; it applies tile and name, then calls the parent readStream. The spawner can be nil if not yet synced. |
| `Dog:writeStream(streamId: integer, connection: table)` | 180 | ✍ Server side: writes the spawner, XML filename, spawn position, name and tile indices (3 bits each), then calls the parent writeStream. |
| `Dog:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 199 | ✍ Server side: writes the engine companion state to the update stream via writeAnimalCompanionManagerToStream. |
| `Dog:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 210 | ✍ Client side: reads the companion state from the stream with the client interpolation delay and network timing globals (engine behavior UNVERIFIED). |
| `Dog:update(dt: number)` | 219 | ✍ Applies a pending coat tile once the companion is ready, otherwise stays active. On the server it teleports a staying dog home if abandoned and keeps itself active every frame. |
| `Dog:updateTick(dt: number)` | 245 | ✍ Server only: raises the dirty flag when the engine reports that the companion needs a network update, then calls the parent. |
| `Dog:testScope(x: number, y: number, z: number, coeff: number, isGuiVisible: any) → boolean` | 261 | ✍ Network scope test: true if the viewer is closer than the smaller of the companion clip distance (scaled by coeff) and forcedClipDistance. Returns a boolean. |
| `Dog:getUpdatePriority(skipCount: number, x: number, y: number, z: number, coeff: number, connection: table, isGuiVisible: any) → number` | 277 | ✍ Network update priority: 0 if clip distance is 0, otherwise higher when nearer, plus a bonus growing with skipCount (80% distance, 20% skip weighting). |
| `Dog:onGhostRemove()` | 291 | ✍ Hides the dog and stops its physics update when it leaves a client's network scope. |
| `Dog:onGhostAdd()` | 297 | ✍ Shows the dog and resumes its physics update when it enters a client's network scope. |
| `Dog:hourChanged()` | 303 | ✍ Server only, subscribed to HOUR_CHANGED: passes the environment's day time to the companion via setCompanionDaytime. Environment is not in the dump, so its dayTime unit is UNVERIFIED. |
| `Dog:setName(name: any)` | 315 | ✍ Sets the dog name, using an empty string if nil is given. |
| `Dog:setVisibility(state: any)` | 321 | ✍ Shows or hides the companion and enables or disables its physics update, if the engine instance exists. |
| `Dog:playerInteractionTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 335 | ✍ Engine trigger callback: when the local player enters and the farm may access the dog, the pet activatable is added to the mission; on leave it is removed. |
| `Dog:followEntity(player: integer)` | 352 | ✍ Makes the dog follow a player. A client only stores the target and sends DogFollowEvent; the server sets the follow behavior and clears the staying flag. |
| `Dog:goToSpawn()` | 373 | ✍ Clears follow and thrower targets and sends the dog to the spawner's spawn node. A client sends DogFollowEvent with no player; the server sets the go-to behavior. |
| `Dog:onFoodBowlFilled(foodBowlNode: any)` | 386 | ✍ Clears follow and thrower targets and starts the feed behavior toward the given bowl node. No client/server check is made here, so it is expected to be called on the server. |
| `Dog:fetchItem(player: object, ball: any)` | 395 | ✍ Starts the fetch behavior for a ball thrown by a player. A client sends DogFetchItemEvent; the server records the ball's throw position, sets the fetch behavior and remembers the thrower. |
| `Dog:pet()` | 408 | ✍ Triggers the petting reaction. A client sends DogPetEvent; the server sets the pet behavior, increments the farm stat petDogCount and tries to unlock the PetDog achievement. |
| `Dog:idleStay()` | 423 | ✍ Server only: clears follow and thrower targets, sets the default behavior and flags the dog as staying (so the abandon timer can apply). |
| `Dog:idleWander()` | 433 | ✍ Server-only placeholder whose body does nothing (the engine call is commented out in the source). |
| `Dog:setTextureTileIndices(tileIndexU: integer, tileIndexV: integer)` | 443 | ✍ Stores the coat atlas tile indices (for sync) and applies them at once if the companion is ready, otherwise marks them pending and keeps the dog active until it loads. |
| `Dog:applyTextureTile()` | 463 | ✍ Applies the stored tile indices to the companion with setCompanionTextureTile and clears the pending flag. |
| `Dog:isAbandoned(dt: any)` | 470 | ✍ Checks whether any controlled player or entered vehicle is within abandonRange of the dog. In range it refills the timer; otherwise it counts down dt and returns true when the timer expires. |
| `Dog:resetSteeringParms()` | 510 | ✍ Empty server-side placeholder with no effect. |
| `Dog:teleportToSpawn()` | 517 | ✍ Server only: moves the dog back to its spawn position, clears staying and follow state and shows the in-game notification that the dog is in its doghouse. A TODO in the source notes the notification is not synced. |
| `Dog:playerFarmChanged(player: any)` | 533 | ✍ Server message callback: if the player who changed farm was being followed or was the ball thrower, the dog switches to staying idle. |
| `Dog:onPlayerLeave(player: any)` | 543 | ✍ Server only: if the leaving player was followed or was the thrower, the dog switches to staying idle. Calling code is outside this file. |
| `Dog:finalizePlacement()` | 554 | ✍ Shows the dog and, on the server, subscribes to HOUR_CHANGED and PLAYER_FARM_CHANGED messages. |
| `Dog:onIndoorStateChanged(isIndoor: any)` | 565 | ✍ Sound manager listener: updates the companion's outdoor audio setup from the current indoor state. |
| `Dog.registerSavegameXMLPaths(schema: any, basePath: any)` | 571 | ✍ Registers the savegame XML attribute `#name` (name of the dog) in the schema. |

## Messages

- subscribes `MessageType.HOUR_CHANGED` (l.558)
- subscribes `MessageType.PLAYER_FARM_CHANGED` (l.559)
