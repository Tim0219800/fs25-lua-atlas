---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelEffects.lua (generated stub, FS25 Lua Atlas)

--- Class (not a specialization) instantiated once per wheel: Wheel.lua:58 creates self.effects = WheelEffects.new(self), and Wheels.lua feeds it through Wheel:update (per frame, Wheels.lua:844-848) and Wheel:updateTick (per tick, Wheels.lua:935-937) with the value g_currentMission.environment.weather:getGroundWetness(). Three families of effects, all visual and mostly client-side: (1) tire tracks (addTireTrackNode, if Platform.gameplay.wheelTireTracks); (2) wheel particles loaded from a shared I3D (WheelEffects.PARTICLE_SYSTEM_PATH) as many systems as there are states in WheelEffects.PARTICLE_SYSTEM_STATES (snow, wet, dry, dust judging by the names WHEEL_SNOW / WHEEL_WET / WHEEL_DRY / WHEEL_DUST used here); (3) shallow-water effects (front/rear splashes and foam, shader parameterized by "density" and "fadeProgress"), plus registration of the wheel as an obstacle of the shallow-water simulation. WEATHER/WETNESS DATA: only one, groundWetness (number; threshold 0.2 hard-coded in updateTick) which chooses between "wet" and "dry" particles when the wheel touches soft ground, and which turns dust off as soon as it exceeds 0.2. The origin and computation of getGroundWetness live in Weather, absent from the dump: UNVERIFIED. The other data come from wheel.physics (contact, hasSoilContact, hasSnowContact, hasWaterContact, densityType, lastTerrainAttribute, groundColor, netInfo.slip, netInfo.lastSpeedSmoothed, netInfo.xDriveSpeed). The class constants (PARTICLE_SYSTEM_PATH, PARTICLE_SYSTEM_STATES, GROUND_PARTICLES, MAX_UPDATE_DISTANCE, WATER_EFFECTS, WATER_EFFECT_FADE_IN_TIME / OUT_TIME, MAX_MUD_AMOUNT) are not defined in this file of the dump: values UNVERIFIED. Particles are driven by ParticleUtil (signature-only file in the dump): internal behaviour UNVERIFIED. Per-wheel XML settings: #hasTireTracks, #hasParticles, #hasWaterParticles, #waterParticleDirection, #isShallowWaterObstacle, tire#tireTrackAtlasIndex and wheelParticleSystem#psOffset / minSpeed (3 km/h) / maxSpeed (20 km/h) / minScale (0.1) / maxScale (1) / direction / onlyActiveOnGroundContact (true). Extension points for a modder: no registered function (no registerFunction); you can only act by directly overriding WheelEffects.* (methods shared by all wheels) or by modifying the instance fields (wheel.effects.driveGroundParticleSystems, minScale, maxScale, waterEffects). Note: the particle state choice is exclusive (only one state emits per wheel and per tick); dust is only intended when groundWetness <= 0.2 and without "soil" contact; dust depends on the vehicle speed, the other states on the wheel speed multiplied by (1 + slip).
---@class WheelEffects
WheelEffects = {}

--- Constructor: stores the wheel and its vehicle, initializes the lists of I3D requests, ground particle systems and water effects, as well as the speed smoothings (not used in this file).
---@param wheel any
function WheelEffects.new(wheel) end

--- Deletes the ground particle systems (ParticleUtil.deleteParticleSystem), releases the requested shared I3Ds and removes the water effects.
function WheelEffects:delete() end

--- Reads the attributes of the wheel effects node: tracks, particles, water particles (nil value if absent), water direction, shallow-water obstacle (true by default), track atlas index, and the wheelParticleSystem block (offset, min/max speeds in km/h divided by 3600, min/max scales, direction, ground contact required). Always returns true.
---@param xmlObject any
function WheelEffects:loadFromXML(xmlObject) end

--- For each visual wheel, requests loading of one particle I3D per state known to g_particleSystemManager, one water-effects I3D (unless hasWaterParticles is false) and declares the visual wheel as a shallow-water obstacle. With no visual wheel (tracks), attaches the effects to the physics wheel (driveNode, dimensions of wheel.physics) and directly creates the track node. The wheel dimensions set sizeScale = 2 x width x radius.
function WheelEffects:finalize() end

--- Creates the tire track nodes once all visual wheels are loaded, and enables wheel.syncContactState so the contact state is synchronized.
function WheelEffects:postLoad() end

