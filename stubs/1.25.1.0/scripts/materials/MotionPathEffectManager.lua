---@meta
-- FS25 1.25.1.0 : materials/MotionPathEffectManager.lua (generated stub, FS25 Lua Atlas)

--- Manager of map-defined "motion path" effects (g_motionPathEffectManager, derives from AbstractManager): vegetation/soil effects based on shader-animated meshes (cutter bar cut, stubble, cultivator, plow, windrower). It does not create the effects: it loads XML definitions, shared I3Ds and materials, then provides the effect class (MotionPathEffect and its child classes, absent from the dump) with the appropriate meshes, materials and shader settings. The behaviour of the effect classes is therefore UNVERIFIED here. Runs on every peer (client and server); no network.
--- 
--- LOADING. loadMapData reads, in the map XML, map.motionPathEffects.motionPathEffect(?)#filename (internal files first, hence prioritized at selection) and map.motionPathEffects#filename (external file that lists other files). It rejects an I3D file name at this spot (an effects XML is required). Each effects XML (schema created by createMotionPathEffectXMLSchema) contains motionPathEffects.motionPathEffect(?) with: #effectClass (MotionPathEffect by default; class looked up in g_effectManager, then with the mod environment prefix, then via ClassUtil.getClassObject), #effectType (space-separated words, uppercased, DEFAULT by default), #filename (I3D loaded asynchronously and shared), .typeDefinition (specific to the effect class), .effectMeshes.effectMesh(?) (#node, #rowLength 30, #numRows 12, #skipPositions, #numVariations 1), .effectMaterials.effectMaterial(?) (node, LOD, custom diffuse/normal/specular textures) and shader settings (variation, custom maps, parameters). Once the I3D is loaded (motionPathEffectI3DFileLoaded), the kept nodes are detached, the root I3D deleted, and the effect indexed by type (effectsByType, effects list).
--- 
--- SELECTION AND APPLICATION. A vehicle effect asks for a shared effect (getSharedMotionPathEffect) then the mesh (getMotionPathEffectMesh) and the material (getMotionPathEffectMaterial), matched by the effect object itself (getIsSharedEffectMatching / getIsEffectMeshMatching / getIsEffectMaterialMatching, with a second "alternatives" pass if nothing matches). applyEffectConfiguration applies the shader settings (maps, variation, parameters) to each clone, sets the "shapeArray" and "animationArray" maps from a texture and computes the animation speed: forced value otherwise material, otherwise mesh, otherwise shared effect, otherwise 0.5. Shader parameters are applied with setShaderParameterRecursive. The speed is an animation scale; no dt is involved in this file.
--- 
--- EXTENSION POINTS. A mod can declare its effects through the map/mod XML (a mod effectClass is accepted with the environment prefix); the modMotionPathEffectsToLoad list is initialized but never used in this file (note, not verified in game).
---@class MotionPathEffectManager : AbstractManager
MotionPathEffectManager = {}

--- Creates the manager.
---@param customMt any
---@return table
function MotionPathEffectManager.new(customMt) end

--- Initializes the lists of open XMLs, shared loading ids, effects by type, effects and mod effects (this last list is not used elsewhere in this file).
function MotionPathEffectManager:initDataStructures() end

--- Remembers the base directory, derives the mod environment, loads the effects declared in the map XML then those of an optional external file. Returns true.
---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function MotionPathEffectManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Opens an external XML containing the effects list (key motionPathEffects.motionPathEffect) and loads it, then closes the file.
---@param filename string
---@param baseDirectory string
---@param customEnvironment string?
function MotionPathEffectManager:loadMotionPathEffectsFromExternalFile(filename, baseDirectory, customEnvironment) end

--- Walks a list of motionPathEffect keys in an XML; for each reads #filename and loads the associated effects XML. Stops with an XML error if the name designates an .i3d.
---@param xmlFileHandle integer
---@param key string
---@param baseDirectory string
---@param customEnvironment string?
function MotionPathEffectManager:loadMotionPathEffects(xmlFileHandle, key, baseDirectory, customEnvironment) end

--- Loads an effects XML, instantiates the definitions, resolves the effect class, reads types, typeDefinition (through the effect class) and starts the asynchronous loading of each effect's shared I3D. Counts the references to close the XML once all I3Ds have been received.
---@param filename string
---@param baseDirectory string
---@param customEnvironment string?
function MotionPathEffectManager:loadMotionPathEffectsXML(filename, baseDirectory, customEnvironment) end

