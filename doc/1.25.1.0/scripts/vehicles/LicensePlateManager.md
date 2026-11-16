# vehicles/LicensePlateManager.lua

*[Version française](../../fr/scripts/vehicles/LicensePlateManager.md)*

Source: `dataS/scripts/vehicles/LicensePlateManager.lua` — FS25 1.25.1.0

✍ Per-map manager of license plates, a subclass of AbstractManager exposed as `g_licensePlateManager`. On map load it reads the file referenced by `map.licensePlates#filename`, loads each plate i3d asynchronously into LicensePlate objects, and reads the font name, colors and default placement. It also holds the static helpers that serialize plate data to network streams and to savegame XML. The constants PLATE_TYPE, PLATE_POSITION, PLACEMENT_OPTION and SEND_NUM_BITS_* are used here but defined outside the visible code (UNVERIFIED).

- **LicensePlateManager** inherits from `AbstractManager` (l.44)

## Functions

| Function | Line | Description |
|---|---|---|
| `LicensePlateManager.new(customMt: table?) → table` | 54 | ✍ Constructor. Delegates to `AbstractManager.new` with this class metatable unless a custom one is given. |
| `LicensePlateManager:initDataStructures()` | 60 | ✍ Resets the plate list, color configurations, availability flag and shared i3d request ids. |
| `LicensePlateManager:loadMapData(xmlFile: integer, missionInfo: table, baseDirectory: string) → boolean` | 73 | ✍ Loads license plates from the file named in the map XML, if any, and always returns true. Frees the XML right away unless asynchronous plate loads still need it. |
| `LicensePlateManager:unloadMapData()` | 97 | ✍ Deletes all plates, releases the shared i3d requests and the XML file, then calls the parent unload. |
| `LicensePlateManager:loadLicensePlatesFromXML(xmlFile: table, baseDirectory: string)` | 121 | ✍ Reads font name, color settings (plate material, shader parameter, custom colors, optionally brand default colors darker than a brightness limit) and default placement. Starts async loading of each plate i3d. |
| `LicensePlateManager:licensePlateI3DFileLoaded(i3dNode: integer, failedReason: integer, args: table?)` | 204 | ✍ Async callback when a plate i3d is loaded: unlinks the plate node, builds a LicensePlate from XML and stores it if valid, deletes the loaded i3d root. When the last request finishes, closes the XML and updates availability. |
| `LicensePlateManager:getAreLicensePlatesAvailable() → boolean` | 237 | ✍ Tells whether at least one plate was loaded and the font material exists. Returns the font material object rather than a strict boolean when both hold. |
| `LicensePlateManager:getLicensePlate(preferedType: integer, includeFrame: boolean?) → table` | 246 | ✍ Returns a clone of the last loaded plate with the preferred type, or of the first plate if none matches. Returns nil when there are no plates. The caller owns the clone. |
| `LicensePlateManager:getLicensePlateValues(licensePlate: table, variationIndex: integer) → table` | 266 | ✍ Returns the value list of a plate variation, or nil if the variation does not exist. |
| `LicensePlateManager:getRandomLicensePlateData() → table` | 278 | ✍ Returns a table with variation 1, random characters from the first plate, the default color index and the default placement. Without plates, characters and color are nil. |
| `LicensePlateManager:getAvailableColors() → table, integer` | 295 | ✍ Returns the color list and the default color index. |
| `LicensePlateManager:getDefaultPlacementIndex() → integer` | 302 | ✍ Returns the default placement option index. |
| `LicensePlateManager:getFont() → table` | 309 | ✍ Returns the font material of this map from `g_materialManager`, using the font name and the mod environment. |
| `LicensePlateManager.readLicensePlateData(streamId: integer, connection: integer) → table` | 318 | ✍ Reads plate data from a network stream: a validity bool, then variation, color, placement and a list of characters stored as font character indices. Returns a table with default values if the data is flagged invalid. |
| `LicensePlateManager.writeLicensePlateData(streamId: integer, connection: integer, licensePlateData: table)` | 346 | ✍ Writes plate data to a network stream, mirroring `readLicensePlateData`. Only writes the fields if all required ones are present; otherwise writes just a false flag. |
| `LicensePlateManager.loadLicensePlateDataFromXML(xmlFile: XMLFile, key: string, useAbsolutePaths: boolean) → table` | 368 | ✍ Reads plate data (configuration file, variation, color, placement, characters) from savegame XML at the key. Returns nil if there is no variation attribute. The filename is converted from network form unless absolute paths are used. |
| `LicensePlateManager.saveLicensePlateDataToXML(xmlFile: XMLFile, key: string, licensePlateData: table, useAbsolutePaths: boolean)` | 402 | ✍ Writes plate data to XML at the key, only if all required fields exist. The configuration filename is converted to network form unless absolute paths are used. |
| `LicensePlateManager.createLicensePlateXMLSchema()` | 516 | ✍ Creates, once, the XML schema for the map license plate file (plates, font, color configurations, placement) and stores it in `LicensePlateManager.xmlSchema`. Note: the shader parameter default is registered as "colorSale" while loading uses "colorScale". |
