---@meta
-- FS25 1.25.1.0 : vehicles/specializations/InlineWrapper.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization for inline bale wrappers, which wrap a continuous line of bales (requires Foldable and Consumable for the wrap rolls). A bale trigger collects bales to push into the line, a wrap trigger tracks bales being wrapped, and the server builds InlineBale objects from them (InlineBale, InlineBaleSingle and Bale classes are not in this file). It animates pusher, wrapping and push-off animations, wrapping nodes that follow the bale surface, adjustable railings and steering nodes, releases the brake while pushing, consumes wrap per minute, and syncs bale lists to clients. A player can push the line off through input or an activatable. Also registers two store spec values for bale sizes (round and square), and contains the helper class InlineWrapperActivatable.
---@class InlineWrapper
InlineWrapper = {}

--- Vehicle specialization for inline bale wrappers, which wrap a continuous line of bales (requires Foldable and Consumable for the wrap rolls). A bale trigger collects bales to push into the line, a wrap trigger tracks bales being wrapped, and the server builds InlineBale objects from them (InlineBale, InlineBaleSingle and Bale classes are not in this file). It animates pusher, wrapping and push-off animations, wrapping nodes that follow the bale surface, adjustable railings and steering nodes, releases the brake while pushing, consumes wrap per minute, and syncs bale lists to clients. A player can push the line off through input or an activatable. Also registers two store spec values for bale sizes (round and square), and contains the helper class InlineWrapperActivatable.
---@class InlineWrapperActivatable
InlineWrapperActivatable = {}

--- Returns true only if the vehicle type has both Foldable and Consumable.
---@param specializations table
---@return boolean
function InlineWrapper.prerequisitesPresent(specializations) end

--- Registers the two shop spec types for round and square bale sizes, and the XML schema under vehicle.inlineWrapper: triggers, bale types (start node, wrap usage, railing, inline bale file, size), railings, wrapping and steering nodes, animations, pushing brake settings, move threshold, numObjectBits and sounds.
function InlineWrapper.initSpecialization() end

--- Registers the vehicle functions of the specialization: bale stream read and write, triggers callbacks, wrapping node updates, bale type lookup, railings, steering, push-off and current inline bale accessors.
---@param vehicleType any
function InlineWrapper.registerFunctions(vehicleType) end

--- Overrides getIsFoldAllowed, getIsActive, getBrakeForce and getShowConsumableEmptyWarning.
---@param vehicleType any
function InlineWrapper.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, delete, stream read and write, update, draw, action event, enter and leave vehicle and consumable variation events.
---@param vehicleType any
function InlineWrapper.registerEventListeners(vehicleType) end

--- Loads triggers, bale types (validated: a start node and inline bale file are required, size decides round or square), railings, wrapping and steering nodes, animation names, push and brake settings and dirty flags. Creates the activatable and, on clients, the wrap, start and stop sounds.
---@param savegame table
function InlineWrapper:onLoad(savegame) end

--- Sets the railings animation to its end time so the railings start fully open.
---@param savegame table
function InlineWrapper:onPostLoad(savegame) end

--- Removes both triggers, deletes sounds and the activatable, and releases the current inline bale (wakes it, resets wrapping state and wrapper link).
function InlineWrapper:onDelete() end

--- Client side initial sync: reads the three bale lists, the current inline bale and the incompatible-bale warning flag, then registers the activatable.
---@param streamId any
---@param connection any
function InlineWrapper:onReadStream(streamId, connection) end

--- Server side initial sync: writes the three bale lists, the current inline bale (if any) and the warning flag.
---@param streamId any
---@param connection any
function InlineWrapper:onWriteStream(streamId, connection) end

--- Client side: when the dirty flag is set in the stream, reads the bale lists and current inline bale and registers the activatable. Always reads the incompatible-bale warning flag.
---@param streamId any
---@param timestamp any
---@param connection any
function InlineWrapper:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: when the bales dirty flag is raised, writes the bale lists and the current inline bale. Always writes the warning flag.
---@param streamId any
---@param connection any
---@param dirtyMask any
function InlineWrapper:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Reads a named list of bale object ids from the stream (count stored in numObjectBits bits) and replaces the list in the specialization.
---@param name any
---@param streamId any
---@param connection any
function InlineWrapper:readInlineBales(name, streamId, connection) end

