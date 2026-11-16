---@meta
-- FS25 1.25.1.0 : animals/Dog.lua (generated stub, FS25 Lua Atlas)

--- Networked companion dog (subclass of Object) driven by the engine's animal companion manager (createAnimalCompanionManager and the setCompanion* functions, whose internals are UNVERIFIED). The server runs the behaviors (follow, fetch, pet, stay, feed, go home) and syncs the companion state to clients; clients send events (DogFollowEvent, DogFetchItemEvent, DogPetEvent) to request actions. It also handles saving the name, coat texture tile, scope and update priority, an abandon timer that teleports the dog back to its spawn, and a pet activatable.
---@class Dog : Object
Dog = {}

--- Creates the dog object with no engine instance yet, a random-name placeholder, abandon timer defaults (6000 ms, range 100), a forced clip distance of 80, a pet activatable and a dirty flag. It registers the class name for the network.
---@param isServer any
---@param isClient any
---@param customMt any
---@return table
function Dog.new(isServer, isClient, customMt) end

--- Picks a random name from the animal name system and creates the engine companion at the spawn position, with water detection offset, interaction trigger, collision masks and indoor/outdoor audio setup. Returns false if the engine instance could not be created.
---@param spawner any
---@param xmlFilename any
---@param spawnX any
---@param spawnY any
---@param spawnZ any
function Dog:load(spawner, xmlFilename, spawnX, spawnY, spawnZ) end

--- Marks the dog as deleted, deletes the engine instance, unsubscribes message listeners (server), unregisters the class name, removes the activatable and the indoor listener, then calls the parent delete.
function Dog:delete() end

--- Restores the dog name from the savegame XML attribute `#name`. Always returns true.
---@param xmlFile XMLFile
---@param key string
---@param resetVehicles boolean
---@return boolean
function Dog:loadFromXMLFile(xmlFile, key, resetVehicles) end

--- Writes the dog name HTML-encoded to `#name`.
---@param xmlFile table
---@param key string
---@param usedModNames table
function Dog:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client join: reads spawner, XML filename, spawn position, name and coat tile indices. On first read it loads the companion and links the spawner to the dog; it applies tile and name, then calls the parent readStream. The spawner can be nil if not yet synced.
---@param streamId integer
---@param connection table
function Dog:readStream(streamId, connection) end

--- Server side: writes the spawner, XML filename, spawn position, name and tile indices (3 bits each), then calls the parent writeStream.
---@param streamId integer
---@param connection table
function Dog:writeStream(streamId, connection) end

--- Server side: writes the engine companion state to the update stream via writeAnimalCompanionManagerToStream.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Dog:writeUpdateStream(streamId, connection, dirtyMask) end

--- Client side: reads the companion state from the stream with the client interpolation delay and network timing globals (engine behavior UNVERIFIED).
---@param streamId integer
---@param timestamp integer
---@param connection table
function Dog:readUpdateStream(streamId, timestamp, connection) end

--- Applies a pending coat tile once the companion is ready, otherwise stays active. On the server it teleports a staying dog home if abandoned and keeps itself active every frame.
---@param dt number
function Dog:update(dt) end

--- Server only: raises the dirty flag when the engine reports that the companion needs a network update, then calls the parent.
---@param dt number
function Dog:updateTick(dt) end

--- Network scope test: true if the viewer is closer than the smaller of the companion clip distance (scaled by coeff) and forcedClipDistance. Returns a boolean.
---@param x number
---@param y number
---@param z number
---@param coeff number
---@param isGuiVisible any
---@return boolean
function Dog:testScope(x, y, z, coeff, isGuiVisible) end

--- Network update priority: 0 if clip distance is 0, otherwise higher when nearer, plus a bonus growing with skipCount (80% distance, 20% skip weighting).
---@param skipCount number
---@param x number
---@param y number
---@param z number
---@param coeff number
---@param connection table
---@param isGuiVisible any
---@return number
function Dog:getUpdatePriority(skipCount, x, y, z, coeff, connection, isGuiVisible) end

