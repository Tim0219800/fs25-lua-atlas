---@meta
-- FS25 1.25.1.0 : vehicles/wheels/Wheel.lua (generated stub, FS25 Lua Atlas)

--- Class (not a specialization) representing a complete wheel: it has almost no logic of its own and orchestrates sub-objects created in Wheel.new (Wheel.lua:53-58): physics (WheelPhysics), steering (WheelSteering), destruction (WheelDestruction), effects (WheelEffects) and debug (WheelDebug), plus the visual wheels (WheelVisual) and chocks (WheelChock) loaded from XML. Called by the Wheels specialization: Wheels:onUpdate (Wheels.lua:844-846) reads g_currentMission.environment.weather:getGroundWetness() once per frame and passes it to Wheel:update(dt, currentUpdateIndex, groundWetness); Wheels:onUpdateTick (Wheels.lua:935) does the same for Wheel:updateTick. This is the only weather access in this file: a groundWetness value whose origin (Weather) is absent from the dump: UNVERIFIED. Server/client: on the server, Wheel:update runs physics:serverUpdate (ground contact, friction, brake, steering) only if the vehicle is in physics; on the client, physics:clientUpdate (ground type reading only). The visual part (wheel position, rotation, suspension, steering, effects) only runs if the vehicle is closer than Wheel.VISUAL_WHEEL_UPDATE_DISTANCE (value not defined in this file: UNVERIFIED) or if force is true; the thresholds Wheel.STEERING_ANGLE_THRESHOLD and Wheel.SUSPENSION_THRESHOLD are not defined here either. The time step dt (ms) is passed through unchanged; Wheels.lua:633 (onLoadFinished) calls update with dt = 99999 and force to initialize positions. Load-spreading detail: each wheel has an updateIndex from 1 to 4 ((index-1) mod 4 + 1) used by WheelPhysics to measure contact only one frame in four. Extension points for a modder: no registered function; access via vehicle.spec_wheels.wheels[i] (Wheel object) and its physics / effects / destruction fields; direct override of Wheel.* (shared by all wheels) is possible.
---@class Wheel
Wheel = {}

--- Creates the wheel: stores vehicle, XML, wheel XML object and indices; initializes brake, contact sync state (syncContactState = false) and the five sub-objects physics, steering, destruction, effects, debug.
---@param vehicle any
---@param xmlFile any
---@param baseKey any
---@param wheelKey any
---@param wheelIndex any
---@param configIndex any
---@param indexToParentIndex any
---@param baseDirectory any
---@param customMt any
function Wheel.new(vehicle, xmlFile, baseKey, wheelKey, wheelIndex, configIndex, indexToParentIndex, baseDirectory, customMt) end

--- Loads the wheel: mandatory repr node (otherwise failure), drive/link nodes (creates a new repr if no driveNode is given), suspension translation ratio, then delegates to physics, steering, destruction and effects; loads materials, wheel chocks, the main visual wheel and additional (dual) wheels, passing them the extra mass. Returns false if the wheel is not in an active component or if a sub-load fails.
function Wheel:loadFromXML() end

--- Computes the total width and offset of the physics shape from the visual wheels, then finalizes physics, destruction and effects and frees the XML object.
function Wheel:finalize() end

--- Post-load: propagates to the visual wheels, to physics and to effects.
function Wheel:postLoad() end

--- Frees visual wheels, chocks, effects (particles, tracks) and debug, as well as the XML object.
function Wheel:delete() end

--- Client: reads the wheel network state by delegating to physics:readStream (contact, position, suspension, rotation depending on configuration).
---@param streamId any
---@param updateInterpolation any
function Wheel:readStream(streamId, updateInterpolation) end

--- Server: writes the wheel network state via physics:writeStream.
---@param streamId any
function Wheel:writeStream(streamId) end

--- Per frame. Server: physics:serverUpdate (if in physics); client: physics:clientUpdate. Then, if the vehicle is close (or force), applies to the nodes the steering, xDrive rotation and suspension from physics:getVisualInfo, updates the visual wheels, steering (WheelSteering), chocks, and calls effects:update(dt, groundWetness, currentUpdateIndex). groundWetness is passed unchanged to the wheel effects (wet/dry particles, tracks).
---@param dt any
---@param currentUpdateIndex any
---@param groundWetness any
---@param force any
function Wheel:update(dt, currentUpdateIndex, groundWetness, force) end

--- Client: interpolates the wheel network data (position, suspension, rotation) via physics:updateInterpolation.
---@param dt any
---@param interpolationAlpha any
function Wheel:updateInterpolation(dt, interpolationAlpha) end

--- Per tick: physics:updateTick (ground color, track dirt, limited rotation speed) then effects:updateTick with groundWetness and the vehicle update distance.
---@param dt any
---@param groundWetness any
---@param currentUpdateDistance any
function Wheel:updateTick(dt, groundWetness, currentUpdateDistance) end

--- Server: makes physics apply the pending position/friction changes (a single recompute per frame).
---@param dt any
function Wheel:postUpdate(dt) end

--- End of update: delegates to effects:onUpdateEnd (effects stop).
---@param dt any
function Wheel:onUpdateEnd(dt) end

--- Puts the wheel chocks in the forced parking position (update with true) before attaching.
function Wheel:onPreAttach() end

--- Returns the chocks to their normal state (update with false) after detaching.
function Wheel:onPostDetach() end

--- Creates the wheel shape in the physics engine with the given braking force (via physics).
---@param brakeForce any
function Wheel:addToPhysics(brakeForce) end

--- Forwards to physics:updatePhysics to apply brake/torque/steering to the physics engine.
---@param brakeForce any
function Wheel:updatePhysics(brakeForce) end

--- Removes the wheel from physics (via physics).
function Wheel:removeFromPhysics() end

--- Wheel mass: physics mass plus the extra mass of the visual wheels (t).
function Wheel:getMass() end

--- Passes the steering limits and rotation speeds to physics and steering.
---@param rotMin any
---@param rotMax any
---@param rotSpeed any
---@param rotSpeedNeg any
---@param inverted any
function Wheel:setSteeringValues(rotMin, rotMax, rotSpeed, rotSpeedNeg, inverted) end

--- Stores the pedal position (0..1) and applies brake = vehicle braking x pedal.
---@param brakePedal any
function Wheel:setBrakePedal(brakePedal) end

--- Passes to WheelDestruction the "care wheel" mode (no crop destruction).
---@param isCareWheel any
function Wheel:setIsCareWheel(isCareWheel) end

--- Returns the first tire node found among the visual wheels, or nil.
function Wheel:getFirstTireNode() end

--- Declares the XML keys of a wheel (physics#repr, #driveNode, #linkNode, #transRatio, #material, #isLeft, #rimOffset, #filename, additionalWheel, wheelChock...) and chains to the registerXMLPaths of the sub-classes (WheelPhysics, WheelSteering, WheelDestruction, WheelEffects, WheelVisual, WheelChock).
---@param schema XMLSchema
---@param key string
function Wheel.registerXMLPaths(schema, key) end
