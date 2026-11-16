# specialization/SpecializationManager.lua

*[Version française](../../fr/scripts/specialization/SpecializationManager.md)*

Source: `dataS/scripts/specialization/SpecializationManager.lua` — FS25 1.25.1.0

✍ Manager that registers the specialization classes (vehicles, placeables, etc.) of one type family from an XML list. It extends AbstractManager and sources each specialization script, then keeps them by name and in load order. It also drives the two-stage initialisation of every specialization through the async task manager.

- **SpecializationManager** inherits from `AbstractManager` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `SpecializationManager.new(typeName: string, xmlFilename: string, customMt: table?) → SpecializationManager` | 34 | ✍ Creates a manager for the given type name and XML file path. Stores both values; the XML is only read later in loadMapData. |
| `SpecializationManager:initDataStructures()` | 45 | ✍ Resets the specialization lookup table (by name) and the ordered list used to keep load order. |
| `SpecializationManager:loadMapData() → boolean` | 53 | ✍ Reads the specializations XML and, for each entry with name, className and filename, queues an async subtask calling addSpecialization. Entries with a missing attribute are skipped with a warning. Returns false if the XML is missing. |
| `SpecializationManager:addSpecialization(name: string, className: string, filename: string, customEnvironment: string) → boolean` | 118 | ✍ Registers one specialization: sources its script, resolves the class by name and stores its className on it. Refuses duplicate names or nil className/filename and returns false; an unresolved class only logs a warning. |
| `SpecializationManager:initSpecializations()` | 154 | ✍ For every registered specialization in load order, queues an async subtask calling its static initSpecialization, if it defines one. |
| `SpecializationManager:postInitSpecializations()` | 167 | ✍ Same as initSpecializations but for the optional static postInitSpecialization, meant to run after all specializations are initialised. |
| `SpecializationManager:getSpecializationByName(name: string) → table?` | 182 | ✍ Returns the registration entry (name, className, filename) for a specialization name, or nil if the name is nil or unknown. |
| `SpecializationManager:getSpecializationObjectByName(name: string) → table?` | 194 | ✍ Returns the actual class table of a specialization, resolved through ClassUtil from its registered className, or nil if unknown. |
| `SpecializationManager:getSpecializations() → table` | 207 | ✍ Returns the internal table of registration entries indexed by specialization name. |
