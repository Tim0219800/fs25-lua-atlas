---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelPhysics.lua (generated stub, FS25 Lua Atlas)

--- Class (not a specialization) created per wheel (Wheel.physics): carries the XML physics parameters (radius, width, mass, stiffnesses, suspension, tire type) and the wheel's dynamic state (contact, ground type, snow, water, track color, sinking). It is the main source of TIRE/GROUND CONTACT for effect mods: WheelEffects, TireTracks and Wheels (dirt/mud) read its fields. SERVER / CLIENT: serverUpdate does everything (contact through the engine wheel shape, friction, sinking, brake); clientUpdate only re-reads the ground type and snow at the contact point (the contact itself comes from the network stream only if wheel.syncContactState is true, otherwise it stays at its initial value client side: reading of the network stream to be checked). CADENCE: contact is only recomputed one frame in four per wheel (currentUpdateIndex == wheel.updateIndex); the track color/dirt is only updated in updateTick and only if the vehicle is under TireTracks.MAX_CREATION_DISTANCE or WheelEffects.MAX_UPDATE_DISTANCE (values outside this file: UNVERIFIED). GROUND DATA (useful public fields): contact (WheelContactType: NONE, GROUND, GROUND_HEIGHT, OBJECT, from the values used here), hasGroundContact, hasWaterContact (asynchronous raycast on CollisionFlag.WATER within a radius + 0.25 m, true if the water point is above the terrain), hasSnowContact (height density type = snowSystem snow), densityBits and densityType (FieldGroundType, read from the GROUND_TYPE density map through fieldGroundSystem only when contact == GROUND; FieldGroundType.NONE otherwise, hence off-field or on road), lastTerrainAttribute (off-field terrain attribute via getTerrainAttributesAtWorldPos), groundColor / fieldGroundColor / trackColor (RGB), groundDepth, dirtAmount (0..1 dirt transfer), trackAlpha, snowScale, hasSoilContact (true on a field other than grass/cut grass), sink (sinking, m). WEATHER DATA READ: only the groundWetness parameter (numeric value passed by Wheel:update / updateTick, coming from weather:getGroundWetness; Weather absent from the dump: UNVERIFIED). It is used (1) in updateFriction through WheelsUtil.getTireFriction (tire/ground/moisture/snow friction coefficient; WheelsUtil body not re-read), with groundWetness forced to 0 on snow contact; (2) in updateTick: the track length (distance over which dirt wears off the wheel) grows with the value (30 m x (1 + wetness), increased at low speed). No direct reading of rain, wind or temperature here. PHYSICS: the wheel is an engine wheel shape (createWheelShape, setWheelShapeProps...) created server side only; sinking (extraSink) uses the tables WheelPhysics.MAX_SINK (per ground type) and WheelPhysics.WATER_SINK, not defined in this file: UNVERIFIED. The time step dt is in ms; xDriveSpeed uses g_physicsDtNonInterpolated server side. Network: synchronizes xDriveDiff, height y (8 bits, range -5..5), suspension length (7 bits), contact (2 bits, optional), versatile steering angle (9 bits). Extension points: no registerFunction; access through wheel.physics.*; overriding WheelPhysics.* is possible (shared by all wheels).
---@class WheelPhysics
WheelPhysics = {}

--- Initializes the default state: colors at zero, contact NONE, ground FieldGroundType.NONE, no snow or water, friction 1.0, no sinking.
---@param wheel any
function WheelPhysics.new(wheel) end

--- Reads all the physics#... parameters: radius and width (default 0.5 m, with a warning), mass (0.1), restLoad (1 t), frictionScale, max longitudinal/lateral stiffnesses, offsets, suspension (suspTravel 0.01, spring, dampers with their default ratios), tire type (tireType, default mud), dirt factors (fieldDirtMultiplier 75, streetDirtMultiplier -150, waterWetnessFactor 20, minDirtPercentage 0.35, maxDirtOffset 0.5, dirtColorChangeSpeed 20 s), steering and "versatile" rotation parameters, extra sinking (extraSink, max defaulting to 20% of the radius), collision mask. The mask excludes TERRAIN_DISPLACEMENT if Platform.gameplay.wheelTerrainDisplacement is false or if sinking is not supported (supportsWheelSink is only true on the server).
---@param xmlObject any
function WheelPhysics:loadFromXML(xmlObject) end

--- Adds the mass and stiffnesses of an additional (dual) wheel to the physical wheel.
---@param xmlObject any
function WheelPhysics:loadAdditionalWheel(xmlObject) end

--- Prepares netInfo (position, suspension, xDrive, smoothed speed, slip), scales the stiffnesses by the rest load and creates the network interpolators (xDriveDiff, position, suspension).
function WheelPhysics:finalize() end

--- Empty (no action).
function WheelPhysics:postLoad() end

