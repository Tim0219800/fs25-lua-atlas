# fillTypes/FillTypeDesc.lua

*[Version française](../../fr/scripts/fillTypes/FillTypeDesc.md)*

Source: `dataS/scripts/fillTypes/FillTypeDesc.lua` — FS25 1.25.1.0

✍ Data class describing one fill type (a material such as grain, liquid or bale content): name, title, unit, mass and price per liter, seasonal price factors, ground layer textures and physical parameters, effect and particle settings. It is created and indexed by FillTypeManager and filled from XML.

- **FillTypeDesc** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `FillTypeDesc.new(customMt: any)` | 16 | ✍ Constructor. Creates a fill type named UNKNOWN with defaults (mass 0.001 per liter, max surface angle 30 degrees, empty economy and layer data, default alpha clip values, not finalized). The index is set later by FillTypeManager. |
| `FillTypeDesc:loadFromXMLFile(xmlFile: any, key: any, baseDirectory: any, customEnvironment: any)` | 89 | ✍ Reads a fill type from XML: name (validated, upper-cased; returns false if invalid), title, unit, bulk/pallet/bale flags, physics, HUD and pallet files, price and per-period economy factors, ground textures and layer parameters, effect type, smoke colors, particles and alpha clip. Existing values are kept as defaults, so repeated loads override selectively. Returns true on success. Note: firmnessWet falls back to the firmness value. |
