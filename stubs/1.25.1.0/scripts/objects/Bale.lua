---@meta
-- FS25 1.25.1.0 : objects/Bale.lua (generated stub, FS25 Lua Atlas)

--- A hay, straw, silage or similar bale, as a networked MountableObject that can be picked up, strapped, auto-loaded, wrapped, cut open and sold. Its properties are loaded from a bale config XML (bale.size, bale.fillTypes, bale.variations, bale.baleMeshes, mountableObject attributes) and saved to the savegame. Wrapping and fermentation are driven by the fill type info and BaleManager (not in this dump, UNVERIFIED). The file also defines BaleActivatable, the cut-bale action.
---@class Bale : MountableObject
Bale = {}

--- A hay, straw, silage or similar bale, as a networked MountableObject that can be picked up, strapped, auto-loaded, wrapped, cut open and sold. Its properties are loaded from a bale config XML (bale.size, bale.fillTypes, bale.variations, bale.baleMeshes, mountableObject attributes) and saved to the savegame. Wrapping and fermentation are driven by the fill type info and BaleManager (not in this dump, UNVERIFIED). The file also defines BaleActivatable, the cut-bale action.
---@class BaleActivatable
BaleActivatable = {}

--- Constructor. Calls the MountableObject constructor and sets defaults (straw, fill level 0, mass 0.25, not wrapped, not fermenting, can be sold, pickup allowed), reserves one dirty flag per synced property, creates the activatable and registers the bale in the slot system as a limited object.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function Bale.new(isServer, isClient, customMt) end

--- Releases the shared i3d request, clears mesh lists, removes the activatable, stops fermentation tracking, removes the AI obstacle, the slot-system and item-system entries, unregisters the class name and calls the parent delete.
function Bale:delete() end

--- Client side update: for each dirty bit present reads fill type, fill level, variation, wrap textures, wrapping state (uint8 over 255), wrap color and fermentation state, applies them, then calls the parent readUpdateStream.
---@param streamId integer
---@param timestamp integer
---@param connection table
function Bale:readUpdateStream(streamId, timestamp, connection) end

--- Server side update: writes a flag and the matching value for each dirty bit (fill type, level, variation, textures, wrapping state, wrap color, fermentation), then calls the parent writeUpdateStream.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Bale:writeUpdateStream(streamId, connection, dirtyMask) end

--- Client side on join: reads the bale type index and loads the bale from its config XML if it has no node, then fill level, fill type, variation, optional wrap textures, parent data, wrapping state, color and fermentation. Also adds the bale to the item system.
---@param streamId integer
---@param connection table
function Bale:readStream(streamId, connection) end

--- Server side on join: writes the bale type index (default 1), fill level, fill type, variation, optional wrap textures, parent data, wrapping state, color and fermentation. Order mirrors readStream.
---@param streamId integer
---@param connection table
function Bale:writeStream(streamId, connection) end

--- Calls the parent mount, then disables the AI obstacle of the bale.
---@param object table
---@param node integer
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
function Bale:mount(object, node, x, y, z, rx, ry, rz) end

--- Calls the parent unmount. On success restores normal component mass and the AI obstacle and returns true, otherwise false.
function Bale:unmount() end

--- Calls the parent mountKinematic, then disables the AI obstacle.
---@param object table
---@param node integer
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
function Bale:mountKinematic(object, node, x, y, z, rx, ry, rz) end

--- Calls the parent unmountKinematic. On success restores normal mass and the AI obstacle and returns true, otherwise false.
function Bale:unmountKinematic() end

--- Calls the parent mountDynamic. Returns false if it fails, otherwise disables the AI obstacle and returns true.
---@param object any
---@param objectActorId any
---@param jointNode any
---@param mountType any
---@param forceAcceleration any
function Bale:mountDynamic(object, objectActorId, jointNode, mountType, forceAcceleration) end

--- Calls the parent unmountDynamic, restores normal component mass and re-enables the AI obstacle.
---@param isDelete any
function Bale:unmountDynamic(isDelete) end

--- Adds the bale node as an obstacle to aiSystem when enabling (if none yet) or removes it when disabling.
---@param isActive any
function Bale:setBaleAIObstacle(isActive) end

--- Loads the i3d file through the shared manager, takes its first child, links it to the root node, deletes the loaded root and sets the child as the bale node.
---@param i3dFilename string
function Bale:createNode(i3dFilename) end

