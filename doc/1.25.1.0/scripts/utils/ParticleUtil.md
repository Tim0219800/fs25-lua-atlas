# utils/ParticleUtil.lua

*[Version française](../../fr/scripts/utils/ParticleUtil.md)*

Source: `dataS/scripts/utils/ParticleUtil.lua` — FS25 1.25.1.0

> ⚠ In the SDK dump this file only contains **signatures** (no bodies).

✍ Particle system utilities: loading from XML or an I3D node, emission, speeds, scales, lifetime, material and copying. Warning: the SDK dump only contains signatures, so the internal behaviour is not readable. The descriptions below come from observed vanilla usage (mainly WorkParticles); anything else is UNVERIFIED. Functions taking a "particleSystem" expect the table returned by the loading functions, not a node id.

- **ParticleUtil** (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `ParticleUtil.loadParticleSystemData(xmlFile: XMLFile\|integer, data: table, baseString: string)` | 12 | ✍ Signature only (no body in the SDK dump): reads particle system data from an XML file under baseString into the data table, apparently without creating the system. UNVERIFIED. |
| `ParticleUtil.loadParticleSystem(xmlFile: integer, particleSystem: table, baseString: string, linkNodes: array, defaultEmittingState: boolean, defaultPsFile: string?, baseDir: string, defaultLinkNode: integer?) → boolean` | 44 | ✍ Signature only (no body in the SDK dump): loads a particle system from an XML file and a base key into the particleSystem table, with link nodes, default emitting state and default file. Used by Motorized for exhaust particles. Internal behaviour UNVERIFIED. |
| `ParticleUtil.loadParticleSystemFromData(data: table, particleSystem: table, linkNodes: array, defaultEmittingState: boolean, defaultPsFile: string?, baseDir: string?, defaultLinkNode: integer?) → boolean` | 60 | ✍ Signature only (no body in the SDK dump): same idea as loadParticleSystem but from a data table previously filled by loadParticleSystemData. UNVERIFIED. |
| `ParticleUtil.particleI3DFileLoaded(i3dNode: integer, failedReason: integer, args: table)` | 96 | ✍ Signature only (no body in the SDK dump): callback of asynchronous I3D loading (i3dNode, failedReason, args), presumably finishing the system setup once the file is loaded. UNVERIFIED. |
| `ParticleUtil.loadParticleSystemFromNode(rootNode: integer, particleSystem: table, defaultEmittingState: boolean?, worldSpace: boolean?, forceFullLifespan: boolean?) → integer` | 144 | ✍ Initialises the particleSystem table from an already loaded I3D node. Vanilla usage (WorkParticles): initial emission disabled and worldSpace=true, so particles stay in world coordinates once emitted. |
| `ParticleUtil.deleteParticleSystem(particleSystem: table)` | 193 | ✍ Deletes a loaded particle system; called from onDelete handlers (WorkParticles:onDelete). |
| `ParticleUtil.deleteParticleSystems(particleSystems: table)` | 212 | ✍ Signature only (no body in the SDK dump): deletes a list of particle systems; called by Motorized:onDelete for the exhaust. UNVERIFIED. |
| `ParticleUtil.setEmittingState(particleSystem: table, state: boolean, resetStartTimer: boolean?, resetStopTimer: boolean?)` | 226 | ✍ Turns a system's emission on or off. WorkParticles calls it every tick with the computed state; the resetStartTimer/resetStopTimer parameters are not used in that case. |
| `ParticleUtil.getParticleSystemAverageSpeed(particleSystem: table) → number` | 262 | ✍ Signature only (no body in the SDK dump): by its name, returns an average speed of the system's particles. Unit and computation UNVERIFIED. |
| `ParticleUtil.setParticleSystemTimeScale(particleSystem: table, scale: number)` | 274 | ✍ Signature only (no body in the SDK dump): by its name, sets the time scale of a particle system. UNVERIFIED. |
| `ParticleUtil.setEmitCountScale(particleSystem: table, scale: number)` | 284 | ✍ Signature only (no body in the SDK dump): by its name, scales the number of particles emitted. Motorized calls it for the exhaust with the RPM ratio. UNVERIFIED. |
| `ParticleUtil.setParticleLifespan(particleSystem: table, lifespan: number)` | 294 | ✍ Signature only (no body in the SDK dump): by its name, sets the particle lifespan (unit presumably ms, UNVERIFIED). |
| `ParticleUtil.addParticleSystemSimulationTime(particleSystem: table, simTime: number)` | 304 | ✍ Signature only (no body in the SDK dump): by its name, adds simulation time to the system (to advance it as if it had run). UNVERIFIED. |
| `ParticleUtil.setParticleStartStopTime(particleSystem: table, startTime: number, stopTime: number)` | 315 | ✍ Signature only (no body in the SDK dump): by its name, sets the start and stop times of the particle emission. UNVERIFIED. |
| `ParticleUtil.getParticleSystemSpeed(particleSystem: table) → number` | 326 | ✍ Signature only (no body in the SDK dump): by its name, reads the initial speed of the particles. UNVERIFIED. |
| `ParticleUtil.setParticleSystemSpeed(particleSystem: table, speed: number)` | 338 | ✍ Signature only (no body in the SDK dump): by its name, sets the initial speed of the particles. UNVERIFIED. |
| `ParticleUtil.getParticleSystemSpeedRandom(particleSystem: table) → number` | 348 | ✍ Signature only (no body in the SDK dump): by its name, reads the random component of the particle speed. UNVERIFIED. |
| `ParticleUtil.setParticleSystemSpeedRandom(particleSystem: table, speedRandom: number)` | 360 | ✍ Signature only (no body in the SDK dump): by its name, sets the random component of the particle speed. UNVERIFIED. |
| `ParticleUtil.getParticleSystemNormalSpeed(particleSystem: table) → number` | 370 | ✍ Signature only (no body in the SDK dump): by its name, reads the speed along the emitter normal. UNVERIFIED. |
| `ParticleUtil.setParticleSystemNormalSpeed(particleSystem: table, normalSpeed: number)` | 382 | ✍ Signature only (no body in the SDK dump): by its name, sets the speed along the emitter normal. UNVERIFIED. |
| `ParticleUtil.getParticleSystemTangentSpeed(particleSystem: table) → number` | 392 | ✍ Signature only (no body in the SDK dump): by its name, reads the tangential speed. UNVERIFIED. |
| `ParticleUtil.setParticleSystemTangentSpeed(particleSystem: table, tangentSpeed: number)` | 404 | ✍ Signature only (no body in the SDK dump): by its name, sets the tangential speed. UNVERIFIED. |
| `ParticleUtil.getParticleSystemSpriteScaleX(particleSystem: table) → number` | 414 | ✍ Signature only (no body in the SDK dump): by its name, reads the sprite scale along X. UNVERIFIED. |
| `ParticleUtil.setParticleSystemSpriteScaleX(particleSystem: table, spriteScaleX: number)` | 426 | ✍ Signature only (no body in the SDK dump): by its name, sets the sprite scale along X. UNVERIFIED. |
| `ParticleUtil.getParticleSystemSpriteScaleY(particleSystem: table) → number` | 436 | ✍ Signature only (no body in the SDK dump): by its name, reads the sprite scale along Y. UNVERIFIED. |
| `ParticleUtil.setParticleSystemSpriteScaleY(particleSystem: table, spriteScaleY: number)` | 448 | ✍ Signature only (no body in the SDK dump): by its name, sets the sprite scale along Y. UNVERIFIED. |
| `ParticleUtil.getParticleSystemSpriteScaleXGain(particleSystem: table) → number` | 458 | ✍ Signature only (no body in the SDK dump): by its name, reads the gain (change over the particle's life) of the X sprite scale. UNVERIFIED. |
| `ParticleUtil.setParticleSystemSpriteScaleXGain(particleSystem: table, spriteScaleXGain: number)` | 470 | ✍ Signature only (no body in the SDK dump): by its name, sets the gain of the X sprite scale. UNVERIFIED. |
| `ParticleUtil.getParticleSystemSpriteScaleYGain(particleSystem: table) → number` | 480 | ✍ Signature only (no body in the SDK dump): by its name, reads the gain of the Y sprite scale. UNVERIFIED. |
| `ParticleUtil.setParticleSystemSpriteScaleYGain(particleSystem: table, spriteScaleYGain: number)` | 492 | ✍ Signature only (no body in the SDK dump): by its name, sets the gain of the Y sprite scale. UNVERIFIED. |
| `ParticleUtil.getParticleSystemVelocityScale(particleSystem: table) → number` | 502 | ✍ Signature only (no body in the SDK dump): by its name, reads the velocity scale, i.e. the share of the emitter's velocity transmitted to the particles. UNVERIFIED. |
| `ParticleUtil.setParticleSystemVelocityScale(particleSystem: table, velocityScale: number)` | 513 | ✍ Signature only (no body in the SDK dump): by its name, sets the velocity scale, i.e. the share of the emitter's velocity transmitted to the particles. UNVERIFIED. |
| `ParticleUtil.resetNumOfEmittedParticles(particleSystem: table)` | 522 | ✍ Signature only (no body in the SDK dump): by its name, resets the counter of emitted particles. UNVERIFIED. |
| `ParticleUtil.setEmitterShape(particleSystem: table, emitterShape: integer)` | 532 | ✍ Signature only (no body in the SDK dump): by its name, assigns the emitter shape (node id) of the system. UNVERIFIED. |
| `ParticleUtil.initEmitterScale(particleSystem: table, scale: number)` | 553 | ✍ Signature only (no body in the SDK dump): by its name, initialises the scale of the emitter. UNVERIFIED. |
| `ParticleUtil.setMaxNumOfParticlesToEmitScale(particleSystem: table, scale: number)` | 571 | ✍ Signature only (no body in the SDK dump): by its name, scales the maximum number of particles to emit. UNVERIFIED. |
| `ParticleUtil.setMaterial(particleSystem: table, material: integer)` | 584 | ✍ Applies a material to a system. Vanilla usage: the particle material specific to the fill type (g_materialManager:getParticleMaterial). |
| `ParticleUtil.copyParticleSystem(xmlFile: XMLFile, key: string, particleSystem: table, emitterShape: integer) → table` | 597 | ✍ Duplicates a reference system (coming from g_particleSystemManager) and attaches it to emitterShape, with overrides read under the XML key; returns the table of the new system (used in WorkParticles:loadGroundParticleMapping). |
| `ParticleUtil.registerParticleXMLPaths(schema: XMLSchema, basePath: string, name: string)` | 660 | ✍ Signature only (no body in the SDK dump): by its name, registers in an XML schema the particle system attributes under basePath/name. UNVERIFIED. |
| `ParticleUtil.registerParticleCopyXMLPaths(schema: XMLSchema, basePath: string)` | 680 | ✍ Registers in an XML schema the attributes accepted by copyParticleSystem (called from WorkParticles.registerGroundParticleMappingXMLPaths). |
