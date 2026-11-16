# vehicles/VehicleMaterial.lua

*[Version française](../../fr/scripts/vehicles/VehicleMaterial.md)*

Source: `dataS/scripts/vehicles/VehicleMaterial.lua` — FS25 1.25.1.0

✍ Data holder for a vehicle paint/material definition: colour scale, smoothness, metalness, clear coat, porosity, detail textures and diffuse/normal/specular maps. It can be filled from a template of `g_vehicleMaterialManager` or from XML (full or short form), then applied to the shapes of a vehicle by writing shader parameters and replacing material maps. Pure client-side visual data.

- **VehicleMaterial** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleMaterial.new(baseDirectory: any, customMt: any)` | 16 | ✍ Creates an empty material for the given base directory (used to resolve texture paths). `colorOnly` starts false. |
| `VehicleMaterial:clone()` | 27 | ✍ Returns a new `VehicleMaterial` with the same slot name, template and all colour, shading and texture values copied (shallow copy of the colour table reference). |
| `VehicleMaterial:setColor(r: any, g: any, b: any)` | 56 | ✍ Sets the colour scale from either three numbers or a table of three; does nothing if the first argument is nil. |
| `VehicleMaterial:getBrightness()` | 70 | ✍ Returns the brightness of the colour scale via `MathUtil.getBrightnessFromColor`, or nil if no colour is set. |
| `VehicleMaterial:setTemplateName(templateName: any, colorOnly: any, customEnvironment: any)` | 80 | ✍ Looks up a material template by name in `g_vehicleMaterialManager` and copies its values, falling back to its parent template then to defaults (e.g. smoothness 1, default detail textures). With `colorOnly`, only the colour is taken. Returns false if the template is unknown. |
| `VehicleMaterial:loadFromXML(xmlFile: any, key: any, customEnvironment: any)` | 112 | ✍ Loads the full XML form: slot name, optional template, then overrides for colour (vector or template name), smoothness, metalness, clear coat, detail and diffuse/normal/specular textures. Returns false (with warning) for an unknown template; otherwise true if any value is set. Porosity has no XML key here. |
| `VehicleMaterial:loadShortFromXML(xmlFile: any, key: any, customEnvironment: any)` | 173 | ✍ Loads the short XML form: slot name, a required template (`#materialTemplateName`, optionally colour-only) and an optional separate template for the colour only (`#materialTemplateNameColor`). Returns false if the template name is missing or unknown. |
| `VehicleMaterial:applyToVehicle(vehicle: any, targetMaterialSlotName: any)` | 200 | ✍ Applies the material to every component node tree of the vehicle, optionally restricted to a material slot name. Returns true if at least one material was changed. |
| `VehicleMaterial:apply(node: any, targetMaterialSlotName: any, colorOnly: any)` | 211 | ✍ Recursively walks a node and its children and applies the material to each shape material slot whose name matches (all slots if no name is given). Returns true if any slot was applied. |
| `VehicleMaterial:applyToMaterial(node: any, materialIndex: any, colorOnly: any)` | 235 | ✍ Writes the colour scale (and, unless `colorOnly`, smoothness, metalness, clear coat, porosity) as shader parameters on one material slot, then swaps in detail/diffuse/normal/gloss maps from file and updates the slot if the material id changed. |
| `VehicleMaterial:getIsApplied(node: any, materialId: any, checkColor: any)` | 298 | ✍ Checks whether a material id already carries this material's values (colour optional, shading parameters and map file names). Unset values are compared with defaults (1 for smoothness/metalness, 0 for clear coat/porosity, 1,1,1 for colour). |
| `VehicleMaterial.registerXMLPaths(schema: XMLSchema, basePath: string)` | 385 | ✍ Registers the XML schema for the full form: slot name, template name (with autocompletion from brandMaterialTemplates.xml), colour-only flag, colour, smoothness, metalness, clear coat, detail and texture paths. |
| `VehicleMaterial.registerShortXMLPaths(schema: XMLSchema, basePath: string)` | 411 | ✍ Registers the XML schema for the short form: slot name, template name, colour-only flag and `#materialTemplateNameColor`. |
