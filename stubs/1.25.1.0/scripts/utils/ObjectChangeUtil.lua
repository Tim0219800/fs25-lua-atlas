---@meta
-- FS25 1.25.1.0 : utils/ObjectChangeUtil.lua (generated stub, FS25 Lua Atlas)

--- Handles the objectChange XML feature: a node can have one set of values when a configuration is active and another when inactive (visibility, translation, rotation, scale, shader parameter, mass, center of mass, parent node, rigid body type, compound child, deletion). It loads these entries, applies them with optional interpolation through ValueInterpolator, and registers the schema paths. The helper loadValueType it calls is not defined in this file (UNVERIFIED).
---@class ObjectChangeUtil
ObjectChangeUtil = {}

--- Reads every objectChange child under a key, resolves its node (using the parent's i3dMappings if any) and loads its values. Returns the given or a new table of change objects, or nil when none was loaded.
---@param xmlFile XMLFile
---@param key string
---@param objects table?
---@param rootNode integer
---@param parent table?
---@return array?
function ObjectChangeUtil.loadObjectChangeFromXML(xmlFile, key, objects, rootNode, parent) end

--- Fills a change object from one XML entry: interpolation settings and active/inactive values for parent, delete, transform, shader parameter, center of mass, mass (in the XML unit divided by 1000), visibility, compound child and rigid body type. Calls the parent's loadObjectChangeValuesFromXML if it exists.
---@param xmlFile XMLFile
---@param key string
---@param node integer
---@param object table
---@param parent table?
---@param rootNode integer?
---@param i3dMappings table?
function ObjectChangeUtil.loadValuesFromXML(xmlFile, key, node, object, parent, rootNode, i3dMappings) end

--- Applies setObjectChange to every object of a table in the given active or inactive state. Does nothing if the table is nil.
---@param objects table
---@param isActive boolean
---@param target table?
---@param updateFunc function?
---@param skipInterpolation boolean?
function ObjectChangeUtil.setObjectChanges(objects, isActive, target, updateFunc, skipInterpolation) end

--- Applies the active or inactive values of one change object, either directly or through a ValueInterpolator when interpolation is on and not skipped, then sets the rigid body type. Finally calls target:setObjectChangeValues and the update function if given.
---@param object table
---@param isActive boolean
---@param target table
---@param updateFunc function
---@param skipInterpolation boolean?
function ObjectChangeUtil.setObjectChange(object, isActive, target, updateFunc, skipInterpolation) end

--- Loops over the numbered objectChange blocks under a key, sets all non-selected configurations inactive first and the one chosen by the config index active last, so it wins on conflicts. The config index is 1-based.
---@param xmlFile XMLFile
---@param key string
---@param configIndex integer
---@param rootNode integer
---@param parent table
function ObjectChangeUtil.updateObjectChanges(xmlFile, key, configIndex, rootNode, parent) end

--- Registers the schema paths for a single objectChange group at the base path, using a shared registration named ObjectChange_single.
---@param schema XMLSchema
---@param basePath string
function ObjectChangeUtil.registerObjectChangeXMLPaths(schema, basePath) end

--- Registers the schema paths for multiple objectChange entries under an objectChanges sub-element, using a shared registration named ObjectChange_multiple.
---@param schema XMLSchema
---@param basePath string
function ObjectChangeUtil.registerObjectChangesXMLPaths(schema, basePath) end

--- Declares every objectChange attribute: node, interpolation and its time, and the Active/Inactive pairs for delete, visibility, translation, rotation, scale, shaderParameter, mass, centerOfMass, compoundChild, rigidBodyType and parentNode. Note: deleteInactive is registered with the same description text as deleteActive.
---@param schema XMLSchema
---@param basePath string
function ObjectChangeUtil.registerObjectChangeSingleXMLPaths(schema, basePath) end

--- Queues a function to be run later to register extra objectChange paths, through the schema's delayed registration under the name ObjectChange.
---@param schema XMLSchema
---@param func function
function ObjectChangeUtil.addAdditionalObjectChangeXMLPaths(schema, func) end
