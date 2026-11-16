---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableAI.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization (`spec_ai`) that integrates a placeable with the AI system: it marks AI navigation update areas dirty, registers road splines, and manages obstacle boxes that can be switched on and off by animated objects (for example gates). Server-side work goes through `g_currentMission.aiSystem`, whose class is not in the dump (UNVERIFIED). It has no prerequisite specialization, but obstacle activation needs `spec_animatedObjects`.
---@class PlaceableAI
PlaceableAI = {}

--- Prerequisite check; always returns true, so this specialization has no required companions.
---@param specializations table
---@return boolean
function PlaceableAI.prerequisitesPresent(specializations) end

--- Registers the specialization's functions on the placeable type: `setObstacleActive`, `loadAIUpdateArea`, `loadAISpline`, `loadAIObstacle` and `updateAIUpdateAreas`.
---@param placeableType any
function PlaceableAI.registerFunctions(placeableType) end

--- Subscribes to the placeable events `onLoad`, `onPostLoad`, `onDelete` and `onFinalizePlacement`.
---@param placeableType any
function PlaceableAI.registerEventListeners(placeableType) end

--- Registers the `.ai` XML schema: update areas (start/end nodes), splines (node, max width, height, turning radius) and obstacles (node, size, offset, and the linked animated object by index or saveId with normalized start/end times).
---@param schema any
---@param basePath any
function PlaceableAI.registerXMLPaths(schema, basePath) end

--- Loads the update areas, splines and obstacles from the XML into `spec_ai`, keeping only those that load successfully. Logs a warning if no `placeable.ai.updateAreas` entry exists.
---@param savegame table
function PlaceableAI:onLoad(savegame) end

--- If animated objects and an AI navigation map exist, links each obstacle to its animated object (by index or saveId, with warnings if missing) and appends a hook to the object's `setAnimTime` that activates the obstacle while the animation time is within its start and end times.
---@param savegame any
function PlaceableAI:onPostLoad(savegame) end

--- Server only: if flagged, marks the AI update areas dirty, removes the placeable's road splines from the AI system and deactivates any active obstacles.
function PlaceableAI:onDelete() end

--- Reads start and end nodes, converts them into root-local coordinates and stores the area center and X/Z size. Returns false with an XML warning if a node is missing.
---@param xmlFile any
---@param key any
---@param area any
function PlaceableAI:loadAIUpdateArea(xmlFile, key, area) end

--- Reads the spline node, hides it, and stores the optional maximum width, height and turning radius. Returns false with a warning if the node is missing.
---@param xmlFile any
---@param key any
---@param spline any
function PlaceableAI:loadAISpline(xmlFile, key, spline) end

--- Reads an obstacle node, size, offset, animated object link (saveId or index) and start/end times. Returns false with a warning if the node is missing, a non-rigid-body node has no size, the link or times are missing, or start is not before end.
---@param xmlFile any
---@param key any
---@param obstacle any
function PlaceableAI:loadAIObstacle(xmlFile, key, obstacle) end

--- Server only: refreshes AI update areas when the placeable is newly placed (or not from a valid savegame, or during a reload), registers its road splines, and applies the initial obstacle state from each linked animation time.
function PlaceableAI:onFinalizePlacement() end

--- Adds the obstacle box to the AI system (node, offset, size) or removes it, and records the active state. Does nothing if there is no AI system.
---@param obstacle any
---@param active any
function PlaceableAI:setObstacleActive(obstacle, active) end

--- Server only: converts each stored area to a world-space bounding rectangle and calls `aiSystem:setAreaDirty` so AI navigation is recomputed there.
function PlaceableAI:updateAIUpdateAreas() end
