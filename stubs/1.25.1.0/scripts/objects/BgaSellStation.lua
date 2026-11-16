---@meta
-- FS25 1.25.1.0 : objects/BgaSellStation.lua (generated stub, FS25 Lua Atlas)

--- Unloading station used by biogas plants for selling goods. It extends UnloadingStation and only adds the XML registration of the appearsOnStats flag.
---@class BgaSellStation : UnloadingStation
BgaSellStation = {}

--- Registers the boolean XML attribute appearsOnStats (default false) at the base path, then the UnloadingStation paths. The attribute is only declared here; its use is not in this file (UNVERIFIED).
---@param schema any
---@param basePath any
function BgaSellStation.registerXMLPaths(schema, basePath) end
