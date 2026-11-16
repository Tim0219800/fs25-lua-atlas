---@meta
-- FS25 1.25.1.0 : misc/ConsumableManager.lua (generated stub, FS25 Lua Atlas)

--- Map-bound manager (extends AbstractManager) for consumables such as animal feed items: consumable types with a UI title, and consumable variations with price, capacity, unit text, i3d meshes (normal, consuming state, tension belt), metadata and shader parameters. Data comes from ConsumableManager.DEFAULT_FILENAME (defined outside this file, UNVERIFIED) and mod xmls queued with addModConsumable. Variations are capped by ConsumableManager.MAX_NUM_VARIATIONS (defined elsewhere).
---@class ConsumableManager : AbstractManager
ConsumableManager = {}

--- Creates the manager, empty type and variation tables, and the two XML schemas (consumable and consumables), stored on the class table.
---@param customMt any
---@return table
function ConsumableManager.new(customMt) end

--- Reads the default consumables xml: types (name uppercased, title required) and consumable file references, loading each file's variations; then loads queued mod consumables with their custom environment and empties the queue.
---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function ConsumableManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Deletes the object, consuming and tension belt nodes of every variation, empties the variation list, releases the shared i3d requests, then calls the parent. Note: the in-code doc line wrongly says it loads data on map load.
---@return boolean
function ConsumableManager:unloadMapData() end

--- Queues a mod consumable xml (filename, custom environment, base directory) to be loaded in loadMapData.
---@param xmlFilename string
---@param customEnvironment string
---@param baseDirectory string
function ConsumableManager:addModConsumable(xmlFilename, customEnvironment, baseDirectory) end

--- Loads every consumableVariation of an xml. Entries missing type, name or title are skipped with a warning; the name is prefixed with the custom environment. Starts async i3d loads for object, consumingObject and tensionBeltObject, reads metadata values and shader parameters, and rejects duplicate names and any variation beyond the maximum.
---@param xmlFilename string
---@param customEnvironment string
---@param baseDirectory string
function ConsumableManager:loadConsumableVariationsFromXML(xmlFilename, customEnvironment, baseDirectory) end

--- Async callback: finds the node by path in the loaded i3d, zeroes its position and rotation, unlinks it and stores it in the variation under the requested field (node, consumingNode or tensionBeltNode); warns if the node is not found. Deletes the i3d root.
---@param i3dNode any
---@param failedReason any
---@param arguments any
function ConsumableManager:consumableI3DFileLoaded(i3dNode, failedReason, arguments) end

--- Returns a clone of the variation's mesh node and, when requested and available, a clone of its tension belt mesh linked under it, as a second value. Nil if the index or the mesh is missing.
---@param index any
---@param addTensionBeltMesh any
function ConsumableManager:getConsumableMeshByIndex(index, addTensionBeltMesh) end

--- Returns a clone of the consuming-state mesh (falling back to the normal mesh) with the variation's shader parameters applied recursively, per material slot when a slot name is given. Nil if the variation or its normal mesh is missing.
---@param index any
function ConsumableManager:getConsumableConsumingMeshByIndex(index) end

--- Returns the variation index for a name, trying the custom-environment-prefixed name first. Returns 0 when unknown.
---@param name any
---@param customEnvironment any
function ConsumableManager:getConsumableVariationIndexByName(name, customEnvironment) end

--- Returns the variation's registered name, or the string UNKNOWN if the index is invalid.
---@param index any
function ConsumableManager:getConsumableVariationNameByIndex(index) end

--- Returns the capacity of one unit and its unit text for UI display; two nils if the index is invalid.
---@param index any
function ConsumableManager:getConsumableVariationCapacityAndUnitByIndex(index) end

--- Returns the variation's list of shader parameters, or nil if the index is invalid.
---@param index any
function ConsumableManager:getConsumableVariationShaderParameterByIndex(index) end

--- Returns the variation's metadata table (name to number, string or vector), or nil if the index is invalid.
---@param index any
function ConsumableManager:getConsumableVariationMetaDataByIndex(index) end

--- Returns the titles of all variations of a type as a list, plus a table mapping each list position to the real variation index.
---@param typeName any
function ConsumableManager:getConsumableVariationsByType(typeName) end

--- Returns the price per unit of a variation, or nil if the index is invalid.
---@param index any
function ConsumableManager:getConsumableVariationPriceByIndex(index) end

--- Returns the UI title of a consumable type (falling back to the type name), or nil if the type is unknown. Type names are stored uppercased.
---@param typeName any
function ConsumableManager:getTypeTitle(typeName) end

--- Registers the schema paths of a consumable xml: variation type, price, name, title, capacity, unit text, object, consumingObject and tensionBeltObject (filename and node), metaData values and shader parameters.
---@param schema any
function ConsumableManager.registerConsumableXMLPaths(schema) end

--- Registers the schema paths of the main consumables xml: types (name, title) and references to consumable files.
---@param schema any
function ConsumableManager.registerConsumablesXMLPaths(schema) end