--- Writes a named list of bale ids with its count in numObjectBits bits, warning if the list is longer than the bits allow (raise numObjectBits).
---@param name any
---@param streamId any
---@param connection any
function InlineWrapper:writeInlineBales(name, streamId, connection) end

--- While the wrapping animation plays, updates the wrapping nodes each frame.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function InlineWrapper:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Main logic. Server: turns pending bales into inline bales (counts wrapped bales for stats and achievement), manages the pusher animation, brake release and the incompatible-bale flag. All sides: tracks the line steering direction, starts or stops the wrapping animation and sounds once a bale moved recently, consumes wrap on the server, moves railings, resets the push-off arm and toggles the push-off input.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function InlineWrapper:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client only: shows blinking warnings when bales wait while the machine is not unfolded in the allowed range, and when an incompatible bale is present.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function InlineWrapper:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- For each wrapping node, finds the nearest bale being wrapped (skipping the pending one) and moves the node's target to the point on that bale's surface computed by the round or square helper, or back to its start translation. Resets the nodes once no inline bale remains.
function InlineWrapper:updateWrappingNodes() end

--- Computes, for a round bale, the world position on its circular cross-section (32 samples, slightly inside the radius) that the wrapping node should aim at. Returns nil values if none qualifies.
---@param bale any
---@param wrappingNode any
---@param x any
---@param y any
---@param z any
function InlineWrapper:updateRoundBaleWrappingNode(bale, wrappingNode, x, y, z) end

--- Computes, for a square bale, the corner of its cross-section (cached as wrappingEdges) that the wrapping node should aim at, choosing the smallest angle among corners not hidden by the bale. Returns nil values if none qualifies.
---@param bale any
---@param wrappingNode any
---@param x any
---@param y any
---@param z any
function InlineWrapper:updateSquareBaleWrappingNode(bale, wrappingNode, x, y, z) end

--- Client only: when active for input, binds ACTIVATE_OBJECT to the push-off handler with the unload text, enabled according to getCanPushOff.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function InlineWrapper:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Refuses folding while bales are inside the inline bale trigger, otherwise defers to the parent.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function InlineWrapper:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Returns true while the brake is being released (or its set state is out of date) so the vehicle keeps updating, otherwise the parent value.
---@param superFunc any
function InlineWrapper:getIsActive(superFunc) end

--- Returns 0 and records the state while pushing requires the brake to be released, otherwise the parent brake force.
---@param superFunc any
function InlineWrapper:getBrakeForce(superFunc) end

--- For the wrap consumable type, shows the empty warning only when bales are pending and the fold time check passes. Note: the check uses `or` between the min and max comparisons, so it is always true.
---@param superFunc any
---@param typeName any
function InlineWrapper:getShowConsumableEmptyWarning(superFunc, typeName) end

--- Returns true when the machine is unfolded within the allowed range, the pusher and push-off animations are idle at start, and wrap consumable is available.
function InlineWrapper:getIsInlineBalingAllowed() end

--- Server only trigger callback for the bale pickup trigger. Tracks entering bales as pending (supported type), incompatible, or already inline; on leaving, removes them and detaches the inline bale from the wrapper once none of its bales remain. Raises the bale dirty flag.
---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function InlineWrapper:inlineBaleTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Server only trigger callback for the wrap trigger: adds or removes bales in the list of bales to wrap, keeps the vehicle active and raises the bale dirty flag.
---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function InlineWrapper:inlineWrapTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Returns the configured bale type matching a bale (supports wrapping, same diameter and width for round, same width, height and length for square), or nil if none matches.
---@param bale any
function InlineWrapper:getWrapperBaleType(bale) end

--- Returns false if the bale is held by a dynamic mount joint, true otherwise.
---@param bale any
function InlineWrapper:getAllowBalePushing(bale) end

