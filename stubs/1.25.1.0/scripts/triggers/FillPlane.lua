---@meta
-- FS25 1.25.1.0 : triggers/FillPlane.lua (stub généré, atlas Lua FS25)

---@class FillPlane
FillPlane = {}

---@param customMt table?
---@return table
function FillPlane.new(customMt) end

function FillPlane:delete() end

---@param components table
---@param xmlFile table
---@param xmlNode string
---@param i3dMappings table
---@return boolean
function FillPlane:load(components, xmlFile, xmlNode, i3dMappings) end

---@param state number
---@return boolean
function FillPlane:setState(state) end

---@param fillTypeIndex integer
function FillPlane:setFillType(fillTypeIndex) end

---@param colorScale array
function FillPlane:setColorScale(colorScale) end

---@param schema XMLFile
---@param basePath string
function FillPlane.registerXMLPaths(schema, basePath) end