--- Client: decodes xDriveDiff (non-linear scale, power 1/4), height y, suspension length, contact and track permission (if syncContactState) and the versatile steering angle; values are set directly or as interpolation targets.
---@param streamId any
---@param updateInterpolation any
function WheelPhysics:readStream(streamId, updateInterpolation) end

--- Server: encodes the same values (sign and magnitude of xDriveDiff with compression, y on 8 bits, suspension on 7 bits, contact on 2 bits if syncContactState, versatile angle on 9 bits).
---@param streamId any
function WheelPhysics:writeStream(streamId) end

--- Server, one frame in four. Launches an asynchronous water raycast; beyond 2 frames after the shape creation, reads the contact point, the hit object and the presence of height-density material (gives GROUND_HEIGHT), terrain (GROUND) or an object (OBJECT, with the user attribute noTireTracks; not read in detail) or no contact. If GROUND, reads the GROUND_TYPE density map at the contact point and derives densityType; if GROUND_HEIGHT, reads the height map to detect snow. Entry point to watch to identify the ground under a tire.
function WheelPhysics:updateContact() end

--- Client: redoes the reading of the ground type (if contact == GROUND) and of snow (if GROUND_HEIGHT) at the contact point, based on the last received contact. Does not determine the contact itself.
function WheelPhysics:updateContactClient() end

--- Server, if extraSink is supported: computes a target sinking according to the ground type (WheelPhysics.MAX_SINK, values UNVERIFIED), increased in water (WATER_SINK), capped by extraSinkMaxValue; only above 0.3 m/s; brings it closer progressively (rate proportional to vehicle speed, with dt in ms) then modifies deltaY. The groundWetness parameter is received but unused in this body.
---@param dt any
---@param groundWetness any
function WheelPhysics:updateSink(dt, groundWetness) end

--- Server: chooses the ground type (WheelsUtil.getGroundType with field/non-field, non-GROUND contact, depth) and computes the tire friction coefficient with the moisture value (0 if snow, snowScale 1). Only applied above 0.2 m/s; flags the friction for update. WheelsUtil body not re-read: UNVERIFIED. This is where ground moisture actually changes grip.
---@param dt any
---@param groundWetness any
function WheelPhysics:updateFriction(dt, groundWetness) end

--- Server: (re)creates the engine wheel shape (createWheelShape) with radius, suspension travel, spring and dampers, then sets force point, steering center, direction/axis, width and terrain displacement.
function WheelPhysics:updateBase() end

--- Recomputes the shape's position and direction from the repr/driveNode nodes and flags the position to be recomputed in postUpdate.
function WheelPhysics:updateShapePosition() end

--- Server: applies stiffnesses and friction (frictionScale x tire/ground coefficient) to the engine through setWheelShapeTireFriction.
function WheelPhysics:updateTireFriction() end

--- Server: applies torque, brake (x brakeFactor), steering angle, rotation damping and automatic parking brake to the wheel shape.
---@param brakeForce any
---@param torque any
function WheelPhysics:updatePhysics(brakeForce, torque) end

--- Server: reads the wheel shape's position, rotation (xDrive) and suspension into netInfo, raises the network flag if the X/Z position changed, and computes the rotation speed (does nothing if g_physicsDtNonInterpolated is 0).
---@param dt any
function WheelPhysics:updateNetInfo(dt) end

--- Computes the steering angle: steering axle of the hitch, versatile rotation (server), or an angle proportional to the steering wheel rotation time (rotatedTime) clamped by rotMin/rotMax; a custom vehicle function can correct it.
---@param dt any
function WheelPhysics:updateSteeringAngle(dt) end

--- Resets the raw rotation, creates the shape, applies friction and properties with zero torque.
---@param brakeForce any
function WheelPhysics:addToPhysics(brakeForce) end

--- Forgets the wheel shape (wheelShape = 0) and resets the creation state.
function WheelPhysics:removeFromPhysics() end

--- Updates the rotation limits and speeds (inverts the speeds if inverted, taking invertRotLimit into account).
---@param rotMin any
---@param rotMax any
---@param rotSpeed any
---@param rotSpeedNeg any
---@param inverted any
function WheelPhysics:setSteeringValues(rotMin, rotMax, rotSpeed, rotSpeedNeg, inverted) end

--- Changes the shape's width and offset and flags the position to be recomputed.
---@param width any
---@param offset any
function WheelPhysics:setWheelShapeWidth(width, offset) end

--- Sets the torque direction (+1 or -1) and recreates the shape if the direction changes.
---@param torqueDirection any
function WheelPhysics:setTorqueDirection(torqueDirection) end

--- Allows or forbids terrain deformation by the wheel (setWheelShapeTerrainDisplacement); used by field-work AIs.
---@param displacementAllowed any
function WheelPhysics:setDisplacementAllowed(displacementAllowed) end

