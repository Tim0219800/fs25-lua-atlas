---@meta
-- FS25 1.25.1.0 : ai/jobs/AIJobFieldWork.lua (generated stub, FS25 Lua Atlas)

--- Job in which an AI driver goes to a start position and then works a field with the attached tools: an `AITaskDriveTo` followed by an `AITaskFieldWork`. Parameters are the vehicle and a position/angle. Settings of the AI mode are streamed along with the job, and the vehicle is notified of start and stop (agent creation on the server).
---@class AIJobFieldWork : AIJob
AIJobFieldWork = {}

--- Creates the drive-to and field-work tasks, the vehicle and position-angle (no snapping) parameters and their groups.
---@param isServer any
---@param customMt any
function AIJobFieldWork.new(isServer, customMt) end

--- Base read, then if a flag is set reads the AI mode settings via `AIModeSelection.readAIModeSettingsFromStream` into `pendingData` and sets `pendingVehicle`, to be applied once the vehicle is available.
---@param streamId any
---@param connection any
function AIJobFieldWork:readStream(streamId, connection) end

--- Base write, then a flag telling whether a vehicle exists and, if so, the vehicle's AI mode settings through `writeAIModeSettingsToStream`.
---@param streamId any
---@param connection any
function AIJobFieldWork:writeStream(streamId, connection) end

--- Returns 2 (field work) for a direct start or when the vehicle is within 3 m of the target position, otherwise 1 (drive first).
function AIJobFieldWork:getStartTaskIndex() end

--- Base start, then on the server creates the agent and calls `vehicle:aiJobStarted`.
---@param farmId any
function AIJobFieldWork:start(farmId) end

--- On the server deletes the agent and calls `vehicle:aiJobFinished`, then runs the base stop.
---@param aiMessage any
function AIJobFieldWork:stop(aiMessage) end

--- Takes position and angle from the last field-work job of the vehicle (unless direct start), else from the vehicle's pose, and sets the angle snapping to the larger of the vehicle's direction snap angle and a terrain-based angle of at least 45 degrees.
---@param vehicle any
---@param mission any
---@param farmId any
---@param isDirectStart any
function AIJobFieldWork:applyCurrentState(vehicle, mission, farmId, isDirectStart) end

--- True when the vehicle can start field work (`getCanStartFieldWork`) and lists this job class as supported.
---@param vehicle any
function AIJobFieldWork:getIsAvailableForVehicle(vehicle) end

--- Returns the drive task's target x, z and the heading angle derived from its direction (0 if none).
function AIJobFieldWork:getTarget() end

--- Returns the vehicle name from the vehicle parameter, or an empty string when there is no vehicle.
function AIJobFieldWork:getTitle() end

--- Resets tasks, sets the vehicle on both tasks and turns the position-angle parameter into the drive task's target position and direction.
function AIJobFieldWork:setValues() end

--- Marks parameters valid, then validates the vehicle parameter and flags it invalid on failure. Returns the result and error text.
---@param farmId any
function AIJobFieldWork:validate(farmId) end

--- Appends to the base description a localized text for the current task: driving to the field or field work.
function AIJobFieldWork:getDescription() end

--- Server-side check before starting: refuses if the AI limit is reached, the vehicle is gone, the player lacks the `hireAssistant` permission, or the vehicle is in use. Returns true plus `AIJob.START_SUCCESS`, else false plus a `AIJobFieldWork.START_ERROR_*` state.
---@param connection any
function AIJobFieldWork:getIsStartable(connection) end

--- Maps a start state returned by `getIsStartable` to a localized text: limit reached, vehicle deleted, no permission, vehicle in use, otherwise the success text. The `AIJobFieldWork.START_ERROR_*` constants are not defined in this file (UNVERIFIED).
---@param state any
function AIJobFieldWork.getIsStartErrorText(state) end

--- Returns 0.0005 per millisecond.
function AIJobFieldWork:getPricePerMs() end
