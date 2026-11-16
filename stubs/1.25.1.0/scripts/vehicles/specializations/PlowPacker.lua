---@meta
-- FS25 1.25.1.0 : vehicles/specializations/PlowPacker.lua (generated stub, FS25 Lua Atlas)

--- Specialization for plows fitted with a packer that can be switched off. It requires the Plow, Cultivator and AnimatedVehicle specializations, reads vehicle.plow.packer from the XML and saves the packer state in the savegame. When the packer is on, the plow works as a cultivator-style packer (via FSDensityMapUtil) and AI ground requirements change. The packer is forced on before turning or folding; state changes are synchronised through PlowPackerStateEvent. The constants CULTIVATED_GROUND_TYPES and CLIENT_DM_UPDATE_RADIUS are used but not defined in the dump (UNVERIFIED).
---@class PlowPacker
PlowPacker = {}

--- Registers the XML keys under vehicle.plow.packer (inputAction, deactivateLeft/Right animations, animationSpeed, foldingConfig, partialDeactivated, lowerAnimation) and the savegame keys packerState and lastPackerState.
function PlowPacker.initSpecialization() end

--- Returns true only if the vehicle type has the Plow, Cultivator and AnimatedVehicle specializations.
---@param specializations any
function PlowPacker.prerequisitesPresent(specializations) end

--- Adds setPackerState and getIsPackerAllowed to the vehicle type.
---@param vehicleType any
function PlowPacker.registerFunctions(vehicleType) end

--- Overrides setRotationMax, setPlowAIRequirements, setFoldState, processCultivatorArea and getUseCultivatorAIRequirements.
---@param vehicleType any
function PlowPacker.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onReadStream, onWriteStream, onUpdate, onUpdateTick, onRegisterActionEvents and onSetLowered.
---@param vehicleType any
function PlowPacker.registerEventListeners(vehicleType) end

--- Reads the packer XML settings. The packer counts as available only if the folding configuration matches and both deactivate animations exist. Starts with the packer active and loads the toggle texts.
---@param savegame any
function PlowPacker:onLoad(savegame) end

--- Recomputes the AI requirements, then restores packerState and lastPackerState from the savegame unless vehicles are being reset. Applies the restored animation state immediately.
---@param savegame any
function PlowPacker:onPostLoad(savegame) end

--- Writes packerState, and lastPackerState when set, to the savegame, only if the packer is available.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlowPacker:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side on join: reads the packer state bool and applies it with animation, if the packer is currently allowed.
---@param streamId integer
---@param connection Connection
function PlowPacker:onReadStream(streamId, connection) end

--- Server side on join: writes the current packer state bool to the stream when the packer is available.
---@param streamId integer
---@param connection Connection
function PlowPacker:onWriteStream(streamId, connection) end

--- Server only. Restores the packer to off after a turn if it was off before, runs a fold change postponed until the packer animations end, and replays the lowering animation if it is out of step.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function PlowPacker:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client only. Refreshes the text of the packer action event each tick when the packer is available.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function PlowPacker:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Server: if the plow rotation target changes, remembers the packer state in lastPackerState and forces the packer on before calling the parent function.
---@param superFunc any
---@param rotationMax any
---@param noEventSend any
---@param turnAnimationTime any
function PlowPacker:setRotationMax(superFunc, rotationMax, noEventSend, turnAnimationTime) end

--- When the packer is on or partly deactivated, calls the parent with PlowPacker.CULTIVATED_GROUND_TYPES (not defined in the dump, UNVERIFIED) as excluded ground types; otherwise passes the given list.
---@param superFunc any
---@param excludedGroundTypes any
function PlowPacker:setPlowAIRequirements(superFunc, excludedGroundTypes) end

--- When folding in a non-turn direction with the packer off, the server turns the packer on and postpones the real fold until its animations end. The fold direction event is still sent to others. Otherwise calls the parent.
---@param superFunc any
---@param direction any
---@param moveToMiddle any
---@param noEventSend any
function PlowPacker:setFoldState(superFunc, direction, moveToMiddle, noEventSend) end

--- Replaces the cultivator work-area processing: erases tire tracks, then calls FSDensityMapUtil.updatePlowPackerArea and accumulates changed, stat and total areas. Remote clients far from the vehicle skip the update. Returns real area and area.
---@param superFunc any
---@param workArea any
---@param dt any
function PlowPacker:processCultivatorArea(superFunc, workArea, dt) end

--- Always returns false, so the AI never applies cultivator requirements to this plow.
---@param superFunc any
---@return boolean
function PlowPacker:getUseCultivatorAIRequirements(superFunc) end

--- Sets or toggles (nil) the packer state. Optionally plays the left or right deactivate animation depending on plow rotation, schedules a lowering resync, updates AI requirements and sends PlowPackerStateEvent.
---@param newState any
---@param updateAnimations any
---@param noEventSend any
function PlowPacker:setPackerState(newState, updateAnimations, noEventSend) end

--- Returns false while the turn animation plays, when the fold animation is not at its turn-on position, when a fold change is pending, or when no packer is available; true otherwise.
function PlowPacker:getIsPackerAllowed() end

--- If the packer is allowed and on, plays the packer lowering animation forward or in reverse to follow the lowered state.
---@param lowered any
function PlowPacker:onSetLowered(lowered) end

--- Client only. Clears and registers the packer toggle action event (powered, default input IMPLEMENT_EXTRA4) when the vehicle is active for input and a packer exists.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function PlowPacker:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Sets the action text to activate or deactivate depending on the packer state, and enables the action only while getIsPackerAllowed returns true.
---@param self any
function PlowPacker.updateActionEventText(self) end

--- Input callback that toggles the packer by calling setPackerState with no argument.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function PlowPacker.actionEventPackerDeactivate(self, actionName, inputValue, callbackState, isAnalog, isMouse) end
