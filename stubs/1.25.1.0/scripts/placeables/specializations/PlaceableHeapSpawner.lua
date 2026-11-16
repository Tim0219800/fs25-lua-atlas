---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableHeapSpawner.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that continuously spawns a fill type as a heap inside rectangular areas at a rate in liters per in-game hour, with optional effects, sounds and animation nodes on clients. The server keeps the placeable active so its update tick does the actual spawning; the onUpdateTick and onDelete handlers are registered but have no body in the SDK dump (UNVERIFIED).
---@class PlaceableHeapSpawner
PlaceableHeapSpawner = {}

--- No prerequisite: always returns true.
---@param specializations table
---@return boolean
function PlaceableHeapSpawner.prerequisitesPresent(specializations) end

--- Subscribes to load, finalize-placement, update-tick and delete events.
---@param placeableType any
function PlaceableHeapSpawner.registerEventListeners(placeableType) end

--- Declares each spawnArea: area start, width and height nodes, fillType, litersPerHour, effect nodes, work/work2/dropping sounds and animation nodes.
---@param schema any
---@param basePath any
function PlaceableHeapSpawner.registerXMLPaths(schema, basePath) end

--- Reads each spawn area, skipping with a logged error those missing a node, a valid fill type or a positive litersPerHour (default 150). Stores liters per millisecond. On clients loads and starts effects, three looping samples and animations.
---@param savegame table
function PlaceableHeapSpawner:onLoad(savegame) end

--- On the server, wakes the update loop so spawning can begin.
---@param savegame any
function PlaceableHeapSpawner:onFinalizePlacement(savegame) end
