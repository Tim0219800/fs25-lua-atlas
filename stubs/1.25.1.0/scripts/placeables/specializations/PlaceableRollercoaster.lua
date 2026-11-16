---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableRollercoaster.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for a rideable rollercoaster, requiring PlaceableConstructible. It loads an animation clip played on the coaster, carts with seats (camera and character per seat), exit points, a player trigger, spline-linked sounds and a map hotspot with optional teleport. Per-player ride counts are saved by unique user id and seat occupancy is streamed to joining clients. Ride logic functions (enter, exit, start, animation time) are registered but have no body in the dump, so they are UNVERIFIED.
---@class PlaceableRollercoaster
PlaceableRollercoaster = {}

--- Requires the PlaceableConstructible specialization.
---@param specializations table
---@return boolean
function PlaceableRollercoaster.prerequisitesPresent(specializations) end

--- Registers the ride API (getCanEnter, startRide, endRide, enterRide, exitRide, riders-changed listeners, player trigger, getNumRides, etc.). Only onSharedAnimationFileLoaded has a body in this dump; the rest is UNVERIFIED.
---@param placeableType any
function PlaceableRollercoaster.registerFunctions(placeableType) end

--- Overrides getHotspot and finalizeConstruction; their bodies are not in this dump.
---@param placeableType any
function PlaceableRollercoaster.registerOverwrittenFunctions(placeableType) end

--- Subscribes to onLoad, onFinalizePlacement, onDelete, onUpdate, onReadStream and onWriteStream.
---@param placeableType any
function PlaceableRollercoaster.registerEventListeners(placeableType) end

--- Declares the XML under placeable.rollercoaster: animation clip, moving audio sources, five driving sounds, player trigger, exit points, hotspot link and teleport nodes, and carts with seats including camera and character definitions.
---@param schema any
---@param basePath any
function PlaceableRollercoaster.registerXMLPaths(schema, basePath) end

--- Declares savegame keys: state index, spline time, and per-player unique user id with ride count.
---@param schema any
---@param basePath any
function PlaceableRollercoaster.registerSavegameXMLPaths(schema, basePath) end

--- Loads the animation setup (async shared i3d for the clip), player trigger, activatable, carts and seats with camera/character, exit points (warns if fewer than seats), hotspot nodes, and on the client the moving audio sources and driving samples. Subscribes to USER_REMOVED.
---@param savegame table
function PlaceableRollercoaster:onLoad(savegame) end

--- Callback after the animation i3d loads: clones its anim character set onto the clip root node, binds the named clip to track 0 (no loop, speed scale), stores its duration, deletes the loaded node, resets ride counters, initializes the constructible state machine states and finishes the loading task.
---@param node any
---@param failedReason any
---@param args any
function PlaceableRollercoaster:onSharedAnimationFileLoaded(node, failedReason, args) end

--- Configures the map hotspot (placeable, no owner farm, world and teleport positions) and adds it to the mission. The first finalized rollercoaster becomes PlaceableRollercoaster.INSTANCE.
---@param savegame any
function PlaceableRollercoaster:onFinalizePlacement(savegame) end

--- Unsubscribes messages, removes and deletes the hotspot, releases the animation i3d, deletes seat characters and cameras, removes moving sounds and samples, removes the player trigger and clears INSTANCE if it was this placeable.
function PlaceableRollercoaster:onDelete() end

--- Saves each player's unique user id and ride count.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableRollercoaster:saveToXMLFile(xmlFile, key, usedModNames) end

--- Restores the per-player ride counters from the savegame, ignoring incomplete entries.
---@param xmlFile any
---@param key any
function PlaceableRollercoaster:loadFromXMLFile(xmlFile, key) end

--- Client initial sync: for each occupied seat, reads the player object and calls enterRide for that seat.
---@param streamId any
---@param connection any
function PlaceableRollercoaster:onReadStream(streamId, connection) end

--- Server initial sync: writes for each seat whether it is occupied and, if so, the player's node object.
---@param streamId any
---@param connection any
function PlaceableRollercoaster:onWriteStream(streamId, connection) end