--- Loads a bale from its config XML: checks the file exists and the type is registered (or an icon generator is present), creates the node, optionally places it, loads attributes, sets uniqueId, adds it to the item system and enables the AI obstacle. Returns false and logs on failure.
---@param xmlFilename string
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
---@param uniqueId any
function Bale:loadFromConfigXML(xmlFilename, x, y, z, rx, ry, rz, uniqueId) end

--- Reads mountable attributes, fill types, variations, size (round or square, rounded to 2 decimals), uvId and visual meshes from the bale config XML. Returns true.
---@param xmlFile table
function Bale:loadBaleAttributesFromXML(xmlFile) end

--- Returns true if the bale size equals the given values: diameter and width for round bales, width, height and length for square bales.
---@param diameter number
---@param width number
---@param height number
---@param length number
---@return boolean
function Bale:getBaleMatchesSize(diameter, width, height, length) end

--- Returns whether the bale can be wrapped for its current fill type.
---@return boolean
function Bale:getSupportsWrapping() end

--- Savegame loading: reads position, rotation and filename (returns false if missing or the file does not exist), loads the attributes, creates the bale from its config XML and applies the attributes. Returns true on success.
---@param xmlFile XMLFile
---@param key string
---@param resetVehicles boolean
---@return boolean
function Bale:loadFromXMLFile(xmlFile, key, resetVehicles) end

--- Static: reads from a savegame node into the attributes table the filename, farmId, fill level, fill type, variation, wrap textures, fermentation, wrapping state and color, mission-bale flag and uniqueId. Returns true.
---@param attributes any
---@param xmlFile any
---@param key any
---@param resetVehicles any
function Bale.loadBaleAttributesFromXMLFile(attributes, xmlFile, key, resetVehicles) end

--- Returns a table with the bale's current attributes (xmlFilename, farmId, fill level and type, variation, wrap textures, wrapping state and color, mission flag, fermentation and its elapsed time).
function Bale:getBaleAttributes() end

--- Static: writes an attributes table to the savegame XML (filename, fill level, fill type name, variation, farmId, mission flag, wrapping, optional textures and fermentation).
---@param attributes any
---@param xmlFile any
---@param key any
function Bale.saveBaleAttributesToXMLFile(attributes, xmlFile, key) end

--- Applies an attributes table: owner farm, fill level and type, variation, wrap textures, wrapping state, color and mission flag. On the server it also re-registers fermentation (instant for mission bales). Returns true.
---@param attributes any
function Bale:applyBaleAttributes(attributes) end

--- Writes uniqueId, network filename, position, rotation, fill level and type, variation, farmId, mission flag, wrapping state and color, optional wrap textures and fermentation data to the savegame.
---@param xmlFile any
---@param key any
function Bale:saveToXMLFile(xmlFile, key) end

--- Returns true if needsSaving is set and the bale node is above y = -90 (the shop area at -100 is excluded).
function Bale:getNeedsSaving() end

--- Returns true: bales can be handled by auto-loaders.
function Bale:getAutoLoadIsSupported() end

--- Returns the result of getAllowPickup.
function Bale:getAutoLoadIsAllowed() end

--- Returns the bale footprint as three sizes: width, then diameter or height, then diameter or length depending on whether the bale is round.
function Bale:getAutoLoadSize() end

--- Places the bale on the auto-loader at the given position by unmounting it first if kinematically mounted, then calling mountKinematic with centred coordinates (round bales rotated 90 degrees around Y). Returns true.
---@param autoLoader any
---@param node any
---@param posX any
---@param posZ any
---@param sizeX any
---@param sizeZ any
function Bale:autoLoad(autoLoader, node, posX, posZ, sizeX, sizeZ) end

--- Returns the sale value: fill level times the economy price per liter of the fill type.
function Bale:getValue() end

--- Returns the physics mass of the node, or 0 if the node does not exist.
function Bale:getMass() end

--- Returns the default mass stored for the current fill type.
function Bale:getDefaultMass() end

--- Returns the current fill type index.
---@return integer
function Bale:getFillType() end

--- Sets the node mass to 0.1 when true, otherwise back to the default mass.
---@param state any
function Bale:setReducedComponentMass(state) end

--- Returns true if the default mass is above 0.1.
function Bale:getAllowComponentMassReduction() end

--- Sets the fill type: applies textures, updates wrapping support, mass and mount force from the type info, and on the server starts fermentation if the type ferments without needing wrapping. Optionally fills the bale to capacity, refreshes mesh visibility and wrapping, and raises the dirty flag.
---@param fillTypeIndex any
---@param fillBale any
function Bale:setFillType(fillTypeIndex, fillBale) end