--- I3D load callback: creates the meshes (rowLength, numRows, skipPositions, numVariations, shader settings, effect class data) and the materials (LOD, custom textures, shader settings), detaches the nodes, indexes the effect by type, deletes the root I3D and releases the XML on the last return. Note: for the custom normal map, the setMaterialNormalMapFromFile call receives the customDiffuse path instead of customNormal (lines 277-278); apparent bug, not verified in game.
---@param i3dNode any
---@param failedReason any
---@param args any
function MotionPathEffectManager:motionPathEffectI3DFileLoaded(i3dNode, failedReason, args) end

--- Reads the shader settings of an entity: variation name, custom maps (name, file, texture created by createMaterialTextureFromFile) and parameters (name, 4-value vector, 0 0 0 0 by default). Note: the calls for meshes and materials pass no base directory (the path is resolved by Utils.getFilename with baseDirectory nil; effect UNVERIFIED).
---@param target table
---@param xmlFile table
---@param key string
---@param baseDirectory any
function MotionPathEffectManager:loadCustomShaderSettingsFromXML(target, xmlFile, key, baseDirectory) end

--- Deletes the mesh and material nodes that still exist, the custom map textures, releases the shared I3Ds, closes the pending XMLs then delegates to the parent class.
function MotionPathEffectManager:unloadMapData() end

--- Deletes the custom map textures of an entity if they still exist.
---@param entity any
function MotionPathEffectManager:deleteCustomShaderMaps(entity) end

--- Returns the first effect for which the requesting effect object accepts the strict match, otherwise the first "alternative" match; nil if nothing.
---@param motionPathEffectObject table
---@return table
function MotionPathEffectManager:getSharedMotionPathEffect(motionPathEffectObject) end

--- Returns the matching effect mesh (strict pass then alternative), nil otherwise.
---@param sharedEffect table
---@param motionPathEffectObject table
---@return table
function MotionPathEffectManager:getMotionPathEffectMesh(sharedEffect, motionPathEffectObject) end

--- Returns the matching effect material (strict pass then alternative), nil otherwise.
---@param sharedEffect table
---@param motionPathEffectObject table
---@return table
function MotionPathEffectManager:getMotionPathEffectMaterial(sharedEffect, motionPathEffectObject) end

--- Applies to the cloned nodes the shader settings of the effect, mesh and material, then the "shapeArray" and "animationArray" maps (given texture); returns the speed scale (forced, otherwise material, mesh, effect, 0.5 by default). With no shared effect or clones, returns the forced value or 1.
---@param sharedEffect table
---@param effectMesh table
---@param effectMaterial array
---@param clonedNodes array
---@param textureEntityId integer
---@param overwrittenSpeedScale number
function MotionPathEffectManager:applyEffectConfiguration(sharedEffect, effectMesh, effectMaterial, clonedNodes, textureEntityId, overwrittenSpeedScale) end

--- Applies to a node the maps, the shader variation and the vector parameters of a target (setShaderParameterRecursive).
---@param node any
---@param target any
function MotionPathEffectManager:applyShaderSettingsParameters(node, target) end

--- Reads a shader parameter on the node (or its first shape child); returns four zeros if no shape is found.
---@param node integer
---@param name string
---@return number
---@return number
---@return number
---@return number
function MotionPathEffectManager:getEffectShaderParameter(node, name) end

--- Applies a shader variation to the material of the node and of all its shape children (LOD), replacing the material if a new one is created.
---@param node integer
---@param variation string
function MotionPathEffectManager:setEffectCustomShaderVariation(node, variation) end

--- Applies a custom map to the material in slot 0 of the node; replaces the material if needed.
---@param node integer
---@param name string
---@param textureEntityId integer
function MotionPathEffectManager:setEffectCustomMapOnNode(node, name, textureEntityId) end

--- Applies a custom map to the node and its shape children (LOD).
---@param node integer
---@param name string
---@param textureEntityId integer
function MotionPathEffectManager:setEffectCustomMap(node, name, textureEntityId) end

--- Assigns the effect material to a node and its children (specific material per LOD if defined, from the second child on).
---@param node integer
---@param material integer
function MotionPathEffectManager:setEffectMaterial(node, material) end

--- Builds once the XML schema of the effects (generic keys plus those of the MotionPathEffect, TypedMotionPathEffect, CutterMotionPathEffect, CultivatorMotionPathEffect, PlowMotionPathEffect, WindrowerMotionPathEffect classes); several keys are only used by out-of-game generation scripts.
function MotionPathEffectManager.createMotionPathEffectXMLSchema() end

--- Registers the shader setting keys: variation (#name), parameters (#name, #value) and maps (#name, #filename).
---@param schema any
---@param basePath any
function MotionPathEffectManager.registerCustomShaderSettingXMLPaths(schema, basePath) end