--- Hides the dog and stops its physics update when it leaves a client's network scope.
function Dog:onGhostRemove() end

--- Shows the dog and resumes its physics update when it enters a client's network scope.
function Dog:onGhostAdd() end

--- Server only, subscribed to HOUR_CHANGED: passes the environment's day time to the companion via setCompanionDaytime. Environment is not in the dump, so its dayTime unit is UNVERIFIED.
function Dog:hourChanged() end

--- Sets the dog name, using an empty string if nil is given.
---@param name any
function Dog:setName(name) end

--- Shows or hides the companion and enables or disables its physics update, if the engine instance exists.
---@param state any
function Dog:setVisibility(state) end

--- Engine trigger callback: when the local player enters and the farm may access the dog, the pet activatable is added to the mission; on leave it is removed.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function Dog:playerInteractionTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Makes the dog follow a player. A client only stores the target and sends DogFollowEvent; the server sets the follow behavior and clears the staying flag.
---@param player integer
function Dog:followEntity(player) end

--- Clears follow and thrower targets and sends the dog to the spawner's spawn node. A client sends DogFollowEvent with no player; the server sets the go-to behavior.
function Dog:goToSpawn() end

--- Clears follow and thrower targets and starts the feed behavior toward the given bowl node. No client/server check is made here, so it is expected to be called on the server.
---@param foodBowlNode any
function Dog:onFoodBowlFilled(foodBowlNode) end

--- Starts the fetch behavior for a ball thrown by a player. A client sends DogFetchItemEvent; the server records the ball's throw position, sets the fetch behavior and remembers the thrower.
---@param player object
---@param ball any
function Dog:fetchItem(player, ball) end

--- Triggers the petting reaction. A client sends DogPetEvent; the server sets the pet behavior, increments the farm stat petDogCount and tries to unlock the PetDog achievement.
function Dog:pet() end

--- Server only: clears follow and thrower targets, sets the default behavior and flags the dog as staying (so the abandon timer can apply).
function Dog:idleStay() end

--- Server-only placeholder whose body does nothing (the engine call is commented out in the source).
function Dog:idleWander() end

--- Stores the coat atlas tile indices (for sync) and applies them at once if the companion is ready, otherwise marks them pending and keeps the dog active until it loads.
---@param tileIndexU integer
---@param tileIndexV integer
function Dog:setTextureTileIndices(tileIndexU, tileIndexV) end

--- Applies the stored tile indices to the companion with setCompanionTextureTile and clears the pending flag.
function Dog:applyTextureTile() end

--- Checks whether any controlled player or entered vehicle is within abandonRange of the dog. In range it refills the timer; otherwise it counts down dt and returns true when the timer expires.
---@param dt any
function Dog:isAbandoned(dt) end

--- Empty server-side placeholder with no effect.
function Dog:resetSteeringParms() end

--- Server only: moves the dog back to its spawn position, clears staying and follow state and shows the in-game notification that the dog is in its doghouse. A TODO in the source notes the notification is not synced.
function Dog:teleportToSpawn() end

--- Server message callback: if the player who changed farm was being followed or was the ball thrower, the dog switches to staying idle.
---@param player any
function Dog:playerFarmChanged(player) end

--- Server only: if the leaving player was followed or was the thrower, the dog switches to staying idle. Calling code is outside this file.
---@param player any
function Dog:onPlayerLeave(player) end

--- Shows the dog and, on the server, subscribes to HOUR_CHANGED and PLAYER_FARM_CHANGED messages.
function Dog:finalizePlacement() end

--- Sound manager listener: updates the companion's outdoor audio setup from the current indoor state.
---@param isIndoor any
function Dog:onIndoorStateChanged(isIndoor) end

--- Registers the savegame XML attribute `#name` (name of the dog) in the schema.
---@param schema any
---@param basePath any
function Dog.registerSavegameXMLPaths(schema, basePath) end
