---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIFieldWorker.lua (generated stub, FS25 Lua Atlas)

--- Specialization that lets a drivable vehicle with AIJobVehicle perform AI field work: it keeps a list of drive strategies (registered in AIFieldWorker.registeredDriveStrategies) and turns their steering targets into driving commands each frame. In this dump most of the file is blank, so the registration, start and stop logic (startFieldWorker, getIsFieldWorkActive and so on) and the XML keys are UNVERIFIED; only seven functions are visible.
---@class AIFieldWorker
AIFieldWorker = {}

--- Returns true only if the vehicle type has both AIJobVehicle and Drivable.
---@param specializations table
---@return boolean
function AIFieldWorker.prerequisitesPresent(specializations) end

--- Writes the isActive flag, asks each drive strategy to fill reconstruction data, then lets every registered strategy class save that data into the vehicle's savegame entry through its optional saveToXML.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AIFieldWorker:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side on join: reads a bool and, if true, calls startFieldWorker so the client mirrors an already running field work (startFieldWorker is not in the dump, UNVERIFIED).
---@param streamId integer
---@param connection Connection
function AIFieldWorker:onReadStream(streamId, connection) end

--- Server side on join: writes whether the field worker is active. Note: spec.isActive is written without a nil guard, and saveToXMLFile does guard against nil.
---@param streamId integer
---@param connection Connection
function AIFieldWorker:onWriteStream(streamId, connection) end

--- Per-frame AI step while field work is active: asks each drive strategy for a target point and speed until one answers, ends the job as finished if none gives a valid target, limits speed near the stop point, the vehicle speed limit and cruise control, then drives to the point with AIVehicleUtil.driveToPoint and raises onAIFieldWorkerActive. Speeds are in the units used by driveToPoint (km/h, UNVERIFIED).
---@param dt number
function AIFieldWorker:updateAIFieldWorker(dt) end

--- Rebuilds the drive strategy list when AI implements exist: deletes the old strategies, then creates one instance per registered strategy whose test function accepts any vehicle in the attached tree, and links each to this vehicle.
function AIFieldWorker:updateAIFieldWorkerDriveStrategies() end

--- Override: calls the parent, then, if field work is active and the vehicle is not turning, raises onAIFieldWorkerContinue and the matching implement event, and clears the blocked flag.
---@param superFunc any
function AIFieldWorker:aiContinue(superFunc) end
