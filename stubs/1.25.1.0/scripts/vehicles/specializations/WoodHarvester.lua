---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WoodHarvester.lua (generated stub, FS25 Lua Atlas)

--- Specialization for tree harvester heads: grab a standing tree or a log, fell it at a cut node, hold it with a physics joint, feed it through a delimbing node, and cut it to the selected length. It requires TurnOnVehicle. The server owns all splitting and joint logic and syncs with events (`WoodHarvesterOnCutTreeEvent`, `WoodHarvesterOnDelimbTreeEvent`, cut-length, drop, tilt and cut events); clients handle effects, sounds, animations, dashboards and input. It raises the vehicle event `onCutTree` and registers a per-vehicle auto-cut setting and a shop spec for maximum tree size.
---@class WoodHarvester
WoodHarvester = {}

--- Returns true only if the vehicle type has the TurnOnVehicle specialization.
---@param specializations any
function WoodHarvester.prerequisitesPresent(specializations) end

--- Adds the `woodHarvesterMaxTreeSize` shop spec and registers the XML schema: cut node, tilt, delimb node, cut lengths, effects, forwarding nodes, sounds, cut and grab animations, tree size measure and dashboards. Also registers the savegame attributes.
function WoodHarvester.initSpecialization() end

--- Registers the vehicle event `onCutTree`.
---@param vehicleType any
function WoodHarvester.registerEvents(vehicleType) end

--- Registers the public vehicle functions: split shape callback, tree diameter, search in range, cut, delimb, access check, header tilt, cut length selection and tree drop.
---@param vehicleType any
function WoodHarvester.registerFunctions(vehicleType) end

--- Overrides `getCanBeSelected`, `getDoConsumePtoPower`, `getConsumingLoad`, `getIsFoldAllowed` and the three auto tree alignment queries.
---@param vehicleType any
function WoodHarvester.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, delete, stream, update, draw, input, activation, turn on/off, state change, `onCutTree` and vehicle setting events.
---@param vehicleType any
function WoodHarvester.registerEventListeners(vehicleType) end

--- Initializes the runtime state and reads cut, attach, delimb, cut length (explicit values or min/max/step, 0 meaning unlimited), effects, sounds, animations and texts from XML. Registers the vehicle setting `WOOD_HARVESTER_AUTO_CUT`.
---@param savegame any
function WoodHarvester:onLoad(savegame) end

--- If a grab animation exists, plays it in reverse and forces it to its end state instantly so the grab starts in a defined position.
---@param savegame any
function WoodHarvester:onPostLoad(savegame) end

--- Restores from a savegame (unless vehicles are reset): cut length index, turned-on state, last tree size, joint position and attach direction. If a tree was held and the head is on, searches again for it and marks it as loaded from the savegame.
---@param savegame any
function WoodHarvester:onLoadFinished(savegame) end

--- Registers three dashboard values: `cutLength` (cm, 9999999 when unlimited), `curCutLength` (cm already fed) and `diameter` (mm of the last tree).
function WoodHarvester:onRegisterDashboardValueTypes() end

--- Removes the joint holding the tree, deletes the helper node, and frees effects, sounds and animation nodes.
function WoodHarvester:onDelete() end

--- Saves cut length index, turned-on flag (also true while a tree is held), attach direction, and, if a tree is held, its size and joint position.
---@param xmlFile any
---@param key any
---@param usedModNames any
function WoodHarvester:saveToXMLFile(xmlFile, key, usedModNames) end

--- Initial sync on the client: reads whether a tree is held (plus grab animation time in 7 bits), whether it is moving, and the cut length index.
---@param streamId any
---@param connection any
function WoodHarvester:onReadStream(streamId, connection) end

--- Initial sync on the server: writes the held-tree flag with grab animation time, the moving flag and the cut length index.
---@param streamId any
---@param connection any
function WoodHarvester:onWriteStream(streamId, connection) end

