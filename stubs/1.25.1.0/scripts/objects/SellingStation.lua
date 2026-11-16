---@meta
-- FS25 1.25.1.0 : objects/SellingStation.lua (generated stub, FS25 Lua Atlas)

--- Selling station: a subclass of UnloadingStation that buys fill types from farms at dynamic prices. This file only adds XML path registration, restoring per-fill-type statistics (received, paid, price dynamics) from the savegame and the store-spec helpers that list which fill types a placeable station accepts. The selling logic itself lives in UnloadingStation (see that file) and in the price classes it uses.
---@class SellingStation : UnloadingStation
SellingStation = {}

--- Reads the savegame `stats(i)` entries: for each accepted fill type it restores the totals received and paid and calls `loadFromXMLFile` on that type's pricing dynamics. Unknown or non-accepted fill types are skipped. Always returns true.
---@param xmlFile XMLFile
---@param key string
---@return boolean
function SellingStation:loadFromXMLFile(xmlFile, key) end

--- Registers the XML attributes of a selling station (stats flags, mission permission, dynamic prices, price drop volume, recovery hours, fill type lists, income name, per-fill-type price scale and options), then registers the UnloadingStation paths.
---@param schema any
---@param basePath any
function SellingStation.registerXMLPaths(schema, basePath) end

--- Registers the savegame paths for one `stats` entry per fill type (fill type name, received and paid amounts) and delegates to `PricingDynamics.registerSavegameXMLPaths` for the price data.
---@param schema any
---@param basePath any
function SellingStation.registerSavegameXMLPaths(schema, basePath) end

--- Store-spec helper: collects the accepted fill type names from `placeable.sellingStation#fillTypes`, from the unload trigger definitions and from a constructible placeable if present. Returns a name set, or nil if none are found.
---@param xmlFile XMLFile
---@param customEnvironment string?
---@param baseDir string?
---@return table?
function SellingStation.loadSpecValueFillTypes(xmlFile, customEnvironment, baseDir) end

--- Store-spec helper: converts the stored `sellingStationFillTypes` names of a store item into fill type entries through the fill type manager. Returns nil if the spec is absent.
---@param storeItem any
---@param realItem any
function SellingStation.getSpecValueFillTypes(storeItem, realItem) end
