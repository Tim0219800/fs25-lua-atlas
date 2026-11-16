---@meta
-- FS25 1.25.1.0 : utils/ParticleUtil.lua (generated stub, FS25 Lua Atlas)

--- Particle system utilities: loading from XML or an I3D node, emission, speeds, scales, lifetime, material and copying. Warning: the SDK dump only contains signatures, so the internal behaviour is not readable. The descriptions below come from observed vanilla usage (mainly WorkParticles); anything else is UNVERIFIED. Functions taking a "particleSystem" expect the table returned by the loading functions, not a node id.
---@class ParticleUtil
ParticleUtil = {}

--- Signature only (no body in the SDK dump): reads particle system data from an XML file under baseString into the data table, apparently without creating the system. UNVERIFIED.
---@param xmlFile XMLFile|integer
---@param data table
---@param baseString string
function ParticleUtil.loadParticleSystemData(xmlFile, data, baseString) end

--- Signature only (no body in the SDK dump): loads a particle system from an XML file and a base key into the particleSystem table, with link nodes, default emitting state and default file. Used by Motorized for exhaust particles. Internal behaviour UNVERIFIED.
---@param xmlFile integer
---@param particleSystem table
---@param baseString string
---@param linkNodes array
---@param defaultEmittingState boolean
---@param defaultPsFile string?
---@param baseDir string
---@param defaultLinkNode integer?
---@return boolean
function ParticleUtil.loadParticleSystem(xmlFile, particleSystem, baseString, linkNodes, defaultEmittingState, defaultPsFile, baseDir, defaultLinkNode) end

--- Signature only (no body in the SDK dump): same idea as loadParticleSystem but from a data table previously filled by loadParticleSystemData. UNVERIFIED.
---@param data table
---@param particleSystem table
---@param linkNodes array
---@param defaultEmittingState boolean
---@param defaultPsFile string?
---@param baseDir string?
---@param defaultLinkNode integer?
---@return boolean
function ParticleUtil.loadParticleSystemFromData(data, particleSystem, linkNodes, defaultEmittingState, defaultPsFile, baseDir, defaultLinkNode) end

--- Signature only (no body in the SDK dump): callback of asynchronous I3D loading (i3dNode, failedReason, args), presumably finishing the system setup once the file is loaded. UNVERIFIED.
---@param i3dNode integer
---@param failedReason integer
---@param args table
function ParticleUtil.particleI3DFileLoaded(i3dNode, failedReason, args) end

--- Initialises the particleSystem table from an already loaded I3D node. Vanilla usage (WorkParticles): initial emission disabled and worldSpace=true, so particles stay in world coordinates once emitted.
---@param rootNode integer
---@param particleSystem table
---@param defaultEmittingState boolean?
---@param worldSpace boolean?
---@param forceFullLifespan boolean?
---@return integer
function ParticleUtil.loadParticleSystemFromNode(rootNode, particleSystem, defaultEmittingState, worldSpace, forceFullLifespan) end

--- Deletes a loaded particle system; called from onDelete handlers (WorkParticles:onDelete).
---@param particleSystem table
function ParticleUtil.deleteParticleSystem(particleSystem) end

--- Signature only (no body in the SDK dump): deletes a list of particle systems; called by Motorized:onDelete for the exhaust. UNVERIFIED.
---@param particleSystems table
function ParticleUtil.deleteParticleSystems(particleSystems) end

--- Turns a system's emission on or off. WorkParticles calls it every tick with the computed state; the resetStartTimer/resetStopTimer parameters are not used in that case.
---@param particleSystem table
---@param state boolean
---@param resetStartTimer boolean?
---@param resetStopTimer boolean?
function ParticleUtil.setEmittingState(particleSystem, state, resetStartTimer, resetStopTimer) end

--- Signature only (no body in the SDK dump): by its name, returns an average speed of the system's particles. Unit and computation UNVERIFIED.
---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemAverageSpeed(particleSystem) end

--- Signature only (no body in the SDK dump): by its name, sets the time scale of a particle system. UNVERIFIED.
---@param particleSystem table
---@param scale number
function ParticleUtil.setParticleSystemTimeScale(particleSystem, scale) end

--- Signature only (no body in the SDK dump): by its name, scales the number of particles emitted. Motorized calls it for the exhaust with the RPM ratio. UNVERIFIED.
---@param particleSystem table
---@param scale number
function ParticleUtil.setEmitCountScale(particleSystem, scale) end

--- Signature only (no body in the SDK dump): by its name, sets the particle lifespan (unit presumably ms, UNVERIFIED).
---@param particleSystem table
---@param lifespan number
function ParticleUtil.setParticleLifespan(particleSystem, lifespan) end

--- Signature only (no body in the SDK dump): by its name, adds simulation time to the system (to advance it as if it had run). UNVERIFIED.
---@param particleSystem table
---@param simTime number
function ParticleUtil.addParticleSystemSimulationTime(particleSystem, simTime) end

--- Signature only (no body in the SDK dump): by its name, sets the start and stop times of the particle emission. UNVERIFIED.
---@param particleSystem table
---@param startTime number
---@param stopTime number
function ParticleUtil.setParticleStartStopTime(particleSystem, startTime, stopTime) end

--- Signature only (no body in the SDK dump): by its name, reads the initial speed of the particles. UNVERIFIED.
---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemSpeed(particleSystem) end

--- Signature only (no body in the SDK dump): by its name, sets the initial speed of the particles. UNVERIFIED.
---@param particleSystem table
---@param speed number
function ParticleUtil.setParticleSystemSpeed(particleSystem, speed) end

