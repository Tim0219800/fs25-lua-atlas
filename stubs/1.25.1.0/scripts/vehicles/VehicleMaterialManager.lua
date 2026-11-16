---@meta
-- FS25 1.25.1.0 : vehicles/VehicleMaterialManager.lua (generated stub, FS25 Lua Atlas)

--- Manager (extends `AbstractManager`) for the material templates used by the vehicle shader (paint colors, smoothness, clear coat and detail textures). On map load it reads the default and brand template files, then the templates declared by mods. Templates can inherit from a parent template and are keyed by upper-cased name, prefixed with the mod's custom environment for mods.
---@class VehicleMaterialManager : AbstractManager
VehicleMaterialManager = {}

--- Creates the empty template list, the name lookup and the queue of mod template files to load.
function VehicleMaterialManager:initDataStructures() end

--- Loads the default and brand template files, then drains the queue of mod template XML files (parent default `calibratedPaint`), loading each and removing it from the queue.
---@param mapXMLFile integer
---@param missionInfo table
---@param baseDirectory string
---@return boolean
function VehicleMaterialManager:loadMapData(mapXMLFile, missionInfo, baseDirectory) end

--- Queues a mod's template XML (file, key, base directory, custom environment) to be loaded at the next `loadMapData`.
---@param xmlFilename any
---@param key any
---@param baseDirectory any
---@param customEnvironment any
function VehicleMaterialManager:addModMaterialTemplatesToLoad(xmlFilename, key, baseDirectory, customEnvironment) end

--- Loads a template XML file with the manager schema and parses its `templates` section, then frees the file.
---@param xmlFilename any
---@param baseDirectory any
---@param customEnvironment any
function VehicleMaterialManager:loadMaterialTemplates(xmlFilename, baseDirectory, customEnvironment) end

--- Parses each `template` entry: name, parent, brand, color and finish scales, and the detail diffuse/normal/specular textures. Entries with a missing parent, or with no own or inherited texture, are skipped with an XML warning.
---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param customEnvironment any
---@param parentTemplateDefault any
function VehicleMaterialManager:loadMaterialTemplatesFromXML(xmlFile, key, baseDirectory, customEnvironment, parentTemplateDefault) end

--- Returns the template for a name; with a custom environment it first tries the environment-prefixed name, then the plain name. Returns nil if none.
---@param name any
---@param customEnvironment any
function VehicleMaterialManager:getMaterialTemplateByName(name, customEnvironment) end

--- Returns the template color scale as a four-value table with alpha 0, or nil if the template or its colorScale is missing.
---@param name any
---@param customEnvironment any
function VehicleMaterialManager:getMaterialTemplateColorByName(name, customEnvironment) end

--- Returns a copy of the color scale (white if unset) and a display title built from brand title plus translated template title; returns nil, nil if unknown.
---@param name any
---@param customEnvironment any
function VehicleMaterialManager:getMaterialTemplateColorAndTitleByName(name, customEnvironment) end

--- Returns the list index of the template with this name, or 1 when the name is nil or not found.
---@param name any
function VehicleMaterialManager:getMaterialTemplateIndexByName(name) end

--- Returns the template name at an index, falling back to the first template when the index is invalid.
---@param index any
function VehicleMaterialManager:getMaterialTemplateNameByIndex(index) end

--- Guesses the finish from the template name: returns isMetallic (name contains silver, copper, gold, bronze, chrome or metallic) and isMat (contains matpaint).
---@param materialTemplateName any
function VehicleMaterialManager:getMaterialTemplateFinish(materialTemplateName) end

--- Registers on an XML schema the attributes allowed for a template file, including template name, title, parent, brand, color and finish scales, detail textures and the colorScan options.
---@param schema any
---@param basePath any
function VehicleMaterialManager.registerXMLPaths(schema, basePath) end
