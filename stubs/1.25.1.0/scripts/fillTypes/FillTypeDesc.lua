---@meta
-- FS25 1.25.1.0 : fillTypes/FillTypeDesc.lua (generated stub, FS25 Lua Atlas)

--- Data class describing one fill type (a material such as grain, liquid or bale content): name, title, unit, mass and price per liter, seasonal price factors, ground layer textures and physical parameters, effect and particle settings. It is created and indexed by FillTypeManager and filled from XML.
---@class FillTypeDesc
FillTypeDesc = {}

--- Constructor. Creates a fill type named UNKNOWN with defaults (mass 0.001 per liter, max surface angle 30 degrees, empty economy and layer data, default alpha clip values, not finalized). The index is set later by FillTypeManager.
---@param customMt any
function FillTypeDesc.new(customMt) end

--- Reads a fill type from XML: name (validated, upper-cased; returns false if invalid), title, unit, bulk/pallet/bale flags, physics, HUD and pallet files, price and per-period economy factors, ground textures and layer parameters, effect type, smoke colors, particles and alpha clip. Existing values are kept as defaults, so repeated loads override selectively. Returns true on success. Note: firmnessWet falls back to the firmness value.
---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param customEnvironment any
function FillTypeDesc:loadFromXMLFile(xmlFile, key, baseDirectory, customEnvironment) end
