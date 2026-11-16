---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Crawlers.lua (generated stub, FS25 Lua Atlas)

--- Specialization for tracked vehicles. For each crawler of the active wheel configuration it loads an external crawler XML and i3d (shared load), links it between two wheels or to a link node, then animates scrolling track textures via shader parameters and rotating parts from the speed of reference wheels or a reference node. It also handles dirt, mud and snow washable nodes, optional shallow-water obstacles and wheel water effects. Requires Wheels. Crawlers.getVRamUsageFromXML is referenced in initSpecialization but not defined in this file (UNVERIFIED), and the MAX_UPDATE_DISTANCE constants are not shown.
---@class Crawlers
Crawlers = {}

--- Returns true only if the vehicle type has the Wheels specialization.
---@param specializations table
---@return boolean
function Crawlers.prerequisitesPresent(specializations) end

--- Registers a VRAM usage callback with the store manager, the crawler entries of each wheel configuration, and a separate 'crawler' XML schema (i3d file, scroller nodes, rotating parts, dirt nodes, animations, object changes) stored in Crawlers.xmlSchema.
function Crawlers.initSpecialization() end

--- Registers updateCrawler, loadCrawlerFromXML, loadCrawlerFromConfigFile, onCrawlerI3DLoaded and getCrawlerWheelMovedDistance.
---@param vehicleType any
function Crawlers.registerFunctions(vehicleType) end

--- Registers an override of validateWashableNode.
---@param vehicleType any
function Crawlers.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, load finished, delete, update and wheel configuration change.
---@param vehicleType any
function Crawlers.registerEventListeners(vehicleType) end

--- Loads every crawler defined in the active wheel configuration through loadCrawlerFromXML and prepares the tables for shared i3d requests and XML handles.
---@param savegame table
function Crawlers:onLoad(savegame) end

--- Removes the update listener if no crawler loaded; otherwise applies each crawler's rim material to the inner and outer rim materials and forces an initial updateCrawler.
---@param savegame table
function Crawlers:onLoadFinished(savegame) end

--- Deletes pending XML handles, removes shallow water obstacles from the simulation, clears the crawler list and releases the shared i3d load requests.
function Crawlers:onDelete() end

--- Updates each crawler while the vehicle is within Crawlers.MAX_UPDATE_DISTANCE (value not in this file) of the player; beyond that, discards the stored last position.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Crawlers:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Resets the dirt amount of each crawler's washable node to 0 when the wheel configuration changes.
function Crawlers:onWheelConfigurationChanged() end

--- Computes the distance moved (from the speed reference node or from wheel rotation), scrolls the track shader parameters, rotates rotating parts and, within the alignment distance, repositions and orients the link node between the two reference wheels.
---@param crawler any
---@param dt any
function Crawlers:updateCrawler(crawler, dt) end

--- Reads one crawler entry: link node or two link wheels, side, track width, offset, speed reference wheels or node, dirt and wetness factors, shallow water obstacle sized from the wheels, rim material, then starts loading the external config file. Returns nothing; skips the crawler with a warning if no link node exists.
---@param xmlFile XMLFile
---@param key any
function Crawlers:loadCrawlerFromXML(xmlFile, key) end

--- Opens the crawler config XML and requests the shared i3d it names; onCrawlerI3DLoaded is called when it is ready. Logs warnings and cleans up if the XML or its i3d name is missing.
---@param crawler any
---@param xmlFilename any
---@param linkNode any
function Crawlers:loadCrawlerFromConfigFile(crawler, xmlFilename, linkNode) end

--- Callback of the shared i3d load: links the left or right crawler node, applies offset, loads scroller nodes, rotating parts, dirt nodes, object changes and animations (added to the vehicle's animation table) and registers the crawler. Note: the early return on a missing previous-shader parameter skips the cleanup at the end of the function.
---@param i3dNode any
---@param failedReason any
---@param args any
function Crawlers:onCrawlerI3DLoaded(i3dNode, failedReason, args) end

--- Returns, among the crawler wheels with ground contact, the smallest rotation difference or moved distance since the last call (stored under lastName); the sign gives the direction and 0 means no valid wheel.
---@param crawler table
---@param lastName string
---@param useOnlyRotation boolean
---@return number
function Crawlers:getCrawlerWheelMovedDistance(crawler, lastName, useOnlyRotation) end

--- For crawler dirt/snow nodes and mud meshes, returns false with the wheel dirt or mud update function and its data (dirt multipliers, snow save/load callbacks); other nodes go to the parent. Snow state uses g_currentMission.environment:getDirtColors, whose code is not in the dump (UNVERIFIED).
---@param superFunc any
---@param node any
function Crawlers:validateWashableNode(superFunc, node) end

--- Callback for the shallow water obstacle: returns the x/z velocity from the vehicle's signed speed, a random jitter when the wheel slips or moves, and the link node's Y rotation. Note: 'math.random() * 2 - 1 * slip' multiplies only the 1 by slip because of operator precedence.
---@param crawler any
function Crawlers.getShallowWaterParameters(crawler) end
