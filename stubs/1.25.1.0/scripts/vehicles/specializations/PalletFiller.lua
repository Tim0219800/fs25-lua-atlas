---@meta
-- FS25 1.25.1.0 : vehicles/specializations/PalletFiller.lua (generated stub, FS25 Lua Atlas)

--- Always returns true: no other specialization is required.
---@param specializations table
---@return boolean
function PalletFiller.prerequisitesPresent(specializations) end

--- Registers the XML paths under vehicle.palletFiller (pickup trigger, pallet file and spacing, pallet row with limits and fill steps, deflector and platform animations, folding limits, sounds, animation nodes) and the savegame state and slot entries.
function PalletFiller.initSpecialization() end

--- Registers the pallet load, unload, buy, state, deflector, fill step and movement direction functions on the vehicle type.
---@param vehicleType any
function PalletFiller.registerFunctions(vehicleType) end

--- Overrides discharge toggles, removeFromPhysics, fold permission, fill level information, mounted object test, AI continue check and combine verification.
---@param vehicleType any
function PalletFiller.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, load-finished, delete, stream read/write, update, update tick, animation finish, fold time and action event registration events.
---@param vehicleType any
function PalletFiller.registerEventListeners(vehicleType) end

--- Reads the XML: pickup trigger (accepts vehicles whose config file matches the pallet), pallet store item, pallet row with slots (one joint node each), fill steps, limits, animations, sounds. Drops update listeners that the current role does not need.
---@param savegame any
function PalletFiller:onLoad(savegame) end

--- Overrides the combine loading delay slots when a loadingDelay is set, resets the platform animation, then restores state, deflector and pallet slot assignments from the savegame (pallets are re-attached later by unique id) or applies the initial state.
---@param savegame any
function PalletFiller:onLoadFinished(savegame) end

--- Saves the state, the deflector state and, per occupied slot, the slot index, the pallet's unique id and the joint node translation and rotation.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PalletFiller:saveToXMLFile(xmlFile, key, usedModNames) end

--- Removes the pickup trigger and delete listeners, deletes samples and unloads every pallet from its slot.
function PalletFiller:onDelete() end

--- Client on join: reads the state, the deflector state and the pallet object in each slot.
---@param streamId integer
---@param connection Connection
function PalletFiller:onReadStream(streamId, connection) end

--- Server on join: writes the state, the deflector state and the pallet object of each slot.
---@param streamId integer
---@param connection Connection
function PalletFiller:onWriteStream(streamId, connection) end

--- Client only: reads the moving flag and the pallet objects of each slot (resolving them later if not yet synchronized), starts or stops animation and sound, and refreshes deflector and action texts.
---@param streamId integer
---@param timestamp integer
---@param connection table
function PalletFiller:onReadUpdateStream(streamId, timestamp, connection) end

--- Server only: when the dirty flag is set, writes the moving flag and the pallet object of each slot.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function PalletFiller:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Server only: attaches savegame pallets, picks up one pallet at a time from the trigger in LOADING state, picks the current fill step and discharge node, then interpolates or moves each pallet joint, unloads pallets in UNLOADING state, auto-returns to IDLE and sets the moving flag.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function PalletFiller:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- For the active player with the tool turned on and idle, shows a blinking warning if no pallet has free capacity. On clients it also resolves pallet object ids that were not yet synchronized.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function PalletFiller:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- When the platform animation ends, refreshes the fill deflector state.
---@param name any
function PalletFiller:onFinishAnimation(name) end

--- Refreshes the action event texts when the fold time changes.
---@param name any
function PalletFiller:onFoldTimeChanged(name) end

--- Takes a pallet vehicle into a free slot (or the slot saved in the data table): creates a physics joint with start limits, sets the mount type to dynamic, and starts the pickup interpolation unless restoring from a savegame. Returns true if a slot was used. Note: the rotation test applies the normalized x value to a pi/2 comparison, which looks suspicious.
---@param object any
---@param data any
function PalletFiller:loadPalletFillerPallet(object, data) end

--- Frees the slot holding the given pallet, removes its joint, sets the pallet mount type back to NONE, then flags the update and refreshes action texts.
---@param object any
function PalletFiller:unloadPalletFillerPallet(object) end

--- Server: spawns a new pallet at each empty slot through VehicleLoadingData. Client: marks the slots as pending and sends PalletFillerBuyPalletEvent unless noEventSend is true.
---@param noEventSend any
function PalletFiller:buyPalletFillerPallets(noEventSend) end