--- Enables or removes TERRAIN_DISPLACEMENT from the wheel's collision mask, then recreates the shape if the mask changes.
---@param displacementCollisionEnabled any
function WheelPhysics:setDisplacementCollisionEnabled(displacementCollisionEnabled) end

--- Applies spring and damping multipliers (default 1) and flags the position to be recomputed.
---@param springMultiplier any
---@param dampingMultiplier any
function WheelPhysics:setSuspensionMultipliers(springMultiplier, dampingMultiplier) end

--- Returns x, y, z, xDrive rotation, suspension length (relative to deltaYOriginal) and visible steering angle (according to showSteeringAngle) for displaying the wheel.
function WheelPhysics:getVisualInfo() end

--- Per frame server side (if the vehicle is active): contact (one frame in four), sinking, friction with groundWetness, brake, torque/steering, then reading of the network info.
---@param dt any
---@param currentUpdateIndex any
---@param groundWetness any
function WheelPhysics:serverUpdate(dt, currentUpdateIndex, groundWetness) end

--- Per frame client side (if the vehicle is active): re-reads the ground at the contact point one frame in four; does no physics.
---@param dt any
---@param currentUpdateIndex any
---@param groundWetness any
function WheelPhysics:clientUpdate(dt, currentUpdateIndex, groundWetness) end

--- Per tick: limits the steering rotation speed if rotSpeedLimit is defined (Note: this code calls self:getLastSpeed() on the WheelPhysics object and uses currentRotSpeedAlpha/rotSpeedDefault which are not initialized in this file; not verified in game, probably inactive by default). Then, if the vehicle is close enough, computes the track color and dirt amount: on a field (ground map color, target dirtAmount 1, 0.7 on grass, 0.6 on cut grass, hasSoilContact true except on grass), off-field (terrain attributes, alpha 0.5 if depth is positive), on height material (alpha 1), on an object (depth 0). dirtAmount rises with distance traveled and falls back over 30 m x (1 + groundWetness), lengthened at low speed; the final color blends field color and terrain color according to dirtAmount. These values feed the tire tracks.
---@param dt any
---@param groundWetness any
---@param currentUpdateDistance any
function WheelPhysics:updateTick(dt, groundWetness, currentUpdateDistance) end

--- Server: applies the pending position or friction changes.
---@param dt any
function WheelPhysics:postUpdate(dt) end

--- Client: interpolates position, suspension and rotation received from the network, then recomputes rotation speed and steering angle with dt in ms.
---@param dt any
---@param interpolationAlpha any
function WheelPhysics:updateInterpolation(dt, interpolationAlpha) end

--- Computes the wheel's angular speed (rad/s), the smoothed linear speed (m/s, via MathUtil.rpmToMps and a 0.9/0.1 filter) and the slip (0 = grip, 1 = full slip) as the ratio between smoothed wheel speed and vehicle speed, clamped between 1 and 2 then reduced by 1. The netInfo.slip slip is read by WheelEffects.
---@param dt any
function WheelPhysics:updateXDriveSpeed(dt) end

--- Returns the track color (RGB), ground depth, terrain attribute, track alpha (maximum of trackAlpha and dirtAmount) and the blend with the terrain, for tire tracks.
function WheelPhysics:getGroundAttributes() end

--- True if there is snow contact or if the ground type is a non-grass field (neither NONE, nor GRASS, nor GRASS_CUT). Used for wheel dirt (Wheels:updateWheelDirtAmount).
function WheelPhysics:getIsOnField() end

--- Returns a surface name (shallowWater, field, snow, asphalt) or a terrain attribute to choose the rolling sound; on non-field GROUND, returns the terrain attribute.
function WheelPhysics:getSurfaceSoundAttributes() end

--- Computes the tire's normal load in tonnes from the engine contact force, the normal and the wheel mass; returns 0 without a created shape or without contact.
function WheelPhysics:getTireLoad() end

--- For free-pivoting wheels (casters): with contact, delegates to Utils.getVersatileRotation; airborne and with a spring defined, simulates a damped spring with static/dynamic friction from the node's acceleration (impact 0.2). Not read in detail.
---@param dt any
function WheelPhysics:getVersatileYRotation(dt) end

--- Water raycast callback: hasWaterContact is true if the hit point is above the terrain height, false on the last result without a hit.
---@param actorId any
---@param x any
---@param y any
---@param z any
---@param distance any
---@param nx any
---@param ny any
---@param nz any
---@param subShapeIndex any
---@param shapeId any
---@param isLast any
function WheelPhysics:waterRaycastCallback(actorId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast, ...) end

--- Declares the wheel's physics#... XML keys (not read line by line).
---@param schema any
---@param key any
function WheelPhysics.registerXMLPaths(schema, key) end

--- Declares the XML keys of additional wheels (added mass and stiffnesses).
---@param schema any
---@param key any
function WheelPhysics.registerAdditionalWheelXMLPaths(schema, key) end
