---@meta
-- FS25 1.25.1.0 : vehicles/specializations/BunkerSiloCompacter.lua (generated stub, FS25 Lua Atlas)

--- Specialization for vehicles that compact bunker silo contents (rollers, tractors with wheels). It stores a compacting scale and an optional speed-limit flag from XML and, on clients, plays a rolling sound on ground contact and a compacting sound when a wheel touches ground-height (density map) contact. The actual compaction in the silo is not done here: it reads the scale elsewhere. Note: the code uses BunkerSiloCompacter.XML_PATH, which is never assigned in this file (UNVERIFIED where it is set).
---@class BunkerSiloCompacter
BunkerSiloCompacter = {}

--- Always returns true: no other specialization is required.
---@param specializations any
function BunkerSiloCompacter.prerequisitesPresent(specializations) end

--- Registers the XML schema entries at XML_PATH: compactingScale, useSpeedLimit and the rolling and compacting sound samples. XML_PATH is not defined in this file, UNVERIFIED.
function BunkerSiloCompacter.initSpecialization() end

--- Registers loadBunkerSiloCompactorFromXML and getBunkerSiloCompacterScale on the vehicle type.
---@param vehicleType any
function BunkerSiloCompacter.registerFunctions(vehicleType) end

--- Overrides doCheckSpeedLimit on the vehicle type.
---@param vehicleType any
function BunkerSiloCompacter.registerOverwrittenFunctions(vehicleType) end

--- Registers onLoad, onUpdate and onDelete.
---@param vehicleType any
function BunkerSiloCompacter.registerEventListeners(vehicleType) end

--- Loads the compactor settings from XML and, on clients, the rolling and compacting samples. Removes the onUpdate listener if the vehicle has no getWheels function.
---@param savegame any
function BunkerSiloCompacter:onLoad(savegame) end

--- Deletes the loaded sound samples through the sound manager.
function BunkerSiloCompacter:onDelete() end

--- Reads compactingScale (default 1) and useSpeedLimit (default false) from the given XML file and key into the specialization.
---@param xmlFile any
---@param key any
function BunkerSiloCompacter:loadBunkerSiloCompactorFromXML(xmlFile, key) end

--- Returns the compacting scale read from XML (the spelling Compacter is in the source).
function BunkerSiloCompacter:getBunkerSiloCompacterScale() end

--- Scans the wheels for ground contact and for GROUND_HEIGHT contact (counted as compacting). When either state changes, starts or stops the rolling and compacting sounds accordingly.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function BunkerSiloCompacter:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- When useSpeedLimit is set, returns the parent result or true while compacting, so the speed limit applies during compaction. Otherwise returns the parent result.
---@param superFunc any
---@return boolean
function BunkerSiloCompacter:doCheckSpeedLimit(superFunc) end

--- Static helper returning the default speed limit, the constant 5 (unit not stated in the code, probably km/h, UNVERIFIED).
---@return number
function BunkerSiloCompacter.getDefaultSpeedLimit() end