--- Client side: reads whether the feed effect is active and, if so, whether the delimb effect is active.
---@param streamId any
---@param timestamp any
---@param connection any
function WoodHarvester:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes the feed effect flag and, if set, the delimb effect flag.
---@param streamId any
---@param connection any
---@param dirtyMask any
function WoodHarvester:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Server: drops lost shapes (raising `onCutTree` with radius 0), runs the cut when the timer or cut animation is ready (split, attach or pick up, achievements counters), delimbs and feeds the held tree toward the target position, and updates its joint. Client: drives cut and delimb sounds and effects.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function WoodHarvester:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Resets warnings, then while on and no tree is held, looks for a valid tree and discards it if the cut would be too low. Also relaxes released joints, runs the delayed grab animation, and on clients updates the cut and cut-length input prompts.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function WoodHarvester:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Shows a blinking warning for the active vehicle while on: tree too thick, too thick at that position, unsupported type, or no access to the land.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function WoodHarvester:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client: registers the input actions for cutting, cut length (next and back), dropping the tree and, if a tilt animation exists, header tilt.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function WoodHarvester:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Clears the current candidate tree and resets the displayed diameter.
function WoodHarvester:onDeactivate() end

--- Cancels any pending delayed grab animation, plays the grab animation toward its open position if no tree is held, and resets the diameter.
function WoodHarvester:onTurnedOn() end

--- Opens the grab fully with a 500 ms delayed follow-up when no tree is held, and on clients stops effects and sounds.
function WoodHarvester:onTurnedOff() end

--- Server: when the motor turns on while a tree is still held, turns the harvester on again if allowed.
---@param state any
---@param data any
function WoodHarvester:onStateChange(state, data) end

--- Asks `g_splitShapeManager` whether this farm may cut the shape at position x, z, given the owner connection.
---@param x any
---@param z any
---@param shape any
function WoodHarvester:getCanSplitShapeBeAccessed(x, z, shape) end

--- Reads a header tilt block into the given table (animation name, speed factor, state). Returns false if no animation name is set.
---@param headerTilt any
---@param xmlFile any
---@param key any
function WoodHarvester:loadWoodHarvesterHeaderTiltFromXML(headerTilt, xmlFile, key) end

--- Hook returning true by default; other specializations can override it to forbid tilting.
---@param headerTilt any
function WoodHarvester:getIsWoodHarvesterTiltStateAllowed(headerTilt) end

--- Sets or toggles (nil) the header tilt, playing the tilt animation forward or backward, then sends `WoodHarvesterHeaderTiltEvent` unless `noEventSend`.
---@param state any
---@param noEventSend any
function WoodHarvester:setWoodHarvesterTiltState(state, noEventSend) end

--- Selects a cut length by index (updating the current length) and sends `WoodHarvesterCutLengthEvent` unless `noEventSend`.
---@param index any
---@param noEventSend any
function WoodHarvester:setWoodHarvesterCutLengthIndex(index, noEventSend) end

--- Server: removes the joint, releases the held tree, stops delimbing and raises `onCutTree` with radius 0 on all machines. Sends `WoodHarvesterDropTreeEvent` unless `noEventSend`.
---@param noEventSend any
function WoodHarvester:dropWoodHarvesterTree(noEventSend) end

--- Looks for a tree or log at the cut node when none is held. Checks harvester allowance, farm access, alignment (15 degrees standing, 40 degrees lying) and max radius, setting warning flags otherwise. Note: the expression `yOffset or 0 + 1` evaluates as `yOffset or 1`, so the one-meter-higher check ignores the offset arithmetic.
---@param yOffset number
---@param skipCutAnimation boolean
function WoodHarvester:findSplitShapesInRange(yOffset, skipCutAnimation) end

--- Sends `WoodHarvesterCutTreeEvent`; on the server, length 0 starts the cut (instant for logs picked up from the ground), a positive length sets the feed target and starts delimbing. Clears the auto-cut dirty flag.
---@param length any
---@param noEventSend any
function WoodHarvester:cutTree(length, noEventSend) end

