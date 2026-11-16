---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableSolarPanels.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that adds solar panels: an optional head node that slowly turns toward the sun, and a weather-dependent income bonus. It requires PlaceableIncomePerHour and registers a `solarPanels` configuration type. Settings come from `placeable.solarPanels.solarPanelsConfigurations.solarPanelsConfiguration(?)`.
---@class PlaceableSolarPanels
PlaceableSolarPanels = {}

--- Returns true only if the placeable type includes the PlaceableIncomePerHour specialization.
---@param specializations table
---@return boolean
function PlaceableSolarPanels.prerequisitesPresent(specializations) end

--- Registers the `solarPanels` configuration type with the placeable configuration manager, using the localized label `configuration_solarPanel`.
function PlaceableSolarPanels.initSpecialization() end

--- Overrides `getIncomePerHour` and `getNeedHourChanged` on the placeable type.
---@param placeableType any
function PlaceableSolarPanels.registerOverwrittenFunctions(placeableType) end

--- Registers the new placeable function `updateHeadRotation`.
---@param placeableType any
function PlaceableSolarPanels.registerFunctions(placeableType) end

--- Subscribes to onLoad, onFinalizePlacement, onReadStream, onWriteStream, onHourChanged and onUpdate.
---@param placeableType any
function PlaceableSolarPanels.registerEventListeners(placeableType) end

--- Declares the XML keys of a solar panel configuration: `#headNode`, `#randomHeadOffsetRange` (default 15 degrees), `#rotationSpeed` (default 5 deg/s), `#isActive` and `#incomePerHour`.
---@param schema any
---@param basePath any
function PlaceableSolarPanels.registerXMLPaths(schema, basePath) end

--- Declares the savegame attribute `#headRotationRandom` used to store the random head offset.
---@param schema any
---@param basePath any
function PlaceableSolarPanels.registerSavegameXMLPaths(schema, basePath) end

--- Reads the selected solar configuration. With a head node it picks a random head offset (-range/2, 0 or +range/2) and sets the rotation speed; it also reads the income and whether panels exist. If there are none, it removes listeners; note that the removals target `Cover` instead of this class, so only onFinalizePlacement is really removed.
---@param savegame any
function PlaceableSolarPanels:onLoad(savegame) end

--- Aligns the head with the sun once placement is final, by calling `updateHeadRotation`.
function PlaceableSolarPanels:onFinalizePlacement() end

--- Reads `#headRotationRandom` from the savegame. Note: the condition is inverted (it assigns only when the value is nil), so the saved offset is never restored.
---@param xmlFile any
---@param key any
function PlaceableSolarPanels:loadFromXMLFile(xmlFile, key) end

--- Writes the random head rotation offset to the savegame when a head node exists.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableSolarPanels:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side: reads the compressed random head angle sent by the server when a head node exists.
---@param streamId any
---@param connection any
function PlaceableSolarPanels:onReadStream(streamId, connection) end

--- Server side: writes the random head angle as a compressed angle for joining clients when a head node exists.
---@param streamId any
---@param connection any
function PlaceableSolarPanels:onWriteStream(streamId, connection) end

--- Moves the current head rotation toward the target at the configured speed (scaled by `dt`) and applies it with `setDirection` on the head node; keeps the placeable active until the target is reached.
---@param dt any
function PlaceableSolarPanels:onUpdate(dt) end

--- Hourly callback that recomputes the head target rotation.
function PlaceableSolarPanels:onHourChanged() end

--- Computes the sun direction from the environment sun light and, when its X component exceeds 0.3 in absolute value, sets the head target angle (plus the random offset). Depends on `g_currentMission.environment`, UNVERIFIED (class absent from the dump).
function PlaceableSolarPanels:updateHeadRotation() end

--- Adds the configured solar income to the base value: full when the sun is on, times 0.75 in winter, times 0.1 when raining. Weather values come from `Environment`/`Weather`, UNVERIFIED.
---@param superFunc any
function PlaceableSolarPanels:getIncomePerHour(superFunc) end

--- Returns whether solar panels exist, so the hourly callback is only required for placeables that have them.
---@param superFunc any
function PlaceableSolarPanels:getNeedHourChanged(superFunc) end
