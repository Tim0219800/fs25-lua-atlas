---@meta
-- FS25 1.25.1.0 : vehicles/specializations/RidgeFormer.lua (generated stub, FS25 Lua Atlas)

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function RidgeFormer.prerequisitesPresent(specializations) end

--- Registers the work area type ridgeFormer with the work area type manager and declares the XML paths of the work sound under vehicle.ridgeFormer.sounds.
function RidgeFormer.initSpecialization() end

--- Registers processRidgeFormerArea on the vehicle type.
---@param vehicleType any
function RidgeFormer.registerFunctions(vehicleType) end

--- Overrides doCheckSpeedLimit, getDirtMultiplier and getWearMultiplier on the vehicle type.
---@param vehicleType any
function RidgeFormer.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onDeactivate, onStartWorkAreaProcessing and onEndWorkAreaProcessing.
---@param vehicleType any
function RidgeFormer.registerEventListeners(vehicleType) end

--- Initialises the stone state and fetches the stone wear multipliers for the SOWINGMACHINE type from the stone system. Adds AI ground type requirements if supported and, on clients, loads the work sound.
---@param savegame any
function RidgeFormer:onLoad(savegame) end

--- Deletes the loaded sound samples.
function RidgeFormer:onDelete() end

--- On clients, stops the sound samples and resets the work sample playing flag.
function RidgeFormer:onDeactivate() end

--- Resets the isWorking flag before the work areas are processed for this frame.
---@param dt any
function RidgeFormer:onStartWorkAreaProcessing(dt) end

--- On clients, starts the work sound when isWorking became true and stops it when it is false, tracking the playing state.
---@param dt any
function RidgeFormer:onEndWorkAreaProcessing(dt) end

--- Work area callback. Working means last speed above 0.5. Erases tire tracks in the area, then (on server, or client near enough) forms ridges in the density map with heading snapped to 90 degrees, stores the stone state, and returns changed and total area.
---@param workArea any
---@param dt any
function RidgeFormer:processRidgeFormerArea(workArea, dt) end

--- Returns the parent result, or true when the implement chain is lowered and the ridge former is working.
---@param superFunc any
function RidgeFormer:doCheckSpeedLimit(superFunc) end

--- Adds work dirt scaled by speed over speed limit to the parent multiplier, only when moving forward and working.
---@param superFunc any
function RidgeFormer:getDirtMultiplier(superFunc) end

--- Adds work wear scaled by speed over speed limit and by the stone multiplier for the last stone state, to the parent multiplier, only when moving forward and working.
---@param superFunc any
---@return number
function RidgeFormer:getWearMultiplier(superFunc) end
