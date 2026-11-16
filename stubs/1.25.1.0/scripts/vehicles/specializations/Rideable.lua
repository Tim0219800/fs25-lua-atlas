---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Rideable.lua (generated stub, FS25 Lua Atlas)

--- Specialization for rideable animals (horses). It sits on top of CCTDrivable and Enterable: the horse is moved as a character controller by a server-side kinematic model with gaits (backwards, still, walk, trot, canter, gallop), turning, gravity and jumps, and clients interpolate. It drives conditional animations for the horse and rider, hoof particles and surface-dependent hoof sounds, breathing sounds, reins and equipment visibility. It holds an AnimalCluster (the animal's data) that is saved, streamed to joining clients, and handed back to a husbandry when the horse is left near a stable or breaks. XML under vehicle.rideable (speeds, turn radii, hooves, model nodes, sounds).
---@class Rideable
Rideable = {}

--- Returns true only if both CCTDrivable and Enterable specializations are present.
---@param specializations table
---@return boolean
function Rideable.prerequisitesPresent(specializations) end

--- Registers XML schema entries under vehicle.rideable (gait speeds, min turn radii, turn speed, jump height, proxy, four hooves with slow and fast step particles, model nodes, breath and halt sounds, conditional animations) and the savegame animalType key.
function Rideable.initSpecialization() end

--- Registers all Rideable functions (jump, gait, steering, kinematics, animation, sound, riding stats, footsteps, cluster accessors, etc.) on the vehicle type.
---@param vehicleType table
function Rideable.registerFunctions(vehicleType) end

--- Subscribes to load, delete, all stream read/write events (including position update streams), update, interpolation update, draw, action events, enter/leave vehicle, set broken and vehicle character changed.
---@param vehicleType table
function Rideable.registerEventListeners(vehicleType) end

--- Overrides world position setters, updateVehicleSpeed, name getters, reset/sell/overview checks, map hotspot rotation, period and day change, image filename, info box, character deletion and interaction help.
---@param vehicleType any
function Rideable.registerOverwrittenFunctions(vehicleType) end

--- Initialises state, animation parameters, gait speeds and turn radii, proxy, hooves with copied particle systems, model nodes, conditional animation player, hoof surface sounds cloned from the mission, breathing sounds and network interpolators; enables high precision position sync. With a savegame it restores the AnimalCluster (error state if the subtype is unknown) and registers the horse with the husbandry system.
---@param savegame table
function Rideable:onLoad(savegame) end

--- Marks the vehicle active (raiseActive) once loading is finished.
function Rideable:onLoadFinished() end

--- Overridden: after the parent, on the server for component 1, resyncs the internal turn angle from the node heading and, if changeInterp, the turn angle interpolator.
---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param xRot any
---@param yRot any
---@param zRot any
---@param i any
---@param changeInterp any
function Rideable:setWorldPosition(superFunc, x, y, z, xRot, yRot, zRot, i, changeInterp) end

--- Overridden: same as setWorldPosition but for the quaternion variant; resyncs the turn angle (server, component 1) after the parent.
---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param qx any
---@param qy any
---@param qz any
---@param qw any
---@param i any
---@param changeInterp any
function Rideable:setWorldPositionQuaternion(superFunc, x, y, z, qx, qy, qz, qw, i, changeInterp) end

--- Overridden: on the server passes the stored interpolation dt to the parent instead of the frame dt; clients pass the normal dt.
---@param superFunc any
---@param dt any
function Rideable:updateVehicleSpeed(superFunc, dt) end

--- Returns the average local Z offset (relative to the root node) of two leg nodes, or 0 if one is nil. Used for the ground check offsets in front and back.
---@param leftLegNode integer
---@param rightLegNode integer
---@return number
function Rideable:calculateLegsDistance(leftLegNode, rightLegNode) end

--- Unregisters from the husbandry system, deletes sounds, hoof particle systems with their emitter shapes and the animation player.
function Rideable:onDelete() end

--- Client on join: reads the on-ground flag (from server), the animal cluster (sub type then data) and the player who should enter, applying each.
---@param streamId integer
---@param connection Connection
function Rideable:onReadStream(streamId, connection) end

--- Server on join: writes the on-ground flag, the animal cluster if present, and the player to enter if any.
---@param streamId integer
---@param connection Connection
function Rideable:onWriteStream(streamId, connection) end

--- Server side reads steer axis and gait from the rider's client. Client side reads halt timer (resetting gait if halted) and optional cluster update, then refreshes dirt.
---@param streamId integer
---@param timestamp integer
---@param connection table
function Rideable:onReadUpdateStream(streamId, timestamp, connection) end

--- Client to server: writes steer axis and gait. Server to client: writes halt timer and the cluster update if a cluster exists.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Rideable:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Reads the on-ground bool from the position update stream into the on-ground interpolator.
---@param streamId integer
---@param connection Connection
function Rideable:onReadPositionUpdateStream(streamId, connection) end

--- Writes the current on-ground flag into the position update stream.
---@param streamId integer
---@param connection Connection
---@param dirtyMask any
function Rideable:onWritePositionUpdateStream(streamId, connection, dirtyMask) end

--- Empty callback used as end-of-fade handler for the screen fade.
function Rideable:endFade() end

--- Saves the animal sub type name and the cluster data (under .animal) when a cluster exists.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Rideable:saveToXMLFile(xmlFile, key, usedModNames) end

--- Stores the AnimalCluster, sets the mesh atlas UV offset from the visual variation for the animal's sub type and age, then refreshes the dirt shader.
---@param cluster any
function Rideable:setCluster(cluster) end

--- Sets the mesh dirt shader parameter from the cluster's dirt factor, but only on platforms where horse cleaning is needed; otherwise 0.
function Rideable:updateDirt() end

--- Returns the AnimalCluster of this horse (may be nil).
function Rideable:getCluster() end

--- Per frame: forces the local player to enter when pending and synced, updates input text and sends steering from a client rider, updates animation, sound (client) and riding stats (server), counts down the halt timer, reads gyroscope steering if enabled, and on the server runs the deferred husbandry handover and the husbandry range check, then deletes the vehicle after handover.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Rideable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Server: resets gait if nobody controls, runs testCCTMove and updateKinematic, feeds the position, turn angle and on-ground interpolators and applies the interpolated position and heading. All sides: leave timer, on-ground state, and ground-following orientation via two raycasts (or a close-to-ground check when stationary).
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Rideable:onUpdateInterpolation(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- While the player is on the horse, adds an extra HUD line showing the cluster's riding factor in percent.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Rideable:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Unlinks the reins. On the server, hands the cluster to the first available husbandry and deletes the horse if one exists, and notifies the last owner whether it went to a stable.
function Rideable:onSetBroken() end

--- Server check of the queued character-controller moves already simulated: if the real displacement is under 70 percent of what was expected (and expected is above 0.001 per ms), the horse is halted for 900 ms and the halt sound plays.
---@param dt any
function Rideable:testCCTMove(dt) end

--- Returns true if the horse is on the ground (unless allowWhileJump), is at canter gait or faster and is not broken.
---@param allowWhileJump any
function Rideable:getIsRideableJumpAllowed(allowWhileJump) end

--- Starts a jump: a client sends JumpEvent to the server, the server increments the horseJumpCount farm stat and tries achievements. Sets vertical speed from jump height (halved at canter) and gravity.
function Rideable:jump() end

--- Sets the current gait (input value) of the horse.
---@param gait any
function Rideable:setCurrentGait(gait) end

--- Returns the current gait value (see Rideable.GAITTYPES, defined outside the visible dump lines).
function Rideable:getCurrentGait() end

--- Sets the steering axis to the negated input; ignores a zero value so the last steer is kept until resetInputs.
---@param axisSteer any
function Rideable:setRideableSteer(axisSteer) end

--- Resets the steering axis to 0.
function Rideable:resetInputs() end

--- Server kinematic step: accelerates or decelerates toward the gait top speed (slower acceleration in the air, speed forced to 0 while halted), applies gravity, turns with limited angular acceleration, moves the character controller and queues the move for testCCTMove. Input dt is in ms.
---@param dt number
function Rideable:updateKinematic(dt) end

--- Raycast callback: ignores the horse's own controller node and nodes whose collision mask is only DEFAULT; otherwise records hit height, object and distance and stops the ray.
---@param hitObjectId integer
---@param x number
---@param y number
---@param z number
---@param distance number
---@return boolean
function Rideable:groundRaycastCallback(hitObjectId, x, y, z, distance) end

--- Computes the animation parameters (forward, vertical and yaw velocity, on ground, in water, halted, smoothed left-right weight, etc.) from speed and interpolators, feeds them to the horse animation player and, when ridden, to the rider's, then calls updateFootsteps.
---@param dt number
function Rideable:updateAnimation(dt) end

--- Client: when on the ground, plays breathing samples on a timer, effort breathing at gallop, otherwise normal breathing with a random idle interval when still.
---@param dt any
function Rideable:updateSound(dt) end

--- Sets root node world translation and quaternion, optionally resetting interpolators. Note: it reads networkInterpolators from the spec table, which this file never sets, so changeInterp true would fail (UNVERIFIED if used elsewhere).
---@param x number
---@param y number
---@param z number
---@param qx number
---@param qy number
---@param qz number
---@param qw number
---@param changeInterp boolean
function Rideable:setWorldPositionQuat(x, y, z, qx, qy, qz, qw, changeInterp) end

--- On clients, registers accelerate, brake, steer and jump actions (hidden help text by default) when active for input and stores their ids.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Rideable:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Client: clears the pending player, resets speeds, sets gait to still and on-ground false. Server: remembers the owner connection as last owner and clears the husbandry check timer.
---@param isControlling boolean
function Rideable:onEnterVehicle(isControlling) end

--- Client: when a rider appears, links the reins to the rider's hands, shows reins, sets up the rider conditional animation with the same parameters, shows equipment and fades the screen back in if it was faded.
---@param character any
function Rideable:onVehicleCharacterChanged(character) end

--- Client: resets gait and inputs and fades the screen back in. Server: arms the husbandry check for 5000 ms. All: resets the leave timer to 15000 ms.
function Rideable:onLeaveVehicle() end

--- Client: relinks both rein nodes to their original parents and hides the reins node.
function Rideable:unlinkReins() end

--- Client: shows or hides the equipment (saddle) and reins nodes if an equipment node is defined.
---@param val any
function Rideable:setEquipmentVisibility(val) end

--- Input callback: when entered, controlled, not halted and on the ground, steps the gait up one level (up to the maximum).
---@param self table
---@param actionName string
---@param inputValue number
---@param callbackState string
---@param isAnalog boolean
function Rideable.actionEventAccelerate(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: when entered, not halted and on the ground, steps the gait down one level (not below 1).
---@param self table
---@param actionName string
---@param inputValue number
---@param callbackState string
---@param isAnalog boolean
function Rideable.actionEventBrake(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: when entered and not halted, passes the input value to setRideableSteer.
---@param self table
---@param actionName string
---@param inputValue number
---@param callbackState string
---@param isAnalog boolean
function Rideable.actionEventSteer(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: calls jump when getIsRideableJumpAllowed accepts.
---@param self table
---@param actionName string
---@param inputValue number
---@param callbackState string
---@param isAnalog boolean
function Rideable.actionEventJump(self, actionName, inputValue, callbackState, isAnalog) end

--- For each hoof, raycasts to the ground; on touchdown it emits slow or fast step particles tinted with the terrain color at the hoof position and plays the surface sound, and stops emitting on liftoff. Note: in the fast branch the rotation is applied to the slow emitter shape, which looks like a bug.
---@param dt any
---@param speed any
function Rideable:updateFootsteps(dt, speed) end

--- Server: while moving with a cluster, accumulates riding time scaled by gait (x2 canter, x3 gallop) and periodically raises the cluster's riding and dirt values, updates the horseDistance farm stat and refreshes dirt.
---@param dt any
function Rideable:updateRiding(dt) end

--- Returns the hoof sample for a position: on terrain, snow, then field, then shallow or medium water, else by terrain material id; off terrain, the asphalt sample. May return nil if no sample matches.
---@param x any
---@param y any
---@param z any
---@param hitTerrain any
function Rideable:getHoofSurfaceSound(x, y, z, hitTerrain) end

--- Returns the world translation (x, y, z) of the root node.
function Rideable:getPosition() end

--- Returns the world rotation (x, y, z) of the root node.
function Rideable:getRotation() end

--- Stores the player who should enter this horse once it is synced, flags the check and wakes the vehicle.
---@param player any
function Rideable:setPlayerToEnter(player) end

--- Overridden: returns the animal cluster's name (errors if no cluster is set).
---@param superFunc any
function Rideable:getName(superFunc) end

--- Overridden: same as getName.
---@param superFunc any
function Rideable:getFullName(superFunc) end

--- Overridden to always return false: a horse cannot be reset.
---@param superFunc any
function Rideable:getCanBeReset(superFunc) end

--- Overridden to always return false: a horse cannot be sold as a vehicle.
---@param superFunc any
function Rideable:getCanBeSold(superFunc) end

--- Overridden: returns 0 for non-player hotspots, otherwise defers to the parent.
---@param superFunc any
---@param isPlayerHotspot any
function Rideable:getMapHotspotRotation(superFunc, isPlayerHotspot) end

--- Overridden to always return false: horses are hidden from the vehicle overview.
---@param superFunc any
function Rideable:getShowInVehiclesOverview(superFunc) end

--- Overridden: calls the parent then forwards the period change to the cluster.
---@param superFunc any
function Rideable:periodChanged(superFunc) end

--- Overridden: calls the parent then forwards the day change to the cluster.
---@param superFunc any
function Rideable:dayChanged(superFunc) end

--- Overridden: returns the store image of the animal visual matching the cluster's sub type and age, else the parent image.
---@param superFunc any
function Rideable:getImageFilename(superFunc) end

--- Overridden: hides the equipment and unlinks the reins before calling the parent.
---@param superFunc any
function Rideable:deleteVehicleCharacter(superFunc) end

--- Overridden: when the interaction flag is enterable, returns the ride-animal text with the animal's name; otherwise the parent text.
---@param superFunc any
---@return string
function Rideable:getInteractionHelp(superFunc) end

--- Overridden: shows the cluster info in the box first, then the parent's info.
---@param superFunc any
---@param box any
function Rideable:showInfo(superFunc, box) end

--- Debug: adds one entry per hoof with the last played sample description to the values table.
---@param values any
function Rideable:updateDebugValues(values) end

--- Sets the label and visibility of the accelerate, brake and jump actions according to the current gait (for instance walk, trot, canter, gallop, stop), enabling jump only from canter upward.
function Rideable:updateInputText() end
