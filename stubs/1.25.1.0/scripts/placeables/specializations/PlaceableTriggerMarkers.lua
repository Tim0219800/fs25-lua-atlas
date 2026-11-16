---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableTriggerMarkers.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that attaches visual trigger markers (loaded i3d files, optionally snapped to terrain) to nodes of a building and shows them only to players allowed to access it. It listens to farm and player-created messages to refresh visibility. Markers are declared under `placeable.triggerMarkers.triggerMarker(?)`.
---@class PlaceableTriggerMarkers
PlaceableTriggerMarkers = {}

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function PlaceableTriggerMarkers.prerequisitesPresent(specializations) end

--- Subscribes to onLoad, onDelete, onFinalizePlacement and onOwnerChanged.
---@param placeableType any
function PlaceableTriggerMarkers.registerEventListeners(placeableType) end

--- Registers `onPlayerFarmChanged`, `onMarkerFileLoaded`, `getTriggerMarkerPosition` and `setShowMarkers`. Note: only `onMarkerFileLoaded` is defined in this file; the other three are referenced but not defined here (UNVERIFIED, may live elsewhere).
---@param placeableType any
function PlaceableTriggerMarkers.registerFunctions(placeableType) end

--- Declares marker XML keys: `#node`, `#filename`, `#adjustToGround`, `#groundOffset` (default 0.03), `#showAllPlayers` and `#showOnlyIfOwned` (both default false).
---@param schema any
---@param basePath any
function PlaceableTriggerMarkers.registerXMLPaths(schema, basePath) end

--- Iterates the marker entries, skipping those with no node, and stores each marker's settings (ground offset defaults to 3 cm). If a filename is set it starts an asynchronous shared i3d load tied to a loading task.
---@param savegame table
function PlaceableTriggerMarkers:onLoad(savegame) end

--- Async load callback: links the loaded i3d under the marker node (when loading succeeded), makes it the marker's node, then completes the loading task.
---@param i3dNode any
---@param failedReason any
---@param args any
function PlaceableTriggerMarkers:onMarkerFileLoaded(i3dNode, failedReason, args) end

--- Releases the shared i3d load requests, removes each marker from the mission via `removeTriggerMarker`, and unsubscribes from the player-farm-changed and player-created messages.
function PlaceableTriggerMarkers:onDelete() end

--- Snaps markers with `adjustToGround` to the terrain height plus offset, shows or hides markers according to player access, and subscribes to the farm-changed and player-created messages.
function PlaceableTriggerMarkers:onFinalizePlacement() end
