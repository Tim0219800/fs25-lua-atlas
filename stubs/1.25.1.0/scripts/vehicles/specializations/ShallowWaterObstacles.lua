---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ShallowWaterObstacles.lua (generated stub, FS25 Lua Atlas)

--- Always returns true: no other specialization is required.
---@param specializations any
function ShallowWaterObstacles.prerequisitesPresent(specializations) end

--- Declares the obstacle node XML schema: node, direction node (defaults to the node), size in meters (default 1 1 1) and local offset.
function ShallowWaterObstacles.initSpecialization() end

--- Registers `loadObstacleNodeFromXML` on the vehicle type.
---@param vehicleType any
function ShallowWaterObstacles.registerFunctions(vehicleType) end

--- Subscribes to onPostLoad, onLoadFinished and onDelete, but only if the platform supports shallow water simulation; otherwise registers nothing.
---@param vehicleType any
function ShallowWaterObstacles.registerEventListeners(vehicleType) end

--- Loads all `obstacleNode` entries from the XML. If none is valid, removes the other listeners and clears the list.
---@param savegame any
function ShallowWaterObstacles:onPostLoad(savegame) end

--- Registers each obstacle node with the shallow water simulation (`addObstacle` with size, callback and offset). Skipped while the vehicle is in the shop configuration state.
---@param savegame table
function ShallowWaterObstacles:onLoadFinished(savegame) end

--- Removes every registered obstacle from the shallow water simulation.
function ShallowWaterObstacles:onDelete() end

--- Reads one obstacle (node, direction node, size, offset) and initialises its last position. Returns false with an XML warning if the node is missing.
---@param xmlFile any
---@param key any
---@param obstacleNode any
function ShallowWaterObstacles:loadObstacleNodeFromXML(xmlFile, key, obstacleNode) end

--- Callback given to the simulation: returns the node's x and z velocity (unit direction of movement since the last call times the vehicle's signed speed times 1000) and the heading angle around Y of the direction node.
---@param obstacleNode any
function ShallowWaterObstacles.getShallowWaterParameters(obstacleNode) end
