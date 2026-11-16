---@meta
-- FS25 1.25.1.0 : specialization/SpecializationManager.lua (generated stub, FS25 Lua Atlas)

--- Manager that registers the specialization classes (vehicles, placeables, etc.) of one type family from an XML list. It extends AbstractManager and sources each specialization script, then keeps them by name and in load order. It also drives the two-stage initialisation of every specialization through the async task manager.
---@class SpecializationManager : AbstractManager
SpecializationManager = {}

--- Creates a manager for the given type name and XML file path. Stores both values; the XML is only read later in loadMapData.
---@param typeName string
---@param xmlFilename string
---@param customMt table?
---@return SpecializationManager
function SpecializationManager.new(typeName, xmlFilename, customMt) end

--- Resets the specialization lookup table (by name) and the ordered list used to keep load order.
function SpecializationManager:initDataStructures() end

--- Reads the specializations XML and, for each entry with name, className and filename, queues an async subtask calling addSpecialization. Entries with a missing attribute are skipped with a warning. Returns false if the XML is missing.
---@return boolean
function SpecializationManager:loadMapData() end

--- Registers one specialization: sources its script, resolves the class by name and stores its className on it. Refuses duplicate names or nil className/filename and returns false; an unresolved class only logs a warning.
---@param name string
---@param className string
---@param filename string
---@param customEnvironment string
---@return boolean
function SpecializationManager:addSpecialization(name, className, filename, customEnvironment) end

--- For every registered specialization in load order, queues an async subtask calling its static initSpecialization, if it defines one.
function SpecializationManager:initSpecializations() end

--- Same as initSpecializations but for the optional static postInitSpecialization, meant to run after all specializations are initialised.
function SpecializationManager:postInitSpecializations() end

--- Returns the registration entry (name, className, filename) for a specialization name, or nil if the name is nil or unknown.
---@param name string
---@return table?
function SpecializationManager:getSpecializationByName(name) end

--- Returns the actual class table of a specialization, resolved through ClassUtil from its registered className, or nil if unknown.
---@param name string
---@return table?
function SpecializationManager:getSpecializationObjectByName(name) end

--- Returns the internal table of registration entries indexed by specialization name.
---@return table
function SpecializationManager:getSpecializations() end
