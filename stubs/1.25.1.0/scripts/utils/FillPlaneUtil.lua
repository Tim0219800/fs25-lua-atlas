---@meta
-- FS25 1.25.1.0 : utils/FillPlaneUtil.lua (stub généré, atlas Lua FS25)

---@class FillPlaneUtil
FillPlaneUtil = {}

---@param schema XMLSchema
---@param key string
function FillPlaneUtil.registerFillPlaneXMLPaths(schema, key) end

---@param xmlFile XMLFile
---@param key string
---@param baseNode integer
---@param capacity number
---@return integer?
function FillPlaneUtil.createFromXML(xmlFile, key, baseNode, capacity) end

---@param fillPlane integer
---@param terrainRootNodeId integer
---@return boolean
function FillPlaneUtil.assignDefaultMaterialsFromTerrain(fillPlane, terrainRootNodeId) end

---@param fillPlane integer
---@param fillTypeIndex integer
function FillPlaneUtil.setFillType(fillPlane, fillTypeIndex) end
