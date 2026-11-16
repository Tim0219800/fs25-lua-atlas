---@meta
-- FS25 1.25.1.0 : field/FieldManager.lua (generated stub, FS25 Lua Atlas)

--- Manager of the map fields, a subclass of AbstractManager. On map load it links each Field to its farmland, checks the field does not touch other farmlands, and on a new server savegame queues FieldUpdateTask objects to preplant or prepare the NPC fields. It also saves and loads field data and pending tasks, and registers gsField* cheat commands. Many methods it calls (getFieldById, addFieldUpdateTask, onFinishFieldUpdateTask, update logic) are not in this file: UNVERIFIED.
---@class FieldManager : AbstractManager
FieldManager = {}

--- Constructor. Creates the manager from AbstractManager.new with the given or default metatable.
---@param customMt table
---@return FieldManager
function FieldManager.new(customMt) end

--- Resets the field list, farmland-to-field mapping, update task queues, pending field update tables, timers and debug field.
function FieldManager:initDataStructures() end

--- Large loader run through g_asyncTaskManager subtasks: registers as updateable, builds the available fruit list, links fields to farmlands with error logs for overlaps, creates random FieldUpdateTask for unowned mission-allowed fields on a new server savegame (or tasks from the map fields XML), registers cheat commands, subscribes to growth and mission-generation messages and creates a debug overlay. On clients it only sets all fields to cultivated ground. Pending tasks are then run to completion.
---@param xmlFile XMLFile
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function FieldManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Removes the updateable, deletes all fields, clears references, unsubscribes from messages, removes the gsField* console commands and calls the parent.
function FieldManager:unloadMapData() end

--- Empty function; cleanup is done in unloadMapData.
function FieldManager:delete() end

--- Reads the savegame fields file: per-field data through Field:loadFromXMLFile, the pending update list, and saved update tasks instantiated by class name and queued. Logs and returns if the file is missing.
---@param xmlFilename string
function FieldManager:loadFromXMLFile(xmlFilename) end

--- Writes fields (id plus Field:saveToXMLFile data), pending updates and queued update tasks (skipped if needsSaving is false) to the savegame XML file.
---@param xmlFilename string
function FieldManager:saveToXMLFile(xmlFilename) end
