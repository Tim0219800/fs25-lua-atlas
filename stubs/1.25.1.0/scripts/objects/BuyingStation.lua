---@meta
-- FS25 1.25.1.0 : objects/BuyingStation.lua (generated stub, FS25 Lua Atlas)

--- Loading station that lets players buy goods (fill types) from a placeable. It extends LoadingStation and declares the XML schema of the per-fill-type entries plus two helpers used by the store specs to list which fill types a buying station offers.
---@class BuyingStation : LoadingStation
BuyingStation = {}

--- Registers fillType(?) entries with name, statsName (default other) and priceScale (default 1) at the base path, then the LoadingStation paths.
---@param schema any
---@param basePath any
function BuyingStation.registerXMLPaths(schema, basePath) end

--- Reads placeable.buyingStation#fillTypes and each loadTrigger#fillTypes (space separated names), upper-cases them into a set, and lets PlaceableHeapSpawner add its own. Returns the set of names, or nil if nothing is found.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function BuyingStation.loadSpecValueFillTypes(xmlFile, customEnvironment, baseDir) end

--- Converts the buyingStationFillTypes set stored in the store item specs into fill type entries through g_fillTypeManager. Returns nil when the spec is absent.
---@param storeItem any
---@param realItem any
function BuyingStation.getSpecValueFillTypes(storeItem, realItem) end
