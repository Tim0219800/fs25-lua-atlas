# vehicles/specializations/Wheels.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Wheels.md)*

Source: `dataS/scripts/vehicles/specializations/Wheels.lua` — FS25 1.25.1.0

✍ Vehicle specialization (no prerequisite) that owns the list of wheels (spec_wheels.wheels, Wheel objects), hubs, axles, steering nodes (Ackermann), surface sounds and wheel configurations. It is the entry point of the whole wheel chain: Wheels -> Wheel -> WheelPhysics / WheelEffects / WheelDestruction. WEATHER DATA: reads weather:getGroundWetness() every frame (onUpdate, Wheels.lua:844) and every tick (onUpdateTick, Wheels.lua:935) then distributes it to the wheels; a single numeric value whose implementation (Weather) is absent from the dump: UNVERIFIED (range and unit not confirmed here). Snow: subscription to the message MessageType.SNOW_HEIGHT_CHANGED (onWheelSnowHeightChanged). Rain, wind and temperature are not read here; they reach the dirt functions (updateWheelDirtAmount, updateWheelMudAmount) as parameters rainScale / timeSinceLastRain / temperature supplied by Washable.lua (see that specialization). TIRE/GROUND CONTACT: see WheelPhysics (contact, densityType, hasSnowContact, hasWaterContact), used here for the surface sounds (getCurrentSurfaceSound), wheel dirt and the vehicle slope (getVehicleWorldXRot, getVehicleWorldDirection, based on hasGroundContact). DIRT / MUD: validateWashableNode detects, through shader parameters in the wheel's children, the nodes "scratches_dirt_snow_wetness" (dirt + snow + wetness) and "mudAmount" (3D mud) and attaches wheel-specific dirt update functions to them. EFFECT ON THE WORLD: crop and snow destruction by the wheels (WheelDestruction.update called here, Wheels.lua:865, only if the vehicle is active, the fruitDestruction savegame option is on, no AI, and no blocking by the vehicle); terrain deformation disabled during AI work (onAIFieldWorkerStart/End, onAIImplementStart/End). CADENCE: the counter currentUpdateIndex cycles from 1 to 4 each frame to spread the contact measurement across the wheels; dt is in ms. NETWORK: only wheels with physics.isSynchronized are sent (initial stream and update stream, dirty flag raised continuously server side as soon as there are wheels); the client interpolates (networkTimeInterpolator) and does not run the physics. Declared events: onBrake, onFinishedWheelLoading, onWheelConfigurationChanged. Extension points for a modder: registered functions that can be overridden per vehicle type (updateWheelDirtAmount and updateWheelMudAmount are registerFunction entries, hence replaceable to change the wheel mud/dirt logic; getCurrentSurfaceSound, getBrakeForce, brake, getWheels), declared overrides (validateWashableNode, addToPhysics, getVehicleWorldXRot...), the events above and the onUpdate/onUpdateTick listeners. Note: setCustomBrakeForce is registered by registerFunction but no definition of Wheels.setCustomBrakeForce exists in this file (not verified in game: nil function or defined elsewhere); Wheels:getBrakeForce returns spec.customBrakeForce (0 by default). The file is 2489 lines long: the XML loading of wheels, axles, hubs and shop values was not re-read in detail.

