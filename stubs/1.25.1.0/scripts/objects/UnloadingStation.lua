---@meta
-- FS25 1.25.1.0 : objects/UnloadingStation.lua (generated stub, FS25 Lua Atlas)

--- Base class for stations where goods are unloaded by vehicles, extending Object. In this dump it only holds the network join streaming of its unload triggers, a developer validation that pallet, bale and bulk fill types have a matching trigger type, and the shared XML paths. The rest of the class (load, trigger handling, storage links) is not in this file and is UNVERIFIED here. SellingStation extends it.
---@class UnloadingStation : Object
UnloadingStation = {}

--- Client side initial sync: after the parent data, for each unload trigger reads its object id and stream data, then finishes registering it with the client.
---@param streamId integer
---@param connection table
function UnloadingStation:readStream(streamId, connection) end

--- Server side initial sync: after the parent data, writes each unload trigger's object id and stream data and registers it in the stream for that connection.
---@param streamId integer
---@param connection table
function UnloadingStation:writeStream(streamId, connection) end

--- Developer check at load time: logs a warning when a pallet, bale or bulk fill type has no suitable trigger class (PalletUnloadTrigger, BaleUnloadTrigger, UnloadTrigger). Train and pallet stations skip bale and bulk checks, and husbandry keys skip the bale warning. Changes no state.
---@param xmlFile any
---@param key any
function UnloadingStation:validateUnloadTriggers(xmlFile, key) end

--- Registers the station XML attributes (node, name, storage radius, hide from prices menu, extension support, train and pallet-only flags), the unload trigger paths, sounds (`active`, `idle`), animation nodes, effect nodes and the `simpleFillplane` entries.
---@param schema any
---@param basePath any
function UnloadingStation.registerXMLPaths(schema, basePath) end
