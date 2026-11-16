---@meta
-- FS25 1.25.1.0 : vehicles/ai/AIDriveStrategyFieldCourse.lua (generated stub, FS25 Lua Atlas)

--- Core AI field-work drive strategy (subclass of AIDriveStrategy). It detects or restores a field course (FieldCourse, AIFieldCourse via g_fieldCourseManager), follows its segments, raises the vehicle field-worker events for turns, lowers or lifts implements from ground checks, handles reverse with tool reversers, and uses AICollisionTriggerHandler for blocking and slow-down. The server broadcasts AIVehicleIsBlockedEvent, and the course can be saved to and loaded from the savegame.
---@class AIDriveStrategyFieldCourse : AIDriveStrategy
AIDriveStrategyFieldCourse = {}

--- Constructor. Creates the collision handler, resets blocked and static-collision state, collision distance and continue-work tracking, and keeps the reconstruction data passed in.
---@param reconstructionData any
---@param customMt any
function AIDriveStrategyFieldCourse.new(reconstructionData, customMt) end

--- Calls the parent delete, then ends the work line on every attached AI implement and raises the AI_END_LINE state change on its root vehicle.
function AIDriveStrategyFieldCourse:delete() end

--- Initialises steering and reverser nodes, drive direction, and the field course settings (reused from the vehicle or generated with FieldCourseSettings.generate). Restores a saved course from reconstruction data or starts field detection, and installs collision callbacks (the blocked one broadcasts an event from the server).
---@param vehicle any
function AIDriveStrategyFieldCourse:setAIVehicle(vehicle) end

--- Callback when a field course is ready or loaded from a save. Stops the job with an error if no course, a vineyard course, or no segments; otherwise wraps it in an AIFieldCourse, sets the start pose, area validity check and initial segment callback, and finalises it.
---@param fieldCourse any
function AIDriveStrategyFieldCourse:onFieldCourseLoadedCallback(fieldCourse) end

--- Per frame: updates collision handler and course, notifies turn start, progress and end on the vehicle, decides per implement whether it is lowered (ground area check or always-on), raises start/end line events, and skips a sub segment after 5 s blocked. Note: drawDebugTriangle runs every frame regardless of debug state.
---@param dt any
function AIDriveStrategyFieldCourse:update(dt) end

--- Returns target x, z, direction, max speed and stop distance. Stops the job with an error if detection never started or the field is not owned, waits when work cannot continue, halts if blocked, otherwise asks the course for drive data, corrects the target for reverser tools and caps speed from the collision distance.
---@param dt any
---@param vX any
---@param vY any
---@param vZ any
function AIDriveStrategyFieldCourse:getDriveData(dt, vX, vY, vZ) end

--- Stores the current AIFieldCourse into the given data table as an AIFieldCourseReconstructionData, so the strategy can be rebuilt (for example after a load).
---@param data any
function AIDriveStrategyFieldCourse:fillReconstructionData(data) end

--- Static. If the data holds field course reconstruction data, saves it to the XML file under the key suffixed with .strategyFieldCourse.
---@param data any
---@param xmlFile any
---@param key any
function AIDriveStrategyFieldCourse.saveToXML(data, xmlFile, key) end

--- Static. Loads AIFieldCourseReconstructionData from the .strategyFieldCourse key and stores it in the data table, or sets it to nil if loading fails.
---@param data any
---@param xmlFile any
---@param key any
function AIDriveStrategyFieldCourse.loadFromXML(data, xmlFile, key) end

--- Static. Registers the savegame XML paths of AIFieldCourseReconstructionData under the base path suffixed with .strategyFieldCourse.
---@param schema any
---@param basePath any
function AIDriveStrategyFieldCourse.registerSavegameXMLPaths(schema, basePath) end
