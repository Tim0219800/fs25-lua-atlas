# vehicles/ai/AIDriveStrategyFieldCourse.lua

*[Version française](../../../fr/scripts/vehicles/ai/AIDriveStrategyFieldCourse.md)*

Source: `dataS/scripts/vehicles/ai/AIDriveStrategyFieldCourse.lua` — FS25 1.25.1.0

✍ Core AI field-work drive strategy (subclass of AIDriveStrategy). It detects or restores a field course (FieldCourse, AIFieldCourse via g_fieldCourseManager), follows its segments, raises the vehicle field-worker events for turns, lowers or lifts implements from ground checks, handles reverse with tool reversers, and uses AICollisionTriggerHandler for blocking and slow-down. The server broadcasts AIVehicleIsBlockedEvent, and the course can be saved to and loaded from the savegame.

- **AIDriveStrategyFieldCourse** inherits from `AIDriveStrategy` (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIDriveStrategyFieldCourse.new(reconstructionData: any, customMt: any)` | 14 | ✍ Constructor. Creates the collision handler, resets blocked and static-collision state, collision distance and continue-work tracking, and keeps the reconstruction data passed in. |
| `AIDriveStrategyFieldCourse:delete()` | 34 | ✍ Calls the parent delete, then ends the work line on every attached AI implement and raises the AI_END_LINE state change on its root vehicle. |
| `AIDriveStrategyFieldCourse:setAIVehicle(vehicle: any)` | 47 | ✍ Initialises steering and reverser nodes, drive direction, and the field course settings (reused from the vehicle or generated with FieldCourseSettings.generate). Restores a saved course from reconstruction data or starts field detection, and installs collision callbacks (the blocked one broadcasts an event from the server). |
| `AIDriveStrategyFieldCourse:onFieldCourseLoadedCallback(fieldCourse: any)` | 143 | ✍ Callback when a field course is ready or loaded from a save. Stops the job with an error if no course, a vineyard course, or no segments; otherwise wraps it in an AIFieldCourse, sets the start pose, area validity check and initial segment callback, and finalises it. |
| `AIDriveStrategyFieldCourse:update(dt: any)` | 218 | ✍ Per frame: updates collision handler and course, notifies turn start, progress and end on the vehicle, decides per implement whether it is lowered (ground area check or always-on), raises start/end line events, and skips a sub segment after 5 s blocked. Note: drawDebugTriangle runs every frame regardless of debug state. |
| `AIDriveStrategyFieldCourse:getDriveData(dt: any, vX: any, vY: any, vZ: any)` | 394 | ✍ Returns target x, z, direction, max speed and stop distance. Stops the job with an error if detection never started or the field is not owned, waits when work cannot continue, halts if blocked, otherwise asks the course for drive data, corrects the target for reverser tools and caps speed from the collision distance. |
| `AIDriveStrategyFieldCourse:fillReconstructionData(data: any)` | 537 | ✍ Stores the current AIFieldCourse into the given data table as an AIFieldCourseReconstructionData, so the strategy can be rebuilt (for example after a load). |
| `AIDriveStrategyFieldCourse.saveToXML(data: any, xmlFile: any, key: any)` | 546 | ✍ Static. If the data holds field course reconstruction data, saves it to the XML file under the key suffixed with .strategyFieldCourse. |
| `AIDriveStrategyFieldCourse.loadFromXML(data: any, xmlFile: any, key: any)` | 554 | ✍ Static. Loads AIFieldCourseReconstructionData from the .strategyFieldCourse key and stores it in the data table, or sets it to nil if loading fails. |
| `AIDriveStrategyFieldCourse.registerSavegameXMLPaths(schema: any, basePath: any)` | 563 | ✍ Static. Registers the savegame XML paths of AIFieldCourseReconstructionData under the base path suffixed with .strategyFieldCourse. |