--- Signature only (no body in the SDK dump): by its name, reads the random component of the particle speed. UNVERIFIED.
---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemSpeedRandom(particleSystem) end

--- Signature only (no body in the SDK dump): by its name, sets the random component of the particle speed. UNVERIFIED.
---@param particleSystem table
---@param speedRandom number
function ParticleUtil.setParticleSystemSpeedRandom(particleSystem, speedRandom) end

--- Signature only (no body in the SDK dump): by its name, reads the speed along the emitter normal. UNVERIFIED.
---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemNormalSpeed(particleSystem) end

--- Signature only (no body in the SDK dump): by its name, sets the speed along the emitter normal. UNVERIFIED.
---@param particleSystem table
---@param normalSpeed number
function ParticleUtil.setParticleSystemNormalSpeed(particleSystem, normalSpeed) end

--- Signature only (no body in the SDK dump): by its name, reads the tangential speed. UNVERIFIED.
---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemTangentSpeed(particleSystem) end

--- Signature only (no body in the SDK dump): by its name, sets the tangential speed. UNVERIFIED.
---@param particleSystem table
---@param tangentSpeed number
function ParticleUtil.setParticleSystemTangentSpeed(particleSystem, tangentSpeed) end

--- Signature only (no body in the SDK dump): by its name, reads the sprite scale along X. UNVERIFIED.
---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemSpriteScaleX(particleSystem) end

--- Signature only (no body in the SDK dump): by its name, sets the sprite scale along X. UNVERIFIED.
---@param particleSystem table
---@param spriteScaleX number
function ParticleUtil.setParticleSystemSpriteScaleX(particleSystem, spriteScaleX) end

--- Signature only (no body in the SDK dump): by its name, reads the sprite scale along Y. UNVERIFIED.
---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemSpriteScaleY(particleSystem) end

--- Signature only (no body in the SDK dump): by its name, sets the sprite scale along Y. UNVERIFIED.
---@param particleSystem table
---@param spriteScaleY number
function ParticleUtil.setParticleSystemSpriteScaleY(particleSystem, spriteScaleY) end

--- Signature only (no body in the SDK dump): by its name, reads the gain (change over the particle's life) of the X sprite scale. UNVERIFIED.
---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemSpriteScaleXGain(particleSystem) end

--- Signature only (no body in the SDK dump): by its name, sets the gain of the X sprite scale. UNVERIFIED.
---@param particleSystem table
---@param spriteScaleXGain number
function ParticleUtil.setParticleSystemSpriteScaleXGain(particleSystem, spriteScaleXGain) end

--- Signature only (no body in the SDK dump): by its name, reads the gain of the Y sprite scale. UNVERIFIED.
---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemSpriteScaleYGain(particleSystem) end

--- Signature only (no body in the SDK dump): by its name, sets the gain of the Y sprite scale. UNVERIFIED.
---@param particleSystem table
---@param spriteScaleYGain number
function ParticleUtil.setParticleSystemSpriteScaleYGain(particleSystem, spriteScaleYGain) end

--- Signature only (no body in the SDK dump): by its name, reads the velocity scale, i.e. the share of the emitter's velocity transmitted to the particles. UNVERIFIED.
---@param particleSystem table
---@return number
function ParticleUtil.getParticleSystemVelocityScale(particleSystem) end

--- Signature only (no body in the SDK dump): by its name, sets the velocity scale, i.e. the share of the emitter's velocity transmitted to the particles. UNVERIFIED.
---@param particleSystem table
---@param velocityScale number
function ParticleUtil.setParticleSystemVelocityScale(particleSystem, velocityScale) end

--- Signature only (no body in the SDK dump): by its name, resets the counter of emitted particles. UNVERIFIED.
---@param particleSystem table
function ParticleUtil.resetNumOfEmittedParticles(particleSystem) end

--- Signature only (no body in the SDK dump): by its name, assigns the emitter shape (node id) of the system. UNVERIFIED.
---@param particleSystem table
---@param emitterShape integer
function ParticleUtil.setEmitterShape(particleSystem, emitterShape) end

--- Signature only (no body in the SDK dump): by its name, initialises the scale of the emitter. UNVERIFIED.
---@param particleSystem table
---@param scale number
function ParticleUtil.initEmitterScale(particleSystem, scale) end

--- Signature only (no body in the SDK dump): by its name, scales the maximum number of particles to emit. UNVERIFIED.
---@param particleSystem table
---@param scale number
function ParticleUtil.setMaxNumOfParticlesToEmitScale(particleSystem, scale) end

--- Applies a material to a system. Vanilla usage: the particle material specific to the fill type (g_materialManager:getParticleMaterial).
---@param particleSystem table
---@param material integer
function ParticleUtil.setMaterial(particleSystem, material) end

--- Duplicates a reference system (coming from g_particleSystemManager) and attaches it to emitterShape, with overrides read under the XML key; returns the table of the new system (used in WorkParticles:loadGroundParticleMapping).
---@param xmlFile XMLFile
---@param key string
---@param particleSystem table
---@param emitterShape integer
---@return table
function ParticleUtil.copyParticleSystem(xmlFile, key, particleSystem, emitterShape) end

--- Signature only (no body in the SDK dump): by its name, registers in an XML schema the particle system attributes under basePath/name. UNVERIFIED.
---@param schema XMLSchema
---@param basePath string
---@param name string
function ParticleUtil.registerParticleXMLPaths(schema, basePath, name) end

--- Registers in an XML schema the attributes accepted by copyParticleSystem (called from WorkParticles.registerGroundParticleMappingXMLPaths).
---@param schema XMLSchema
---@param basePath string
function ParticleUtil.registerParticleCopyXMLPaths(schema, basePath) end
