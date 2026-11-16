# vehicles/wheels/WheelManager.lua

*[Version française](../../../fr/scripts/vehicles/wheels/WheelManager.md)*

Source: `dataS/scripts/vehicles/wheels/WheelManager.lua` — FS25 1.25.1.0

✍ Manager (subclass of AbstractManager) that loads the list of known wheel models from the default wheels XML at map load. It indexes each wheel by path, filename and base directory, groups them by brand and name, and answers radius/width lookups by tire size or file name. Warns when two wheels with the same size name disagree on radius or width.

- **WheelManager** inherits from `AbstractManager` (l.23)

## Functions

| Function | Line | Description |
|---|---|---|
| `WheelManager.new(customMt: any) → table` | 28 | ✍ Creates the manager using the given or default metatable. |
| `WheelManager:initDataStructures()` | 34 | ✍ Resets the tables: wheel list, wheels by base path, sorted typed wheel groups and filename-to-attributes map. |
| `WheelManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 44 | ✍ Loads the default wheels XML (WheelManager.DEFAULT_FILENAME) and fills the wheel lists. Returns true. The base directory argument is used to resolve wheel paths. |
| `WheelManager:loadWheelsFromXML(xmlFile: table, key: string, baseDirectory: string)` | 63 | ✍ Parses each `wheel` entry (filename, radius, width, category, allowMixture, priority), derives brand and name from the folder path, warns on size mismatches, registers it and sorts the groups by brand, priority then name. Entries missing path, radius or width are skipped with a warning. |
| `WheelManager:getWheelRadiusAndWidthFromDimension(dimension: string) → number, number` | 333 | ✍ Returns the radius and width of the first wheel whose short filename equals the given dimension string, or nil, nil if none matches. |
| `WheelManager:getWheelRadiusAndWidthFromFilename(filename: string) → number, number` | 350 | ✍ Returns the radius and width of the wheel whose full path equals the given filename, or nil, nil if not found. |