--- Applies the variation at the given index (default 1) if it exists: stores the index, sets variation textures and, on the server, raises the dirty flag. Does nothing for an unknown index.
---@param variationIndex any
function Bale:setVariationIndex(variationIndex) end

--- Selects a variation by id, compared case-insensitively. A nil id selects the first. Returns true if applied, false if the id is unknown.
---@param variationId any
function Bale:setVariationId(variationId) end

--- Returns the id of the current variation, or the string NONE if there are none or the index is invalid.
function Bale:getVariationId() end

--- Returns the capacity defined for the current fill type, or 0 if the type has no info.
---@return integer
function Bale:getCapacity() end

--- Returns the current fill level.
---@return integer
function Bale:getFillLevel() end

--- Stores the fill level and, on the server, raises the fill level dirty flag.
---@param fillLevel integer
function Bale:setFillLevel(fillLevel) end

--- Returns the info entry of the bale's current fill type, or nil. Note: the fillTypeIndex parameter is ignored; the comparison uses self.fillType.
---@param fillTypeIndex integer
---@return table
function Bale:getFillTypeInfo(fillTypeIndex) end

--- Sets whether the bale can be sold.
---@param canBeSold boolean
function Bale:setCanBeSold(canBeSold) end

--- Returns whether the bale can be sold.
---@return boolean
function Bale:getCanBeSold() end

--- Sets the wrapping progress (0 to 1): updates mesh visibility and the wrappingState shader parameter, raises the dirty flag on the server, and starts fermentation at full wrapping for types that require it. Adds the cut activatable when above 0, removes it otherwise.
---@param wrappingState number
---@param updateFermentation boolean
function Bale:setWrappingState(wrappingState, updateFermentation) end

--- Stores the wrap diffuse and normal texture paths (keeping the old ones if nil) and applies them to every mesh material when the files exist, otherwise logs a warning. Also resets wrappingState and colorScale shader parameters and raises the dirty flag on the server.
---@param diffuse string
---@param normal string
function Bale:setWrapTextures(diffuse, normal) end

--- Sets the wrap color (missing channels default to 1). Only when it differs from the current one it raises the dirty flag on the server and sets the colorScale shader parameter on meshes that have it.
---@param r number
---@param g number
---@param b number
function Bale:setColor(r, g, b) end

--- Sets whether the bale comes from a field mission.
---@param state any
function Bale:setIsMissionBale(state) end

--- Returns the list of tension belt mesh nodes.
function Bale:getMeshNodes() end

--- Returns true: bales support tension belts.
function Bale:getSupportsTensionBelts() end

--- Returns the bale node as the tension belt node.
function Bale:getTensionBeltNodeId() end

--- Returns true: bales can be used with bale loaders.
function Bale:getBaleSupportsBaleLoader() end

--- Returns the allowPickup flag.
function Bale:getAllowPickup() end

--- Returns 0 for round bales, or half the height for square bales.
function Bale:getAdditionalMountingDistance() end

--- Returns whether the bale is currently fermenting.
function Bale:getIsFermenting() end

--- Returns the fermentation progress in the range 0 to 1, or 0 when not fermenting.
function Bale:getFermentingPercentage() end

--- Callback from the bale manager: stores the new percentage and raises the fermentation dirty flag.
---@param percentage any
function Bale:onFermentationUpdate(percentage) end

--- Callback when fermentation ends. On the server, switches the bale to the output fill type of the fermenting info, clears the fermenting flag and raises the dirty flag.
function Bale:onFermentationEnd() end

--- Returns true only if the bale is wrapped, not fermenting and not mounted in any way.
function Bale:getCanBeOpened() end

--- Returns the local player's world position, or nothing if the player is in a vehicle.
function Bale:getInteractionPosition() end

--- Returns true if the player may access the bale and is within Bale.INTERACTION_RADIUS (constant not defined in this dump, UNVERIFIED) of it, on foot.
function Bale:getCanInteract() end

--- Opens the bale by setting the wrapping state to 0.
function Bale:open() end

--- Resets the visibilityXZ shader parameter of meshes that have it to a wide range (5, -5, 5, -5), removing any cut.
function Bale:resetDetailVisibilityCut() end

--- Applies a visibility cut on every bale mesh based on the position of a node, along the given axis and direction.
---@param node any
---@param axis any
---@param direction any
function Bale:setDetailVisibilityCutNode(node, axis, direction) end