--- Loading callback for a bought pallet: re-adds it to physics, loads it into its slot, and on success charges the store price to the owner farm (PURCHASE_PALLETS); otherwise deletes the vehicle.
---@param self any
---@param vehicles any
---@param vehicleLoadState any
---@param arguments any
function PalletFiller.onCreatePalletFinished(self, vehicles, vehicleLoadState, arguments) end

--- Checks whether the requested state change is allowed (slots free or occupied, lowered when required, fold time within limits, no unload in progress). Returns false, with a warning text when relevant.
---@param newState any
function PalletFiller:getCanChangePalletFillerState(newState) end

--- Returns true if the fold time is within limits; otherwise false with an unfold-the-tool warning.
function PalletFiller:getCanBuyPalletFillerPallets() end

--- Sets the state and plays the platform animation toward the matching time (0 loading, 1 unloading, middle time idle). Refreshes action texts and sends PalletFillerStateEvent unless noEventSend is true.
---@param state any
---@param updateAnimations any
---@param noEventSend any
function PalletFiller:setPalletFillerState(state, updateAnimations, noEventSend) end

--- Static helper: turns the deflector on while the platform is off its middle position or pallets are moving, and applies the change when needed.
---@param self any
function PalletFiller.updatePalletFillerDeflectorState(self) end

--- Stores the deflector state and plays its animation forward or backward; optionally jumps the animation to the end at once.
---@param state any
---@param updateAnimations any
function PalletFiller:setPalletFillerDeflectorState(state, updateAnimations) end

--- Returns the fill step for the first slot whose pallet still has free capacity; otherwise the first empty slot's step, otherwise the first step.
function PalletFiller:getPalletFillerFillStep() end

--- Returns 1 while LOADING, -1 while UNLOADING and 0 otherwise.
function PalletFiller:getPalletFillerMovementDirection() end

--- Always false: discharge to object cannot be toggled on this tool.
---@param superFunc any
function PalletFiller:getCanToggleDischargeToObject(superFunc) end

--- Always false: discharge to ground cannot be toggled on this tool.
---@param superFunc any
function PalletFiller:getCanToggleDischargeToGround(superFunc) end

--- Unloads all pallets from their slots before the parent removes the vehicle from physics.
---@param superFunc any
function PalletFiller:removeFromPhysics(superFunc) end

--- Forbids folding unless the state is IDLE and every slot is empty with no pallet pending, returning a warning text; otherwise defers to the parent.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function PalletFiller:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Calls the parent, then adds one HUD entry summing fill level and capacity of all pallets in the slots, with the last known fill type.
---@param superFunc any
---@param display any
function PalletFiller:getFillLevelInformation(superFunc, display) end

--- Returns true if the parent finds the object, or if it is one of the slot pallets or mounted on one of them.
---@param superFunc table
---@param object table
---@return boolean
function PalletFiller:getHasObjectMounted(superFunc, object) end

--- If the loaded pallets have no free capacity, stops the AI with a pallets-full message, or a no-pallets-loaded message when none are loaded; otherwise defers to the parent.
---@param superFunc any
---@param isTurning any
function PalletFiller:getCanAIImplementContinueWork(superFunc, isTurning) end

--- Rejects the output fill type if a loaded pallet does not accept it (returning the pallet's fill type), returns nil when no free capacity remains, otherwise defers to the parent.
---@param superFunc any
---@param fruitType any
---@param outputFillType any
function PalletFiller:verifyCombine(superFunc, fruitType, outputFillType, ...) end

--- Client: registers the load platform, unload platform and buy pallets action events (the latter only if a pallet store item exists) and refreshes their texts.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function PalletFiller:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Static helper: sets text and visibility of the load, unload and buy actions according to the state, allowed transitions and number of empty slots.
---@param self any
function PalletFiller.updateActionEventTexts(self) end

--- Input callback: toggles between IDLE and LOADING if allowed, otherwise shows the warning in a blinking message.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function PalletFiller.actionEventLowerPlatformLoad(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: toggles between IDLE and UNLOADING if allowed, otherwise shows the warning in a blinking message.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function PalletFiller.actionEventLowerPlatformUnload(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: if buying is allowed, shows a yes/no dialog with the number of empty slots and the total price, and buys the pallets on confirmation; otherwise shows the warning.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function PalletFiller.actionEventBuyPallets(self, actionName, inputValue, callbackState, isAnalog) end

--- Delete listener: removes the deleted object from the pickup trigger's tracked objects, keyed by root node.
---@param self any
---@param object any
function PalletFiller.onObjectDeleted(self, object) end
