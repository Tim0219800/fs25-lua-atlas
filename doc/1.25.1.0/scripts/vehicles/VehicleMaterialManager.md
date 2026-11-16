# vehicles/VehicleMaterialManager.lua

*[Version française](../../fr/scripts/vehicles/VehicleMaterialManager.md)*

Source: `dataS/scripts/vehicles/VehicleMaterialManager.lua` — FS25 1.25.1.0

✍ Manager (extends `AbstractManager`) for the material templates used by the vehicle shader (paint colors, smoothness, clear coat and detail textures). On map load it reads the default and brand template files, then the templates declared by mods. Templates can inherit from a parent template and are keyed by upper-cased name, prefixed with the mod's custom environment for mods.

- **VehicleMaterialManager** inherits from `AbstractManager` (l.21)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleMaterialManager:initDataStructures()` | 36 | ✍ Creates the empty template list, the name lookup and the queue of mod template files to load. |
| `VehicleMaterialManager:loadMapData(mapXMLFile: integer, missionInfo: table, baseDirectory: string) → boolean` | 48 | ✍ Loads the default and brand template files, then drains the queue of mod template XML files (parent default `calibratedPaint`), loading each and removing it from the queue. |
| `VehicleMaterialManager:addModMaterialTemplatesToLoad(xmlFilename: any, key: any, baseDirectory: any, customEnvironment: any)` | 68 | ✍ Queues a mod's template XML (file, key, base directory, custom environment) to be loaded at the next `loadMapData`. |
| `VehicleMaterialManager:loadMaterialTemplates(xmlFilename: any, baseDirectory: any, customEnvironment: any)` | 74 | ✍ Loads a template XML file with the manager schema and parses its `templates` section, then frees the file. |
| `VehicleMaterialManager:loadMaterialTemplatesFromXML(xmlFile: any, key: any, baseDirectory: any, customEnvironment: any, parentTemplateDefault: any)` | 84 | ✍ Parses each `template` entry: name, parent, brand, color and finish scales, and the detail diffuse/normal/specular textures. Entries with a missing parent, or with no own or inherited texture, are skipped with an XML warning. |
| `VehicleMaterialManager:getMaterialTemplateByName(name: any, customEnvironment: any)` | 183 | ✍ Returns the template for a name; with a custom environment it first tries the environment-prefixed name, then the plain name. Returns nil if none. |
| `VehicleMaterialManager:getMaterialTemplateColorByName(name: any, customEnvironment: any)` | 200 | ✍ Returns the template color scale as a four-value table with alpha 0, or nil if the template or its colorScale is missing. |
| `VehicleMaterialManager:getMaterialTemplateColorAndTitleByName(name: any, customEnvironment: any)` | 214 | ✍ Returns a copy of the color scale (white if unset) and a display title built from brand title plus translated template title; returns nil, nil if unknown. |
| `VehicleMaterialManager:getMaterialTemplateIndexByName(name: any)` | 247 | ✍ Returns the list index of the template with this name, or 1 when the name is nil or not found. |
| `VehicleMaterialManager:getMaterialTemplateNameByIndex(index: any)` | 262 | ✍ Returns the template name at an index, falling back to the first template when the index is invalid. |
| `VehicleMaterialManager:getMaterialTemplateFinish(materialTemplateName: any)` | 270 | ✍ Guesses the finish from the template name: returns isMetallic (name contains silver, copper, gold, bronze, chrome or metallic) and isMat (contains matpaint). |
| `VehicleMaterialManager.registerXMLPaths(schema: any, basePath: any)` | 296 | ✍ Registers on an XML schema the attributes allowed for a template file, including template name, title, parent, brand, color and finish scales, detail textures and the colorScan options. |