--- Static: sets visibilityXZ on a mesh from the local position of a node (X when axis is 1, else Z, as lower or upper bound by direction), optionally recursing into children.
---@param baleMesh any
---@param node any
---@param axis any
---@param direction any
---@param recursively any
function Bale.setBaleMeshVisibilityCut(baleMesh, node, axis, direction, recursively) end

--- Calls the given function with a parallelogram covering about 40 percent of the bale size (offset by a 0.25 grid), for round or square bales, plus extra arguments. Used to apply density-map operations under the bale.
---@param func any
---@param target any
function Bale:doDensityMapItemAreaUpdate(func, target, ...) end

--- Adds lines to an info box: fill type and volume, fermentation percentage if fermenting, and mass.
---@param box any
function Bale:showInfo(box) end

--- Static: builds a visual-only bale from a bale XML (no physics, unlinked) with the given fill type, variation, wrapping state and color. Returns the node id and the shared load request id; the caller must release them.
---@param xmlFilename string
---@param fillTypeIndex integer
---@param variationId string
---@param wrappingState number?
---@param wrappingColor table?
---@return integer
---@return integer
function Bale.createDummyBale(xmlFilename, fillTypeIndex, variationId, wrappingState, wrappingColor) end

--- Static: reads each bale.fillTypes.fillType entry into the target list: fill type index, capacity (default 1000), mass (XML value divided by 1000), force, wrapping support, materials, textures and optional fermenting output, wrapping requirement and time.
---@param fillTypes table
---@param xmlFile table
---@param baseDirectory string
function Bale.loadFillTypesFromXML(fillTypes, xmlFile, baseDirectory) end

--- Static: reads bale.variations.variation entries (id and textures) into the target list. Adds a DEFAULT variation if none exist.
---@param variations table
---@param xmlFile table
---@param baseDirectory string
function Bale.loadVariationsFromXML(variations, xmlFile, baseDirectory) end

--- Static: for the matching fill type, assigns the base material (alpha material for alpha meshes), applies textures and sets the fillTypeId texture array index on each mesh. Logs a warning if a material is not found.
---@param meshes table
---@param fillTypes table
---@param fillTypeIndex integer
function Bale.setFillTypeTextures(meshes, fillTypes, fillTypeIndex) end

--- Static: applies the textures of the variation with the given id (or number index) to all meshes, falling back to the first variation if not found.
---@param meshes table
---@param variations table
---@param id string
function Bale.setVariationTextures(meshes, variations, id) end

--- Static: for a shape node whose material uses the wrapBaleShader, sets diffuse, normal, alpha, bale normal and net-wrap maps from the texture data, or terrain fill type texture arrays when requested.
---@param nodeId integer
---@param textureData table
function Bale.setTexturesForNode(nodeId, textureData) end

--- Static: reads bale.baleMeshes.baleMesh entries (node, wrapping support, fill types, tension belt and alpha flags). Returns the mesh list and the list of tension belt mesh nodes.
---@param rootNode integer
---@param xmlFile table
---@param baseDirectory string
---@return table
---@return table
function Bale.loadVisualMeshesFromXML(rootNode, xmlFile, baseDirectory) end

--- Static: for meshes tied to specific fill types, shows only those matching the fill type (and, when wrapped, only wrap-capable ones) and stores the fill type visibility flag.
---@param meshes table
---@param fillTypeIndex integer
---@param isWrapped boolean
function Bale.updateVisualMeshVisibility(meshes, fillTypeIndex, isWrapped) end

--- Static: sets the wrappingState shader parameter on all meshes and, when above 0, the colorScale parameter from the given color (default 0.85 grey).
---@param meshes table
---@param wrappingState number
---@param wrappingColor table
function Bale.updateVisualMeshWrappingState(meshes, wrappingState, wrappingColor) end

--- Creates the activatable for a bale with the cut-bale action text.
---@param bale any
function BaleActivatable.new(bale) end

--- Returns true if the player can interact with the bale and the bale can be opened.
function BaleActivatable:getIsActivatable() end

--- Returns the horizontal (XZ) distance between the given position and the bale, or math.huge if the bale has no node.
---@param posX any
---@param posY any
---@param posZ any
function BaleActivatable:getDistance(posX, posY, posZ) end

--- Opens the bale directly on the server, or on a client sends a BaleOpenEvent to the server.
function BaleActivatable:run() end
