# vehicles/specializations/LicensePlates.lua

*[Version française](../../../fr/scripts/vehicles/specializations/LicensePlates.md)*

Source: `dataS/scripts/vehicles/specializations/LicensePlates.lua` — FS25 1.25.1.0

✍ Specialization that lets a vehicle carry license plates. Each `vehicle.licensePlates.licensePlate` entry links a plate object from `g_licensePlateManager` to a node, scales and shifts it to fit a placement area, and toggles optional object changes. Plate data (variation, characters, colour, placement) is saved per vehicle and sent to joining clients; it has no prerequisites.

- **LicensePlates** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `LicensePlates.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Always returns true: no other specialization is required. |
| `LicensePlates.initSpecialization()` | 23 | ✍ Registers the `licensePlate` store spec type and the XML schema (default placement, plate nodes, preferred type, placement area, position, frame, object changes) plus the savegame attributes. |
| `LicensePlates.registerFunctions(vehicleType: any)` | 49 | ✍ Registers the license plate data accessors, the equality check, `getHasLicensePlates` and `getLicensePlateDialogSettings` on the vehicle type. |
| `LicensePlates.registerEventListeners(vehicleType: any)` | 59 | ✍ Subscribes to onLoad, onDelete, onPostLoad, onReadStream and onWriteStream. |
| `LicensePlates:onLoad(savegame: table)` | 70 | ✍ Reads the default placement and, if plates are available in the map, creates each plate from the manager, parents it to its node, hides it and fits it into the placement area. If no plates are available, it resets the object changes instead. |
| `LicensePlates:onPostLoad(savegame: any)` | 176 | ✍ Disables all plate object changes, then restores saved plate data from the savegame (characters are split byte by byte, not UTF-8 safe) and applies it with `setLicensePlatesData`. |
| `LicensePlates:onDelete(savegame: any)` | 205 | ✍ Empties the plate list of the vehicle. |
| `LicensePlates:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 213 | ✍ Writes variation, characters, colour and placement to the savegame, unless the vehicle has no plates or the placement is NONE. |
| `LicensePlates:onReadStream(streamId: integer, connection: Connection)` | 234 | ✍ Client join: reads the plate data from the stream and applies it. |
| `LicensePlates:onWriteStream(streamId: integer, connection: Connection)` | 244 | ✍ Server join: writes the current plate data to the stream. |
| `LicensePlates:setLicensePlatesData(licensePlateData: any)` | 251 | ✍ Applies plate data to all plates: shows or hides each according to the placement option (NONE, BACK_ONLY), updates text, variation and colour, and toggles object changes. Incomplete data hides all plates. |
| `LicensePlates:getLicensePlatesData()` | 288 | ✍ Returns the current plate data table (variation, characters, colorIndex, placementIndex), or nil. |
| `LicensePlates:getLicensePlatesDataIsEqual(data: any)` | 294 | ✍ Compares given data with the vehicle's own. Returns true if either is nil, otherwise true only if variation, colour, placement and characters all match. |
| `LicensePlates:getHasLicensePlates() → boolean` | 323 | ✍ Returns true if at least one plate was loaded on the vehicle. |
| `LicensePlates:getLicensePlateDialogSettings() → string, boolean` | 331 | ✍ Returns the default placement index and whether the vehicle has a front plate, for the plate editing dialog. |
| `LicensePlates.loadSpecValuePlateText(xmlFile: any, customEnvironment: any, baseDir: any)` | 347 | ✍ Store spec loader; always returns nil because the spec only applies to existing vehicles. |
| `LicensePlates.getSpecValuePlateText(storeItem: any, realItem: any)` | 354 | ✍ Store spec getter: for an owned vehicle with plates, returns the formatted text of the back plate (or the last one); otherwise nil. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setLicensePlatesData` | 50 |
| registerFunction | `getLicensePlatesData` | 51 |
| registerFunction | `getLicensePlatesDataIsEqual` | 52 |
| registerFunction | `getHasLicensePlates` | 53 |
| registerFunction | `getLicensePlateDialogSettings` | 54 |
| registerEventListener | `onLoad` | 60 |
| registerEventListener | `onDelete` | 61 |
| registerEventListener | `onPostLoad` | 62 |
| registerEventListener | `onReadStream` | 63 |
| registerEventListener | `onWriteStream` | 64 |
