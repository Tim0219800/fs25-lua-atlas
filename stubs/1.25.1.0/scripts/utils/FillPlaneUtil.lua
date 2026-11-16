---@meta
-- FS25 1.25.1.0 : utils/FillPlaneUtil.lua (generated stub, FS25 Lua Atlas)

--- Static helpers for fill planes, the visual meshes that show bulk material inside vehicles and trailers. The dump only contains signatures: XML path registration, creation from XML, default material assignment from the terrain and fill type switching. Behaviour is inferred from names and parameters and is UNVERIFIED.
---@class FillPlaneUtil
FillPlaneUtil = {}

--- Signature only (no body in the SDK dump): Registers the XML paths used to describe a fill plane in the given schema, under the given key.
---@param schema XMLSchema
---@param key string
function FillPlaneUtil.registerFillPlaneXMLPaths(schema, key) end

--- Signature only (no body in the SDK dump): Presumably builds a fill plane from an XML file at a key, attached to a base node, with a default capacity when the XML gives none. Returns the fill plane node or nil. UNVERIFIED.
---@param xmlFile XMLFile
---@param key string
---@param baseNode integer
---@param capacity number
---@return integer?
function FillPlaneUtil.createFromXML(xmlFile, key, baseNode, capacity) end

--- Signature only (no body in the SDK dump): Presumably assigns default materials taken from the terrain root node to the fill plane mesh and returns a success boolean. UNVERIFIED.
---@param fillPlane integer
---@param terrainRootNodeId integer
---@return boolean
function FillPlaneUtil.assignDefaultMaterialsFromTerrain(fillPlane, terrainRootNodeId) end

--- Signature only (no body in the SDK dump): Presumably switches the fill plane to the look of the given fill type index. UNVERIFIED.
---@param fillPlane integer
---@param fillTypeIndex integer
function FillPlaneUtil.setFillType(fillPlane, fillTypeIndex) end
