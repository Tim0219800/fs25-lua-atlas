---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIAutomaticSteering.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization that implements the steering assist (automatic steering along field-course lines) for drivable vehicles; it requires the Drivable specialization. It asks the server to generate a field course through g_fieldCourseManager, follows the current line by overriding steering input and vehicle physics, and plays engage, disengage and line-end sounds. The course is saved with the vehicle, streamed to joining clients and kept in sync with events. Constants such as STATE, HEADING_LETTERS and the distance thresholds are not visible in the dump (UNVERIFIED).
---@class AIAutomaticSteering
AIAutomaticSteering = {}

--- Returns true only when the vehicle type includes the Drivable specialization, which is the single prerequisite for automatic steering.
---@param specializations table
---@return boolean
function AIAutomaticSteering.prerequisitesPresent(specializations) end

--- Registers the XML schema entries: engage, disengage and lineEnd sounds, four dashboard values, and the optional lookAheadDistance under vehicle.ai.automaticSteering. Also registers the savegame paths for the saved field courses and the isOnField and courseWasActive flags.
function AIAutomaticSteering.initSpecialization() end

--- Registers the vehicle event onAIAutomaticSteeringLineEnd, raised on the server when the vehicle gets close to the end of a line.
---@param vehicleType any
function AIAutomaticSteering.registerEvents(vehicleType) end

--- Adds the specialization's public functions to the vehicle type: working width, allowed checks, enabling steering, setting or generating the course, state, look-ahead distance and side-offset reversal.
---@param vehicleType table
function AIAutomaticSteering.registerFunctions(vehicleType) end

--- Overrides setSteeringInput and updateVehiclePhysics on the vehicle type so the assist can cancel itself on manual input and inject its own steering value.
---@param vehicleType table
function AIAutomaticSteering.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to load, post-load, delete, network stream, update, state change, AI mode, activate, leave-vehicle, dashboard and action-event callbacks.
---@param vehicleType table
function AIAutomaticSteering.registerEventListeners(vehicleType) end

--- Initializes the steering state in spec_aiAutomaticSteering, reads the optional lookAheadDistance from XML, loads the three sounds on clients and registers the STEERING_ASSIST_CRUISE_CONTROL vehicle setting. Also allocates the dirty flag used for segment-state sync.
---@param savegame table
function AIAutomaticSteering:onLoad(savegame) end

--- When loading from a savegame that is not reset, restores the isOnField flag, the last active course and the current course, applying the course through setAIAutomaticSteeringCourse without sending an event.
---@param savegame any
function AIAutomaticSteering:onPostLoad(savegame) end

--- Registers four dashboard values: steeringEngaged, steeringState (state minus one), heading in degrees and headingLetter (compass letter from eight 45-degree sectors). Note: headingLetter samples the backward direction while heading uses the forward one.
function AIAutomaticSteering:onRegisterDashboardValueTypes() end

--- Frees the loaded sound samples when the vehicle is deleted.
function AIAutomaticSteering:onDelete() end

--- Writes the courseWasActive and isOnField flags, the current course, and the last active course when it differs from the current one, into the vehicle's savegame entry.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AIAutomaticSteering:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side on join: reads a bool and, if set, the full steering field course from the stream, applies it without sending events and marks the vehicle as on a field.
---@param streamId integer
---@param connection Connection
function AIAutomaticSteering:onReadStream(streamId, connection) end

--- Server side on join: writes whether a course exists and, if so, the whole course to the stream.
---@param streamId integer
---@param connection Connection
function AIAutomaticSteering:onWriteStream(streamId, connection) end

--- On a client receiving from the server, reads the flag and the per-segment states into the current course.
---@param streamId any
---@param timestamp any
---@param connection any
function AIAutomaticSteering:onReadUpdateStream(streamId, timestamp, connection) end

--- On the server, writes the segment states when the specialization's dirty flag is set in the mask. Note: it indexes steeringFieldCourse without a nil check, so it relies on the flag only being raised when a course exists.
---@param streamId any
---@param connection any
---@param dirtyMask any
function AIAutomaticSteering:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- In steering-assist mode, feeds the course the vehicle position and heading from a speed-dependent look-ahead point. The server then computes a target steering value from the target point, ramps it at the AI steering speed, raises the line-end event and can switch cruise control off near the end. Also flags segment states for network sync.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AIAutomaticSteering:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- For the active local vehicle, checks via the terrain density map and farm land access whether it is on a field and, on change or forced update, either asks the server for a new course (AIAutomaticSteeringRequestEvent) or starts a timer to clear it. On the server it turns steering off if the driving direction flips while moving.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AIAutomaticSteering:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- On attach (not from savegame) or detach, forces a field course refresh and forgets the last active course; the server leaves steering-assist mode for WORKER mode if automatic steering is no longer allowed.
---@param state any
---@param data any
function AIAutomaticSteering:onStateChange(state, data) end

