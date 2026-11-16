---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolSprayCan.lua (generated stub, FS25 Lua Atlas)

--- Hand tool specialization for the tree marking spray can. The player aims at a tree (split shape) within a short distance; a SprayCanEvent runs on the server and the marker is applied through the mission's tree marker system after a delay. The number of remaining markers is saved to the savegame and synchronised to clients. Several marker types can be cycled.
---@class HandToolSprayCan
HandToolSprayCan = {}

--- Registers the `handTool.sprayCan` attributes (shake node, colour material slot, colour, distance, delay, total markers) plus the spraying sound and effects.
---@param xmlSchema any
function HandToolSprayCan.registerXMLPaths(xmlSchema) end

--- Registers the savegame key `sprayCan#remainingNumMarkers`.
---@param savegameXMLSchema any
---@param baseKey any
function HandToolSprayCan.registerSavegameXMLPaths(savegameXMLSchema, baseKey) end

--- Registers `tryToAddTreeMarker`, `processDelayedMarker`, `setIsSpraying`, `changeTreeMarkerType`, `getIsSprayingAllowed` and `activateSpraying`.
---@param handToolType any
function HandToolSprayCan.registerFunctions(handToolType) end

--- Subscribes to load, post-load, delete, update, draw, full and update stream read/write, action events registration, and held start/end.
---@param handToolType any
function HandToolSprayCan.registerEventListeners(handToolType) end

--- Always returns true: no prerequisite.
---@param specializations any
function HandToolSprayCan.prerequisitesPresent(specializations) end

--- Reads marker count (valid range 1 to 255, otherwise 255 with a warning), colour, detection distance (default 1.5), delay, colour slot and shake node; loads effects (water type) and sound; resolves the tree marker type and crosshairs. Returns true.
---@param xmlFile any
function HandToolSprayCan:onLoad(xmlFile) end

--- Restores `remainingNumMarkers` from the savegame, clamped between 1 and the maximum, when the savegame has the `sprayCan` key.
---@param savegame any
function HandToolSprayCan:onPostLoad(savegame) end

--- Applies any pending delayed marker, then frees effects, spraying sound and both crosshairs.
function HandToolSprayCan:onDelete() end

--- Server to client initial sync: writes the remaining marker count as a byte.
---@param streamId any
---@param connection any
---@param dirtyMask any
function HandToolSprayCan:onWriteStream(streamId, connection, dirtyMask) end

--- Client side: reads the remaining marker count sent by the server.
---@param streamId any
---@param connection any
---@param carryingPlayer any
function HandToolSprayCan:onReadStream(streamId, connection, carryingPlayer) end

--- Server to client: when the dirty flag is set, writes the remaining marker count as a byte.
---@param streamId any
---@param connection any
---@param dirtyMask any
function HandToolSprayCan:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Client side: reads the remaining marker count if the update flag is set.
---@param streamId any
---@param timestamp any
---@param connection any
---@param carryingPlayer any
function HandToolSprayCan:onReadUpdateStream(streamId, timestamp, connection, carryingPlayer) end

--- Saves the remaining marker count to `#remainingNumMarkers` under the given key.
---@param xmlFile any
---@param key any
---@param usedModNames any
function HandToolSprayCan:saveToXMLFile(xmlFile, key, usedModNames) end

--- For the owning player, reads the targeted tree and on a fresh press sends a SprayCanEvent to the server if markers remain and the land is accessible; otherwise shows a blinking warning. Also processes the delayed marker, animates the shake and stops spraying after its duration.
---@param dt any
function HandToolSprayCan:onUpdate(dt) end

--- Draws the marker type icon and, if a tree is targeted, the tree crosshair. Draws nothing without a marker type or with no markers left.
function HandToolSprayCan:onDraw() end

--- For the owning player, adds a TREE target type (0.5 minimum, detection distance) with a filter that keeps only split-shape meshes.
function HandToolSprayCan:onHeldStart() end

--- Registers SPRAYCAN_CHANGE_MARKER (cycles marker type) and ACTIVATE_HANDTOOL (spray), with texts and priority. Skipped if the tool is not active for input.
function HandToolSprayCan:onRegisterActionEvents() end

--- Input callback: records whether the activate input is pressed for this frame.
---@param _ any
---@param inputValue any
function HandToolSprayCan:activateSpraying(_, inputValue) end

--- Called when the server-side event is processed: starts the spray animation, decrements the remaining markers, flags sync on the server and, if a tree is given and allowed, stores a delayed marker to apply after `sprayDelay`.
---@param treeMarkerTypeIndex any
---@param splitShapeId any
---@param x any
---@param y any
---@param z any
---@param hitX any
---@param hitY any
---@param hitZ any
function HandToolSprayCan:tryToAddTreeMarker(treeMarkerTypeIndex, splitShapeId, x, y, z, hitX, hitY, hitZ) end

--- Applies the pending delayed marker via the tree marker system (camera based, with the spray colour) if the shape still exists, then clears it.
function HandToolSprayCan:processDelayedMarker() end

--- Starts or stops the spray effects and sound. Starting needs the tool to be held and sets the shake end time; stopping can optionally reset the effects when `force` is true.
---@param isSpraying any
---@param force any
function HandToolSprayCan:setIsSpraying(isSpraying, force) end

--- Input callback: advances to the next tree marker type (wrapping to 1) and rebuilds the marker icon crosshair.
---@param _ any
---@param inputValue any
function HandToolSprayCan:changeTreeMarkerType(_, inputValue) end

--- Returns true for no shape; otherwise true only if the local player's farm may access the land at the shape's position.
---@param shape any
function HandToolSprayCan:getIsSprayingAllowed(shape) end
