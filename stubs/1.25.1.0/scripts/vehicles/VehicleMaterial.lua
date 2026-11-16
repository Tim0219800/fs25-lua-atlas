---@meta
-- FS25 1.25.1.0 : vehicles/VehicleMaterial.lua (generated stub, FS25 Lua Atlas)

--- Data holder for a vehicle paint/material definition: colour scale, smoothness, metalness, clear coat, porosity, detail textures and diffuse/normal/specular maps. It can be filled from a template of `g_vehicleMaterialManager` or from XML (full or short form), then applied to the shapes of a vehicle by writing shader parameters and replacing material maps. Pure client-side visual data.
---@class VehicleMaterial
VehicleMaterial = {}

--- Creates an empty material for the given base directory (used to resolve texture paths). `colorOnly` starts false.
---@param baseDirectory any
---@param customMt any
function VehicleMaterial.new(baseDirectory, customMt) end

--- Returns a new `VehicleMaterial` with the same slot name, template and all colour, shading and texture values copied (shallow copy of the colour table reference).
function VehicleMaterial:clone() end

--- Sets the colour scale from either three numbers or a table of three; does nothing if the first argument is nil.
---@param r any
---@param g any
---@param b any
function VehicleMaterial:setColor(r, g, b) end

--- Returns the brightness of the colour scale via `MathUtil.getBrightnessFromColor`, or nil if no colour is set.
function VehicleMaterial:getBrightness() end

--- Looks up a material template by name in `g_vehicleMaterialManager` and copies its values, falling back to its parent template then to defaults (e.g. smoothness 1, default detail textures). With `colorOnly`, only the colour is taken. Returns false if the template is unknown.
---@param templateName any
---@param colorOnly any
---@param customEnvironment any
function VehicleMaterial:setTemplateName(templateName, colorOnly, customEnvironment) end

--- Loads the full XML form: slot name, optional template, then overrides for colour (vector or template name), smoothness, metalness, clear coat, detail and diffuse/normal/specular textures. Returns false (with warning) for an unknown template; otherwise true if any value is set. Porosity has no XML key here.
---@param xmlFile any
---@param key any
---@param customEnvironment any
function VehicleMaterial:loadFromXML(xmlFile, key, customEnvironment) end

--- Loads the short XML form: slot name, a required template (`#materialTemplateName`, optionally colour-only) and an optional separate template for the colour only (`#materialTemplateNameColor`). Returns false if the template name is missing or unknown.
---@param xmlFile any
---@param key any
---@param customEnvironment any
function VehicleMaterial:loadShortFromXML(xmlFile, key, customEnvironment) end

--- Applies the material to every component node tree of the vehicle, optionally restricted to a material slot name. Returns true if at least one material was changed.
---@param vehicle any
---@param targetMaterialSlotName any
function VehicleMaterial:applyToVehicle(vehicle, targetMaterialSlotName) end

--- Recursively walks a node and its children and applies the material to each shape material slot whose name matches (all slots if no name is given). Returns true if any slot was applied.
---@param node any
---@param targetMaterialSlotName any
---@param colorOnly any
function VehicleMaterial:apply(node, targetMaterialSlotName, colorOnly) end

--- Writes the colour scale (and, unless `colorOnly`, smoothness, metalness, clear coat, porosity) as shader parameters on one material slot, then swaps in detail/diffuse/normal/gloss maps from file and updates the slot if the material id changed.
---@param node any
---@param materialIndex any
---@param colorOnly any
function VehicleMaterial:applyToMaterial(node, materialIndex, colorOnly) end

--- Checks whether a material id already carries this material's values (colour optional, shading parameters and map file names). Unset values are compared with defaults (1 for smoothness/metalness, 0 for clear coat/porosity, 1,1,1 for colour).
---@param node any
---@param materialId any
---@param checkColor any
function VehicleMaterial:getIsApplied(node, materialId, checkColor) end

--- Registers the XML schema for the full form: slot name, template name (with autocompletion from brandMaterialTemplates.xml), colour-only flag, colour, smoothness, metalness, clear coat, detail and texture paths.
---@param schema XMLSchema
---@param basePath string
function VehicleMaterial.registerXMLPaths(schema, basePath) end

--- Registers the XML schema for the short form: slot name, template name, colour-only flag and `#materialTemplateNameColor`.
---@param schema XMLSchema
---@param basePath string
function VehicleMaterial.registerShortXMLPaths(schema, basePath) end
