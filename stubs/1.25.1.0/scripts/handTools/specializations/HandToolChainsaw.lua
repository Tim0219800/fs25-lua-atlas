---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolChainsaw.lua (generated stub, FS25 Lua Atlas)

--- Hand tool specialization for the chainsaw. It requires HandToolMotorized. The owning player aims at a tree (split shape); a ring indicator shows whether a cut is valid, and holding the activate input cuts through the trunk over a time proportional to its section, then slices it (directly on the server, or via ChainsawCutEvent from a client). With no tree targeted it revs up and delimbs, removing split shape attachments on the server. State is synchronised in the update stream. Constants such as distances and thresholds are defined elsewhere (UNVERIFIED values).
---@class HandToolChainsaw
HandToolChainsaw = {}

--- Registers the `handTool.chainsaw` XML keys: work style preset, maximum cut and delimb diameter, cut time per square metre, ring selector i3d, cut and hand nodes, chain animation, effects and cut sounds.
---@param xmlSchema any
function HandToolChainsaw.registerXMLPaths(xmlSchema) end

--- Registers the cut plane, validity test, cutting, delimbing, state, animation, split plane and ring selector functions on the hand tool type.
---@param handToolType any
function HandToolChainsaw.registerFunctions(handToolType) end

--- Subscribes to load, post-load, delete, update, draw, update stream read/write, held start/end and action events registration.
---@param handToolType any
function HandToolChainsaw.registerEventListeners(handToolType) end

--- Returns true only if HandToolMotorized is among the specializations.
---@param specializations any
function HandToolChainsaw.prerequisitesPresent(specializations) end

--- Creates shared compression parameters on first use, reads limits, cut time (stored in ms), nodes and optional ring i3d (async load), creates guide, camera rotation and split plane nodes, and loads effects, chain animation, cut sounds and crosshair on clients. Sets `walkMultiplier` to 0.5.
---@param xmlFile any
---@param baseDirectory any
function HandToolChainsaw:onLoad(xmlFile, baseDirectory) end

--- Sets the motor's RPM gain rate so that full RPM is reached over the startup time, and the loss rate to 1.2 times that.
---@param savegame any
function HandToolChainsaw:onPostLoad(savegame) end

--- Async load callback: finishes the loading task, takes the first child of the loaded i3d as the ring indicator, hides it and links it under the camera rotation node. Logs an error on failure.
---@param ringNode any
---@param failedReason any
function HandToolChainsaw:onRingLoadFinished(ringNode, failedReason) end

--- Releases the shared ring i3d, animations, effects, sounds, helper nodes and crosshair, and removes this target type from the carrying player's targeter.
function HandToolChainsaw:onDelete() end

--- When the dirty flag is set, writes the cut state (and vertical flag when cutting). From a client to the server during delimbing it writes the compressed plane position, normal and up vectors; the server writes whether attachments were removed.
---@param streamId any
---@param connection any
---@param dirtyMask any
function HandToolChainsaw:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Reads the cut state and applies it unless the local player owns the tool. The server reads the delimb plane data; a client reads the removed-attachment flag and, for the owner, triggers the delimb effect timing.
---@param streamId any
---@param timestamp any
---@param connection any
function HandToolChainsaw:onReadUpdateStream(streamId, timestamp, connection) end

--- Main loop. For the owner: updates target tree, split plane, roll and tool orientation, checks cut validity, updates action text and ring, and runs the cutting update. While delimbing, computes the plane; the server removes split shape attachments in it. Clients start or stop effects, sounds and chain animation.
---@param dt any
function HandToolChainsaw:onUpdate(dt) end

--- Draws the crosshair only while idle.
function HandToolChainsaw:onDraw() end

--- For the owner, adds a tree target type with a filter for split-shape meshes; for others resets the graphical node. Applies the work style preset and the chainsaw flag to the carrying player.
function HandToolChainsaw:onHeldStart() end

--- Removes the target type, restores the player work style, stops any delimbing or cutting, stops chain animation, hides the ring and clears roll input.
function HandToolChainsaw:onHeldEnd() end

--- Registers AXIS_ROTATE_HANDTOOL (roll the cut plane) and ACTIVATE_HANDTOOL (cut or rev), with texts and priority. Skipped if the tool is not active for input.
function HandToolChainsaw:onRegisterActionEvents() end

