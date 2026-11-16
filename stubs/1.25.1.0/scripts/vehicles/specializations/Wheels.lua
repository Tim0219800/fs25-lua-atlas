---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Wheels.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization (no prerequisite) that owns the list of wheels (spec_wheels.wheels, Wheel objects), hubs, axles, steering nodes (Ackermann), surface sounds and wheel configurations. It is the entry point of the whole wheel chain: Wheels -> Wheel -> WheelPhysics / WheelEffects / WheelDestruction. WEATHER DATA: reads weather:getGroundWetness() every frame (onUpdate, Wheels.lua:844) and every tick (onUpdateTick, Wheels.lua:935) then distributes it to the wheels; a single numeric value whose implementation (Weather) is absent from the dump: UNVERIFIED (range and unit not confirmed here). Snow: subscription to the message MessageType.SNOW_HEIGHT_CHANGED (onWheelSnowHeightChanged). Rain, wind and temperature are not read here; they reach the dirt functions (updateWheelDirtAmount, updateWheelMudAmount) as parameters rainScale / timeSinceLastRain / temperature supplied by Washable.lua (see that specialization). TIRE/GROUND CONTACT: see WheelPhysics (contact, densityType, hasSnowContact, hasWaterContact), used here for the surface sounds (getCurrentSurfaceSound), wheel dirt and the vehicle slope (getVehicleWorldXRot, getVehicleWorldDirection, based on hasGroundContact). DIRT / MUD: validateWashableNode detects, through shader parameters in the wheel's children, the nodes "scratches_dirt_snow_wetness" (dirt + snow + wetness) and "mudAmount" (3D mud) and attaches wheel-specific dirt update functions to them. EFFECT ON THE WORLD: crop and snow destruction by the wheels (WheelDestruction.update called here, Wheels.lua:865, only if the vehicle is active, the fruitDestruction savegame option is on, no AI, and no blocking by the vehicle); terrain deformation disabled during AI work (onAIFieldWorkerStart/End, onAIImplementStart/End). CADENCE: the counter currentUpdateIndex cycles from 1 to 4 each frame to spread the contact measurement across the wheels; dt is in ms. NETWORK: only wheels with physics.isSynchronized are sent (initial stream and update stream, dirty flag raised continuously server side as soon as there are wheels); the client interpolates (networkTimeInterpolator) and does not run the physics. Declared events: onBrake, onFinishedWheelLoading, onWheelConfigurationChanged. Extension points for a modder: registered functions that can be overridden per vehicle type (updateWheelDirtAmount and updateWheelMudAmount are registerFunction entries, hence replaceable to change the wheel mud/dirt logic; getCurrentSurfaceSound, getBrakeForce, brake, getWheels), declared overrides (validateWashableNode, addToPhysics, getVehicleWorldXRot...), the events above and the onUpdate/onUpdateTick listeners. Note: setCustomBrakeForce is registered by registerFunction but no definition of Wheels.setCustomBrakeForce exists in this file (not verified in game: nil function or defined elsewhere); Wheels:getBrakeForce returns spec.customBrakeForce (0 by default). The file is 2489 lines long: the XML loading of wheels, axles, hubs and shop values was not re-read in detail.
---@class Wheels
Wheels = {}

--- No prerequisite (always returns true).
---@param specializations any
function Wheels.prerequisitesPresent(specializations) end

--- Declares the events onBrake, onFinishedWheelLoading and onWheelConfigurationChanged.
---@param vehicleType any
function Wheels.registerEvents(vehicleType) end

--- Registers the functions of the specialization (loading of wheels/hubs, access, braking, surface sounds, updateWheelDirtAmount, updateWheelMudAmount, onWheelSnowHeightChanged, steering...). They are therefore replaceable by a mod through the SpecializationUtil mechanisms. Also registers setCustomBrakeForce, not defined in this file.
---@param vehicleType any
function Wheels.registerFunctions(vehicleType) end

--- Declares the overrides: addToPhysics, removeFromPhysics, getComponentMass, getVehicleWorldXRot, getVehicleWorldDirection, validateWashableNode, getAIDirectionNode, getAIRootNode, getSupportsMountKinematic, loadBendingNodeFromXML.
---@param vehicleType any
function Wheels.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to onPreLoad, onLoad, onLoadFinished, onRegisterDashboardValueTypes, onDelete, network streams, onUpdate, onPostUpdate, onUpdateTick, onUpdateEnd, onLeaveVehicle, onPreAttach, onPostDetach, onRegisterAnimationValueTypes, onPostAttachImplement and AI events.
---@param vehicleType any
function Wheels.registerEventListeners(vehicleType) end

