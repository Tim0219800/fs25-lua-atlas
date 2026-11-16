# vehicles/specializations/AIAutomaticSteering.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AIAutomaticSteering.md)*

Source: `dataS/scripts/vehicles/specializations/AIAutomaticSteering.lua` — FS25 1.25.1.0

✍ Vehicle specialization that implements the steering assist (automatic steering along field-course lines) for drivable vehicles; it requires the Drivable specialization. It asks the server to generate a field course through g_fieldCourseManager, follows the current line by overriding steering input and vehicle physics, and plays engage, disengage and line-end sounds. The course is saved with the vehicle, streamed to joining clients and kept in sync with events. Constants such as STATE, HEADING_LETTERS and the distance thresholds are not visible in the dump (UNVERIFIED).

- **AIAutomaticSteering** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIAutomaticSteering.prerequisitesPresent(specializations: table) → boolean` | 43 | ✍ Returns true only when the vehicle type includes the Drivable specialization, which is the single prerequisite for automatic steering. |
| `AIAutomaticSteering.initSpecialization()` | 49 | ✍ Registers the XML schema entries: engage, disengage and lineEnd sounds, four dashboard values, and the optional lookAheadDistance under vehicle.ai.automaticSteering. Also registers the savegame paths for the saved field courses and the isOnField and courseWasActive flags. |
| `AIAutomaticSteering.registerEvents(vehicleType: any)` | 72 | ✍ Registers the vehicle event onAIAutomaticSteeringLineEnd, raised on the server when the vehicle gets close to the end of a line. |
| `AIAutomaticSteering.registerFunctions(vehicleType: table)` | 80 | ✍ Adds the specialization's public functions to the vehicle type: working width, allowed checks, enabling steering, setting or generating the course, state, look-ahead distance and side-offset reversal. |
| `AIAutomaticSteering.registerOverwrittenFunctions(vehicleType: table)` | 95 | ✍ Overrides setSteeringInput and updateVehiclePhysics on the vehicle type so the assist can cancel itself on manual input and inject its own steering value. |
| `AIAutomaticSteering.registerEventListeners(vehicleType: table)` | 103 | ✍ Subscribes the specialization to load, post-load, delete, network stream, update, state change, AI mode, activate, leave-vehicle, dashboard and action-event callbacks. |
| `AIAutomaticSteering:onLoad(savegame: table)` | 126 | ✍ Initializes the steering state in spec_aiAutomaticSteering, reads the optional lookAheadDistance from XML, loads the three sounds on clients and registers the STEERING_ASSIST_CRUISE_CONTROL vehicle setting. Also allocates the dirty flag used for segment-state sync. |
| `AIAutomaticSteering:onPostLoad(savegame: any)` | 164 | ✍ When loading from a savegame that is not reset, restores the isOnField flag, the last active course and the current course, applying the course through setAIAutomaticSteeringCourse without sending an event. |
| `AIAutomaticSteering:onRegisterDashboardValueTypes()` | 192 | ✍ Registers four dashboard values: steeringEngaged, steeringState (state minus one), heading in degrees and headingLetter (compass letter from eight 45-degree sectors). Note: headingLetter samples the backward direction while heading uses the forward one. |
| `AIAutomaticSteering:onDelete()` | 251 | ✍ Frees the loaded sound samples when the vehicle is deleted. |
| `AIAutomaticSteering:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 260 | ✍ Writes the courseWasActive and isOnField flags, the current course, and the last active course when it differs from the current one, into the vehicle's savegame entry. |
| `AIAutomaticSteering:onReadStream(streamId: integer, connection: Connection)` | 279 | ✍ Client side on join: reads a bool and, if set, the full steering field course from the stream, applies it without sending events and marks the vehicle as on a field. |
| `AIAutomaticSteering:onWriteStream(streamId: integer, connection: Connection)` | 293 | ✍ Server side on join: writes whether a course exists and, if so, the whole course to the stream. |
| `AIAutomaticSteering:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 302 | ✍ On a client receiving from the server, reads the flag and the per-segment states into the current course. |
| `AIAutomaticSteering:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 312 | ✍ On the server, writes the segment states when the specialization's dirty flag is set in the mask. Note: it indexes steeringFieldCourse without a nil check, so it relies on the flag only being raised when a course exists. |
| `AIAutomaticSteering:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 326 | ✍ In steering-assist mode, feeds the course the vehicle position and heading from a speed-dependent look-ahead point. The server then computes a target steering value from the target point, ramps it at the AI steering speed, raises the line-end event and can switch cruise control off near the end. Also flags segment states for network sync. |
| `AIAutomaticSteering:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 437 | ✍ For the active local vehicle, checks via the terrain density map and farm land access whether it is on a field and, on change or forced update, either asks the server for a new course (AIAutomaticSteeringRequestEvent) or starts a timer to clear it. On the server it turns steering off if the driving direction flips while moving. |
| `AIAutomaticSteering:onStateChange(state: any, data: any)` | 532 | ✍ On attach (not from savegame) or detach, forces a field course refresh and forgets the last active course; the server leaves steering-assist mode for WORKER mode if automatic steering is no longer allowed. |
| `AIAutomaticSteering:onAIModeChanged(aiMode: any)` | 548 | ✍ Clears the course when the AI mode leaves steering assist; when entering it on an input-active vehicle, schedules a course update. |
| `AIAutomaticSteering:onAIModeSettingsChanged(aiMode: any)` | 560 | ✍ When steering-assist settings change on the vehicle being controlled, drops the current course and schedules a new one. |
| `AIAutomaticSteering:onAIAutomaticSteeringLineEnd()` | 572 | ✍ Event handler that plays the line-end sound sample. |
| `AIAutomaticSteering:onActivate()` | 579 | ✍ When the vehicle becomes active in steering-assist mode and has a course, registers that course as the active one in g_fieldCourseManager. |
| `AIAutomaticSteering:onLeaveVehicle(wasEntered: any)` | 592 | ✍ Server only: when the player leaves a vehicle that is not being deleted, clears the active course in the field course manager and disables automatic steering. |
| `AIAutomaticSteering:getAttacherToolWorkingWidth()` | 607 | ✍ Returns the largest working width among all child vehicles of the root vehicle, from their AI markers or AI work-area width; 0 if none provide one. It refreshes each marker width as a side effect. |
| `AIAutomaticSteering:getIsAutomaticSteeringAllowed()` | 629 | ✍ Returns true if the root vehicle or any of its child vehicles reports getImplementAllowAutomaticSteering as true, false otherwise. |
| `AIAutomaticSteering:setAIAutomaticSteeringEnabled(isEnabled: any, segmentIndex: any, segmentIsLeft: any, noEventSend: any)` | 649 | ✍ Turns steering on, off or toggles it (nil), plays the engage or disengage sound and updates dashboards on clients, and syncs the current line segment. Sends AIAutomaticSteeringStateEvent unless noEventSend is set; returns the segment index and side. |
| `AIAutomaticSteering:setAIAutomaticSteeringCourse(steeringFieldCourse: any, noEventSend: any)` | 705 | ✍ Sets or clears the steering field course, disabling steering if cleared, updates the active course in the field course manager and the UI, and broadcasts AIAutomaticSteeringCourseEvent (server) or sends it to the server (client) unless noEventSend is true. |
| `AIAutomaticSteering:generateSteeringFieldCourse(x: any, z: any, fieldCourseSettings: any)` | 738 | ✍ Reuses the last active course if the point is inside it and the settings are identical; otherwise asks g_fieldCourseManager to generate a course at the position, queuing one pending request while a generation is running. On failure it clears the course. |
| `AIAutomaticSteering:getIsAIAutomaticSteeringAllowed()` | 781 | ✍ Returns true when a course with a current segment exists; otherwise returns false plus a localized warning text (no course or no segment). |
| `AIAutomaticSteering:getAIAutomaticSteeringState()` | 796 | ✍ Returns ACTIVE when a course exists and steering is on, AVAILABLE when a course exists but steering is off, DISABLED without a course. The numeric values of STATE are not in the dump (UNVERIFIED). |
| `AIAutomaticSteering:getAIAutomaticSteeringLookAheadDistance()` | 811 | ✍ Returns the lookAheadDistance configured in XML, or by default the AI root node's max Z offset when moving forward and its min Z offset when reversing. |
| `AIAutomaticSteering:getIsSideOffsetReversed()` | 822 | ✍ Looks for a plow among child vehicles and returns its rotationMax value; returns false if there is none. This tells the course whether the side offset is mirrored. |
| `AIAutomaticSteering:setSteeringInput(superFunc: any, inputValue: any, isAnalog: any, deviceCategory: any)` | 834 | ✍ Override of setSteeringInput. While assist is on, keyboard/mouse input switches it off at once; for other devices a change above 0.1 after a 2.5 s grace period switches it off. Then calls the parent function. |
| `AIAutomaticSteering:updateVehiclePhysics(superFunc: any, axisForward: any, axisSide: any, doHandbrake: any, dt: any)` | 860 | ✍ Override of updateVehiclePhysics: while steering is enabled, replaces the side axis with the value derived from the computed steering target, calls the parent, then forces rotatedTime and the Drivable side axis to that value. |
| `AIAutomaticSteering:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 881 | ✍ Client side: registers the TOGGLE_AI_STEERING action (high priority, with the steering-assist label) and the hidden TOGGLE_AI_STEERING_LINES action for the vehicle that is input-active. |
| `AIAutomaticSteering.actionEventSteering(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 905 | ✍ Input callback that toggles automatic steering on or off. |
| `AIAutomaticSteering.updateActionEvents(self: any)` | 911 | ✍ Enables the steering toggle action only when a course with a current segment exists. |
| `AIAutomaticSteering.actionEventSteeringLines(self: any)` | 922 | ✍ Input callback that flips the STEERING_ASSIST_LINES game setting (show or hide guidance lines) and saves it. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onAIAutomaticSteeringLineEnd` | 73 |
| registerFunction | `getAttacherToolWorkingWidth` | 81 |
| registerFunction | `getIsAutomaticSteeringAllowed` | 82 |
| registerFunction | `setAIAutomaticSteeringEnabled` | 83 |
| registerFunction | `setAIAutomaticSteeringCourse` | 84 |
| registerFunction | `generateSteeringFieldCourse` | 85 |
| registerFunction | `getIsAIAutomaticSteeringAllowed` | 86 |
| registerFunction | `getAIAutomaticSteeringState` | 87 |
| registerFunction | `getAIAutomaticSteeringLookAheadDistance` | 88 |
| registerFunction | `getIsSideOffsetReversed` | 89 |
| registerOverwrittenFunction | `setSteeringInput` | 96 |
| registerOverwrittenFunction | `updateVehiclePhysics` | 97 |
| registerEventListener | `onLoad` | 104 |
| registerEventListener | `onPostLoad` | 105 |
| registerEventListener | `onRegisterDashboardValueTypes` | 106 |
| registerEventListener | `onDelete` | 107 |
| registerEventListener | `onReadStream` | 108 |
| registerEventListener | `onWriteStream` | 109 |
| registerEventListener | `onReadUpdateStream` | 110 |
| registerEventListener | `onWriteUpdateStream` | 111 |
| registerEventListener | `onUpdate` | 112 |
| registerEventListener | `onUpdateTick` | 113 |
| registerEventListener | `onStateChange` | 114 |
| registerEventListener | `onAIModeChanged` | 115 |
| registerEventListener | `onAIModeSettingsChanged` | 116 |
| registerEventListener | `onAIAutomaticSteeringLineEnd` | 117 |
| registerEventListener | `onActivate` | 118 |
| registerEventListener | `onLeaveVehicle` | 119 |
| registerEventListener | `onRegisterActionEvents` | 120 |