--- Load callback: hooks the emitter onto wheel.repr, copies the source particle system (ParticleUtil.copyParticleSystem), keeps the original state, speed and random speed, the size scale, an initial opacity of zero and the "tintable" user attribute (true by default), then positions, orients and scales the emitter on the wheel (width, 2 x radius).
---@param i3dNode integer
---@param failedReason table
---@param args table
function WheelEffects:onWheelParticleSystemI3DLoaded(i3dNode, failedReason, args) end

--- Load callback: creates a "waterEffectNode" under the wheel, hooks the four meshes onto it (front, front foam, rear, rear foam), offsets them according to the radius (+0.65 in front, -0.35 behind), sets "fadeProgress" from min(radius x width, 1), then hides everything until the first water contact.
---@param i3dNode any
---@param failedReason any
---@param wheelData any
function WheelEffects:onWheelWaterEffectI3DLoaded(i3dNode, failedReason, wheelData) end

--- Variant for a wheel without visual wheel: forces hasWaterParticles to true and loads the water I3D with the dimensions of the physics wheel.
function WheelEffects:addWaterEffectsToPhysicsData() end

--- Deletes the water effect nodes and sets hasWaterParticles back to false.
function WheelEffects:removeWaterEffects() end

--- Returns the emission scale (0 = nothing) of a wheel particle system as a function of a speed. Without snow: requires GROUND contact (if onlyActiveOnGroundContact), a terrain attribute present in WheelEffects.GROUND_PARTICLES and a ground that is not grass (FieldGroundType.GRASS). Then: above minSpeed and in the right driving direction (vehicle.movingDirection), linear interpolation between minScale and maxScale up to maxSpeed. No weather reading here.
---@param particleSystem any
---@param speed any
function WheelEffects:getDriveGroundParticleSystemsScale(particleSystem, speed) end

--- Per frame, only if water effects are loaded. Raises/lowers waterEffectScale according to physics.hasWaterContact (WATER_EFFECT_FADE_* durations, UNVERIFIED), then, if active, places the node at the contact point (corrected by terrain height), orients it along the driving direction with 0.8/0.2 smoothing, sets the scale (radius x speed/25 clamped to 0.25..1) and the shader densities: front (speed-1)/11, front foam (speed-11)/21 x slip (capped at 2), rear and rear foam on the wheel speed. waterParticleDirection can disable the front or the rear. The groundWetness parameter is received but unused. Debug mode via VehicleDebug.wheelEffectDebugState (forces a water contact).
---@param dt any
---@param groundWetness any
---@param currentUpdateIndex any
function WheelEffects:update(dt, groundWetness, currentUpdateIndex) end

--- Per tick, skipped beyond WheelEffects.MAX_UPDATE_DISTANCE. Chooses the particle state: snow if snow contact; otherwise soft-ground contact: WET if groundWetness > 0.2 else DRY; otherwise dust (DUST) only if groundWetness <= 0.2. For the chosen state's system: scale = getDriveGroundParticleSystemsScale (wheel speed x (1 + slip), or vehicle speed for dust); tints "tintable" particles toward physics.groundColor with a fade of about one second (alpha +0.001 per ms) via the colorAlpha shader parameter; switches emission on/off (ParticleUtil.setEmittingState) and sets the emitted count (setEmitCountScale) to clamp(scale x wheel rotation normalized on 50 km/h x sizeScale, minScale, maxScale); rewrites the particle speed to its original value. The systems of the other states are turned off. Note: the color change target condition uses "and" on the three channels, so it only triggers if R, G and B all differ (not verified in game).
---@param dt any
---@param groundWetness any
---@param currentUpdateDistance any
function WheelEffects:updateTick(dt, groundWetness, currentUpdateDistance) end

--- Turns off emission of all the ground particle systems of the wheel. Called via Wheel:onUpdateEnd from the onUpdateEnd listener of Wheels (client side); the exact timing of this event is UNVERIFIED.
---@param dt any
function WheelEffects:onUpdateEnd(dt) end

--- Registers in the XML schema the keys #hasTireTracks, #hasParticles, #hasWaterParticles, #waterParticleDirection (0: both, 1: front only, -1: rear only), #isShallowWaterObstacle, tire#tireTrackAtlasIndex and the wheelParticleSystem attributes (psOffset, minSpeed, maxSpeed, minScale, maxScale, direction, onlyActiveOnGroundContact).
---@param schema any
---@param key any
function WheelEffects.registerXMLPaths(schema, key) end