--- Registers the XML schema of the specialization (wheels, wheel, hubs, configurations, axles, surface sounds, Ackermann) and the savegame paths. Not re-read in detail.
function Wheels.initSpecialization() end

--- Declares the XML keys of the Ackermann steering.
---@param schema any
---@param key any
function Wheels.registerAckermannSteeringXMLPaths(schema, key) end

--- Reads the wheel configuration id and applies a generated configuration if one exists.
---@param savegame any
function Wheels:onPreLoad(savegame) end

--- Loads the wheel configuration: rim/hub materials, wheels (loadWheelsFromXML), hubs, steering nodes, axles, surface sounds per tire type (type wheel_<name> or wheel), network flag, subscription to SNOW_HEIGHT_CHANGED. Not fully re-read.
---@param savegame any
function Wheels:onLoad(savegame) end

--- Server: adds the wheel mass to the vehicle default mass; if the saved wheel configuration changed, resets wheel dirt and mud and raises onWheelConfigurationChanged; applies the rim, hub and bolt materials; then calls Wheel:update once with dt = 99999, groundWetness = 0 and force true to place the visual wheels (Wheels.lua:633).
---@param savegame any
function Wheels:onLoadFinished(savegame) end

--- Declares dashboard values related to the wheels. Not re-read.
function Wheels:onRegisterDashboardValueTypes() end

