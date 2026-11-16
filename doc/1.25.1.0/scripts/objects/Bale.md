# objects/Bale.lua

*[Version française](../../fr/scripts/objects/Bale.md)*

Source: `dataS/scripts/objects/Bale.lua` — FS25 1.25.1.0

✍ A hay, straw, silage or similar bale, as a networked MountableObject that can be picked up, strapped, auto-loaded, wrapped, cut open and sold. Its properties are loaded from a bale config XML (bale.size, bale.fillTypes, bale.variations, bale.baleMeshes, mountableObject attributes) and saved to the savegame. Wrapping and fermentation are driven by the fill type info and BaleManager (not in this dump, UNVERIFIED). The file also defines BaleActivatable, the cut-bale action.

- **Bale** inherits from `MountableObject` (l.11)
- **BaleActivatable** (l.1636)

## Functions

| Function | Line | Description |
|---|---|---|
| `Bale.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 49 | ✍ Constructor. Calls the MountableObject constructor and sets defaults (straw, fill level 0, mass 0.25, not wrapped, not fermenting, can be sold, pickup allowed), reserves one dirty flag per synced property, creates the activatable and registers the bale in the slot system as a limited object. |
| `Bale:delete()` | 101 | ✍ Releases the shared i3d request, clears mesh lists, removes the activatable, stops fermentation tracking, removes the AI obstacle, the slot-system and item-system entries, unregisters the class name and calls the parent delete. |
| `Bale:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 130 | ✍ Client side update: for each dirty bit present reads fill type, fill level, variation, wrap textures, wrapping state (uint8 over 255), wrap color and fermentation state, applies them, then calls the parent readUpdateStream. |
| `Bale:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 180 | ✍ Server side update: writes a flag and the matching value for each dirty bit (fill type, level, variation, textures, wrapping state, wrap color, fermentation), then calls the parent writeUpdateStream. |
| `Bale:readStream(streamId: integer, connection: table)` | 225 | ✍ Client side on join: reads the bale type index and loads the bale from its config XML if it has no node, then fill level, fill type, variation, optional wrap textures, parent data, wrapping state, color and fermentation. Also adds the bale to the item system. |
| `Bale:writeStream(streamId: integer, connection: table)` | 271 | ✍ Server side on join: writes the bale type index (default 1), fill level, fill type, variation, optional wrap textures, parent data, wrapping state, color and fermentation. Order mirrors readStream. |
| `Bale:mount(object: table, node: integer, x: number, y: number, z: number, rx: number, ry: number, rz: number)` | 309 | ✍ Calls the parent mount, then disables the AI obstacle of the bale. |
| `Bale:unmount()` | 316 | ✍ Calls the parent unmount. On success restores normal component mass and the AI obstacle and returns true, otherwise false. |
| `Bale:mountKinematic(object: table, node: integer, x: number, y: number, z: number, rx: number, ry: number, rz: number)` | 335 | ✍ Calls the parent mountKinematic, then disables the AI obstacle. |
| `Bale:unmountKinematic()` | 342 | ✍ Calls the parent unmountKinematic. On success restores normal mass and the AI obstacle and returns true, otherwise false. |
| `Bale:mountDynamic(object: any, objectActorId: any, jointNode: any, mountType: any, forceAcceleration: any)` | 353 | ✍ Calls the parent mountDynamic. Returns false if it fails, otherwise disables the AI obstacle and returns true. |
| `Bale:unmountDynamic(isDelete: any)` | 364 | ✍ Calls the parent unmountDynamic, restores normal component mass and re-enables the AI obstacle. |
| `Bale:setBaleAIObstacle(isActive: any)` | 372 | ✍ Adds the bale node as an obstacle to aiSystem when enabling (if none yet) or removes it when disabling. |
| `Bale:createNode(i3dFilename: string)` | 385 | ✍ Loads the i3d file through the shared manager, takes its first child, links it to the root node, deletes the loaded root and sets the child as the bale node. |
| `Bale:loadFromConfigXML(xmlFilename: string, x: number, y: number, z: number, rx: number, ry: number, rz: number, uniqueId: any)` | 406 | ✍ Loads a bale from its config XML: checks the file exists and the type is registered (or an icon generator is present), creates the node, optionally places it, loads attributes, sets uniqueId, adds it to the item system and enables the AI obstacle. Returns false and logs on failure. |
| `Bale:loadBaleAttributesFromXML(xmlFile: table)` | 455 | ✍ Reads mountable attributes, fill types, variations, size (round or square, rounded to 2 decimals), uvId and visual meshes from the bale config XML. Returns true. |
| `Bale:getBaleMatchesSize(diameter: number, width: number, height: number, length: number) → boolean` | 491 | ✍ Returns true if the bale size equals the given values: diameter and width for round bales, width, height and length for square bales. |
| `Bale:getSupportsWrapping() → boolean` | 502 | ✍ Returns whether the bale can be wrapped for its current fill type. |
| `Bale:loadFromXMLFile(xmlFile: XMLFile, key: string, resetVehicles: boolean) → boolean` | 512 | ✍ Savegame loading: reads position, rotation and filename (returns false if missing or the file does not exist), loads the attributes, creates the bale from its config XML and applies the attributes. Returns true on success. |
| `Bale.loadBaleAttributesFromXMLFile(attributes: any, xmlFile: any, key: any, resetVehicles: any)` | 544 | ✍ Static: reads from a savegame node into the attributes table the filename, farmId, fill level, fill type, variation, wrap textures, fermentation, wrapping state and color, mission-bale flag and uniqueId. Returns true. |
| `Bale:getBaleAttributes()` | 577 | ✍ Returns a table with the bale's current attributes (xmlFilename, farmId, fill level and type, variation, wrap textures, wrapping state and color, mission flag, fermentation and its elapsed time). |
| `Bale.saveBaleAttributesToXMLFile(attributes: any, xmlFile: any, key: any)` | 602 | ✍ Static: writes an attributes table to the savegame XML (filename, fill level, fill type name, variation, farmId, mission flag, wrapping, optional textures and fermentation). |
| `Bale:applyBaleAttributes(attributes: any)` | 629 | ✍ Applies an attributes table: owner farm, fill level and type, variation, wrap textures, wrapping state, color and mission flag. On the server it also re-registers fermentation (instant for mission bales). Returns true. |
| `Bale:saveToXMLFile(xmlFile: any, key: any)` | 672 | ✍ Writes uniqueId, network filename, position, rotation, fill level and type, variation, farmId, mission flag, wrapping state and color, optional wrap textures and fermentation data to the savegame. |
| `Bale:getNeedsSaving()` | 708 | ✍ Returns true if needsSaving is set and the bale node is above y = -90 (the shop area at -100 is excluded). |
| `Bale:getAutoLoadIsSupported()` | 720 | ✍ Returns true: bales can be handled by auto-loaders. |
| `Bale:getAutoLoadIsAllowed()` | 726 | ✍ Returns the result of getAllowPickup. |
| `Bale:getAutoLoadSize()` | 732 | ✍ Returns the bale footprint as three sizes: width, then diameter or height, then diameter or length depending on whether the bale is round. |
| `Bale:autoLoad(autoLoader: any, node: any, posX: any, posZ: any, sizeX: any, sizeZ: any)` | 742 | ✍ Places the bale on the auto-loader at the given position by unmounting it first if kinematically mounted, then calling mountKinematic with centred coordinates (round bales rotated 90 degrees around Y). Returns true. |
| `Bale:getValue()` | 772 | ✍ Returns the sale value: fill level times the economy price per liter of the fill type. |
| `Bale:getMass()` | 779 | ✍ Returns the physics mass of the node, or 0 if the node does not exist. |
| `Bale:getDefaultMass()` | 785 | ✍ Returns the default mass stored for the current fill type. |
| `Bale:getFillType() → integer` | 792 | ✍ Returns the current fill type index. |
| `Bale:setReducedComponentMass(state: any)` | 798 | ✍ Sets the node mass to 0.1 when true, otherwise back to the default mass. |
| `Bale:getAllowComponentMassReduction()` | 808 | ✍ Returns true if the default mass is above 0.1. |
| `Bale:setFillType(fillTypeIndex: any, fillBale: any)` | 814 | ✍ Sets the fill type: applies textures, updates wrapping support, mass and mount force from the type info, and on the server starts fermentation if the type ferments without needing wrapping. Optionally fills the bale to capacity, refreshes mesh visibility and wrapping, and raises the dirty flag. |
| `Bale:setVariationIndex(variationIndex: any)` | 861 | ✍ Applies the variation at the given index (default 1) if it exists: stores the index, sets variation textures and, on the server, raises the dirty flag. Does nothing for an unknown index. |
| `Bale:setVariationId(variationId: any)` | 876 | ✍ Selects a variation by id, compared case-insensitively. A nil id selects the first. Returns true if applied, false if the id is unknown. |
| `Bale:getVariationId()` | 894 | ✍ Returns the id of the current variation, or the string NONE if there are none or the index is invalid. |
| `Bale:getCapacity() → integer` | 910 | ✍ Returns the capacity defined for the current fill type, or 0 if the type has no info. |
| `Bale:getFillLevel() → integer` | 923 | ✍ Returns the current fill level. |
| `Bale:setFillLevel(fillLevel: integer)` | 930 | ✍ Stores the fill level and, on the server, raises the fill level dirty flag. |
| `Bale:getFillTypeInfo(fillTypeIndex: integer) → table` | 942 | ✍ Returns the info entry of the bale's current fill type, or nil. Note: the fillTypeIndex parameter is ignored; the comparison uses self.fillType. |
| `Bale:setCanBeSold(canBeSold: boolean)` | 955 | ✍ Sets whether the bale can be sold. |
| `Bale:getCanBeSold() → boolean` | 962 | ✍ Returns whether the bale can be sold. |
| `Bale:setWrappingState(wrappingState: number, updateFermentation: boolean)` | 970 | ✍ Sets the wrapping progress (0 to 1): updates mesh visibility and the wrappingState shader parameter, raises the dirty flag on the server, and starts fermentation at full wrapping for types that require it. Adds the cut activatable when above 0, removes it otherwise. |
| `Bale:setWrapTextures(diffuse: string, normal: string)` | 1024 | ✍ Stores the wrap diffuse and normal texture paths (keeping the old ones if nil) and applies them to every mesh material when the files exist, otherwise logs a warning. Also resets wrappingState and colorScale shader parameters and raises the dirty flag on the server. |
| `Bale:setColor(r: number, g: number, b: number)` | 1066 | ✍ Sets the wrap color (missing channels default to 1). Only when it differs from the current one it raises the dirty flag on the server and sets the colorScale shader parameter on meshes that have it. |
| `Bale:setIsMissionBale(state: any)` | 1091 | ✍ Sets whether the bale comes from a field mission. |
| `Bale:getMeshNodes()` | 1097 | ✍ Returns the list of tension belt mesh nodes. |
| `Bale:getSupportsTensionBelts()` | 1103 | ✍ Returns true: bales support tension belts. |
| `Bale:getTensionBeltNodeId()` | 1109 | ✍ Returns the bale node as the tension belt node. |
| `Bale:getBaleSupportsBaleLoader()` | 1115 | ✍ Returns true: bales can be used with bale loaders. |
| `Bale:getAllowPickup()` | 1121 | ✍ Returns the allowPickup flag. |
| `Bale:getAdditionalMountingDistance()` | 1127 | ✍ Returns 0 for round bales, or half the height for square bales. |
| `Bale:getIsFermenting()` | 1137 | ✍ Returns whether the bale is currently fermenting. |
| `Bale:getFermentingPercentage()` | 1143 | ✍ Returns the fermentation progress in the range 0 to 1, or 0 when not fermenting. |
| `Bale:onFermentationUpdate(percentage: any)` | 1153 | ✍ Callback from the bale manager: stores the new percentage and raises the fermentation dirty flag. |
| `Bale:onFermentationEnd()` | 1160 | ✍ Callback when fermentation ends. On the server, switches the bale to the output fill type of the fermenting info, clears the fermenting flag and raises the dirty flag. |
| `Bale:getCanBeOpened()` | 1176 | ✍ Returns true only if the bale is wrapped, not fermenting and not mounted in any way. |
| `Bale:getInteractionPosition()` | 1194 | ✍ Returns the local player's world position, or nothing if the player is in a vehicle. |
| `Bale:getCanInteract()` | 1204 | ✍ Returns true if the player may access the bale and is within Bale.INTERACTION_RADIUS (constant not defined in this dump, UNVERIFIED) of it, on foot. |
| `Bale:open()` | 1221 | ✍ Opens the bale by setting the wrapping state to 0. |
| `Bale:resetDetailVisibilityCut()` | 1227 | ✍ Resets the visibilityXZ shader parameter of meshes that have it to a wide range (5, -5, 5, -5), removing any cut. |
| `Bale:setDetailVisibilityCutNode(node: any, axis: any, direction: any)` | 1238 | ✍ Applies a visibility cut on every bale mesh based on the position of a node, along the given axis and direction. |
| `Bale.setBaleMeshVisibilityCut(baleMesh: any, node: any, axis: any, direction: any, recursively: any)` | 1246 | ✍ Static: sets visibilityXZ on a mesh from the local position of a node (X when axis is 1, else Z, as lower or upper bound by direction), optionally recursing into children. |
| `Bale:doDensityMapItemAreaUpdate(func: any, target: any, ...: any)` | 1277 | ✍ Calls the given function with a parallelogram covering about 40 percent of the bale size (offset by a 0.25 grid), for round or square bales, plus extra arguments. Used to apply density-map operations under the bale. |
| `Bale:showInfo(box: any)` | 1300 | ✍ Adds lines to an info box: fill type and volume, fermentation percentage if fermenting, and mass. |
| `Bale.createDummyBale(xmlFilename: string, fillTypeIndex: integer, variationId: string, wrappingState: number?, wrappingColor: table?) → integer, integer` | 1330 | ✍ Static: builds a visual-only bale from a bale XML (no physics, unlinked) with the given fill type, variation, wrapping state and color. Returns the node id and the shared load request id; the caller must release them. |
| `Bale.loadFillTypesFromXML(fillTypes: table, xmlFile: table, baseDirectory: string)` | 1388 | ✍ Static: reads each bale.fillTypes.fillType entry into the target list: fill type index, capacity (default 1000), mass (XML value divided by 1000), force, wrapping support, materials, textures and optional fermenting output, wrapping requirement and time. |
| `Bale.loadVariationsFromXML(variations: table, xmlFile: table, baseDirectory: string)` | 1423 | ✍ Static: reads bale.variations.variation entries (id and textures) into the target list. Adds a DEFAULT variation if none exist. |
| `Bale.setFillTypeTextures(meshes: table, fillTypes: table, fillTypeIndex: integer)` | 1446 | ✍ Static: for the matching fill type, assigns the base material (alpha material for alpha meshes), applies textures and sets the fillTypeId texture array index on each mesh. Logs a warning if a material is not found. |
| `Bale.setVariationTextures(meshes: table, variations: table, id: string)` | 1486 | ✍ Static: applies the textures of the variation with the given id (or number index) to all meshes, falling back to the first variation if not found. |
| `Bale.setTexturesForNode(nodeId: integer, textureData: table)` | 1513 | ✍ Static: for a shape node whose material uses the wrapBaleShader, sets diffuse, normal, alpha, bale normal and net-wrap maps from the texture data, or terrain fill type texture arrays when requested. |
| `Bale.loadVisualMeshesFromXML(rootNode: integer, xmlFile: table, baseDirectory: string) → table, table` | 1559 | ✍ Static: reads bale.baleMeshes.baleMesh entries (node, wrapping support, fill types, tension belt and alpha flags). Returns the mesh list and the list of tension belt mesh nodes. |
| `Bale.updateVisualMeshVisibility(meshes: table, fillTypeIndex: integer, isWrapped: boolean)` | 1590 | ✍ Static: for meshes tied to specific fill types, shows only those matching the fill type (and, when wrapped, only wrap-capable ones) and stores the fill type visibility flag. |
| `Bale.updateVisualMeshWrappingState(meshes: table, wrappingState: number, wrappingColor: table)` | 1615 | ✍ Static: sets the wrappingState shader parameter on all meshes and, when above 0, the colorScale parameter from the given color (default 0.85 grey). |
| `BaleActivatable.new(bale: any)` | 1640 | ✍ Creates the activatable for a bale with the cut-bale action text. |
| `BaleActivatable:getIsActivatable()` | 1651 | ✍ Returns true if the player can interact with the bale and the bale can be opened. |
| `BaleActivatable:getDistance(posX: any, posY: any, posZ: any)` | 1667 | ✍ Returns the horizontal (XZ) distance between the given position and the bale, or math.huge if the bale has no node. |
| `BaleActivatable:run()` | 1679 | ✍ Opens the bale directly on the server, or on a client sends a BaleOpenEvent to the server. |
