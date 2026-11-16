---@meta
-- FS25 1.25.1.0 : vehicles/specializations/MultipleItemPurchase.lua (generated stub, FS25 Lua Atlas)

--- Specialization of a temporary root vehicle used to buy several bales or vehicles at once. It requires FillUnit. It adds a multipleItemPurchaseAmount configuration, spawns the items at XML-defined positions while loading, and outside the shop configuration it deletes itself on the first server update, leaving the spawned items behind.
---@class MultipleItemPurchase
MultipleItemPurchase = {}

--- Registers the multipleItemPurchaseAmount configuration type and the XML paths under vehicle.multipleItemPurchase (item filename, isVehicle, bale fill type, wrapped flag, variation, offsets by amount, item positions and rotations).
function MultipleItemPurchase.initSpecialization() end

--- Returns true only if the vehicle type has the FillUnit specialization.
---@param specializations any
function MultipleItemPurchase.prerequisitesPresent(specializations) end

--- Adds loadItemAtPosition and onFinishLoadingVehicle as vehicle functions.
---@param vehicleType any
function MultipleItemPurchase.registerFunctions(vehicleType) end

--- Overrides getTotalMass, getFillUnitCapacity, setVisibility, addToPhysics and removeFromPhysics.
---@param vehicleType any
function MultipleItemPurchase.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, pre-load-finished, delete and update events.
---@param vehicleType any
function MultipleItemPurchase.registerEventListeners(vehicleType) end

--- Reads the item settings and builds the position list, applying the offset that matches the selected amount configuration. It removes vehicle and dynamic-object collision bits from the components, and drops the update listener on clients.
---@param savegame table
function MultipleItemPurchase:onLoad(savegame) end

--- Spawns one item per position, up to the number chosen in the amount configuration.
---@param savegame table
function MultipleItemPurchase:onPreLoadFinished(savegame) end

--- Server (or shop config) only: creates a bale from the config XML (fill type, farm, variation, optional wrapping and base colour; registered unless in shop config) or starts loading a vehicle with matching configurations. Items are kept out of physics.
---@param position any
function MultipleItemPurchase:loadItemAtPosition(position) end

--- Loading callback: if this vehicle is already being deleted, it deletes the loaded vehicles; otherwise it removes them from physics, hides them and stores them. It then completes the loading task.
---@param vehicles any
---@param vehicleLoadState any
---@param loadingTask any
function MultipleItemPurchase:onFinishLoadingVehicle(vehicles, vehicleLoadState, loadingTask) end

--- Deletes the loaded bales and vehicles only in the shop configuration, icon generator or vehicle debug-load cases; in normal purchases the items are kept.
function MultipleItemPurchase:onDelete() end

--- Server only: outside the shop configuration the vehicle deletes itself, which is what makes it a throwaway carrier.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function MultipleItemPurchase:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- In shop config returns the summed mass of the loaded bales and vehicles; otherwise 0. The parent is not called.
---@param superFunc any
---@param onlyGivenVehicle any
function MultipleItemPurchase:getTotalMass(superFunc, onlyGivenVehicle) end

--- In shop config returns the summed fill level of the loaded bales plus the first fill unit capacity of loaded vehicles; otherwise 0. The parent is not called.
---@param superFunc any
---@param fillUnitIndex any
function MultipleItemPurchase:getFillUnitCapacity(superFunc, fillUnitIndex) end

--- Forwards the visibility state to the loaded vehicles, then to the parent.
---@param superFunc any
---@param state any
function MultipleItemPurchase:setVisibility(superFunc, state) end

--- Adds the vehicle to physics via the parent; if that succeeds, also adds the loaded bales and vehicles. Returns false if the parent fails.
---@param superFunc any
function MultipleItemPurchase:addToPhysics(superFunc) end

--- Removes the loaded bales and vehicles from physics, then calls the parent and returns its result.
---@param superFunc any
function MultipleItemPurchase:removeFromPhysics(superFunc) end