--- Saves the wheel configuration id (#lastConfigId).
---@param xmlFile any
---@param key any
---@param usedModNames any
function Wheels:saveToXMLFile(xmlFile, key, usedModNames) end

--- Frees shared I3D files, hubs, wheels, dynamically loaded wheels and surface sounds.
function Wheels:onDelete() end

--- Client: resets the time interpolator and reads the state of each synchronized wheel (with direct update).
---@param streamId any
---@param connection any
function Wheels:onReadStream(streamId, connection) end

--- Server: writes the state of each synchronized wheel.
---@param streamId any
---@param connection any
function Wheels:onWriteStream(streamId, connection) end

--- Client: reads, if the flag is present, the state of each synchronized wheel and the rotation time (rotatedTime, 8 bits) as interpolation targets. Not fully re-read.
---@param streamId any
---@param timestamp any
---@param connection any
function Wheels:onReadUpdateStream(streamId, timestamp, connection) end

--- Server: writes the state of the synchronized wheels and rotatedTime (8 bits) when the dirty flag is raised.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Wheels:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Per frame. Pure client: network interpolation of the wheels and rotatedTime. After the first update: reads weather:getGroundWetness() once, calls Wheel:update for each wheel (with the cyclic counter 1..4), then, if the vehicle is active, crop/snow destruction (except AI, savegame option disabled or blocking), the axles (server), the surface sounds and the steering nodes. The server raises the network flag every frame if there are wheels.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Wheels:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Server: calls postUpdate of the wheels to apply pending position/friction.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Wheels:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Per tick: re-reads weather:getGroundWetness() and calls Wheel:updateTick with the vehicle update distance (drives track colour/dirt and wheel effects).
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Wheels:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client: calls onUpdateEnd of the wheels (effect stop) and stops the current surface sound.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Wheels:onUpdateEnd(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads all the hubs declared in vehicle.wheels.hubs.hub.
function Wheels:loadHubsFromXML() end

--- Loads the material of a hub (base, rim or design colour depending on the XML options).
---@param vehicle any
---@param xmlFile any
---@param key any
---@param hub any
---@param materialName any
function Wheels.loadHubMaterial(vehicle, xmlFile, key, hub, materialName) end

--- Loads a hub: shared I3D model, link, materials. Not re-read in detail.
---@param xmlFile any
---@param key any
function Wheels:loadHubFromXML(xmlFile, key) end

--- I3D loading callback of a hub: attaches it to the wheel node. Not re-read in detail.
---@param i3dNode integer
---@param failedReason table
---@param args table
function Wheels:onWheelHubI3DLoaded(i3dNode, failedReason, args) end

--- Loads an Ackermann steering setting. Not re-read in detail.
---@param xmlFile any
---@param ackermannSteeringIndex any
---@param ackermannSteeringAngle any
function Wheels:loadAckermannSteeringFromXML(xmlFile, ackermannSteeringIndex, ackermannSteeringAngle) end

--- Loads all the wheels of the given configuration by instantiating Wheel.new. Not re-read in detail.
---@param xmlFile any
---@param key any
---@param wheelConfigurationId any
function Wheels:loadWheelsFromXML(xmlFile, key, wheelConfigurationId) end

--- Loads a wheel by calling wheel:loadFromXML; returns its result (registered function, hence replaceable).
---@param wheel any
function Wheels:loadWheelFromXML(wheel) end

--- Hook called for each loaded wheel chock (empty body: extension point).
---@param wheelChock any
function Wheels:onLoadWheelChockFromXML(wheelChock) end

--- Tells whether a wheel chock is allowed (returns true by default).
---@param wheelChock any
function Wheels:getIsWheelChockAllowed(wheelChock) end

--- Override: after the parent, adds each wheel to the physics with the current brake force, then applies full brake server side.
---@param superFunc any
function Wheels:addToPhysics(superFunc) end

--- Override: removes the wheels from the physics server side.
---@param superFunc any
function Wheels:removeFromPhysics(superFunc) end

--- Override: adds the mass of the wheels carried by the component.
---@param superFunc boolean
---@param component any
---@return number
function Wheels:getComponentMass(superFunc, component) end

--- Override: estimates the longitudinal tilt of the vehicle from the height of the wheels in ground contact (hasGroundContact). Not re-read in detail.
---@param superFunc any
---@return number
function Wheels:getVehicleWorldXRot(superFunc) end

--- Override: estimates the vehicle direction from the wheels in ground contact. Not re-read in detail.
---@param superFunc any
---@return number
---@return number
---@return number
function Wheels:getVehicleWorldDirection(superFunc) end

--- Override for Washable: once the vehicle is loaded, finds in each wheel the shader nodes "scratches_dirt_snow_wetness" (dirt, snow, wetness) and "mudAmount" (mud) and attaches wheel-specific dirt data to them (field/road multipliers, water factor, colour change speed) and the updateWheelDirtAmount or updateWheelMudAmount functions. Saves the wheel's snowScale value. For mud, randomly rotates the mesh and applies a cleaning multiplier of 4. Otherwise delegates to the parent.
---@param superFunc any
---@param node any
function Wheels:validateWashableNode(superFunc, node) end

--- Override: returns the wheels' steering center node if it exists, otherwise the parent's result.
---@param superFunc any
function Wheels:getAIDirectionNode(superFunc) end

--- Override: same as getAIDirectionNode (wheels' steering center, otherwise parent).
---@param superFunc any
function Wheels:getAIRootNode(superFunc) end

--- Override: kinematic mounting supported only if the vehicle has no wheels and the parent allows it.
---@param superFunc any
function Wheels:getSupportsMountKinematic(superFunc) end

--- Override: reads #wheelIndices of a foliage bending node to associate it with wheels. Not re-read in detail.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param bendingNode any
function Wheels:loadBendingNodeFromXML(superFunc, xmlFile, key, bendingNode, ...) end

--- Dirt function for a wheel node, called by Washable with rainScale, timeSinceLastRain and temperature. Returns the change in dirt and wetness. Acts only if the wheel touches something (or forced update). On field ground, dirt x fieldDirtMultiplier; off-field and off-grassland, dirt decreases in proportion to speed (streetDirtMultiplier), multiplied by 0.15 when rainScale > 0.1 (mud sticks more in rainy weather, per the code comment). Limits the gap between the wheel dirt and the overall vehicle dirt. Evolves snowScale (towards 1 with snow contact and temperature < 1, otherwise slow return) and the node colour between dirt colour and snow colour (environment:getDirtColors, unverified). Wetness increases with waterWetnessFactor on water contact, otherwise decreases with speed (drying by rotation).
---@param nodeData any
---@param dt any
---@param allowsWashingByRain any
---@param rainScale any
---@param timeSinceLastRain any
---@param temperature any
function Wheels:updateWheelDirtAmount(nodeData, dt, allowsWashingByRain, rainScale, timeSinceLastRain, temperature) end

--- 3D mud function for the mudAmount nodes: follows the dirt of the associated wheel. Maximum mud amount = WheelEffects.MAX_MUD_AMOUNT[ground type] (table not defined here: UNVERIFIED), halved when rainScale <= 0.1 (full mud only in rainy weather). Deposits mud if the wheel dirt exceeds 0.75 and the maximum is not reached, removes it otherwise, depending on speed. Wetness and colour follow those of the wheel node.
---@param nodeData any
---@param dt any
---@param allowsWashingByRain any
---@param rainScale any
---@param timeSinceLastRain any
---@param temperature any
function Wheels:updateWheelMudAmount(nodeData, dt, allowsWashingByRain, rainScale, timeSinceLastRain, temperature) end

--- Reapplies brake and physical properties to all the wheels.
---@param dt any
function Wheels:forceUpdateWheelPhysics(dt) end

--- SNOW_HEIGHT_CHANGED message: when the snow height falls to 0 or less, resets the wheels' snowScale to zero, forces the dirt update and wakes up the vehicle.
---@param heightPct any
---@param heightAbs any
function Wheels:onWheelSnowHeightChanged(heightPct, heightAbs) end

--- Returns the steering node associated with a given node (not re-read).
---@param node any
function Wheels:getSteeringNodeByNode(node) end

--- Updates the steering nodes from rotatedTime and their limits (not re-read in detail).
---@param dt any
function Wheels:updateSteeringNodes(dt) end

--- Applies the rotation/translation of the visual steering bar (not re-read in detail).
---@param steeringNode table
---@param steeringAngle number
function Wheels:updateSteeringNodeBar(steeringNode, steeringAngle) end

--- Returns the sound sample matching the surface under the first wheel with a synchronized contact state (or the last wheel), based on WheelPhysics:getSurfaceSoundAttributes.
function Wheels:getCurrentSurfaceSound() end

--- Surface sounds are active if the vehicle is active for local sound (isActiveForLocalSound).
function Wheels:getAreSurfaceSoundsActive() end

--- Returns true: free-pivoting wheels are always active (can be overridden).
---@param wheel any
function Wheels:getIsVersatileYRotActive(wheel) end

--- Returns the wheel of the given index (1..n).
---@param wheelIndex any
function Wheels:getWheelFromWheelIndex(wheelIndex) end

--- Finds a wheel by node (repr, driveNode or linkNode) or by i3dMapping name.
---@param wheelNode any
function Wheels:getWheelByWheelNode(wheelNode) end

--- Returns the vehicle's wheel list (spec_wheels.wheels). Standard access point for a mod that wants to read contact, ground, slip per wheel.
function Wheels:getWheels() end

--- Sets the brake pedal (0..1) on all the wheels and raises onBrake if it changes.
---@param brakePedal any
function Wheels:brake(brakePedal) end

--- Returns the custom brake force (0 by default).
function Wheels:getBrakeForce() end

--- Server: when leaving the vehicle, sets torque to zero and applies the current braking to the wheels.
function Wheels:onLeaveVehicle() end

--- Calls onPreAttach of each wheel (wheel chocks).
function Wheels:onPreAttach() end

--- Calls onPostDetach of each wheel (wheel chocks).
function Wheels:onPostDetach() end

--- Converts a curvature into a steering wheel rotation time (Ackermann); not re-read in detail.
---@param curvature any
function Wheels:getSteeringRotTimeByCurvature(curvature) end

--- Converts a steering wheel rotation time into a turning radius; not re-read in detail.
---@param rotTime any
function Wheels:getTurningRadiusByRotTime(rotTime) end

--- Declares animation values related to the wheels; not re-read in detail.
function Wheels:onRegisterAnimationValueTypes() end

--- Re-raises the onBrake event so the newly attached implement's braking force is applied.
---@param object any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function Wheels:onPostAttachImplement(object, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- Disables terrain deformation and its collision for all the wheels during AI work.
function Wheels:onAIFieldWorkerStart() end

--- Same: disables terrain deformation for the implement driven by the AI.
function Wheels:onAIImplementStart() end

--- Re-enables terrain deformation and its collision.
function Wheels:onAIFieldWorkerEnd() end

--- Re-enables terrain deformation and its collision.
function Wheels:onAIImplementEnd() end

--- Measures the spread of suspension compression between wheels (maximum deviation from the mean); the name is spelled that way in the code (Modfier).
function Wheels:getWheelSuspensionModfier() end

--- Lists the tire names of the wheels of a vehicle instance (used for the shop sheet).
---@param instance any
function Wheels.getTireNames(instance) end

--- Lists the tire brands from a list of items (shop); not re-read in detail.
---@param items any
function Wheels.getBrands(items) end

--- Filters wheel items by brand; not re-read in detail.
---@param items any
---@param brand any
function Wheels.getWheelsByBrand(items, brand) end

--- Shop sheet value: wheel mass from the default or selectable wheel configuration; not re-read in detail.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Wheels.loadSpecValueWheelWeight(xmlFile, customEnvironment, baseDir) end

--- Shop sheet value: list of wheels (not re-read in detail).
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Wheels.loadSpecValueWheels(xmlFile, customEnvironment, baseDir) end

--- Shop sheet value: tire names of the real object, separated by " / "; nil without a real object.
---@param storeItem any
---@param realItem any
function Wheels.getSpecValueWheels(storeItem, realItem) end

--- Builds the mapping between wheel configurations and the base configuration (#baseConfig); reports a self-reference as an XML error.
---@param xmlFile table
---@return table
---@return table
function Wheels.createConfigToParentConfigMapping(xmlFile) end
