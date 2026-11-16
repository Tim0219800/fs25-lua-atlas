---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WorkParticles.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization handling three families of ground-work effects, client side only (on a pure server its onDelete/onUpdateTick/onDeactivate listeners are removed in onLoad): (1) "particleAnimations", shader-animated meshes (parameter VertxoffsetVertexdeformMotionUVscale) whose visibility follows the working depth; (2) "particles", real particle systems switched on or off via ParticleUtil.setEmittingState; (3) "effects", EffectManager effects whose fill type comes from the work area. The decision is taken on each onUpdateTick, not each frame. Common conditions: getDoGroundManipulation() and the vehicle being on a field (unless vehicle.workParticles#requireField=false). No weather or moisture data is involved: only speed, driving direction, ground contact and depth matter. Extension point: override getDoGroundManipulation (registered function) or the listeners; everything is purely visual, with no network synchronization.
---@class WorkParticles
WorkParticles = {}

--- No prerequisite: always returns true.
---@param specializations any
function WorkParticles.prerequisitesPresent(specializations) end

--- Registers in Vehicle.xmlSchema the keys vehicle.workParticles.particleAnimation(?), .particle(?) and .effect(?) (with speedThreshold, activeDirection, workAreaIndex, groundReferenceNodeIndex, needsSetIsTurnedOn), #requireField (default true) and the #depthNode attribute of groundReferenceNode.
function WorkParticles.initSpecialization() end

--- Registers the attributes of a ground animation node: node, refNodeIndex, animMeshNode, or materialType+materialId when there is no external file, and maxDepth (default -0.1 m).
---@param schema any
---@param key any
function WorkParticles.registerGroundAnimationMappingXMLPaths(schema, key) end

--- Registers the attributes of a ground particle node: node, refNodeIndex, particleNode, or particleType+fillType without a file, speedThreshold (default 0.5) and movingDirection, plus the ParticleUtil copy attributes.
---@param schema any
---@param key any
function WorkParticles.registerGroundParticleMappingXMLPaths(schema, key) end

--- Exposes to the vehicle type: getDoGroundManipulation, the animation, particle and effect loaders, and getFillTypeFromWorkAreaIndex.
---@param vehicleType any
function WorkParticles.registerFunctions(vehicleType) end

--- Overrides loadGroundReferenceNode and updateGroundReferenceNode to add depth, displacement and direction measurement to the ground reference node.
---@param vehicleType any
function WorkParticles.registerOverwrittenFunctions(vehicleType) end

--- Listens to onLoad, onDelete, onUpdateTick and onDeactivate.
---@param vehicleType any
function WorkParticles.registerEventListeners(vehicleType) end

--- Client side only: reads requireField then loops over each particleAnimation(i), particle(i) and effect(i) of the vehicle XML into spec_workParticles. On a non-client instance, removes the listeners that became useless.
---@param savegame any
function WorkParticles:onLoad(savegame) end

--- Releases the shared I3Ds (g_i3DManager:releaseSharedI3DFile), deletes the particle systems (ParticleUtil.deleteParticleSystem) and the effects (g_effectManager:deleteEffects).
function WorkParticles:onDelete() end

--- Core of the specialization. Animations: normalized depth = depth/maxWorkDepth, clamped to 0..1, smoothed by distance travelled, and set to 0 off-field; it drives visibility and the shader. Particles: emitting if ground manipulation is active, on a field, reference node active, speed > speedThreshold and right driving direction. Effects: same conditions, plus needsSetIsTurnedOn (the tool or its attacher must be turned on), the work area ground contact and activeDirection; the fillType is then passed to setEffectTypeInfo before startEffects. Binary on/off switch, no intensity modulation.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function WorkParticles:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Returns true by default; other specializations or mods can override it to cut all effects of the specialization.
function WorkParticles:getDoGroundManipulation() end

--- Reads speedThreshold and the node(j) nodes, then starts the asynchronous loading of the external I3D (#file) via loadSubSharedI3DFile.
---@param xmlFile any
---@param key any
---@param animation any
---@param index any
function WorkParticles:loadGroundAnimations(xmlFile, key, animation, index) end

--- Loading callback: attaches each animNode to its node, hides it, then deletes the loaded I3D root.
---@param i3dNode any
---@param args any
function WorkParticles:onGroundAnimationI3DLoaded(i3dNode, args) end

--- Resolves node, refNodeIndex and animMeshNode; without animMeshNode, applies the base material materialType to the node. Returns false (with an XML warning) if a reference is invalid.
---@param xmlFile any
---@param key any
---@param mapping any
---@param index any
function WorkParticles:loadGroundAnimationMapping(xmlFile, key, mapping, index) end

--- With #file: asynchronous loading of the shared I3D (g_i3DManager:loadSharedI3DFileAsync). Otherwise, mappings are built directly from the particle manager (particleType).
---@param xmlFile any
---@param key any
---@param particle any
---@param index any
function WorkParticles:loadGroundParticles(xmlFile, key, particle, index) end

--- Callback: builds the mappings, attaches the particleNodes and creates the systems with ParticleUtil.loadParticleSystemFromNode (initial emission disabled, world space enabled).
---@param i3dNode any
---@param failedReason any
---@param args any
function WorkParticles:groundParticleI3DLoaded(i3dNode, failedReason, args) end

--- Without an external file: fetches g_particleSystemManager:getParticleSystem(particleType), applies the fillType particle material if known, then copies the system onto the node (ParticleUtil.copyParticleSystem). Reads speedThreshold (default 0.5) and movingDirection.
---@param xmlFile any
---@param key any
---@param mapping any
---@param index any
---@param i3dNode any
function WorkParticles:loadGroundParticleMapping(xmlFile, key, mapping, index, i3dNode) end

--- Reads the effect parameters (speedThreshold 0.5, activeDirection 1, workAreaIndex, groundReferenceNodeIndex, needsSetIsTurnedOn false) and loads it with g_effectManager:loadEffect.
---@param xmlFile any
---@param key any
---@param effect any
---@param index any
function WorkParticles:loadGroundEffects(xmlFile, key, effect, index) end

--- Fill type of the work area: workArea.fillType, otherwise a conversion from workArea.fruitType, otherwise FillType.UNKNOWN. Note: the conversion goes through getFruitTypeIndexByFillTypeIndex although the argument is a fruitType; the name suggests the conversion direction is inverted (not verified in game).
---@param workAreaIndex any
function WorkParticles:getFillTypeFromWorkAreaIndex(workAreaIndex) end

--- After the original function, adds to the ground reference node: depthNode, movedDistance, depth and movingDirection, initialized to 0.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param groundReferenceNode any
function WorkParticles:loadGroundReferenceNode(superFunc, xmlFile, key, groundReferenceNode) end

--- Client side, with a depthNode: computes the local displacement since the last position, the driving direction (threshold 0.0001 on local z), the distance travelled and the depth, i.e. the node height minus getTerrainHeightAtWorldPos (in metres, negative when the node is sunk).
---@param superFunc any
---@param groundReferenceNode any
---@param x any
---@param y any
---@param z any
---@param terrainHeight any
---@param densityHeight any
function WorkParticles:updateGroundReferenceNode(superFunc, groundReferenceNode, x, y, z, terrainHeight, densityHeight) end

--- Stops all particle emissions and hides the animations when the vehicle is deactivated.
function WorkParticles:onDeactivate() end
