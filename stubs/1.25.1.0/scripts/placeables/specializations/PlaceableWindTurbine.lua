---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableWindTurbine.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization (prerequisite: PlaceableIncomePerHour) that spins a rotor and orients a wind turbine head according to the wind, and adds an hourly income proportional to the rotor speed. WIND DATA: the specialization does not read the wind itself; it receives (windDirX, windDirZ, windVelocity, cirrusCloudSpeedFactor) through setWindValues, a signature modeled on a "wind changed" listener. The unit of windVelocity is m/s according to the XML comment on #optimalWindSpeed (speed at which the rotor reaches its max speed, default 15, clamped to 1..200). The only access to the wind source is in onDelete: g_currentMission.environment.weather.windUpdater:removeWindChangedListener(self); the symmetric subscription (addWindChangedListener) does NOT appear in this file of the dump: it should be in startWindTurbine, but that function is registered (registerFunction) without being defined in this file. Note: finalizeConstruction is likewise registered as an override without a definition here (not verified in game: either the definition is absent from the dump, or the reference is nil). WindUpdater and Weather are absent from the dump: UNVERIFIED for everything concerning call frequency and the origin of the wind. No other weather data (rain, moisture, temperature) is read. Effects: rotor rotation driven by animationNodes (speedFunc returns rotSpeedFactor), "idle" sound started as soon as the factor is > 0 (client only); head oriented opposite to the wind (Y rotation computed on -dirX, -dirZ) if #headAdjustToWind. Network: only the head rotation (compressed angle) is written/read in the initial stream (onWriteStream/onReadStream); rotSpeedFactor is not synchronized, each machine recomputes it from the wind it receives (unverified hypothesis: the wind is assumed identical on clients). Savegame: #headRotation. Extension points for a modder: registerFunction functions (updateHeadRotation, updateRotorRotSpeed, setWindValues, getWindTurbineLoad, startWindTurbine) overridable per placeable type; getIncomePerHour is a registered override; getWindTurbineLoad is a good external read point (0..1 factor).
---@class PlaceableWindTurbine
PlaceableWindTurbine = {}

--- Requires the PlaceableIncomePerHour specialization in the placeable type.
---@param specializations table
---@return boolean
function PlaceableWindTurbine.prerequisitesPresent(specializations) end

--- Registers updateHeadRotation, updateRotorRotSpeed, setWindValues, getWindTurbineLoad and startWindTurbine (the latter is not defined in this file: Note, not verified in game).
---@param placeableType any
function PlaceableWindTurbine.registerFunctions(placeableType) end

--- Declares the overrides getIncomePerHour and finalizeConstruction; only the first is defined in this file.
---@param placeableType any
function PlaceableWindTurbine.registerOverwrittenFunctions(placeableType) end

--- Subscribes the specialization to onLoad, onDelete, onFinalizePlacement, onReadStream and onWriteStream.
---@param placeableType any
function PlaceableWindTurbine.registerEventListeners(placeableType) end

--- Declares the windTurbine XML keys: #headNode, #headAdjustToWind, #rotationNode, #optimalWindSpeed (m/s), #incomePerHour, #isFinalized, as well as sounds and animationNodes. #rotationNode is declared but never read in this file (rotation is handled by the animationNodes).
---@param schema any
---@param basePath any
function PlaceableWindTurbine.registerXMLPaths(schema, basePath) end

--- Declares the #headRotation save key (current head angle).
---@param schema any
---@param basePath any
function PlaceableWindTurbine.registerSavegameXMLPaths(schema, basePath) end

--- Reads the XML: head node, wind orientation option, optimal wind speed (default 15 m/s, clamped 1..200), hourly income (default 0) and #isFinalized (default true). On the client, loads the "idle" sound and the animationNodes whose speed follows rotSpeedFactor (initially 1).
---@param savegame table
function PlaceableWindTurbine:onLoad(savegame) end

--- Removes the placeable from the wind change listeners of weather.windUpdater (unguarded call: assumes the environment exists), then frees sounds and animations. Wind source not re-read (WindUpdater absent from the dump).
function PlaceableWindTurbine:onDelete() end

--- Calls startWindTurbine if the turbine is already finalized (#isFinalized); the content of startWindTurbine is absent from this file.
function PlaceableWindTurbine:onFinalizePlacement() end

--- Client: reads the compressed head angle if a head node exists. The rotor factor is not transmitted.
---@param streamId any
---@param connection any
function PlaceableWindTurbine:onReadStream(streamId, connection) end

--- Server: writes the compressed head angle if a head node exists.
---@param streamId any
---@param connection any
function PlaceableWindTurbine:onWriteStream(streamId, connection) end

--- Restores the head rotation from the savegame (default 0) and applies it.
---@param xmlFile any
---@param key any
function PlaceableWindTurbine:loadFromXMLFile(xmlFile, key) end

--- Writes the head rotation to the savegame.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableWindTurbine:saveToXMLFile(xmlFile, key, usedModNames) end

--- Applies the value spec.headRotation as a world rotation around the Y axis of the head node (does nothing without a head node).
function PlaceableWindTurbine:updateHeadRotation() end

--- Computes rotSpeedFactor = wind speed / optimal speed, clamped to 0..1; client side starts or stops the sound depending on whether the factor is positive. The wind is therefore only used through its magnitude, without gusts or smoothing in this file.
---@param windVelocity any
function PlaceableWindTurbine:updateRotorRotSpeed(windVelocity) end

--- Receives wind direction (X, Z), speed and cirrus speed factor (the latter ignored here). Orients the head opposite to the direction if #headAdjustToWind, then updates the rotor. Entry point to override or call in order to observe the wind passed to listeners (exact origin UNVERIFIED).
---@param windDirX any
---@param windDirZ any
---@param windVelocity any
---@param cirrusCloudSpeedFactor any
function PlaceableWindTurbine:setWindValues(windDirX, windDirZ, windVelocity, cirrusCloudSpeedFactor) end

--- Returns the rotor load factor (0..1), i.e. rotSpeedFactor.
function PlaceableWindTurbine:getWindTurbineLoad() end

--- Override: adds to the parent's hourly income the configured income multiplied by the rotor factor; zero income without wind.
---@param superFunc any
function PlaceableWindTurbine:getIncomePerHour(superFunc) end
