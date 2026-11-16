---@meta
-- FS25 1.25.1.0 : vehicles/specializations/VineCutter.lua (generated stub, FS25 Lua Atlas)

--- Specialization for vine cutters (grape harvest tools). It depends on a vine detection specialization (`VineDetector`) providing `raycastCallbackVineDetection`, adds the `vineCutter` configuration type and reads the input fruit type and optional fruit type converter, from which it derives the output fill type and conversion factor. Only onLoad and onDraw have bodies in this file; the other registered functions are not defined here in the dump (UNVERIFIED).
---@class VineCutter
VineCutter = {}

--- Adds the `vineCutter` configuration type and registers the XML paths `fruitType` and `fruitTypeConverter`, both at base level and per configuration.
function VineCutter.initSpecialization() end

--- Always returns true: no prerequisites (the vine detection dependency is checked at load time instead).
---@param specializations any
function VineCutter.prerequisitesPresent(specializations) end

--- Registers `getCombine` and `harvestCallback` on the vehicle type. Their implementations are not present in this file (UNVERIFIED).
---@param vehicleType any
function VineCutter.registerFunctions(vehicleType) end

--- Registers overrides for doCheckSpeedLimit, getCanStartVineDetection, getIsValidVinePlaceable, handleVinePlaceable, clearCurrentVinePlaceable and getAIImplementUseVineSegment. Bodies are not present in this file (UNVERIFIED).
---@param vehicleType any
function VineCutter.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onDraw and onTurnedOff. Only onLoad and onDraw are defined in this file.
---@param vehicleType any
function VineCutter.registerEventListeners(vehicleType) end

--- Warns and returns if no `raycastCallbackVineDetection` exists. Otherwise picks the fruit type from the configuration or base XML (default `FruitType.GRAPE`), loads an optional fruit type converter, and sets the output fill type and conversion factor (1 without converter).
---@param savegame any
function VineCutter:onLoad(savegame) end

--- Shows the blinking warning that the player has no access to this land while the `showFarmlandNotOwnedWarning` flag is set. Note: if onLoad returned early the spec fields are nil and this would fail on the flag check (inferred from the code).
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function VineCutter:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end