- **Wheels** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Wheels.prerequisitesPresent(specializations: any)` | 29 | ✍ No prerequisite (always returns true). |
| `Wheels.registerEvents(vehicleType: any)` | 35 | ✍ Declares the events onBrake, onFinishedWheelLoading and onWheelConfigurationChanged. |
| `Wheels.registerFunctions(vehicleType: any)` | 43 | ✍ Registers the functions of the specialization (loading of wheels/hubs, access, braking, surface sounds, updateWheelDirtAmount, updateWheelMudAmount, onWheelSnowHeightChanged, steering...). They are therefore replaceable by a mod through the SpecializationUtil mechanisms. Also registers setCustomBrakeForce, not defined in this file. |
| `Wheels.registerOverwrittenFunctions(vehicleType: any)` | 79 | ✍ Declares the overrides: addToPhysics, removeFromPhysics, getComponentMass, getVehicleWorldXRot, getVehicleWorldDirection, validateWashableNode, getAIDirectionNode, getAIRootNode, getSupportsMountKinematic, loadBendingNodeFromXML. |
| `Wheels.registerEventListeners(vehicleType: any)` | 94 | ✍ Subscribes the specialization to onPreLoad, onLoad, onLoadFinished, onRegisterDashboardValueTypes, onDelete, network streams, onUpdate, onPostUpdate, onUpdateTick, onUpdateEnd, onLeaveVehicle, onPreAttach, onPostDetach, onRegisterAnimationValueTypes, onPostAttachImplement and AI events. |
| `Wheels.initSpecialization()` | 121 | ✍ Registers the XML schema of the specialization (wheels, wheel, hubs, configurations, axles, surface sounds, Ackermann) and the savegame paths. Not re-read in detail. |
| `Wheels.registerAckermannSteeringXMLPaths(schema: any, key: any)` | 288 | ✍ Declares the XML keys of the Ackermann steering. |
| `Wheels:onPreLoad(savegame: any)` | 301 | ✍ Reads the wheel configuration id and applies a generated configuration if one exists. |
| `Wheels:onLoad(savegame: any)` | 318 | ✍ Loads the wheel configuration: rim/hub materials, wheels (loadWheelsFromXML), hubs, steering nodes, axles, surface sounds per tire type (type wheel_<name> or wheel), network flag, subscription to SNOW_HEIGHT_CHANGED. Not fully re-read. |
| `Wheels:onLoadFinished(savegame: any)` | 547 | ✍ Server: adds the wheel mass to the vehicle default mass; if the saved wheel configuration changed, resets wheel dirt and mud and raises onWheelConfigurationChanged; applies the rim, hub and bolt materials; then calls Wheel:update once with dt = 99999, groundWetness = 0 and force true to place the visual wheels (Wheels.lua:633). |
| `Wheels:onRegisterDashboardValueTypes()` | 639 | ✍ Declares dashboard values related to the wheels. Not re-read. |
| `Wheels:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 690 | ✍ Saves the wheel configuration id (#lastConfigId). |
| `Wheels:onDelete()` | 699 | ✍ Frees shared I3D files, hubs, wheels, dynamically loaded wheels and surface sounds. |
| `Wheels:onReadStream(streamId: any, connection: any)` | 731 | ✍ Client: resets the time interpolator and reads the state of each synchronized wheel (with direct update). |
| `Wheels:onWriteStream(streamId: any, connection: any)` | 748 | ✍ Server: writes the state of each synchronized wheel. |
| `Wheels:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 762 | ✍ Client: reads, if the flag is present, the state of each synchronized wheel and the rotation time (rotatedTime, 8 bits) as interpolation targets. Not fully re-read. |
| `Wheels:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 793 | ✍ Server: writes the state of the synchronized wheels and rotatedTime (8 bits) when the dirty flag is raised. |
| `Wheels:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 819 | ✍ Per frame. Pure client: network interpolation of the wheels and rotatedTime. After the first update: reads weather:getGroundWetness() once, calls Wheel:update for each wheel (with the cyclic counter 1..4), then, if the vehicle is active, crop/snow destruction (except AI, savegame option disabled or blocking), the axles (server), the surface sounds and the steering nodes. The server raises the network flag every frame if there are wheels. |
| `Wheels:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 917 | ✍ Server: calls postUpdate of the wheels to apply pending position/friction. |
| `Wheels:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 932 | ✍ Per tick: re-reads weather:getGroundWetness() and calls Wheel:updateTick with the vehicle update distance (drives track colour/dirt and wheel effects). |
| `Wheels:onUpdateEnd(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 947 | ✍ Client: calls onUpdateEnd of the wheels (effect stop) and stops the current surface sound. |
| `Wheels:loadHubsFromXML()` | 963 | ✍ Loads all the hubs declared in vehicle.wheels.hubs.hub. |
| `Wheels.loadHubMaterial(vehicle: any, xmlFile: any, key: any, hub: any, materialName: any)` | 974 | ✍ Loads the material of a hub (base, rim or design colour depending on the XML options). |
| `Wheels:loadHubFromXML(xmlFile: any, key: any)` | 1004 | ✍ Loads a hub: shared I3D model, link, materials. Not re-read in detail. |
| `Wheels:onWheelHubI3DLoaded(i3dNode: integer, failedReason: table, args: table)` | 1054 | ✍ I3D loading callback of a hub: attaches it to the wheel node. Not re-read in detail. |
| `Wheels:loadAckermannSteeringFromXML(xmlFile: any, ackermannSteeringIndex: any, ackermannSteeringAngle: any)` | 1120 | ✍ Loads an Ackermann steering setting. Not re-read in detail. |
| `Wheels:loadWheelsFromXML(xmlFile: any, key: any, wheelConfigurationId: any)` | 1287 | ✍ Loads all the wheels of the given configuration by instantiating Wheel.new. Not re-read in detail. |
| `Wheels:loadWheelFromXML(wheel: any)` | 1314 | ✍ Loads a wheel by calling wheel:loadFromXML; returns its result (registered function, hence replaceable). |
| `Wheels:onLoadWheelChockFromXML(wheelChock: any)` | 1320 | ✍ Hook called for each loaded wheel chock (empty body: extension point). |
| `Wheels:getIsWheelChockAllowed(wheelChock: any)` | 1325 | ✍ Tells whether a wheel chock is allowed (returns true by default). |
| `Wheels:addToPhysics(superFunc: any)` | 1331 | ✍ Override: after the parent, adds each wheel to the physics with the current brake force, then applies full brake server side. |
| `Wheels:removeFromPhysics(superFunc: any)` | 1352 | ✍ Override: removes the wheels from the physics server side. |
| `Wheels:getComponentMass(superFunc: boolean, component: any) → number` | 1369 | ✍ Override: adds the mass of the wheels carried by the component. |
| `Wheels:getVehicleWorldXRot(superFunc: any) → number` | 1385 | ✍ Override: estimates the longitudinal tilt of the vehicle from the height of the wheels in ground contact (hasGroundContact). Not re-read in detail. |
| `Wheels:getVehicleWorldDirection(superFunc: any) → number, number, number` | 1433 | ✍ Override: estimates the vehicle direction from the wheels in ground contact. Not re-read in detail. |
| `Wheels:validateWashableNode(superFunc: any, node: any)` | 1502 | ✍ Override for Washable: once the vehicle is loaded, finds in each wheel the shader nodes "scratches_dirt_snow_wetness" (dirt, snow, wetness) and "mudAmount" (mud) and attaches wheel-specific dirt data to them (field/road multipliers, water factor, colour change speed) and the updateWheelDirtAmount or updateWheelMudAmount functions. Saves the wheel's snowScale value. For mud, randomly rotates the mesh and applies a cleaning multiplier of 4. Otherwise delegates to the parent. |
| `Wheels:getAIDirectionNode(superFunc: any)` | 1575 | ✍ Override: returns the wheels' steering center node if it exists, otherwise the parent's result. |
| `Wheels:getAIRootNode(superFunc: any)` | 1581 | ✍ Override: same as getAIDirectionNode (wheels' steering center, otherwise parent). |
| `Wheels:getSupportsMountKinematic(superFunc: any)` | 1587 | ✍ Override: kinematic mounting supported only if the vehicle has no wheels and the parent allows it. |
| `Wheels:loadBendingNodeFromXML(superFunc: any, xmlFile: any, key: any, bendingNode: any, ...: any)` | 1593 | ✍ Override: reads #wheelIndices of a foliage bending node to associate it with wheels. Not re-read in detail. |
| `Wheels:updateWheelDirtAmount(nodeData: any, dt: any, allowsWashingByRain: any, rainScale: any, timeSinceLastRain: any, temperature: any)` | 1633 | ✍ Dirt function for a wheel node, called by Washable with rainScale, timeSinceLastRain and temperature. Returns the change in dirt and wetness. Acts only if the wheel touches something (or forced update). On field ground, dirt x fieldDirtMultiplier; off-field and off-grassland, dirt decreases in proportion to speed (streetDirtMultiplier), multiplied by 0.15 when rainScale > 0.1 (mud sticks more in rainy weather, per the code comment). Limits the gap between the wheel dirt and the overall vehicle dirt. Evolves snowScale (towards 1 with snow contact and temperature < 1, otherwise slow return) and the node colour between dirt colour and snow colour (environment:getDirtColors, unverified). Wetness increases with waterWetnessFactor on water contact, otherwise decreases with speed (drying by rotation). |
| `Wheels:updateWheelMudAmount(nodeData: any, dt: any, allowsWashingByRain: any, rainScale: any, timeSinceLastRain: any, temperature: any)` | 1712 | ✍ 3D mud function for the mudAmount nodes: follows the dirt of the associated wheel. Maximum mud amount = WheelEffects.MAX_MUD_AMOUNT[ground type] (table not defined here: UNVERIFIED), halved when rainScale <= 0.1 (full mud only in rainy weather). Deposits mud if the wheel dirt exceeds 0.75 and the maximum is not reached, removes it otherwise, depending on speed. Wetness and colour follow those of the wheel node. |
| `Wheels:forceUpdateWheelPhysics(dt: any)` | 1758 | ✍ Reapplies brake and physical properties to all the wheels. |
| `Wheels:onWheelSnowHeightChanged(heightPct: any, heightAbs: any)` | 1767 | ✍ SNOW_HEIGHT_CHANGED message: when the snow height falls to 0 or less, resets the wheels' snowScale to zero, forces the dirt update and wakes up the vehicle. |
| `Wheels:getSteeringNodeByNode(node: any)` | 1788 | ✍ Returns the steering node associated with a given node (not re-read). |
| `Wheels:updateSteeringNodes(dt: any)` | 1801 | ✍ Updates the steering nodes from rotatedTime and their limits (not re-read in detail). |
| `Wheels:updateSteeringNodeBar(steeringNode: table, steeringAngle: number)` | 1861 | ✍ Applies the rotation/translation of the visual steering bar (not re-read in detail). |
| `Wheels:getCurrentSurfaceSound()` | 1890 | ✍ Returns the sound sample matching the surface under the first wheel with a synchronized contact state (or the last wheel), based on WheelPhysics:getSurfaceSoundAttributes. |
| `Wheels:getAreSurfaceSoundsActive()` | 1910 | ✍ Surface sounds are active if the vehicle is active for local sound (isActiveForLocalSound). |
| `Wheels:getIsVersatileYRotActive(wheel: any)` | 1916 | ✍ Returns true: free-pivoting wheels are always active (can be overridden). |
| `Wheels:getWheelFromWheelIndex(wheelIndex: any)` | 1922 | ✍ Returns the wheel of the given index (1..n). |
| `Wheels:getWheelByWheelNode(wheelNode: any)` | 1928 | ✍ Finds a wheel by node (repr, driveNode or linkNode) or by i3dMapping name. |
| `Wheels:getWheels()` | 1952 | ✍ Returns the vehicle's wheel list (spec_wheels.wheels). Standard access point for a mod that wants to read contact, ground, slip per wheel. |
| `Wheels:brake(brakePedal: any)` | 1958 | ✍ Sets the brake pedal (0..1) on all the wheels and raises onBrake if it changes. |
| `Wheels:getBrakeForce()` | 1978 | ✍ Returns the custom brake force (0 by default). |
| `Wheels:onLeaveVehicle()` | 1985 | ✍ Server: when leaving the vehicle, sets torque to zero and applies the current braking to the wheels. |
| `Wheels:onPreAttach()` | 1997 | ✍ Calls onPreAttach of each wheel (wheel chocks). |
| `Wheels:onPostDetach()` | 2006 | ✍ Calls onPostDetach of each wheel (wheel chocks). |
| `Wheels:getSteeringRotTimeByCurvature(curvature: any)` | 2015 | ✍ Converts a curvature into a steering wheel rotation time (Ackermann); not re-read in detail. |
| `Wheels:getTurningRadiusByRotTime(rotTime: any)` | 2050 | ✍ Converts a steering wheel rotation time into a turning radius; not re-read in detail. |
| `Wheels:onRegisterAnimationValueTypes()` | 2074 | ✍ Declares animation values related to the wheels; not re-read in detail. |
| `Wheels:onPostAttachImplement(object: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 2227 | ✍ Re-raises the onBrake event so the newly attached implement's braking force is applied. |
| `Wheels:onAIFieldWorkerStart()` | 2235 | ✍ Disables terrain deformation and its collision for all the wheels during AI work. |
| `Wheels:onAIImplementStart()` | 2245 | ✍ Same: disables terrain deformation for the implement driven by the AI. |
| `Wheels:onAIFieldWorkerEnd()` | 2255 | ✍ Re-enables terrain deformation and its collision. |
| `Wheels:onAIImplementEnd()` | 2265 | ✍ Re-enables terrain deformation and its collision. |
| `Wheels:getWheelSuspensionModfier()` | 2275 | ✍ Measures the spread of suspension compression between wheels (maximum deviation from the mean); the name is spelled that way in the code (Modfier). |
| `Wheels.getTireNames(instance: any)` | 2303 | ✍ Lists the tire names of the wheels of a vehicle instance (used for the shop sheet). |
| `Wheels.getBrands(items: any)` | 2330 | ✍ Lists the tire brands from a list of items (shop); not re-read in detail. |
| `Wheels.getWheelsByBrand(items: any, brand: any)` | 2345 | ✍ Filters wheel items by brand; not re-read in detail. |
| `Wheels.loadSpecValueWheelWeight(xmlFile: any, customEnvironment: any, baseDir: any)` | 2358 | ✍ Shop sheet value: wheel mass from the default or selectable wheel configuration; not re-read in detail. |
| `Wheels.loadSpecValueWheels(xmlFile: any, customEnvironment: any, baseDir: any)` | 2408 | ✍ Shop sheet value: list of wheels (not re-read in detail). |
| `Wheels.getSpecValueWheels(storeItem: any, realItem: any)` | 2415 | ✍ Shop sheet value: tire names of the real object, separated by " / "; nil without a real object. |
| `Wheels.createConfigToParentConfigMapping(xmlFile: table) → table, table` | 2465 | ✍ Builds the mapping between wheel configurations and the base configuration (#baseConfig); reports a self-reference as an XML error. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onBrake` | 36 |
| registerEvent | `onFinishedWheelLoading` | 37 |
| registerEvent | `onWheelConfigurationChanged` | 38 |
| registerFunction | `getSteeringRotTimeByCurvature` | 44 |
| registerFunction | `getTurningRadiusByRotTime` | 45 |
| registerFunction | `loadHubsFromXML` | 47 |
| registerFunction | `loadHubFromXML` | 48 |
| registerFunction | `onWheelHubI3DLoaded` | 49 |
| registerFunction | `loadAckermannSteeringFromXML` | 51 |
| registerFunction | `loadWheelsFromXML` | 53 |
| registerFunction | `loadWheelFromXML` | 54 |
| registerFunction | `onLoadWheelChockFromXML` | 56 |
| registerFunction | `getIsWheelChockAllowed` | 57 |
| registerFunction | `getIsVersatileYRotActive` | 59 |
| registerFunction | `getWheelFromWheelIndex` | 60 |
| registerFunction | `getWheelByWheelNode` | 61 |
| registerFunction | `getWheels` | 62 |
| registerFunction | `getCurrentSurfaceSound` | 63 |
| registerFunction | `getAreSurfaceSoundsActive` | 64 |
| registerFunction | `brake` | 65 |
| registerFunction | `getBrakeForce` | 66 |
| registerFunction | `setCustomBrakeForce` | 67 |
| registerFunction | `updateWheelDirtAmount` | 68 |
| registerFunction | `updateWheelMudAmount` | 69 |
| registerFunction | `forceUpdateWheelPhysics` | 70 |
| registerFunction | `onWheelSnowHeightChanged` | 71 |
| registerFunction | `getSteeringNodeByNode` | 72 |
| registerFunction | `updateSteeringNodes` | 73 |
| registerFunction | `updateSteeringNodeBar` | 74 |
| registerOverwrittenFunction | `addToPhysics` | 80 |
| registerOverwrittenFunction | `removeFromPhysics` | 81 |
| registerOverwrittenFunction | `getComponentMass` | 82 |
| registerOverwrittenFunction | `getVehicleWorldXRot` | 83 |
| registerOverwrittenFunction | `getVehicleWorldDirection` | 84 |
| registerOverwrittenFunction | `validateWashableNode` | 85 |
| registerOverwrittenFunction | `getAIDirectionNode` | 86 |
| registerOverwrittenFunction | `getAIRootNode` | 87 |
| registerOverwrittenFunction | `getSupportsMountKinematic` | 88 |
| registerOverwrittenFunction | `loadBendingNodeFromXML` | 89 |
| registerEventListener | `onPreLoad` | 95 |
| registerEventListener | `onLoad` | 96 |
| registerEventListener | `onLoadFinished` | 97 |
| registerEventListener | `onRegisterDashboardValueTypes` | 98 |
| registerEventListener | `onDelete` | 99 |
| registerEventListener | `onReadStream` | 100 |
| registerEventListener | `onWriteStream` | 101 |
| registerEventListener | `onReadUpdateStream` | 102 |
| registerEventListener | `onWriteUpdateStream` | 103 |
| registerEventListener | `onUpdate` | 104 |
| registerEventListener | `onPostUpdate` | 105 |
| registerEventListener | `onUpdateTick` | 106 |
| registerEventListener | `onUpdateEnd` | 107 |
| registerEventListener | `onLeaveVehicle` | 108 |
| registerEventListener | `onPreAttach` | 109 |
| registerEventListener | `onPostDetach` | 110 |
| registerEventListener | `onRegisterAnimationValueTypes` | 111 |
| registerEventListener | `onPostAttachImplement` | 112 |
| registerEventListener | `onAIFieldWorkerStart` | 113 |
| registerEventListener | `onAIImplementStart` | 114 |
| registerEventListener | `onAIFieldWorkerEnd` | 115 |
| registerEventListener | `onAIImplementEnd` | 116 |

## Messages

- subscribes `MessageType.SNOW_HEIGHT_CHANGED` (l.542)
