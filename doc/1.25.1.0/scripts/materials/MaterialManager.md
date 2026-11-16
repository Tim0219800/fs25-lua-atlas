# materials/MaterialManager.lua

*[Version française](../../fr/scripts/materials/MaterialManager.md)*

Source: `dataS/scripts/materials/MaterialManager.lua` — FS25 1.25.1.0

✍ Global material manager (g_materialManager, derives from AbstractManager). It keeps five registries: (1) material types (list of names), (2) base materials by name, (3) materials by fill type (self.materials), (4) particle materials by fill type (self.particleMaterials), (5) fonts (FontMaterial). Materials are not created here: they are registered by MaterialUtil "onCreate" callbacks while the "material holder" I3Ds are loaded; those I3Ds and the fonts XML file (MaterialManager.DEFAULT_FONT_MATERIAL_XML, constant absent from the dump) are not in the dump.

LOOKUP KEY. A material is found by (fillTypeIndex, material type name, index). Types declared at loadMapData (MaterialManager.lua:60-78): fillplane, icon, unloading, smoke, straw, chopper, soil, sprayer, sprayerCannonSolid, sprayerCannonBillboard, spreader, pipe, mower, belt, belt_cropDirt, belt_cropClean, leveler, washer, pickup. Names are stored in uppercase; the global MaterialType table points to nameToIndex. To add a mod-specific type: addMaterialType (before the material holders are loaded).

EFFECT USE. getParticleMaterial(fillType, type, index) provides the material to apply to a particle system according to the matter (e.g. grain, soil), through ParticleUtil.setMaterial in WorkParticles; getMaterial serves other uses (e.g. fill surfaces, belts, conveyors). Both return nil if the fill type, the material type or the index does not exist, without a log (the warnings are in lines marked #debug, ignored in production). Materials declared several times for the same key are overwritten, with a developer warning only if g_showDevelopmentWarnings.

SHARING AND LOADING. Mod material holders are queued by addModMaterialHolder (file name = key: no duplicates) then loaded by loadModMaterialHolders asynchronously (g_i3DManager:loadI3DFileAsync); on return, each child is detached from the tree and kept in loadedMaterialHolderNodes so the materials stay valid until unloadMapData, which deletes those nodes. None of the data is network-synchronized: loading happens on each peer (client, server); the caller is probably the mission/mods set (UNVERIFIED: caller absent from the dump).

EXTENSION POINTS. No registerFunction or event: a mod can call g_materialManager:addMaterialType, addParticleMaterial, addBaseMaterial, addModMaterialHolder or read the tables. These calls must precede the end of map loading; that exact moment (loadModMaterialHolders) is UNVERIFIED here.

- **MaterialManager** inherits from `AbstractManager` (l.23)

## Functions

| Function | Line | Description |
|---|---|---|
| `MaterialManager.new(customMt: any) → MaterialManager` | 28 | ✍ Creates the manager and prepares the fonts XML schema (FontMaterial.registerXMLPaths). |
| `MaterialManager:initDataStructures()` | 39 | ✍ Resets all the registries: names, types, materials, particle materials, fonts, base materials, mod material holders and loaded nodes. |
| `MaterialManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any, finishedLoadingCallback: any, callbackTarget: any) → boolean` | 57 | ✍ Declares the nineteen vanilla material types, publishes the global MaterialType table, remembers the end-of-loading callback then starts loading the default fonts XML. Returns true. |
| `MaterialManager:unloadMapData()` | 93 | ✍ Deletes the material holder nodes, the current XML, the fonts (nodes, materials, shared I3D) then delegates to the parent class. |
| `MaterialManager:addMaterialType(name: string)` | 122 | ✍ Adds a material type (name in uppercase) after validating the name; no effect if already known. |
| `MaterialManager:getMaterialTypeByName(name: string) → string` | 142 | ✍ Returns the normalized (uppercase) name of the type if it exists, otherwise nil. |
| `MaterialManager:addBaseMaterial(materialName: string, materialId: integer)` | 159 | ✍ Registers a base material under its name (uppercase) and in the base materials list. |
| `MaterialManager:getBaseMaterialByName(materialName: string) → integer` | 168 | ✍ Returns the base material id by name (case-insensitive), nil if absent. |
| `MaterialManager:addMaterial(fillTypeIndex: integer, materialType: string, materialIndex: integer, materialId: integer)` | 182 | ✍ Registers a material for a fill type, a material type and an index, in the materials registry. |
| `MaterialManager:addParticleMaterial(fillTypeIndex: integer, materialType: string, materialIndex: integer, materialId: integer)` | 192 | ✍ Same thing, in the particle materials registry. |
| `MaterialManager:addMaterialToTarget(target: table, fillTypeIndex: integer, materialType: string, materialIndex: integer, materialId: integer)` | 203 | ✍ Inserts the material into the target table, at three levels (fill, type, index). Ignores the call if an argument is nil. Overwriting an existing material is only flagged by a developer warning. |
| `MaterialManager:getMaterial(fillType: integer, materialTypeName: string, materialIndex: integer) → integer` | 232 | ✍ Returns the material for (fill type, material type, index), nil otherwise. |
| `MaterialManager:getParticleMaterial(fillType: integer, materialTypeName: string, materialIndex: integer) → integer` | 242 | ✍ Returns the particle material for (fill type, material type, index), nil otherwise; this is the function used to dress particles according to the matter. |
| `MaterialManager:getMaterialFromTarget(target: integer, fillType: integer, materialTypeName: string, materialIndex: integer) → integer` | 252 | ✍ Generic lookup in a target table: validates the type name, then descends into fill type, material type and index; returns nil as soon as a level is missing or an argument is nil. |
| `MaterialManager:addModMaterialHolder(filename: any)` | 279 | ✍ Queues an I3D material holder file provided by a mod (key = file name, hence deduplicated). |
| `MaterialManager:loadModMaterialHolders()` | 285 | ✍ Starts the asynchronous loading of all the queued mod material holders; the callback is materialHolderLoaded. |
| `MaterialManager:materialHolderLoaded(i3dNode: any, failedReason: any, args: any)` | 293 | ✍ Load callback: detaches each child of the loaded I3D, keeps it in loadedMaterialHolderNodes, then deletes the root I3D. No handling on failure (id 0). |
| `MaterialManager:getFontMaterial(materialName: any, customEnvironment: any)` | 307 | ✍ Returns the font by name; tries first the name prefixed by the mod environment ("mod.name"), then the raw name. |
| `MaterialManager:loadFontMaterialsXML(xmlFilename: any, customEnvironment: any, baseDirectory: any)` | 320 | ✍ Loads a fonts XML asynchronously with a reference counter; at the end of the last load, deletes the XML and calls the end callback registered by loadMapData. If there is no font, the callback is called immediately. |
