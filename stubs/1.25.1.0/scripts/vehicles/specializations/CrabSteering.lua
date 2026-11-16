---@meta
-- FS25 1.25.1.0 : vehicles/specializations/CrabSteering.lua (generated stub, FS25 Lua Atlas)

--- Specialization for vehicles with several selectable steering modes (all-wheel, crab, rear-wheel, etc.). Each mode, loaded from 'vehicle.crabSteering', can offset or lock wheels and steering nodes, move nodes, play animations, change the steering center and the articulated axis; the active mode index is saved and synchronized, and a HUD extension is created. Requires Drivable, Wheels and AnimatedVehicle. Several functions registered here (getCrabSteeringModeAvailable, getNumCrabSteeringModesAvailable, getCrabSteeringMode, setNextCrabSteeringMode, onDelete, onDraw) have no body in the SDK dump: UNVERIFIED.
---@class CrabSteering
CrabSteering = {}

--- Returns true only if the vehicle type has Drivable, Wheels and AnimatedVehicle.
---@param specializations table
---@return boolean
function CrabSteering.prerequisitesPresent(specializations) end

--- Registers the XML schema for crab steering (rear wheel distance, AI mode index, toggle speed, steering modes, per-configuration modes, dashboards with a 'states' list), the wheel configuration 'crabSteeringIndex' and the savegame state key.
function CrabSteering.initSpecialization() end

--- Registers the XML paths of one steering mode under a base path: name, input action, wheels, steering center, AI look-ahead, steering nodes, nodes, articulated axis, animations and steering wheel.
---@param schema any
---@param basePath any
function CrabSteering.registerSteeringModeXMLPaths(schema, basePath) end

--- Registers the crab steering functions on the vehicle type (mode loading, toggle permission, availability, current mode, next mode, articulated axis update). Some have no body in the dump.
---@param vehicleType any
function CrabSteering.registerFunctions(vehicleType) end

--- Registers overrides for wheel loading, steering angle, selection, steering wheel update, AI field worker start and AI look-ahead distance.
---@param vehicleType any
function CrabSteering.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, post-load, delete, dashboard registration, stream read/write, update stream read/write, update tick, draw and action event registration.
---@param vehicleType any
function CrabSteering.registerEventListeners(vehicleType) end

--- Reads crab steering settings and the steering modes of the active configuration, warns if there are more modes than the network bits allow, creates the HUD extension and applies mode 1. Without modes, removes its network, tick, draw and input listeners.
---@param savegame table
function CrabSteering:onLoad(savegame) end

--- Restores the saved steering mode from the savegame (clamped to the valid range) unless vehicles are reset, then fast-forwards animations and wheel physics.
---@param savegame any
function CrabSteering:onPostLoad(savegame) end

--- Registers the 'crabSteering.state' dashboard value: the current mode index, or a boolean telling whether the mode is in the dashboard's configured 'states' list.
function CrabSteering:onRegisterDashboardValueTypes() end

--- Writes the current steering mode index to the savegame if the vehicle has steering modes.
---@param xmlFile any
---@param key any
---@param usedModNames any
function CrabSteering:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client on join: reads the mode index, applies it without sending an event and fast-forwards animations and wheel physics.
---@param streamId integer
---@param connection Connection
function CrabSteering:onReadStream(streamId, connection) end

--- Server on join: writes the current mode index into the stream.
---@param streamId integer
---@param connection Connection
function CrabSteering:onWriteStream(streamId, connection) end

--- Reads the articulated axis current rotation (float) from the update stream when an articulated axis with a component joint exists.
---@param streamId integer
---@param timestamp integer
---@param connection table
function CrabSteering:onReadUpdateStream(streamId, timestamp, connection) end

--- Writes the articulated axis current rotation into the update stream when an articulated axis with a component joint exists.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function CrabSteering:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Server only: if the current mode is no longer available according to getCrabSteeringModeAvailable (body not in dump), switches to the next mode.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function CrabSteering:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads one steering mode into the given table: name, input action, steering center and radius, AI look-ahead, wheel entries, steering node entries, node pose changes, articulated axis data, animations and steering wheel. Invalid references are logged and skipped; always returns true.
---@param xmlFile any
---@param key any
---@param mode any
function CrabSteering:loadCrabSteeringModeFromXML(xmlFile, key, mode) end

--- Returns whether toggling is allowed plus an optional warning text; by default returns true, nil. Override point for other specializations.
---@return boolean
---@return string
function CrabSteering:getCanToggleCrabSteering() end

--- Switches to the given mode. Sends SetCrabSteeringEvent (broadcast on server, sent to server on client) unless noEventSend, plays or reverses mode animations, sets the target offsets and rotation scales of steering nodes and wheels, applies node poses and refreshes the dashboard on clients.
---@param state integer
---@param noEventSend boolean
function CrabSteering:setCrabSteering(state, noEventSend) end

--- After the parent loads a wheel, initializes its steering offset to 0 and forces a steering angle update. Returns false if the parent fails.
---@param superFunc any
---@param wheel any
function CrabSteering:loadWheelFromXML(superFunc, wheel) end

--- Overrides the wheel steering angle for wheels listed in the current mode: smoothly moves the steering offset, scales the rotation, gradually changes the wheel rotation speed and clamps to the wheel limits; locked wheels converge to their offset. Other wheels keep the given angle.
---@param superFunc table
---@param wheel table
---@param dt number
---@param steeringAngle number
---@return number
function CrabSteering:updateSteeringAngle(superFunc, wheel, dt, steeringAngle) end

--- Computes the articulated axis steering angle for the current mode (offset, lock, speed blending). On clients returns the synchronized rotation; on the server, with configured wheels and rear distance, derives the angle from wheel speed and slip, otherwise blends smoothly over 2.5 s.
---@param steeringAngle number
---@param dt number
---@return number
function CrabSteering:updateArticulatedAxisRotation(steeringAngle, dt) end

--- Returns true if the vehicle has steering modes, otherwise defers to the parent.
---@param superFunc any
function CrabSteering:getCanBeSelected(superFunc) end

--- After the parent loads the wheels, stores the 'crabSteeringIndex' of the active wheel configuration as the crab steering configuration index.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param wheelConfigurationI any
function CrabSteering:loadWheelsFromXML(superFunc, xmlFile, key, wheelConfigurationI) end

--- If the current mode defines its own steering wheel, uses it instead of the given one, then calls the parent.
---@param superFunc any
---@param steeringWheel any
---@param dt any
---@param direction any
function CrabSteering:updateSteeringWheel(superFunc, steeringWheel, dt, direction) end

--- Switches to the configured AI steering mode (aiSteeringModeIndex), sending the event, before starting the AI field worker via the parent.
---@param superFunc any
function CrabSteering:startFieldWorker(superFunc) end

--- Returns the look-ahead distance defined by the current mode if present; otherwise the parent's value.
---@param superFunc any
function CrabSteering:getAIAutomaticSteeringLookAheadDistance(superFunc) end

--- Client only: registers the next/previous mode toggle inputs and one direct input per mode that defines an input action, when the vehicle has modes and is active for input.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function CrabSteering:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback: if getCanToggleCrabSteering allows it, moves to the next or previous mode (callbackState gives the direction); otherwise shows the warning for 2 s.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function CrabSteering.actionEventToggleCrabSteeringModes(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: selects the mode bound to the pressed action if toggling is allowed and the mode is available; otherwise shows the warning for 2 s.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function CrabSteering.actionEventSetCrabSteeringMode(self, actionName, inputValue, callbackState, isAnalog) end
