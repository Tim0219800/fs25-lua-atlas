# vehicles/specializations/WorkParticles.lua

*[Version française](../../../fr/scripts/vehicles/specializations/WorkParticles.md)*

Source: `dataS/scripts/vehicles/specializations/WorkParticles.lua` — FS25 1.25.1.0

✍ Vehicle specialization handling three families of ground-work effects, client side only (on a pure server its onDelete/onUpdateTick/onDeactivate listeners are removed in onLoad): (1) "particleAnimations", shader-animated meshes (parameter VertxoffsetVertexdeformMotionUVscale) whose visibility follows the working depth; (2) "particles", real particle systems switched on or off via ParticleUtil.setEmittingState; (3) "effects", EffectManager effects whose fill type comes from the work area. The decision is taken on each onUpdateTick, not each frame. Common conditions: getDoGroundManipulation() and the vehicle being on a field (unless vehicle.workParticles#requireField=false). No weather or moisture data is involved: only speed, driving direction, ground contact and depth matter. Extension point: override getDoGroundManipulation (registered function) or the listeners; everything is purely visual, with no network synchronization.

- **WorkParticles** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `WorkParticles.prerequisitesPresent(specializations: any)` | 17 | ✍ No prerequisite: always returns true. |
| `WorkParticles.initSpecialization()` | 23 | ✍ Registers in Vehicle.xmlSchema the keys vehicle.workParticles.particleAnimation(?), .particle(?) and .effect(?) (with speedThreshold, activeDirection, workAreaIndex, groundReferenceNodeIndex, needsSetIsTurnedOn), #requireField (default true) and the #depthNode attribute of groundReferenceNode. |
| `WorkParticles.registerGroundAnimationMappingXMLPaths(schema: any, key: any)` | 50 | ✍ Registers the attributes of a ground animation node: node, refNodeIndex, animMeshNode, or materialType+materialId when there is no external file, and maxDepth (default -0.1 m). |
| `WorkParticles.registerGroundParticleMappingXMLPaths(schema: any, key: any)` | 63 | ✍ Registers the attributes of a ground particle node: node, refNodeIndex, particleNode, or particleType+fillType without a file, speedThreshold (default 0.5) and movingDirection, plus the ParticleUtil copy attributes. |
| `WorkParticles.registerFunctions(vehicleType: any)` | 79 | ✍ Exposes to the vehicle type: getDoGroundManipulation, the animation, particle and effect loaders, and getFillTypeFromWorkAreaIndex. |
| `WorkParticles.registerOverwrittenFunctions(vehicleType: any)` | 93 | ✍ Overrides loadGroundReferenceNode and updateGroundReferenceNode to add depth, displacement and direction measurement to the ground reference node. |
| `WorkParticles.registerEventListeners(vehicleType: any)` | 100 | ✍ Listens to onLoad, onDelete, onUpdateTick and onDeactivate. |
| `WorkParticles:onLoad(savegame: any)` | 109 | ✍ Client side only: reads requireField then loops over each particleAnimation(i), particle(i) and effect(i) of the vehicle XML into spec_workParticles. On a non-client instance, removes the listeners that became useless. |
| `WorkParticles:onDelete()` | 176 | ✍ Releases the shared I3Ds (g_i3DManager:releaseSharedI3DFile), deletes the particle systems (ParticleUtil.deleteParticleSystem) and the effects (g_effectManager:deleteEffects). |
| `WorkParticles:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 211 | ✍ Core of the specialization. Animations: normalized depth = depth/maxWorkDepth, clamped to 0..1, smoothed by distance travelled, and set to 0 off-field; it drives visibility and the shader. Particles: emitting if ground manipulation is active, on a field, reference node active, speed > speedThreshold and right driving direction. Effects: same conditions, plus needsSetIsTurnedOn (the tool or its attacher must be turned on), the work area ground contact and activeDirection; the fillType is then passed to setEffectTypeInfo before startEffects. Binary on/off switch, no intensity modulation. |
| `WorkParticles:getDoGroundManipulation()` | 311 | ✍ Returns true by default; other specializations or mods can override it to cut all effects of the specialization. |
| `WorkParticles:loadGroundAnimations(xmlFile: any, key: any, animation: any, index: any)` | 317 | ✍ Reads speedThreshold and the node(j) nodes, then starts the asynchronous loading of the external I3D (#file) via loadSubSharedI3DFile. |
| `WorkParticles:onGroundAnimationI3DLoaded(i3dNode: any, args: any)` | 350 | ✍ Loading callback: attaches each animNode to its node, hides it, then deletes the loaded I3D root. |
| `WorkParticles:loadGroundAnimationMapping(xmlFile: any, key: any, mapping: any, index: any)` | 366 | ✍ Resolves node, refNodeIndex and animMeshNode; without animMeshNode, applies the base material materialType to the node. Returns false (with an XML warning) if a reference is invalid. |
| `WorkParticles:loadGroundParticles(xmlFile: any, key: any, particle: any, index: any)` | 422 | ✍ With #file: asynchronous loading of the shared I3D (g_i3DManager:loadSharedI3DFileAsync). Otherwise, mappings are built directly from the particle manager (particleType). |
| `WorkParticles:groundParticleI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 456 | ✍ Callback: builds the mappings, attaches the particleNodes and creates the systems with ParticleUtil.loadParticleSystemFromNode (initial emission disabled, world space enabled). |
| `WorkParticles:loadGroundParticleMapping(xmlFile: any, key: any, mapping: any, index: any, i3dNode: any)` | 490 | ✍ Without an external file: fetches g_particleSystemManager:getParticleSystem(particleType), applies the fillType particle material if known, then copies the system onto the node (ParticleUtil.copyParticleSystem). Reads speedThreshold (default 0.5) and movingDirection. |
| `WorkParticles:loadGroundEffects(xmlFile: any, key: any, effect: any, index: any)` | 554 | ✍ Reads the effect parameters (speedThreshold 0.5, activeDirection 1, workAreaIndex, groundReferenceNodeIndex, needsSetIsTurnedOn false) and loads it with g_effectManager:loadEffect. |
| `WorkParticles:getFillTypeFromWorkAreaIndex(workAreaIndex: any)` | 567 | ✍ Fill type of the work area: workArea.fillType, otherwise a conversion from workArea.fruitType, otherwise FillType.UNKNOWN. Note: the conversion goes through getFruitTypeIndexByFillTypeIndex although the argument is a fruitType; the name suggests the conversion direction is inverted (not verified in game). |
| `WorkParticles:loadGroundReferenceNode(superFunc: any, xmlFile: any, key: any, groundReferenceNode: any)` | 582 | ✍ After the original function, adds to the ground reference node: depthNode, movedDistance, depth and movingDirection, initialized to 0. |
| `WorkParticles:updateGroundReferenceNode(superFunc: any, groundReferenceNode: any, x: any, y: any, z: any, terrainHeight: any, densityHeight: any)` | 597 | ✍ Client side, with a depthNode: computes the local displacement since the last position, the driving direction (threshold 0.0001 on local z), the distance travelled and the depth, i.e. the node height minus getTerrainHeightAtWorldPos (in metres, negative when the node is sunk). |
| `WorkParticles:onDeactivate()` | 621 | ✍ Stops all particle emissions and hides the animations when the vehicle is deactivated. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getDoGroundManipulation` | 80 |
| registerFunction | `loadGroundAnimations` | 81 |
| registerFunction | `onGroundAnimationI3DLoaded` | 82 |
| registerFunction | `loadGroundAnimationMapping` | 83 |
| registerFunction | `loadGroundParticles` | 84 |
| registerFunction | `groundParticleI3DLoaded` | 85 |
| registerFunction | `loadGroundParticleMapping` | 86 |
| registerFunction | `loadGroundEffects` | 87 |
| registerFunction | `getFillTypeFromWorkAreaIndex` | 88 |
| registerOverwrittenFunction | `loadGroundReferenceNode` | 94 |
| registerOverwrittenFunction | `updateGroundReferenceNode` | 95 |
| registerEventListener | `onLoad` | 101 |
| registerEventListener | `onDelete` | 102 |
| registerEventListener | `onUpdateTick` | 103 |
| registerEventListener | `onDeactivate` | 104 |