--- Event handler. With a positive radius, adjusts the grab animation to the tree size, records the diameter and marks a tree as held; otherwise opens the grab, clears the held flag and restores a saved header tilt. Snaps animations when loaded from a savegame.
---@param radius any
---@param isNewTree any
---@param loadedFromSavegame any
function WoodHarvester:onCutTree(radius, isNewTree, loadedFromSavegame) end

--- Stores the new value of the `WOOD_HARVESTER_AUTO_CUT` setting as the automatic cutting flag.
---@param gameSettingId any
---@param state any
function WoodHarvester:onVehicleSettingChanged(gameSettingId, state) end

--- Sets whether the held tree is being fed. When feeding ends, triggers the next cut (`cutTree(0)`) on the server if auto-cut is on, otherwise flags that a manual cut is pending.
---@param state any
function WoodHarvester:onDelimbTree(state) end

--- Callback of `splitShape`. Registers the new shape, and if it is the upper part, attaches it to the cut attach node with a locked physics joint, releases configured component joints, resets tilt, records positions and raises `onCutTree` with the tree radius (also broadcast to clients).
---@param shape any
---@param isBelow any
---@param isAbove any
---@param minY any
---@param maxY any
---@param minZ any
---@param maxZ any
function WoodHarvester:woodHarvesterSplitShapeCallback(shape, isBelow, isAbove, minY, maxY, minZ, maxZ) end

--- Stores the last measured tree diameter (meters) used by the dashboard.
---@param diameter any
function WoodHarvester:setLastTreeDiameter(diameter) end

--- Always returns true, so the implement can be selected regardless of the parent result.
---@param superFunc any
function WoodHarvester:getCanBeSelected(superFunc) end

--- Returns true if the parent says so or if the harvester is turned on.
---@param superFunc any
---@return boolean
function WoodHarvester:getDoConsumePtoPower(superFunc) end

--- Adds full load (1) to the parent value while the held tree is moving or the cut animation plays, and increments the count by one.
---@param superFunc any
function WoodHarvester:getConsumingLoad(superFunc) end

--- Returns false with a warning text while a tree is held; otherwise defers to the parent.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function WoodHarvester:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Always true: the harvester supports automatic alignment to trees.
---@param superFunc any
function WoodHarvester:getSupportsAutoTreeAlignment(superFunc) end

--- Returns false while a tree is held; otherwise defers to the parent.
---@param superFunc any
function WoodHarvester:getIsAutoTreeAlignmentAllowed(superFunc) end

--- Returns two booleans: whether a candidate tree exists, and whether the given radius fits the maximum cut radius.
---@param superFunc any
---@param radius any
function WoodHarvester:getAutoAlignHasValidTree(superFunc, radius) end

--- Input callback. If on, after a 1 s cooldown: with a tree held and idle it cuts to the selected length (or finishes a pending auto-cut); with a candidate tree it starts the felling cut. If off, shows a warning to turn the tool on first.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WoodHarvester.actionEventCutTree(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: moves the cut length index by `callbackState` (+1 or -1) with wrap-around, unless the tree is currently being fed.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WoodHarvester.actionEventSetCutlength(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: calls `dropWoodHarvesterTree`.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WoodHarvester.actionEventDropTree(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: toggles the header tilt if allowed and no tree is held.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WoodHarvester.actionEventTiltHeader(self, actionName, inputValue, callbackState, isAnalog) end

--- Shop spec loader: returns the `cutNode#maxRadius` value from the vehicle XML.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function WoodHarvester.loadSpecValueMaxTreeSize(xmlFile, customEnvironment, baseDir) end

--- Shop spec getter: turns the stored radius into a diameter in cm (radius x 2 x 100) and returns it with a formatted string, or nil if absent. Return shape depends on `returnValues` and `returnRange`.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function WoodHarvester.getSpecValueMaxTreeSize(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
