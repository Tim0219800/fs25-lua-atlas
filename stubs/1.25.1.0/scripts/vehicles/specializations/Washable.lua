---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Washable.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization (no prerequisites) that manages DIRT (accumulated mud/dust) and surface WETNESS of vehicles, through shader parameters on their nodes. It is the vanilla reference for any moisture/mud mod. MODEL: each "washable node" (nodeData) groups I3D nodes and carries dirtAmount (0..1), wetness (0..1), a dirt color and an update function updateFunc. The global node (index 1) covers all nodes carrying the shader parameter "scratches_dirt_snow_wetness" (components: y = dirt, w = wetness, judging by the setShaderParameter calls); nodes without this parameter are treated as "mudNodes" (shader with "mudAmount", "wetness", "dirtColor"). Other specializations (e.g. Wheels via validateWashableNode) create local nodes with their own function. SERVER / CLIENT: the simulation runs on the server only (onUpdateTick); values are sent to clients (dirt and wetness quantized, color if changed) and applied to the shaders on each machine by setNodeDirtAmount / setNodeWetness with send thresholds (Washable.SEND_THRESHOLD and SEND_THRESHOLD_WETNESS, defined outside this file: UNVERIFIED). WEATHER DATA READ: (1) onUpdateTick reads weather:getRainFallScale(), getTimeSinceLastRain() and getCurrentTemperature() (Washable.lua:~290-295; only if the vehicle allows rain washing, WASHTYPE_RAIN not blocked) and passes them to updateFunc; (2) getDirtMultiplier reads weather:getGroundWetness() (Washable.lua:685) to speed up fouling on fields: x(1 + wetness x wetMultiplier). Units and ranges of these values: Weather implementation absent from the dump, UNVERIFIED; the thresholds hard-coded here (rain > 0.1, time since last rain < 30, temperature > 0) suggest respectively a 0..1 scale, game minutes and degrees Celsius (unverified hypothesis). WETNESS is NOT computed here from the weather: updateWetness is called from outside by VehicleSystem:update (VehicleSystem.lua:~155-175) with dt multiplied by the effective time scale. TIME STEP: onUpdateTick uses the received dt directly (ms); time acceleration does not appear explicitly there (UNVERIFIED whether dt is already scaled elsewhere), whereas updateWetness receives dt x timeScale. Per-vehicle XML constants (vehicle.washable#...): dirtDuration (default 90 min), washDuration (1), rainWashDuration (10 min), wetDuration (10), dryDuration (120 min), workMultiplier (4), fieldMultiplier (2), wetMultiplier (5), blockedWashTypes. Game option: missionInfo.dirtInterval sets the soiling speed (1 = none, 2 = x0.25, 3 = x0.5, 4 and others = x1). Extension points for a modder: all the specialization's functions are registerFunction (replaceable per vehicle type); validateWashableNode is the intended hook to assign logic to a node (returns global/function/index/parameters); addWashableNode / addWashableNodes to add nodes afterwards; getDirtMultiplier and getWorkDirtMultiplier to change the fouling speed; setNodeDirtAmount, setNodeWetness and setNodeDirtColor to act on the synchronized look. What vanilla does NOT do here: no reading of wind, and no evaporation tied to temperature or sunshine (drying is a fixed rate modulated by dirt and speed).
---@class Washable
Washable = {}

--- No prerequisites.
---@param specializations any
function Washable.prerequisitesPresent(specializations) end

--- Declares the dirtNode save keys (#amount, #snowScale, #wetness) and the specialization's XML schema.
function Washable.initSpecialization() end

--- Registers all the public functions (dirt, wetness, node management, durations) as vehicle functions; all are replaceable by a mod.
---@param vehicleType any
function Washable.registerFunctions(vehicleType) end

--- Subscribes the specialization to onLoad, onLoadFinished, the network stream (initial and update read/write) and onUpdateTick.
---@param vehicleType any
function Washable.registerEventListeners(vehicleType) end

--- Reads the XML parameters (durations, multipliers, blocked wash types, wetnessIgnoreNode: nodes ignored for wetness) and creates the global node with Washable.updateDirtAmount as its function. Removes the onUpdateTick listener in store configuration (SHOP_CONFIG).
---@param savegame any
function Washable:onLoad(savegame) end

--- Adds all the washable nodes of the components, then restores dirt, wetness and node-specific data from the savegame; resets everything to zero without a savegame or if the dirt option is disabled (interval 1).
---@param savegame any
function Washable:onLoadFinished(savegame) end

--- Saves, per node, dirt, wetness and specific data (e.g. snowScale of wheels).
---@param xmlFile any
---@param key any
---@param usedModNames any
function Washable:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client: reads dirt, wetness and color of all nodes (initial state).
---@param streamId any
---@param connection any
function Washable:onReadStream(streamId, connection) end

--- Server: writes dirt, wetness and color of all nodes (initial state).
---@param streamId any
---@param connection any
function Washable:onWriteStream(streamId, connection) end

--- Client: reads the node values if the update flag is present.
---@param streamId any
---@param timestamp any
---@param connection any
function Washable:onReadUpdateStream(streamId, timestamp, connection) end

--- Server: writes the node values if the specialization's dirty flag is raised.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Washable:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Decodes, for each node, dirt and wetness (quantized with SEND_NUM_BITS / SEND_NUM_BITS_WETNESS, values defined outside the file: UNVERIFIED) and an optional color, then applies them to the shaders.
---@param self any
---@param streamId any
---@param connection any
function Washable.readWashableNodeData(self, streamId, connection) end

--- Encodes the same values; the colorChanged flag is only reset to false after the color has been written.
---@param self any
---@param streamId any
---@param connection any
function Washable.writeWashableNodeData(self, streamId, connection) end

--- Server only, per tick. Computes lastDirtMultiplier = getDirtMultiplier x the game's dirt interval x Platform.gameplay.dirtDurationScale. If rain washing is allowed, reads rainFallScale, time since last rain and current temperature. Calls each node's function with (dt, allowsWashingByRain, rainScale, timeSinceLastRain, temperature) and applies the returned dirt and wetness changes.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Washable:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Cleans the vehicle (washing): removes the requested amount (multiplied by the node's cleaningMultiplier, 4 for wheel mud) and adds 5 times that amount of wetness, in a forced (synchronized) way.
---@param amount any
function Washable:cleanVehicle(amount) end

--- Default function of the global node. Under rain (rainScale > 0.1, time since last rain < 30, temperature > 0), if dirt exceeds 0.5 and the vehicle is not on a field or drives slower than 1 km/h (per the hard-coded threshold), rain washes: change -(dt / rainWashDuration). The soiling multiplier is multiplied by 2.5 under this rain (mud splashes more). Note: since the soiling is then assigned without adding (assignment, not accumulation) when dirtMultiplier is non-zero, the rain washing computed just before is overwritten as soon as the vehicle gets dirty (not verified in game).
---@param nodeData any
---@param dt any
---@param allowsWashingByRain any
---@param rainScale any
---@param timeSinceLastRain any
---@param temperature any
function Washable:updateDirtAmount(nodeData, dt, allowsWashingByRain, rainScale, timeSinceLastRain, temperature) end

--- Adds an amount of dirt to all nodes (clamped 0..1), with a force option to synchronize.
---@param dirtAmount any
---@param force any
function Washable:addDirtAmount(dirtAmount, force) end

--- Sets the dirt of all nodes; for wheel nodes (non-nil wheelDirtNode) converts the value with (x - 0.75) / 0.25 because wheel mud is handled separately.
---@param dirtAmount any
function Washable:setDirtAmount(dirtAmount) end

--- Returns the dirt of the global node (index 1), 0 without a node.
function Washable:getDirtAmount() end

--- Clamps the dirt (0..1) and, beyond the send threshold or if forced, applies it to the shader parameter "scratches_dirt_snow_wetness" (y component) of the nodes and to the "mudAmount" parameter of the mudNodes (fade from 75% dirt for the vehicle's mud meshes; direct for wheels). Raises the network flag server side.
---@param nodeData any
---@param dirtAmount any
---@param force any
function Washable:setNodeDirtAmount(nodeData, dirtAmount, force) end

--- Returns the dirt of a node.
---@param nodeData any
function Washable:getNodeDirtAmount(nodeData) end

--- Changes the dirt color (shader parameter "dirtColor") of the nodes and mudNodes if the difference exceeds the threshold or if forced; flags the color to be sent and raises the network flag server side.
---@param nodeData any
---@param r any
---@param g any
---@param b any
---@param force any
function Washable:setNodeDirtColor(nodeData, r, g, b, force) end

--- Called from outside (VehicleSystem:update). Under rain: wetness + dt x wetDuration x (1 + min(speed km/h / 10, 1)). Without rain: dries by dt x dryDuration x factor (0.5 to 1, slower if the vehicle is very dirty) x (1 + min(speed km/h / 10, 1)). Drying does not depend on any sun, temperature or wind data.
---@param isRaining any
---@param dt any
function Washable:updateWetness(isRaining, dt) end

--- True if at least one node has positive wetness.
function Washable:getIsWet() end

--- Adds wetness to all nodes (also used by the console command gsVehicleAddWetness).
---@param amount any
function Washable:addWetnessAmount(amount) end

--- Clamps the wetness (0..1) and applies it to the wetness component of the shader "scratches_dirt_snow_wetness" and to the "wetness" parameter of the mudNodes, excluding nodes excluded via wetnessIgnoreNode; own send threshold; raises the network flag server side.
---@param nodeData any
---@param wetness any
---@param force any
function Washable:setNodeWetness(nodeData, wetness, force) end

--- Recursively walks a root node to find those carrying one of the Washable.SHADER_PARAMETERS (defined outside this file) and adds them, then reapplies the current dirt to all nodes.
---@param rootNode any
function Washable:addAllSubWashableNodes(rootNode) end

--- Adds a list of washable nodes.
---@param nodes any
function Washable:addWashableNodes(nodes) end

--- Queries validateWashableNode and files the node in the global node or in a local node depending on the answer.
---@param node any
function Washable:addWashableNode(node) end

--- By default, all nodes are global (returns true, nil). Overridden by Wheels and by other specializations (not read) to assign their own logic.
---@param node any
function Washable:validateWashableNode(node) end

--- Adds a node to the global node, with the wetness-use flag set to false if a parent is declared in wetnessIgnoreNode; distinguishes "classic" dirt nodes from mud nodes according to the shader parameter present.
---@param node any
function Washable:addToGlobalWashableNode(node) end

--- Returns the local washable node associated with a custom index (e.g. a wheel object).
---@param customIndex any
function Washable:getWashableNodeByCustomIndex(customIndex) end

--- Creates (or completes, if the custom index already exists) a local washable node: nodes/mudNodes tables, dirt and wetness at zero, default color = environment:getDirtColors (UNVERIFIED, Environment absent from the dump), update function and extra parameters copied into the node.
---@param node any
---@param updateFunc any
---@param customIndex any
---@param extraParams any
function Washable:addToLocalWashableNode(node, updateFunc, customIndex, extraParams) end

--- Recursively removes the washable nodes of a root node.
---@param rootNode any
function Washable:removeAllSubWashableNodes(rootNode) end

--- Removes a node from all washable nodes.
---@param node any
function Washable:removeWashableNode(node) end

--- Soiling multiplier: 0 below 1 km/h (per the hard-coded threshold on getLastSpeed), x fieldMultiplier on a field (self.isOnField), and on a field with wet ground x(1 + groundWetness x wetMultiplier) based on weather:getGroundWetness().
function Washable:getDirtMultiplier() end

--- Returns workMultiplier (default 4), used by working tools to get dirty faster.
function Washable:getWorkDirtMultiplier() end

--- Returns the washing duration in ms.
function Washable:getWashDuration() end

--- Converts the game option dirtInterval into a factor: 1 -> 0, 2 -> 0.25, 3 -> 0.5, 4 -> 1 (other -> 1).
function Washable.getIntervalMultiplier() end

--- True if the wash type (e.g. WASHTYPE_RAIN) is not blocked in the vehicle's XML.
---@param type any
function Washable:getAllowsWashingByType(type) end

--- Debug: adds to a value list the dirt multiplier and, per node, the hourly dirt and wetness changes estimated with the current weather data.
---@param values any
function Washable:updateDebugValues(values) end
