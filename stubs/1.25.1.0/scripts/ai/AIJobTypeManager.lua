---@meta
-- FS25 1.25.1.0 : ai/AIJobTypeManager.lua (generated stub, FS25 Lua Atlas)

--- Registry of AI job types. On map load it registers GOTO, FIELDWORK, CONVEYOR, DELIVER and LOAD_AND_DELIVER with a localised title and a job class, publishes the name-to-index table as the global AIJobType, and creates job instances from a type index. The job classes themselves are not in this file.
---@class AIJobTypeManager
AIJobTypeManager = {}

--- Constructor. Stores whether this instance runs on the server; the job type tables are filled later in loadMapData.
---@param isServer any
---@param customMt any
---@return table
function AIJobTypeManager.new(isServer, customMt) end

--- Resets the job type tables, rebinds the global AIJobType to the name-to-index table and registers the five built-in job types. The XML and mission arguments are not used. Always returns nil despite its doc comment (no explicit return in the code).
---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function AIJobTypeManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Clears all job type tables and resets the global AIJobType to the now empty name-to-index table.
function AIJobTypeManager:delete() end

--- Registers a job type under an upper-cased valid name with a localised title and class, returning its record (name, title, classObject, index). Returns nil with a warning if the name is invalid or already used.
---@param name any
---@param title any
---@param classObject any
function AIJobTypeManager:registerJobType(name, title, classObject) end

--- Returns the type index of a job instance, found from its class, or nil if the class is unknown or not registered.
---@param job any
function AIJobTypeManager:getJobTypeIndex(job) end

--- Creates a job of the given type index by calling the registered class's new with the server flag, and stores the type index on it. Returns nil for a nil or unknown index.
---@param typeIndex any
function AIJobTypeManager:createJob(typeIndex) end

--- Returns the job type record for an index, or nil.
---@param index any
function AIJobTypeManager:getJobTypeByIndex(index) end

--- Returns the job type index for a name (case-insensitive), or nil if the name is nil or unknown.
---@param name any
function AIJobTypeManager:getJobTypeIndexByName(name) end