--- Clears the course when the AI mode leaves steering assist; when entering it on an input-active vehicle, schedules a course update.
---@param aiMode any
function AIAutomaticSteering:onAIModeChanged(aiMode) end

--- When steering-assist settings change on the vehicle being controlled, drops the current course and schedules a new one.
---@param aiMode any
function AIAutomaticSteering:onAIModeSettingsChanged(aiMode) end

--- Event handler that plays the line-end sound sample.
function AIAutomaticSteering:onAIAutomaticSteeringLineEnd() end

--- When the vehicle becomes active in steering-assist mode and has a course, registers that course as the active one in g_fieldCourseManager.
function AIAutomaticSteering:onActivate() end

--- Server only: when the player leaves a vehicle that is not being deleted, clears the active course in the field course manager and disables automatic steering.
---@param wasEntered any
function AIAutomaticSteering:onLeaveVehicle(wasEntered) end

--- Returns the largest working width among all child vehicles of the root vehicle, from their AI markers or AI work-area width; 0 if none provide one. It refreshes each marker width as a side effect.
function AIAutomaticSteering:getAttacherToolWorkingWidth() end

--- Returns true if the root vehicle or any of its child vehicles reports getImplementAllowAutomaticSteering as true, false otherwise.
function AIAutomaticSteering:getIsAutomaticSteeringAllowed() end

--- Turns steering on, off or toggles it (nil), plays the engage or disengage sound and updates dashboards on clients, and syncs the current line segment. Sends AIAutomaticSteeringStateEvent unless noEventSend is set; returns the segment index and side.
---@param isEnabled any
---@param segmentIndex any
---@param segmentIsLeft any
---@param noEventSend any
function AIAutomaticSteering:setAIAutomaticSteeringEnabled(isEnabled, segmentIndex, segmentIsLeft, noEventSend) end

--- Sets or clears the steering field course, disabling steering if cleared, updates the active course in the field course manager and the UI, and broadcasts AIAutomaticSteeringCourseEvent (server) or sends it to the server (client) unless noEventSend is true.
---@param steeringFieldCourse any
---@param noEventSend any
function AIAutomaticSteering:setAIAutomaticSteeringCourse(steeringFieldCourse, noEventSend) end

--- Reuses the last active course if the point is inside it and the settings are identical; otherwise asks g_fieldCourseManager to generate a course at the position, queuing one pending request while a generation is running. On failure it clears the course.
---@param x any
---@param z any
---@param fieldCourseSettings any
function AIAutomaticSteering:generateSteeringFieldCourse(x, z, fieldCourseSettings) end

--- Returns true when a course with a current segment exists; otherwise returns false plus a localized warning text (no course or no segment).
function AIAutomaticSteering:getIsAIAutomaticSteeringAllowed() end

--- Returns ACTIVE when a course exists and steering is on, AVAILABLE when a course exists but steering is off, DISABLED without a course. The numeric values of STATE are not in the dump (UNVERIFIED).
function AIAutomaticSteering:getAIAutomaticSteeringState() end

--- Returns the lookAheadDistance configured in XML, or by default the AI root node's max Z offset when moving forward and its min Z offset when reversing.
function AIAutomaticSteering:getAIAutomaticSteeringLookAheadDistance() end

--- Looks for a plow among child vehicles and returns its rotationMax value; returns false if there is none. This tells the course whether the side offset is mirrored.
function AIAutomaticSteering:getIsSideOffsetReversed() end

--- Override of setSteeringInput. While assist is on, keyboard/mouse input switches it off at once; for other devices a change above 0.1 after a 2.5 s grace period switches it off. Then calls the parent function.
---@param superFunc any
---@param inputValue any
---@param isAnalog any
---@param deviceCategory any
function AIAutomaticSteering:setSteeringInput(superFunc, inputValue, isAnalog, deviceCategory) end

--- Override of updateVehiclePhysics: while steering is enabled, replaces the side axis with the value derived from the computed steering target, calls the parent, then forces rotatedTime and the Drivable side axis to that value.
---@param superFunc any
---@param axisForward any
---@param axisSide any
---@param doHandbrake any
---@param dt any
function AIAutomaticSteering:updateVehiclePhysics(superFunc, axisForward, axisSide, doHandbrake, dt) end

--- Client side: registers the TOGGLE_AI_STEERING action (high priority, with the steering-assist label) and the hidden TOGGLE_AI_STEERING_LINES action for the vehicle that is input-active.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function AIAutomaticSteering:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback that toggles automatic steering on or off.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AIAutomaticSteering.actionEventSteering(self, actionName, inputValue, callbackState, isAnalog) end

--- Enables the steering toggle action only when a course with a current segment exists.
---@param self any
function AIAutomaticSteering.updateActionEvents(self) end

--- Input callback that flips the STEERING_ASSIST_LINES game setting (show or hide guidance lines) and saves it.
---@param self any
function AIAutomaticSteering.actionEventSteeringLines(self) end
