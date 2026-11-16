---@meta
-- FS25 1.25.1.0 : ai/jobs/AIJobGoTo.lua (generated stub, FS25 Lua Atlas)

--- Simplest driving job: the AI drives a vehicle to a chosen position and heading with one `AITaskDriveTo`. Parameters are the vehicle and a position/angle without angle snapping.
---@class AIJobGoTo : AIJob
AIJobGoTo = {}

--- Creates the drive-to task, the vehicle and position-angle parameters and their groups.
---@param isServer any
---@param customMt any
function AIJobGoTo.new(isServer, customMt) end

--- Base start, then for a non-nil vehicle creates the agent on the server and calls `vehicle:aiJobStarted` (on server and client alike).
---@param farmId any
function AIJobGoTo:start(farmId) end

--- For a non-nil vehicle deletes the agent on the server and calls `vehicle:aiJobFinished`, then runs the base stop.
---@param aiMessage any
function AIJobGoTo:stop(aiMessage) end

--- Returns the drive task's target x, z and the heading angle from its direction (nil if no direction is set).
function AIJobGoTo:getTarget() end

--- Requires `createAgent`, `setAITarget`, AI start capability and support for this job class.
---@param vehicle any
function AIJobGoTo:getIsAvailableForVehicle(vehicle) end

--- Returns the vehicle name from the vehicle parameter, or an empty string when there is no vehicle.
function AIJobGoTo:getTitle() end

--- Takes the position and angle from the vehicle's last go-to job (unless direct start), else from the vehicle's pose, with angle snapping disabled.
---@param vehicle any
---@param mission any
---@param farmId any
---@param isDirectStart any
function AIJobGoTo:applyCurrentState(vehicle, mission, farmId, isDirectStart) end

--- Resets tasks and feeds the vehicle plus the parameter's position and direction into the drive task.
function AIJobGoTo:setValues() end

--- Validates vehicle and position parameters, flagging each invalid one; returns the result and the first error text.
---@param farmId any
function AIJobGoTo:validate(farmId) end

--- Appends the localized "drive to target" text to the base description while the drive task is current.
function AIJobGoTo:getDescription() end

--- Server-side check before starting: refuses if the AI limit is reached, the vehicle is gone, the player lacks the `hireAssistant` permission, or the vehicle is in use. Returns true plus `AIJob.START_SUCCESS`, else false plus a `AIJobGoTo.START_ERROR_*` state.
---@param connection any
function AIJobGoTo:getIsStartable(connection) end

--- Maps a start state returned by `getIsStartable` to a localized text: limit reached, vehicle deleted, no permission, vehicle in use, otherwise the success text. The `AIJobGoTo.START_ERROR_*` constants are not defined in this file (UNVERIFIED).
---@param state any
function AIJobGoTo.getIsStartErrorText(state) end
