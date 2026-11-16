# specialization/TypeManager.lua

*[Version française](../../fr/scripts/specialization/TypeManager.md)*

Source: `dataS/scripts/specialization/TypeManager.lua` — FS25 1.25.1.0

✍ Generic registry of entity types (vehicle types, placeable types and similar), each type being a class plus an ordered list of specializations. It reads type definitions from an XML file, supports inheritance through a parent type, and builds the per-type tables of functions and events. It works together with a specialization manager that is passed in at construction; that manager class is not in this file (UNVERIFIED).

- **TypeManager** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `TypeManager.new(typeName: any, rootElementName: any, xmlFilename: any, specializationManager: any, customMt: any) → table` | 17 | ✍ Creates a manager with an empty type table, storing the display type name, XML root element name, XML file path and the specialization manager to use. |
| `TypeManager:loadMapData() → boolean` | 40 | ✍ Opens the types XML and queues one async subtask per `type` entry to load it with loadTypeFromXML, then queues closing the file and a log line. Always returns true; actual loading happens later in the task manager. |
| `TypeManager:unloadMapData()` | 71 | ✍ Clears the type table by replacing it with an empty one. |
| `TypeManager:addType(typeName: string, className: string, filename: string, customEnvironment: string, parent: any) → boolean` | 82 | ✍ Registers a new type entry after checking the name is unused and a class name and file are given; it also runs `source` on the file with the given mod environment. Returns false with an error log on failure, true otherwise. |
| `TypeManager:loadTypeFromXML(xmlFile: any, key: any, isDLC: any, modDir: any, modName: any)` | 118 | ✍ Reads one type from XML: resolves an optional parent (also trying the mod-prefixed name), inherits class, file and specializations, prefixes mod types with the mod name, then adds listed specializations. Returns false if invalid or if script mods are not allowed on the platform. |
| `TypeManager:addSpecialization(typeName: any, specName: any)` | 218 | ✍ Appends a specialization to an existing type, looked up through the specialization manager. Fails with an error log if the type is unknown, the specialization is unknown, or it is already present; returns true on success. |
| `TypeManager:validateTypes()` | 245 | ✍ Queues, for each type, a check that every specialization defines prerequisitesPresent and that it returns true for the type's specializations. A type failing either check is removed from the registry with an error log. |
| `TypeManager:finalizeTypes()` | 264 | ✍ Queues async subtasks per type that call, when defined, registerEvents and registerFunctions on the type's class, then registerEvents, registerFunctions, registerOverwrittenFunctions and registerEventListeners on each specialization, in that order. Returns true. |
| `TypeManager:getTypes()` | 324 | ✍ Returns the table of all registered types, keyed by type name. |
| `TypeManager:removeType(typeName: any)` | 330 | ✍ Removes the type with the given name from the registry. |
| `TypeManager:getTypeByName(typeName: any, modName: any)` | 336 | ✍ Returns the type entry for a name, falling back to the mod-prefixed name when a mod name is given. If the entry is missing and the mod is not loaded (g_modIsLoaded), logs an error and returns nil. |
| `TypeManager:getObjectTypeFromXML(xmlFilename: any)` | 363 | ✍ Opens an object's XML, reads its root `#type` attribute, finds the matching type entry (using the mod name derived from the path) and its class. Returns the type entry and class object, or nil, nil with an error log. |