--- Input callback: accumulates the roll input applied in the next update.
---@param _ any
---@param inputDelta any
function HandToolChainsaw:onRollAction(_, inputDelta) end

--- Input callback. On release it stops cutting or delimbing and returns to idle. On press it starts cutting if a tree is targeted, falling back to delimbing (revving) when the cut cannot start, or delimbing when no tree is targeted.
---@param _ any
---@param inputValue any
function HandToolChainsaw:onCutAction(_, inputValue) end

--- Stores the cut state and vertical flag, flags a network update on the server or the owning player, and tells the carrying player whether a cut is in progress.
---@param cutState any
---@param isVerticalCut any
function HandToolChainsaw:setCurrentCutState(cutState, isVerticalCut) end

--- Returns true only if a player carries the tool, has the CUT_TREES farm permission and the split shape manager allows cutting that shape at the position.
---@param treeNode any
---@param cutX any
---@param cutZ any
function HandToolChainsaw:testIfCutAllowed(treeNode, cutX, cutZ) end

--- Returns true if the cut is not too low (`testIfTooLow`) and the plane bounds are below the maximum cut diameter on both axes.
---@param treeNode any
---@param cutX any
---@param cutZ any
---@param minY any
---@param maxY any
---@param minZ any
---@param maxZ any
function HandToolChainsaw:testIfCutValid(treeNode, cutX, cutZ, minY, maxY, minZ, maxZ) end

--- Checks the four corners of the cut bounds. For a still rooted (static) tree each must be above a roots height threshold and a ground distance threshold; felled trees always pass. Returns false for missing tree or bounds; draws debug when enabled.
---@param treeNode integer
---@param minY number
---@param maxY number
---@param minZ number
---@param maxZ number
---@return boolean
function HandToolChainsaw:testIfTooLow(treeNode, minY, maxY, minZ, maxZ) end

--- Returns a 0..1 factor from the current RPM, remapped between 0.3 and 1 of the RPM range.
function HandToolChainsaw:getChainSpeedFactor() end

--- Owner only: enters the DELIMBING state, resets load, targets max RPM and hides the action text.
function HandToolChainsaw:beginDelimbing() end

--- Returns to IDLE, ends the effect timer, resets load and sets target RPM to idle.
function HandToolChainsaw:stopDelimbing() end

--- Owner only. Checks a possible tree and permission (else shows a warning), enters CUTTING, computes the cut duration from the oval section area plus spin-up, sets start/end positions, links the tool to the cut guide and locks player input.
function HandToolChainsaw:beginCutting() end

--- Owner only. Returns to IDLE, resets load and RPM, unlocks input and relinks the tool. If `sliceTree` is true, slices the shape: directly on the server, or by sending a ChainsawCutEvent from a client.
---@param sliceTree any
function HandToolChainsaw:stopCutting(sliceTree) end

--- Per-frame cutting step: animates the tool, targets max RPM, advances cut time, aborts if the player's look point is too far from the cut, and slices the tree when the target time is reached.
---@param dt any
function HandToolChainsaw:updateCutting(dt) end

--- Moves the cut guide node. During spin-up it approaches the cut start at zero load; afterwards it follows the cut line with a bezier-smoothed progress, derives the load from smoothed versus linear speed and keeps the effects alive.
---@param dt any
function HandToolChainsaw:updateCuttingAnimation(dt) end

--- Orients the camera rotation node (camera-based while delimbing, yaw-only otherwise), applies the roll, then recomputes the cut bounds with `testSplitShape` for the current or targeted tree.
function HandToolChainsaw:updateSplitPlane() end

--- Shows or hides the ring indicator, colours it valid or invalid, scales it to the trunk section and centres it on the cut bounds.
---@param targetedTree any
---@param isCutPossible any
---@param cutMinimumY any
---@param cutMaximumY any
---@param cutMinimumZ any
---@param cutMaximumZ any
function HandToolChainsaw:updateRingSelector(targetedTree, isCutPossible, cutMinimumY, cutMaximumY, cutMinimumZ, cutMaximumZ) end

--- Returns the split plane position, its down and left directions, and the plane width and depth (maximum cut diameter plus an offset constant).
function HandToolChainsaw:calculateCutPlane() end
