# materials/MaterialUtil.lua

*[Version française](../../fr/scripts/materials/MaterialUtil.md)*

Source: `dataS/scripts/materials/MaterialUtil.lua` — FS25 1.25.1.0

✍ Utility functions related to materials. The four "onCreate" functions are callbacks meant to be declared in an I3D (the node's onCreate attribute, resolved by global function name): they read the node's user attributes (getUserAttribute) and record the result in g_materialManager or g_particleSystemManager. They therefore run when the material-holder and particle-holder I3Ds (absent from the dump) are loaded, on every peer.

USER ATTRIBUTES READ. Base material: materialName. Per-material: fillType (fill type name, via g_fillTypeManager), materialType (must exist in MaterialManager) and materialIndex (integer, 1 by default). Particle system: particleType (required, must exist in ParticleSystemManager), defaultEmittingState (false by default), worldSpace (true by default), forceFullLifespan (false by default). The material kept is always the one in slot 0 of the node (getMaterial(id, 0)). For a mod: putting these attributes and these onCreate callbacks in its I3D is the vanilla way to declare materials and particles, provided it is loaded by addModMaterialHolder for materials (the equivalent path for particles is not in this file: UNVERIFIED).

ERROR HANDLING: all invalid cases are reported with Logging.i3dWarning with the node, then the call is abandoned without an exception; onCreateParticleSystem also prints the list of available types. The bodies of ParticleUtil.loadParticleSystemFromNode and getUserAttribute are absent from the dump: how defaultEmittingState, worldSpace and forceFullLifespan are applied is UNVERIFIED here.

- **MaterialUtil** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `MaterialUtil.onCreateBaseMaterial(_: any, id: integer)` | 17 | ✍ Material-holder callback: reads the node's materialName attribute and registers the slot-0 material as a base material (g_materialManager:addBaseMaterial); warns if the attribute is missing. |
| `MaterialUtil.validateMaterialAttributes(node: integer, sourceFuncName: string) → boolean, integer, integer, integer` | 35 | ✍ Validates a node's fillType, materialType and materialIndex attributes and, on success, returns true then the fill type index, the material type name and the index (1 by default). Returns false with an I3D warning if an attribute is missing, if the fill type or material type is unknown, or if the index is not numeric. |
| `MaterialUtil.onCreateMaterial(_: any, id: integer)` | 74 | ✍ Material-holder callback: after validation, registers the slot-0 material in the materials registry (g_materialManager:addMaterial). |
| `MaterialUtil.onCreateParticleMaterial(_: any, id: integer)` | 85 | ✍ Material-holder callback: after validation, registers the slot-0 material in the particle materials registry (g_materialManager:addParticleMaterial). |
| `MaterialUtil.onCreateParticleSystem(_: any, id: integer)` | 97 | ✍ Particle-holder callback: reads particleType, defaultEmittingState, worldSpace and forceFullLifespan, builds a particle system from the node (ParticleUtil.loadParticleSystemFromNode) and registers it as the reference system of the type (g_particleSystemManager:addParticleSystem), replacing any system already declared for that type. |
| `MaterialUtil.getMaterialBySlotName(node: any, materialName: any)` | 124 | ✍ Searches, recursively in the node then its children, for the first material whose slot name (getMaterialSlotName) equals the requested name; only looks at shapes (ClassIds.SHAPE); returns its identifier or nil. |
