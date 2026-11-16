---@meta
-- FS25 1.25.1.0 : placement/PalletSpawner.lua (generated stub, FS25 Lua Atlas)

--- Helper owned by a production point, shop or similar placeable that spawns pallet vehicles on defined spawn places. It loads spawn places and pallet definitions from XML, maps fill types to pallet files, queues spawn requests and processes them one at a time via the PlacementManager and VehicleLoadingData. Spawning runs on the authority (server); result codes such as PALLET_LIMITED_REACHED and RESULT_SUCCESS are defined outside this file (UNVERIFIED).
---@class PalletSpawner
PalletSpawner = {}

--- Creates a spawner with an empty queue and the mod/base directory used to resolve pallet paths. Sets a vertical spawn offset of 0.2 when the platform has dynamic pallets, otherwise 0.
---@param baseDirectory any
---@param customMt any
function PalletSpawner.new(baseDirectory, customMt) end

--- Reads `spawnPlaces.spawnPlace` entries (optionally restricted by `#fillTypes` or `#fillTypeCategories`, not both) and the pallets: first every fill type's default pallet file, then `pallets.pallet#filename` entries, which override. Returns false with an XML error if no spawn place exists.
---@param components table
---@param xmlFile table
---@param key string
---@param customEnv string
---@param i3dMappings table
---@return boolean
function PalletSpawner:load(components, xmlFile, key, customEnv, i3dMappings) end

--- Empty cleanup hook; nothing is released here.
function PalletSpawner:delete() end

--- Loads a pallet vehicle XML, reads its size, capacity and supported fill types, and registers it for those fill types (or only `limitFillTypeId`). Returns the pallet table, or nil if the file fails to load or no fill type matches.
---@param palletFilename any
---@param limitFillTypeId any
function PalletSpawner:loadPalletFromFilename(palletFilename, limitFillTypeId) end

--- Returns the table mapping fill type ids to their pallet definitions.
function PalletSpawner:getSupportedFillTypes() end

--- Queues a pallet for the farm and fill type and registers the spawner as updateable. Calls the callback immediately with an error code if the pallet slot limit is reached or no pallet exists for the fill type.
---@param farmId integer
---@param fillTypeId integer
---@param callback function
---@param callbackTarget table
function PalletSpawner:spawnPallet(farmId, fillTypeId, callback, callbackTarget) end

--- Looks for an existing non-full pallet of the fill type on the spawn places (physics overlap test) and reports it with PALLET_ALREADY_PRESENT; otherwise falls back to spawnPallet. Result goes through the callback.
---@param farmId integer
---@param fillTypeId integer
---@param callback function
---@param callbackTarget table
function PalletSpawner:getOrSpawnPallet(farmId, fillTypeId, callback, callbackTarget) end

--- Overlap-tests the spawn places for pallets currently holding the given fill type and passes them as a list, with the fill type id, to the callback synchronously.
---@param fillTypeId integer
---@param callbackFunc function
---@param callbackTarget table
function PalletSpawner:getAllPallets(fillTypeId, callbackFunc, callbackTarget) end

--- Per-frame step: when idle, takes the first queued request and asks the placement manager asynchronously for a free place. Removes the spawner from the updateables once the queue is empty.
---@param dt any
function PalletSpawner:update(dt) end

--- Placement callback. If a place was found, clamps its Y to at least terrain height plus the offset and loads the pallet as an owned vehicle (spawnEmpty parameter). If not, reports RESULT_NO_SPACE and pops the request.
---@param location any
function PalletSpawner:onSpawnSearchFinished(location) end

--- Vehicle-load callback: reports the first loaded vehicle with success, or an error code if the load state is not OK, then pops the current request so the next one can start.
---@param vehicles any
---@param vehicleLoadState any
function PalletSpawner:onFinishLoadingPallet(vehicles, vehicleLoadState) end

--- Overlap callback: accepts a pallet vehicle that supports the wanted fill type and still has free capacity in unit 1, stores it and returns false to stop further reports.
---@param node any
function PalletSpawner:onFindExistingPallet(node) end

--- Overlap callback: collects pallet vehicles whose pallet fill unit currently holds the wanted fill type into a set keyed by the vehicle.
---@param node any
function PalletSpawner:onFindPallet(node) end

--- Registers `spawnPlaces.spawnPlace(?)#fillTypes` and `#fillTypeCategories`, the PlacementUtil place keys, and `pallets.pallet(?)#filename` under the base path.
---@param schema any
---@param basePath any
function PalletSpawner.registerXMLPaths(schema, basePath) end
