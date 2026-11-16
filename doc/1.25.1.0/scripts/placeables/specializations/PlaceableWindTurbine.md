# placeables/specializations/PlaceableWindTurbine.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableWindTurbine.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableWindTurbine.lua` — FS25 1.25.1.0

✍ Placeable specialization (prerequisite: PlaceableIncomePerHour) that spins a rotor and orients a wind turbine head according to the wind, and adds an hourly income proportional to the rotor speed. WIND DATA: the specialization does not read the wind itself; it receives (windDirX, windDirZ, windVelocity, cirrusCloudSpeedFactor) through setWindValues, a signature modeled on a "wind changed" listener. The unit of windVelocity is m/s according to the XML comment on #optimalWindSpeed (speed at which the rotor reaches its max speed, default 15, clamped to 1..200). The only access to the wind source is in onDelete: g_currentMission.environment.weather.windUpdater:removeWindChangedListener(self); the symmetric subscription (addWindChangedListener) does NOT appear in this file of the dump: it should be in startWindTurbine, but that function is registered (registerFunction) without being defined in this file. Note: finalizeConstruction is likewise registered as an override without a definition here (not verified in game: either the definition is absent from the dump, or the reference is nil). WindUpdater and Weather are absent from the dump: UNVERIFIED for everything concerning call frequency and the origin of the wind. No other weather data (rain, moisture, temperature) is read. Effects: rotor rotation driven by animationNodes (speedFunc returns rotSpeedFactor), "idle" sound started as soon as the factor is > 0 (client only); head oriented opposite to the wind (Y rotation computed on -dirX, -dirZ) if #headAdjustToWind. Network: only the head rotation (compressed angle) is written/read in the initial stream (onWriteStream/onReadStream); rotSpeedFactor is not synchronized, each machine recomputes it from the wind it receives (unverified hypothesis: the wind is assumed identical on clients). Savegame: #headRotation. Extension points for a modder: registerFunction functions (updateHeadRotation, updateRotorRotSpeed, setWindValues, getWindTurbineLoad, startWindTurbine) overridable per placeable type; getIncomePerHour is a registered override; getWindTurbineLoad is a good external read point (0..1 factor).

- **PlaceableWindTurbine** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableWindTurbine.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Requires the PlaceableIncomePerHour specialization in the placeable type. |
| `PlaceableWindTurbine.registerFunctions(placeableType: any)` | 24 | ✍ Registers updateHeadRotation, updateRotorRotSpeed, setWindValues, getWindTurbineLoad and startWindTurbine (the latter is not defined in this file: Note, not verified in game). |
| `PlaceableWindTurbine.registerOverwrittenFunctions(placeableType: any)` | 34 | ✍ Declares the overrides getIncomePerHour and finalizeConstruction; only the first is defined in this file. |
| `PlaceableWindTurbine.registerEventListeners(placeableType: any)` | 41 | ✍ Subscribes the specialization to onLoad, onDelete, onFinalizePlacement, onReadStream and onWriteStream. |
| `PlaceableWindTurbine.registerXMLPaths(schema: any, basePath: any)` | 51 | ✍ Declares the windTurbine XML keys: #headNode, #headAdjustToWind, #rotationNode, #optimalWindSpeed (m/s), #incomePerHour, #isFinalized, as well as sounds and animationNodes. #rotationNode is declared but never read in this file (rotation is handled by the animationNodes). |
| `PlaceableWindTurbine.registerSavegameXMLPaths(schema: any, basePath: any)` | 66 | ✍ Declares the #headRotation save key (current head angle). |
| `PlaceableWindTurbine:onLoad(savegame: table)` | 75 | ✍ Reads the XML: head node, wind orientation option, optimal wind speed (default 15 m/s, clamped 1..200), hourly income (default 0) and #isFinalized (default true). On the client, loads the "idle" sound and the animationNodes whose speed follows rotSpeedFactor (initially 1). |
| `PlaceableWindTurbine:onDelete()` | 104 | ✍ Removes the placeable from the wind change listeners of weather.windUpdater (unguarded call: assumes the environment exists), then frees sounds and animations. Wind source not re-read (WindUpdater absent from the dump). |
| `PlaceableWindTurbine:onFinalizePlacement()` | 114 | ✍ Calls startWindTurbine if the turbine is already finalized (#isFinalized); the content of startWindTurbine is absent from this file. |
| `PlaceableWindTurbine:onReadStream(streamId: any, connection: any)` | 124 | ✍ Client: reads the compressed head angle if a head node exists. The rotor factor is not transmitted. |
| `PlaceableWindTurbine:onWriteStream(streamId: any, connection: any)` | 133 | ✍ Server: writes the compressed head angle if a head node exists. |
| `PlaceableWindTurbine:loadFromXMLFile(xmlFile: any, key: any)` | 142 | ✍ Restores the head rotation from the savegame (default 0) and applies it. |
| `PlaceableWindTurbine:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 152 | ✍ Writes the head rotation to the savegame. |
| `PlaceableWindTurbine:updateHeadRotation()` | 194 | ✍ Applies the value spec.headRotation as a world rotation around the Y axis of the head node (does nothing without a head node). |
| `PlaceableWindTurbine:updateRotorRotSpeed(windVelocity: any)` | 203 | ✍ Computes rotSpeedFactor = wind speed / optimal speed, clamped to 0..1; client side starts or stops the sound depending on whether the factor is positive. The wind is therefore only used through its magnitude, without gusts or smoothing in this file. |
| `PlaceableWindTurbine:setWindValues(windDirX: any, windDirZ: any, windVelocity: any, cirrusCloudSpeedFactor: any)` | 222 | ✍ Receives wind direction (X, Z), speed and cirrus speed factor (the latter ignored here). Orients the head opposite to the direction if #headAdjustToWind, then updates the rotor. Entry point to override or call in order to observe the wind passed to listeners (exact origin UNVERIFIED). |
| `PlaceableWindTurbine:getWindTurbineLoad()` | 234 | ✍ Returns the rotor load factor (0..1), i.e. rotSpeedFactor. |
| `PlaceableWindTurbine:getIncomePerHour(superFunc: any)` | 242 | ✍ Override: adds to the parent's hourly income the configured income multiplied by the rotor factor; zero income without wind. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `updateHeadRotation` | 25 |
| registerFunction | `updateRotorRotSpeed` | 26 |
| registerFunction | `setWindValues` | 27 |
| registerFunction | `getWindTurbineLoad` | 28 |
| registerFunction | `startWindTurbine` | 29 |
| registerOverwrittenFunction | `getIncomePerHour` | 35 |
| registerOverwrittenFunction | `finalizeConstruction` | 36 |
| registerEventListener | `onLoad` | 42 |
| registerEventListener | `onDelete` | 43 |
| registerEventListener | `onFinalizePlacement` | 44 |
| registerEventListener | `onReadStream` | 45 |
| registerEventListener | `onWriteStream` | 46 |
