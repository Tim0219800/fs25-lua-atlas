---@meta
-- FS25 1.25.1.0 : triggers/FillPlane.lua (generated stub, FS25 Lua Atlas)

--- Small helper class that drives a visual fill plane node (the surface showing a load inside a container). It moves the node vertically and optionally tilts it according to a 0..1 fill state, and can change its fill-type material and color shader. Configuration comes from an XML block (node, minY/maxY, minRotX/maxRotX, changeVisibility, colorChange) declared through registerXMLPaths.
---@class FillPlane
FillPlane = {}

--- Creates a fill plane instance with no node, zero range and nothing loaded; call load afterwards. Accepts an optional custom metatable for subclassing.
---@param customMt table?
---@return table
function FillPlane.new(customMt) end

--- Destructor; empty body, it releases nothing.
function FillPlane:delete() end

--- Reads the node and settings from the XML key, resolving the node through components and i3dMappings. Returns false if no node is found. Swaps inverted minY/maxY with a warning, disables colorChange if the node lacks a `colorScale` shader parameter, then places the node at minY and hides it when changeVisibility is set.
---@param components table
---@param xmlFile table
---@param xmlNode string
---@param i3dMappings table
---@return boolean
function FillPlane:load(components, xmlFile, xmlNode, i3dMappings) end

--- Interpolates the node height between minY and maxY and its X rotation between minRotX and maxRotX using the 0..1 state. With changeVisibility the node is visible only when state is above 0. Returns true if the height changed; does nothing if not loaded.
---@param state number
---@return boolean
function FillPlane:setState(state) end

--- Applies the material for the given fill type index to the node, using default materials taken from the terrain node, and sets the `isCustomShape` shader parameter. The actual material logic lives in FillPlaneUtil, which is not in the dump (UNVERIFIED).
---@param fillTypeIndex integer
function FillPlane:setFillType(fillTypeIndex) end

--- Sets the `colorScale` shader parameter of the node from an array of three components (r, g, b). Does nothing if the plane is not loaded.
---@param colorScale array
function FillPlane:setColorScale(colorScale) end

--- Registers the XML attributes the class reads under the given base path: node, minY, maxY, minRotX, maxRotX, changeVisibility and colorChange.
---@param schema XMLFile
---@param basePath string
function FillPlane.registerXMLPaths(schema, basePath) end
