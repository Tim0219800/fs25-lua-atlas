---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WaterTrailer.lua (generated stub, FS25 Lua Atlas)

--- Specialization that lets a water trailer (needs FillUnit) be refilled from any water plane in the world, not only from a trigger. When the fill node is within 0.2 m of the water height (`self.waterY`, provided by the engine, UNVERIFIED), an activatable is offered; the server then adds water to the configured fill unit at `fillLitersPerSecond` (default 500) and syncs the state with `WaterTrailerSetIsFillingEvent`. The file also defines the helper class `WaterTrailerActivatable`.
---@class WaterTrailer
WaterTrailer = {}

--- Specialization that lets a water trailer (needs FillUnit) be refilled from any water plane in the world, not only from a trigger. When the fill node is within 0.2 m of the water height (`self.waterY`, provided by the engine, UNVERIFIED), an activatable is offered; the server then adds water to the configured fill unit at `fillLitersPerSecond` (default 500) and syncs the state with `WaterTrailerSetIsFillingEvent`. The file also defines the helper class `WaterTrailerActivatable`.
---@class WaterTrailerActivatable
WaterTrailerActivatable = {}

--- Returns true only if the vehicle type has the `FillUnit` specialization.
---@param specializations table
---@return boolean
function WaterTrailer.prerequisitesPresent(specializations) end

--- Registers the XML paths `vehicle.waterTrailer#fillUnitIndex`, `#fillLitersPerSecond` (default 500), `#fillNode` (default root component) and the `refill` sound sample.
function WaterTrailer.initSpecialization() end

--- Adds `setIsWaterTrailerFilling` to the vehicle type.
---@param vehicleType any
function WaterTrailer.registerFunctions(vehicleType) end

--- Overrides `getDrawFirstFillText`.
---@param vehicleType any
function WaterTrailer.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, read/write stream, onUpdateTick and onPreDetach.
---@param vehicleType any
function WaterTrailer.registerEventListeners(vehicleType) end

--- Reads the fill unit index, fill rate and fill node (only when an index is given), creates the activatable, loads the refill sound on the client and sets `needWaterInfo` so the engine provides the water height. Note: onUpdateTick uses `waterFillNode` without a nil check, so a missing `fillUnitIndex` would break it.
---@param savegame table
function WaterTrailer:onLoad(savegame) end

--- Removes the activatable from the activatable objects system and deletes the sound samples.
function WaterTrailer:onDelete() end

--- Client join: reads the filling boolean and applies it without sending an event.
---@param streamId integer
---@param connection Connection
function WaterTrailer:onReadStream(streamId, connection) end

--- Server side on join: writes the current filling boolean.
---@param streamId integer
---@param connection Connection
function WaterTrailer:onWriteStream(streamId, connection) end

--- Adds or removes the activatable depending on whether the fill node is near the water. On the server, stops filling when leaving the water, and while filling adds water to the fill unit at the configured rate (water must be an allowed fill type); stops when nothing more is added.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function WaterTrailer:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Changes the filling state: sends `WaterTrailerSetIsFillingEvent` (unless `noEventSend`), stores the state and plays or stops the refill sound on the client.
---@param isFilling boolean
---@param noEventSend boolean
function WaterTrailer:setIsWaterTrailerFilling(isFilling, noEventSend) end

--- Override: on the client, returns true when the trailer is selected and active for input, its fill unit is empty and has non-zero capacity; otherwise defers to the previous implementation.
---@param superFunc any
function WaterTrailer:getDrawFirstFillText(superFunc) end

--- Removes the refill activatable just before the trailer is detached.
---@param attacherVehicle table
---@param implement table
function WaterTrailer:onPreDetach(attacherVehicle, implement) end

--- Constructor: creates the activatable for the given trailer with a placeholder activate text.
---@param trailer any
function WaterTrailerActivatable.new(trailer) end

--- Returns true (and refreshes the text) when the trailer is active for input, its fill unit is not full and accepts water.
function WaterTrailerActivatable:getIsActivatable() end

--- Toggles the trailer's filling state and refreshes the displayed text.
function WaterTrailerActivatable:run() end

--- Sets the activate text to the stop-refilling or refill label (localized), formatted with the vehicle type description.
function WaterTrailerActivatable:updateActivateText() end
