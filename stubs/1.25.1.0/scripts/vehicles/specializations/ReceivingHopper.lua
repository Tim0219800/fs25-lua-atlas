---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ReceivingHopper.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization for receiving hoppers that take tipped goods (such as potatoes) and optionally spawn boxes (pallet-like vehicles) to fill. Requires FillUnit and Dischargeable. Box spawning runs on the server only, can be toggled by the player with an action event, is synchronised through ReceivingHopperSetCreateBoxesEvent and saved as createBoxes in the savegame. XML under vehicle.receivingHopper: fill unit index, spawn place node and one box file per fill type.
---@class ReceivingHopper
ReceivingHopper = {}

--- Returns true only if the vehicle type has both the FillUnit and Dischargeable specializations.
---@param specializations table
---@return boolean
function ReceivingHopper.prerequisitesPresent(specializations) end

--- Registers the XML schema entries (fill unit index, box spawn place node, box fill type and filename) and the savegame key for createBoxes.
function ReceivingHopper.initSpecialization() end

--- Registers setCreateBoxes, getCanSpawnNextBox, collisionTestCallback, createBox and onCreateBoxFinished on the vehicle type.
---@param vehicleType any
function ReceivingHopper.registerFunctions(vehicleType) end

--- Overrides handleDischargeRaycast and getCanBeSelected on the vehicle type.
---@param vehicleType any
function ReceivingHopper.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onUpdateTick, onRegisterActionEvents and onFillUnitFillLevelChanged.
---@param vehicleType any
function ReceivingHopper.registerEventListeners(vehicleType) end

--- Warns about deprecated XML keys, reads the fill unit index, spawn place and the fill type to box file map, and restores createBoxes from the savegame. Removes the onUpdateTick listener when not on the server.
---@param savegame table
function ReceivingHopper:onLoad(savegame) end

--- Writes the createBoxes flag into the vehicle savegame XML.
---@param xmlFile any
---@param key any
---@param usedModNames any
function ReceivingHopper:saveToXMLFile(xmlFile, key, usedModNames) end

--- Server tick. When box creation is on and the discharge state is off, creates a new box if getCanSpawnNextBox allows it.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function ReceivingHopper:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Changes the box creation flag. If the value differs it sends ReceivingHopperSetCreateBoxesEvent (unless noEventSend), refreshes the action text and forgets the last box.
---@param state boolean
---@param noEventSend boolean
function ReceivingHopper:setCreateBoxes(state, noEventSend) end

--- Returns true if no box is being created, the current fill type has a box file, the previous box is full and an overlap box test at the spawn place finds no other object or player.
function ReceivingHopper:getCanSpawnNextBox() end

--- Overlap callback: flags the spawn place as occupied when the hit node belongs to a registered object or player other than this vehicle.
---@param transformId any
function ReceivingHopper:collisionTestCallback(transformId) end

--- Server only. Loads the box vehicle for the current fill type at the spawn place with VehicleLoadingData, owned by the hopper's farm, and calls onCreateBoxFinished when done.
function ReceivingHopper:createBox() end

--- Loading callback: clears the creating flag and, on success, stores the first loaded vehicle as the last box.
---@param vehicles any
---@param vehicleLoadState any
---@param arguments any
function ReceivingHopper:onCreateBoxFinished(vehicles, vehicleLoadState, arguments) end

--- Overridden discharge raycast handler. Sets the discharge state to OBJECT while the hit object accepts the fill type and has free capacity, and back to OFF when not. The parent function is not called.
---@param superFunc any
---@param dischargeNode any
---@param hitObject any
---@param hitShape any
---@param hitDistance any
---@param hitFillUnitIndex any
---@param hitTerrain any
function ReceivingHopper:handleDischargeRaycast(superFunc, dischargeNode, hitObject, hitShape, hitDistance, hitFillUnitIndex, hitTerrain) end

--- Overridden to always return true, so the hopper can be selected by the player.
---@param superFunc any
function ReceivingHopper:getCanBeSelected(superFunc) end

--- On clients, rebuilds the action events and, when active for input, registers IMPLEMENT_EXTRA to toggle box creation, then updates its text.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function ReceivingHopper:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Keeps the vehicle awake (raiseActive) whenever the changed fill unit still holds some fill.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function ReceivingHopper:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

--- Input callback that flips the box creation flag through setCreateBoxes.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function ReceivingHopper.actionEventToggleBoxCreation(self, actionName, inputValue, callbackState, isAnalog) end

--- Sets the action text to the enable or disable pallet spawning label according to the current createBoxes state.
---@param self any
function ReceivingHopper.updateActionEvents(self) end
