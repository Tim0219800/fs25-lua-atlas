---@meta
-- FS25 1.25.1.0 : ai/jobs/AIJobLoadAndDeliver.lua (generated stub, FS25 Lua Atlas)

--- Job in which an AI driver loads a chosen fill type at a loading station, drives to an unloading station and discharges, optionally looping. Tasks are drive to loading, `AITaskLoading`, drive to unloading and `AITaskDischarge`; parameters are vehicle, loading station, fill type, unloading station and looping. Fill units and discharge nodes of the vehicle and its children are collected and processed one by one.
---@class AIJobLoadAndDeliver : AIJob
AIJobLoadAndDeliver = {}

--- Creates the four tasks, the five parameters and their UI groups (vehicle, loading station with fill type, unloading station, looping).
---@param isServer any
---@param customMt any
function AIJobLoadAndDeliver.new(isServer, customMt) end

--- Collects AI fill units and discharge nodes of the vehicle and children sorted by Z offset, sets target offsets, then for the chosen fill type takes positions, directions and triggers from both stations' `getAITargetPositionAndDirection`. Returns early if vehicle or a station is missing.
function AIJobLoadAndDeliver:setValues() end

--- Validates the vehicle (needs discharge and loading nodes), fill type, loading station and unloading station for the fill type and farm, marking invalid ones. Returns the result and the first error text.
---@param farmId any
function AIJobLoadAndDeliver:validate(farmId) end

--- Enables looping, reuses stations and looping from the vehicle's last job of this class, then fills the lists of selectable unloading and loading stations (accessible, AI-capable, sorted by name) and updates the fill types.
---@param vehicle any
---@param mission any
---@param farmId any
---@param isDirectStart any
function AIJobLoadAndDeliver:applyCurrentState(vehicle, mission, farmId, isDirectStart) end

--- Gives the fill type parameter the AI-supported fill types of the loading station with the current fill level of the local player's farm. Uses `g_localPlayer`, so it is client-side.
---@param loadingStation any
function AIJobLoadAndDeliver:updateFillTypes(loadingStation) end

--- When the loading station parameter changes, refreshes the selectable fill types.
---@param parameter any
function AIJobLoadAndDeliver:onParameterValueChanged(parameter) end

--- Base start, then on the server creates the agent and calls `vehicle:aiJobStarted`.
---@param farmId any
function AIJobLoadAndDeliver:start(farmId) end

--- On the server deletes the agent and calls `vehicle:aiJobFinished`, runs the base stop, then clears the node info lists.
---@param aiMessage any
function AIJobLoadAndDeliver:stop(aiMessage) end

--- Starting the drive-to-loading task marks all discharge nodes dirty, starting the drive-to-unloading task marks all loading fill units dirty; then runs the base `startTask`.
---@param task any
function AIJobLoadAndDeliver:startTask(task) end

--- Starts by driving to loading if any loading fill unit is empty, otherwise directly with driving to unloading.
function AIJobLoadAndDeliver:getStartTaskIndex() end

--- Fails with the matching `AIMessageError*` if vehicle or either station was deleted or the unloading station has no free capacity. During loading, if the station has none of the fill type left and no loaded unit holds it, ends with `AIMessageSuccessSiloEmpty`.
function AIJobLoadAndDeliver:canContinueWork() end

--- After driving to loading or loading, picks the next empty dirty fill unit and stays in loading; after driving to unloading or discharging, picks the next dirty discharge node holding the chosen fill type and goes to discharge; otherwise defers to the base index.
---@param isSkipTask any
function AIJobLoadAndDeliver:getNextTaskIndex(isSkipTask) end

--- Requires `createAgent`, `setAITarget`, AI start capability and job support, then AI discharge nodes and AI fill units on the vehicle or its children. Note: it returns true as soon as a child has discharge nodes, before checking for fill units (apparent oversight).
---@param vehicle any
function AIJobLoadAndDeliver:getIsAvailableForVehicle(vehicle) end

--- Returns the vehicle name from the vehicle parameter, or an empty string when there is no vehicle.
function AIJobLoadAndDeliver:getTitle() end

--- Appends to the base description a localized text for the current task: driving to loading, loading, driving to unloading or unloading.
function AIJobLoadAndDeliver:getDescription() end

--- Returns the value of the looping parameter.
function AIJobLoadAndDeliver:getIsLooping() end

--- Server-side check before starting: refuses if the AI limit is reached, the vehicle is gone, the player lacks the `hireAssistant` permission, or the vehicle is in use. Returns true plus `AIJob.START_SUCCESS`, else false plus a `AIJobLoadAndDeliver.START_ERROR_*` state.
---@param connection any
function AIJobLoadAndDeliver:getIsStartable(connection) end

--- Maps a start state returned by `getIsStartable` to a localized text: limit reached, vehicle deleted, no permission, vehicle in use, otherwise the success text. The `AIJobLoadAndDeliver.START_ERROR_*` constants are not defined in this file (UNVERIFIED).
---@param state any
function AIJobLoadAndDeliver.getIsStartErrorText(state) end
