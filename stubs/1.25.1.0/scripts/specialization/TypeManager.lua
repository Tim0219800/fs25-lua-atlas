---@meta
-- FS25 1.25.1.0 : specialization/TypeManager.lua (generated stub, FS25 Lua Atlas)

--- Generic registry of entity types (vehicle types, placeable types and similar), each type being a class plus an ordered list of specializations. It reads type definitions from an XML file, supports inheritance through a parent type, and builds the per-type tables of functions and events. It works together with a specialization manager that is passed in at construction; that manager class is not in this file (UNVERIFIED).
---@class TypeManager
TypeManager = {}

--- Creates a manager with an empty type table, storing the display type name, XML root element name, XML file path and the specialization manager to use.
---@param typeName any
---@param rootElementName any
---@param xmlFilename any
---@param specializationManager any
---@param customMt any
---@return table
function TypeManager.new(typeName, rootElementName, xmlFilename, specializationManager, customMt) end

--- Opens the types XML and queues one async subtask per `type` entry to load it with loadTypeFromXML, then queues closing the file and a log line. Always returns true; actual loading happens later in the task manager.
---@return boolean
function TypeManager:loadMapData() end

--- Clears the type table by replacing it with an empty one.
function TypeManager:unloadMapData() end

--- Registers a new type entry after checking the name is unused and a class name and file are given; it also runs `source` on the file with the given mod environment. Returns false with an error log on failure, true otherwise.
---@param typeName string
---@param className string
---@param filename string
---@param customEnvironment string
---@param parent any
---@return boolean
function TypeManager:addType(typeName, className, filename, customEnvironment, parent) end

--- Reads one type from XML: resolves an optional parent (also trying the mod-prefixed name), inherits class, file and specializations, prefixes mod types with the mod name, then adds listed specializations. Returns false if invalid or if script mods are not allowed on the platform.
---@param xmlFile any
---@param key any
---@param isDLC any
---@param modDir any
---@param modName any
function TypeManager:loadTypeFromXML(xmlFile, key, isDLC, modDir, modName) end

--- Appends a specialization to an existing type, looked up through the specialization manager. Fails with an error log if the type is unknown, the specialization is unknown, or it is already present; returns true on success.
---@param typeName any
---@param specName any
function TypeManager:addSpecialization(typeName, specName) end

--- Queues, for each type, a check that every specialization defines prerequisitesPresent and that it returns true for the type's specializations. A type failing either check is removed from the registry with an error log.
function TypeManager:validateTypes() end

--- Queues async subtasks per type that call, when defined, registerEvents and registerFunctions on the type's class, then registerEvents, registerFunctions, registerOverwrittenFunctions and registerEventListeners on each specialization, in that order. Returns true.
function TypeManager:finalizeTypes() end

--- Returns the table of all registered types, keyed by type name.
function TypeManager:getTypes() end

--- Removes the type with the given name from the registry.
---@param typeName any
function TypeManager:removeType(typeName) end

--- Returns the type entry for a name, falling back to the mod-prefixed name when a mod name is given. If the entry is missing and the mod is not loaded (g_modIsLoaded), logs an error and returns nil.
---@param typeName any
---@param modName any
function TypeManager:getTypeByName(typeName, modName) end

--- Opens an object's XML, reads its root `#type` attribute, finds the matching type entry (using the mod name derived from the path) and its class. Returns the type entry and class object, or nil, nil with an error log.
---@param xmlFilename any
function TypeManager:getObjectTypeFromXML(xmlFilename) end
