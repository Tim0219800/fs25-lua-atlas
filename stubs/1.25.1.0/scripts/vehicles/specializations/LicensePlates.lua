---@meta
-- FS25 1.25.1.0 : vehicles/specializations/LicensePlates.lua (generated stub, FS25 Lua Atlas)

--- Specialization that lets a vehicle carry license plates. Each `vehicle.licensePlates.licensePlate` entry links a plate object from `g_licensePlateManager` to a node, scales and shifts it to fit a placement area, and toggles optional object changes. Plate data (variation, characters, colour, placement) is saved per vehicle and sent to joining clients; it has no prerequisites.
---@class LicensePlates
LicensePlates = {}

--- Always returns true: no other specialization is required.
---@param specializations table
---@return boolean
function LicensePlates.prerequisitesPresent(specializations) end

--- Registers the `licensePlate` store spec type and the XML schema (default placement, plate nodes, preferred type, placement area, position, frame, object changes) plus the savegame attributes.
function LicensePlates.initSpecialization() end

--- Registers the license plate data accessors, the equality check, `getHasLicensePlates` and `getLicensePlateDialogSettings` on the vehicle type.
---@param vehicleType any
function LicensePlates.registerFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onPostLoad, onReadStream and onWriteStream.
---@param vehicleType any
function LicensePlates.registerEventListeners(vehicleType) end

--- Reads the default placement and, if plates are available in the map, creates each plate from the manager, parents it to its node, hides it and fits it into the placement area. If no plates are available, it resets the object changes instead.
---@param savegame table
function LicensePlates:onLoad(savegame) end

--- Disables all plate object changes, then restores saved plate data from the savegame (characters are split byte by byte, not UTF-8 safe) and applies it with `setLicensePlatesData`.
---@param savegame any
function LicensePlates:onPostLoad(savegame) end

--- Empties the plate list of the vehicle.
---@param savegame any
function LicensePlates:onDelete(savegame) end

--- Writes variation, characters, colour and placement to the savegame, unless the vehicle has no plates or the placement is NONE.
---@param xmlFile any
---@param key any
---@param usedModNames any
function LicensePlates:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client join: reads the plate data from the stream and applies it.
---@param streamId integer
---@param connection Connection
function LicensePlates:onReadStream(streamId, connection) end

--- Server join: writes the current plate data to the stream.
---@param streamId integer
---@param connection Connection
function LicensePlates:onWriteStream(streamId, connection) end

--- Applies plate data to all plates: shows or hides each according to the placement option (NONE, BACK_ONLY), updates text, variation and colour, and toggles object changes. Incomplete data hides all plates.
---@param licensePlateData any
function LicensePlates:setLicensePlatesData(licensePlateData) end

--- Returns the current plate data table (variation, characters, colorIndex, placementIndex), or nil.
function LicensePlates:getLicensePlatesData() end

--- Compares given data with the vehicle's own. Returns true if either is nil, otherwise true only if variation, colour, placement and characters all match.
---@param data any
function LicensePlates:getLicensePlatesDataIsEqual(data) end

--- Returns true if at least one plate was loaded on the vehicle.
---@return boolean
function LicensePlates:getHasLicensePlates() end

--- Returns the default placement index and whether the vehicle has a front plate, for the plate editing dialog.
---@return string
---@return boolean
function LicensePlates:getLicensePlateDialogSettings() end

--- Store spec loader; always returns nil because the spec only applies to existing vehicles.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function LicensePlates.loadSpecValuePlateText(xmlFile, customEnvironment, baseDir) end

--- Store spec getter: for an owned vehicle with plates, returns the formatted text of the back plate (or the last one); otherwise nil.
---@param storeItem any
---@param realItem any
function LicensePlates.getSpecValuePlateText(storeItem, realItem) end
