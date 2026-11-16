---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableIncomePerHour.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that pays a fixed income per in-game hour to the owning farm, with an amount that can depend on an incomePerHour configuration. It also registers the incomePerHour store spec and configuration type, so the value appears in the shop. Income is added on the server only, and only once the placeable is fully built.
---@class PlaceableIncomePerHour
PlaceableIncomePerHour = {}

--- No prerequisite: always returns true.
---@param specializations table
---@return boolean
function PlaceableIncomePerHour.prerequisitesPresent(specializations) end

--- Registers the getIncomePerHour method.
---@param placeableType any
function PlaceableIncomePerHour.registerFunctions(placeableType) end

--- Overrides getNeedHourChanged and finalizeConstruction (the latter has no body in the SDK dump: UNVERIFIED).
---@param placeableType any
function PlaceableIncomePerHour.registerOverwrittenFunctions(placeableType) end

--- Subscribes to the load and hour-changed events.
---@param placeableType any
function PlaceableIncomePerHour.registerEventListeners(placeableType) end

--- Declares incomePerHour as a plain value and per configuration entry.
---@param schema any
---@param basePath any
function PlaceableIncomePerHour.registerXMLPaths(schema, basePath) end

--- Registers the incomePerHour store spec type (loader, getter, placeable species) and the incomePerHour configuration type with the placeable configuration manager.
function PlaceableIncomePerHour.initSpecialization() end

--- Reads the income for the selected configuration (default 1st), falling back to the base value then 0. The placeable counts as finished unless it has constructible states (getNumFinishedConstructibleStates).
---@param savegame table
function PlaceableIncomePerHour:onLoad(savegame) end

--- Always returns true so the placeable receives hour-changed events.
---@param superFunc any
function PlaceableIncomePerHour:getNeedHourChanged(superFunc) end

--- Server only. Skips unowned or unfinished placeables; otherwise adds getIncomePerHour times the environment time adjustment to the owner farm as PROPERTY_INCOME money.
function PlaceableIncomePerHour:onHourChanged() end

--- Returns the hourly income value (before the time adjustment factor).
function PlaceableIncomePerHour:getIncomePerHour() end

--- Store spec loader: returns a fixed income (first configuration or base value) and a variable income summed from wind turbine and first solar panel configuration, or nil if all are zero.
---@param xmlFile XMLFile
---@param customEnvironment string
---@param baseDir any
---@return table
function PlaceableIncomePerHour.loadSpecValueIncomePerHour(xmlFile, customEnvironment, baseDir) end

--- Formats the shop text per month (24 times the hourly value): a single amount, or a range from fixed to fixed plus variable income when a variable part exists. Returns nil without stored spec.
---@param storeItem table
---@param realItem table
---@return integer
function PlaceableIncomePerHour.getSpecValueIncomePerHour(storeItem, realItem) end