--- Moves the current railing width toward the target at a fixed rate per millisecond and sets the railings animation time accordingly.
---@param targetPosition any
---@param dt any
function InlineWrapper:updateWrapperRailings(targetPosition, dt) end

--- Aligns each steering node toward the given world direction (x, z), or restores its start rotation when no direction is given. Flags moving tools as dirty when available.
---@param dirX any
---@param dirZ any
function InlineWrapper:updateInlineSteeringWheels(dirX, dirZ) end

--- Resets the steering amount (rotatedTime) to 0 when the player leaves the vehicle.
function InlineWrapper:onLeaveVehicle() end

--- Restores the start rotation of all steering nodes when the player enters the vehicle.
function InlineWrapper:onEnterVehicle() end

--- When the selected wrap variation carries a color, stores it as the wrap color used for new bales.
---@param variationIndex any
---@param metaData any
function InlineWrapper:onConsumableVariationChanged(variationIndex, metaData) end

--- Returns true if the local player is on foot, has access to the vehicle and stands within the interaction radius of its first component. The radius constant is defined outside this file (UNVERIFIED).
function InlineWrapper:getCanInteract() end

--- Returns true when an inline bale exists with no pending bale and neither the pusher nor the push-off animation is playing.
function InlineWrapper:getCanPushOff() end

--- Stores the current inline bale: on the server as a network id (raising the dirty flag on change), on clients as the object itself when isClient is true.
---@param inlineBale any
---@param isClient any
function InlineWrapper:setCurrentInlineBale(inlineBale, isClient) end

--- Returns the current inline bale object resolved from the stored network id, or nil.
function InlineWrapper:getCurrentInlineBale() end

--- Input callback: on press, the server pushes the bale line off directly, a client sends an InlineWrapperPushOffEvent to the server.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function InlineWrapper.pushOffInlineBaleEvent(self, actionName, inputValue, callbackState, isAnalog) end

--- Starts the push-off animation forward if it is not already playing and marks the push-off as started so the arm is reset afterwards.
function InlineWrapper:pushOffInlineBale() end

--- Reads from a vehicle XML the min and max bale diameter (round wrappers) or length (square wrappers) over all baleType entries. Returns a table of those values, or nil if none.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
---@param roundBaleWrapper any
function InlineWrapper.loadSpecValueBaleSize(xmlFile, customEnvironment, baseDir, roundBaleWrapper) end

--- Shop display helper: returns the bale size as text in cm (a range when min differs from max), or as numbers with unit when returnValues is set, or empty values when absent.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
---@param roundBaleWrapper any
function InlineWrapper.getSpecValueBaleSize(storeItem, realItem, configurations, saleItem, returnValues, returnRange, roundBaleWrapper) end

--- Store spec loader for round bale sizes: calls loadSpecValueBaleSize with the round flag.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function InlineWrapper.loadSpecValueBaleSizeRound(xmlFile, customEnvironment, baseDir) end

--- Store spec loader for square bale sizes: calls loadSpecValueBaleSize without the round flag.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function InlineWrapper.loadSpecValueBaleSizeSquare(xmlFile, customEnvironment, baseDir) end

--- Store spec getter for round bale sizes; returns nil if the store item has no such spec, otherwise the shared formatting result.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function InlineWrapper.getSpecValueBaleSizeRound(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Store spec getter for square bale sizes; returns nil if the store item has no such spec, otherwise the shared formatting result.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function InlineWrapper.getSpecValueBaleSizeSquare(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Creates the activatable object linked to an inline wrapper, with the unload text for the activation prompt.
---@param inlineWrapper any
function InlineWrapperActivatable.new(inlineWrapper) end

--- Returns true when the player can interact with the wrapper and the bale line can currently be pushed off.
function InlineWrapperActivatable:getIsActivatable() end

--- Executes the activation: the server pushes the bale line off, a client sends an InlineWrapperPushOffEvent to the server.
function InlineWrapperActivatable:run() end
