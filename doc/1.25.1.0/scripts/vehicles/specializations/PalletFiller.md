# vehicles/specializations/PalletFiller.lua

*[Version française](../../../fr/scripts/vehicles/specializations/PalletFiller.md)*

Source: `dataS/scripts/vehicles/specializations/PalletFiller.lua` — FS25 1.25.1.0

✍ Specialization for tools that carry pallets while a harvester or machine fills them (pallet fillers on a platform). It has no prerequisites. The server holds pallets on physics joints in slots along a row node, moves them by fill step, loads from a pickup trigger, unloads, and can buy new pallets through VehicleLoadingData; the state is IDLE, LOADING or UNLOADING (PalletFillerState, not in this dump). The client handles animations, sound, action events and a warning when the pallets are full. The class table itself is declared outside the visible lines of this dump.


## Functions

| Function | Line | Description |
|---|---|---|
| `PalletFiller.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ Always returns true: no other specialization is required. |
| `PalletFiller.initSpecialization()` | 28 | ✍ Registers the XML paths under vehicle.palletFiller (pickup trigger, pallet file and spacing, pallet row with limits and fill steps, deflector and platform animations, folding limits, sounds, animation nodes) and the savegame state and slot entries. |
| `PalletFiller.registerFunctions(vehicleType: any)` | 90 | ✍ Registers the pallet load, unload, buy, state, deflector, fill step and movement direction functions on the vehicle type. |
| `PalletFiller.registerOverwrittenFunctions(vehicleType: any)` | 104 | ✍ Overrides discharge toggles, removeFromPhysics, fold permission, fill level information, mounted object test, AI continue check and combine verification. |
| `PalletFiller.registerEventListeners(vehicleType: any)` | 117 | ✍ Subscribes to load, load-finished, delete, stream read/write, update, update tick, animation finish, fold time and action event registration events. |
| `PalletFiller:onLoad(savegame: any)` | 134 | ✍ Reads the XML: pickup trigger (accepts vehicles whose config file matches the pallet), pallet store item, pallet row with slots (one joint node each), fill steps, limits, animations, sounds. Drops update listeners that the current role does not need. |
| `PalletFiller:onLoadFinished(savegame: any)` | 280 | ✍ Overrides the combine loading delay slots when a loadingDelay is set, resets the platform animation, then restores state, deflector and pallet slot assignments from the savegame (pallets are re-attached later by unique id) or applies the initial state. |
| `PalletFiller:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 332 | ✍ Saves the state, the deflector state and, per occupied slot, the slot index, the pallet's unique id and the joint node translation and rotation. |
| `PalletFiller:onDelete()` | 352 | ✍ Removes the pickup trigger and delete listeners, deletes samples and unloads every pallet from its slot. |
| `PalletFiller:onReadStream(streamId: integer, connection: Connection)` | 389 | ✍ Client on join: reads the state, the deflector state and the pallet object in each slot. |
| `PalletFiller:onWriteStream(streamId: integer, connection: Connection)` | 413 | ✍ Server on join: writes the state, the deflector state and the pallet object of each slot. |
| `PalletFiller:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 431 | ✍ Client only: reads the moving flag and the pallet objects of each slot (resolving them later if not yet synchronized), starts or stops animation and sound, and refreshes deflector and action texts. |
| `PalletFiller:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 472 | ✍ Server only: when the dirty flag is set, writes the moving flag and the pallet object of each slot. |
| `PalletFiller:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 492 | ✍ Server only: attaches savegame pallets, picks up one pallet at a time from the trigger in LOADING state, picks the current fill step and discharge node, then interpolates or moves each pallet joint, unloads pallets in UNLOADING state, auto-returns to IDLE and sets the moving flag. |
| `PalletFiller:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 679 | ✍ For the active player with the tool turned on and idle, shows a blinking warning if no pallet has free capacity. On clients it also resolves pallet object ids that were not yet synchronized. |
| `PalletFiller:onFinishAnimation(name: any)` | 717 | ✍ When the platform animation ends, refreshes the fill deflector state. |
| `PalletFiller:onFoldTimeChanged(name: any)` | 726 | ✍ Refreshes the action event texts when the fold time changes. |
| `PalletFiller:loadPalletFillerPallet(object: any, data: any)` | 732 | ✍ Takes a pallet vehicle into a free slot (or the slot saved in the data table): creates a physics joint with start limits, sets the mount type to dynamic, and starts the pickup interpolation unless restoring from a savegame. Returns true if a slot was used. Note: the rotation test applies the normalized x value to a pi/2 comparison, which looks suspicious. |
| `PalletFiller:unloadPalletFillerPallet(object: any)` | 802 | ✍ Frees the slot holding the given pallet, removes its joint, sets the pallet mount type back to NONE, then flags the update and refreshes action texts. |
| `PalletFiller:buyPalletFillerPallets(noEventSend: any)` | 827 | ✍ Server: spawns a new pallet at each empty slot through VehicleLoadingData. Client: marks the slots as pending and sends PalletFillerBuyPalletEvent unless noEventSend is true. |
| `PalletFiller.onCreatePalletFinished(self: any, vehicles: any, vehicleLoadState: any, arguments: any)` | 871 | ✍ Loading callback for a bought pallet: re-adds it to physics, loads it into its slot, and on success charges the store price to the owner farm (PURCHASE_PALLETS); otherwise deletes the vehicle. |
| `PalletFiller:getCanChangePalletFillerState(newState: any)` | 905 | ✍ Checks whether the requested state change is allowed (slots free or occupied, lowered when required, fold time within limits, no unload in progress). Returns false, with a warning text when relevant. |
| `PalletFiller:getCanBuyPalletFillerPallets()` | 959 | ✍ Returns true if the fold time is within limits; otherwise false with an unfold-the-tool warning. |
| `PalletFiller:setPalletFillerState(state: any, updateAnimations: any, noEventSend: any)` | 971 | ✍ Sets the state and plays the platform animation toward the matching time (0 loading, 1 unloading, middle time idle). Refreshes action texts and sends PalletFillerStateEvent unless noEventSend is true. |
| `PalletFiller.updatePalletFillerDeflectorState(self: any)` | 1000 | ✍ Static helper: turns the deflector on while the platform is off its middle position or pallets are moving, and applies the change when needed. |
| `PalletFiller:setPalletFillerDeflectorState(state: any, updateAnimations: any)` | 1016 | ✍ Stores the deflector state and plays its animation forward or backward; optionally jumps the animation to the end at once. |
| `PalletFiller:getPalletFillerFillStep()` | 1030 | ✍ Returns the fill step for the first slot whose pallet still has free capacity; otherwise the first empty slot's step, otherwise the first step. |
| `PalletFiller:getPalletFillerMovementDirection()` | 1057 | ✍ Returns 1 while LOADING, -1 while UNLOADING and 0 otherwise. |
| `PalletFiller:getCanToggleDischargeToObject(superFunc: any)` | 1070 | ✍ Always false: discharge to object cannot be toggled on this tool. |
| `PalletFiller:getCanToggleDischargeToGround(superFunc: any)` | 1076 | ✍ Always false: discharge to ground cannot be toggled on this tool. |
| `PalletFiller:removeFromPhysics(superFunc: any)` | 1082 | ✍ Unloads all pallets from their slots before the parent removes the vehicle from physics. |
| `PalletFiller:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1097 | ✍ Forbids folding unless the state is IDLE and every slot is empty with no pallet pending, returning a warning text; otherwise defers to the parent. |
| `PalletFiller:getFillLevelInformation(superFunc: any, display: any)` | 1116 | ✍ Calls the parent, then adds one HUD entry summing fill level and capacity of all pallets in the slots, with the last known fill type. |
| `PalletFiller:getHasObjectMounted(superFunc: table, object: table) → boolean` | 1142 | ✍ Returns true if the parent finds the object, or if it is one of the slot pallets or mounted on one of them. |
| `PalletFiller:getCanAIImplementContinueWork(superFunc: any, isTurning: any)` | 1167 | ✍ If the loaded pallets have no free capacity, stops the AI with a pallets-full message, or a no-pallets-loaded message when none are loaded; otherwise defers to the parent. |
| `PalletFiller:verifyCombine(superFunc: any, fruitType: any, outputFillType: any, ...: any)` | 1190 | ✍ Rejects the output fill type if a loaded pallet does not accept it (returning the pallet's fill type), returns nil when no free capacity remains, otherwise defers to the parent. |
| `PalletFiller:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1217 | ✍ Client: registers the load platform, unload platform and buy pallets action events (the latter only if a pallet store item exists) and refreshes their texts. |
| `PalletFiller.updateActionEventTexts(self: any)` | 1244 | ✍ Static helper: sets text and visibility of the load, unload and buy actions according to the state, allowed transitions and number of empty slots. |
| `PalletFiller.actionEventLowerPlatformLoad(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1307 | ✍ Input callback: toggles between IDLE and LOADING if allowed, otherwise shows the warning in a blinking message. |
| `PalletFiller.actionEventLowerPlatformUnload(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1321 | ✍ Input callback: toggles between IDLE and UNLOADING if allowed, otherwise shows the warning in a blinking message. |
| `PalletFiller.actionEventBuyPallets(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1335 | ✍ Input callback: if buying is allowed, shows a yes/no dialog with the number of empty slots and the total price, and buys the pallets on confirmation; otherwise shows the warning. |
| `PalletFiller.onObjectDeleted(self: any, object: any)` | 1361 | ✍ Delete listener: removes the deleted object from the pickup trigger's tracked objects, keyed by root node. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadPalletFillerPallet` | 91 |
| registerFunction | `unloadPalletFillerPallet` | 92 |
| registerFunction | `buyPalletFillerPallets` | 93 |
| registerFunction | `getCanChangePalletFillerState` | 94 |
| registerFunction | `getCanBuyPalletFillerPallets` | 95 |
| registerFunction | `setPalletFillerState` | 96 |
| registerFunction | `setPalletFillerDeflectorState` | 97 |
| registerFunction | `getPalletFillerFillStep` | 98 |
| registerFunction | `getPalletFillerMovementDirection` | 99 |
| registerOverwrittenFunction | `getCanToggleDischargeToObject` | 105 |
| registerOverwrittenFunction | `getCanToggleDischargeToGround` | 106 |
| registerOverwrittenFunction | `removeFromPhysics` | 107 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 108 |
| registerOverwrittenFunction | `getFillLevelInformation` | 109 |
| registerOverwrittenFunction | `getHasObjectMounted` | 110 |
| registerOverwrittenFunction | `getCanAIImplementContinueWork` | 111 |
| registerOverwrittenFunction | `verifyCombine` | 112 |
| registerEventListener | `onLoad` | 118 |
| registerEventListener | `onLoadFinished` | 119 |
| registerEventListener | `onDelete` | 120 |
| registerEventListener | `onReadStream` | 121 |
| registerEventListener | `onWriteStream` | 122 |
| registerEventListener | `onReadUpdateStream` | 123 |
| registerEventListener | `onWriteUpdateStream` | 124 |
| registerEventListener | `onUpdate` | 125 |
| registerEventListener | `onUpdateTick` | 126 |
| registerEventListener | `onFinishAnimation` | 127 |
| registerEventListener | `onFoldTimeChanged` | 128 |
| registerEventListener | `onRegisterActionEvents` | 129 |
