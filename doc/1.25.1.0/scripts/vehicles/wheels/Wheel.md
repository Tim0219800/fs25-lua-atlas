# vehicles/wheels/Wheel.lua

*[Version française](../../../fr/scripts/vehicles/wheels/Wheel.md)*

Source: `dataS/scripts/vehicles/wheels/Wheel.lua` — FS25 1.25.1.0

✍ Class (not a specialization) representing a complete wheel: it has almost no logic of its own and orchestrates sub-objects created in Wheel.new (Wheel.lua:53-58): physics (WheelPhysics), steering (WheelSteering), destruction (WheelDestruction), effects (WheelEffects) and debug (WheelDebug), plus the visual wheels (WheelVisual) and chocks (WheelChock) loaded from XML. Called by the Wheels specialization: Wheels:onUpdate (Wheels.lua:844-846) reads g_currentMission.environment.weather:getGroundWetness() once per frame and passes it to Wheel:update(dt, currentUpdateIndex, groundWetness); Wheels:onUpdateTick (Wheels.lua:935) does the same for Wheel:updateTick. This is the only weather access in this file: a groundWetness value whose origin (Weather) is absent from the dump: UNVERIFIED. Server/client: on the server, Wheel:update runs physics:serverUpdate (ground contact, friction, brake, steering) only if the vehicle is in physics; on the client, physics:clientUpdate (ground type reading only). The visual part (wheel position, rotation, suspension, steering, effects) only runs if the vehicle is closer than Wheel.VISUAL_WHEEL_UPDATE_DISTANCE (value not defined in this file: UNVERIFIED) or if force is true; the thresholds Wheel.STEERING_ANGLE_THRESHOLD and Wheel.SUSPENSION_THRESHOLD are not defined here either. The time step dt (ms) is passed through unchanged; Wheels.lua:633 (onLoadFinished) calls update with dt = 99999 and force to initialize positions. Load-spreading detail: each wheel has an updateIndex from 1 to 4 ((index-1) mod 4 + 1) used by WheelPhysics to measure contact only one frame in four. Extension points for a modder: no registered function; access via vehicle.spec_wheels.wheels[i] (Wheel object) and its physics / effects / destruction fields; direct override of Wheel.* (shared by all wheels) is possible.

- **Wheel** (l.28)

## Functions

| Function | Line | Description |
|---|---|---|
| `Wheel.new(vehicle: any, xmlFile: any, baseKey: any, wheelKey: any, wheelIndex: any, configIndex: any, indexToParentIndex: any, baseDirectory: any, customMt: any)` | 32 | ✍ Creates the wheel: stores vehicle, XML, wheel XML object and indices; initializes brake, contact sync state (syncContactState = false) and the five sub-objects physics, steering, destruction, effects, debug. |
| `Wheel:loadFromXML()` | 66 | ✍ Loads the wheel: mandatory repr node (otherwise failure), drive/link nodes (creates a new repr if no driveNode is given), suspension translation ratio, then delegates to physics, steering, destruction and effects; loads materials, wheel chocks, the main visual wheel and additional (dual) wheels, passing them the extra mass. Returns false if the wheel is not in an active component or if a sub-load fails. |
| `Wheel:finalize()` | 228 | ✍ Computes the total width and offset of the physics shape from the visual wheels, then finalizes physics, destruction and effects and frees the XML object. |
| `Wheel:postLoad()` | 254 | ✍ Post-load: propagates to the visual wheels, to physics and to effects. |
| `Wheel:delete()` | 265 | ✍ Frees visual wheels, chocks, effects (particles, tracks) and debug, as well as the XML object. |
| `Wheel:readStream(streamId: any, updateInterpolation: any)` | 285 | ✍ Client: reads the wheel network state by delegating to physics:readStream (contact, position, suspension, rotation depending on configuration). |
| `Wheel:writeStream(streamId: any)` | 291 | ✍ Server: writes the wheel network state via physics:writeStream. |
| `Wheel:update(dt: any, currentUpdateIndex: any, groundWetness: any, force: any)` | 297 | ✍ Per frame. Server: physics:serverUpdate (if in physics); client: physics:clientUpdate. Then, if the vehicle is close (or force), applies to the nodes the steering, xDrive rotation and suspension from physics:getVisualInfo, updates the visual wheels, steering (WheelSteering), chocks, and calls effects:update(dt, groundWetness, currentUpdateIndex). groundWetness is passed unchanged to the wheel effects (wet/dry particles, tracks). |
| `Wheel:updateInterpolation(dt: any, interpolationAlpha: any)` | 375 | ✍ Client: interpolates the wheel network data (position, suspension, rotation) via physics:updateInterpolation. |
| `Wheel:updateTick(dt: any, groundWetness: any, currentUpdateDistance: any)` | 381 | ✍ Per tick: physics:updateTick (ground color, track dirt, limited rotation speed) then effects:updateTick with groundWetness and the vehicle update distance. |
| `Wheel:postUpdate(dt: any)` | 388 | ✍ Server: makes physics apply the pending position/friction changes (a single recompute per frame). |
| `Wheel:onUpdateEnd(dt: any)` | 394 | ✍ End of update: delegates to effects:onUpdateEnd (effects stop). |
| `Wheel:onPreAttach()` | 400 | ✍ Puts the wheel chocks in the forced parking position (update with true) before attaching. |
| `Wheel:onPostDetach()` | 408 | ✍ Returns the chocks to their normal state (update with false) after detaching. |
| `Wheel:addToPhysics(brakeForce: any)` | 416 | ✍ Creates the wheel shape in the physics engine with the given braking force (via physics). |
| `Wheel:updatePhysics(brakeForce: any)` | 422 | ✍ Forwards to physics:updatePhysics to apply brake/torque/steering to the physics engine. |
| `Wheel:removeFromPhysics()` | 428 | ✍ Removes the wheel from physics (via physics). |
| `Wheel:getMass()` | 434 | ✍ Wheel mass: physics mass plus the extra mass of the visual wheels (t). |
| `Wheel:setSteeringValues(rotMin: any, rotMax: any, rotSpeed: any, rotSpeedNeg: any, inverted: any)` | 440 | ✍ Passes the steering limits and rotation speeds to physics and steering. |
| `Wheel:setBrakePedal(brakePedal: any)` | 447 | ✍ Stores the pedal position (0..1) and applies brake = vehicle braking x pedal. |
| `Wheel:setIsCareWheel(isCareWheel: any)` | 455 | ✍ Passes to WheelDestruction the "care wheel" mode (no crop destruction). |
| `Wheel:getFirstTireNode()` | 461 | ✍ Returns the first tire node found among the visual wheels, or nil. |
| `Wheel.registerXMLPaths(schema: XMLSchema, key: string)` | 476 | ✍ Declares the XML keys of a wheel (physics#repr, #driveNode, #linkNode, #transRatio, #material, #isLeft, #rimOffset, #filename, additionalWheel, wheelChock...) and chains to the registerXMLPaths of the sub-classes (WheelPhysics, WheelSteering, WheelDestruction, WheelEffects, WheelVisual, WheelChock). |
