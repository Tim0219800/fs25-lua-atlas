# ai/AIJobTypeManager.lua

*[Version française](../../fr/scripts/ai/AIJobTypeManager.md)*

Source: `dataS/scripts/ai/AIJobTypeManager.lua` — FS25 1.25.1.0

✍ Registry of AI job types. On map load it registers GOTO, FIELDWORK, CONVEYOR, DELIVER and LOAD_AND_DELIVER with a localised title and a job class, publishes the name-to-index table as the global AIJobType, and creates job instances from a type index. The job classes themselves are not in this file.

- **AIJobTypeManager** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIJobTypeManager.new(isServer: any, customMt: any) → table` | 18 | ✍ Constructor. Stores whether this instance runs on the server; the job type tables are filled later in loadMapData. |
| `AIJobTypeManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 29 | ✍ Resets the job type tables, rebinds the global AIJobType to the name-to-index table and registers the five built-in job types. The XML and mission arguments are not used. Always returns nil despite its doc comment (no explicit return in the code). |
| `AIJobTypeManager:delete()` | 44 | ✍ Clears all job type tables and resets the global AIJobType to the now empty name-to-index table. |
| `AIJobTypeManager:registerJobType(name: any, title: any, classObject: any)` | 53 | ✍ Registers a job type under an upper-cased valid name with a localised title and class, returning its record (name, title, classObject, index). Returns nil with a warning if the name is invalid or already used. |
| `AIJobTypeManager:getJobTypeIndex(job: any)` | 81 | ✍ Returns the type index of a job instance, found from its class, or nil if the class is unknown or not registered. |
| `AIJobTypeManager:createJob(typeIndex: any)` | 92 | ✍ Creates a job of the given type index by calling the registered class's new with the server flag, and stores the type index on it. Returns nil for a nil or unknown index. |
| `AIJobTypeManager:getJobTypeByIndex(index: any)` | 110 | ✍ Returns the job type record for an index, or nil. |
| `AIJobTypeManager:getJobTypeIndexByName(name: any)` | 116 | ✍ Returns the job type index for a name (case-insensitive), or nil if the name is nil or unknown. |
