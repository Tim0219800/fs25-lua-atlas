# vehicles/specializations/Crawlers.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Crawlers.md)*

Source: `dataS/scripts/vehicles/specializations/Crawlers.lua` — FS25 1.25.1.0

✍ Specialization for tracked vehicles. For each crawler of the active wheel configuration it loads an external crawler XML and i3d (shared load), links it between two wheels or to a link node, then animates scrolling track textures via shader parameters and rotating parts from the speed of reference wheels or a reference node. It also handles dirt, mud and snow washable nodes, optional shallow-water obstacles and wheel water effects. Requires Wheels. Crawlers.getVRamUsageFromXML is referenced in initSpecialization but not defined in this file (UNVERIFIED), and the MAX_UPDATE_DISTANCE constants are not shown.

- **Crawlers** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Crawlers.prerequisitesPresent(specializations: table) → boolean` | 23 | ✍ Returns true only if the vehicle type has the Wheels specialization. |
| `Crawlers.initSpecialization()` | 29 | ✍ Registers a VRAM usage callback with the store manager, the crawler entries of each wheel configuration, and a separate 'crawler' XML schema (i3d file, scroller nodes, rotating parts, dirt nodes, animations, object changes) stored in Crawlers.xmlSchema. |
| `Crawlers.registerFunctions(vehicleType: any)` | 89 | ✍ Registers updateCrawler, loadCrawlerFromXML, loadCrawlerFromConfigFile, onCrawlerI3DLoaded and getCrawlerWheelMovedDistance. |
| `Crawlers.registerOverwrittenFunctions(vehicleType: any)` | 99 | ✍ Registers an override of validateWashableNode. |
| `Crawlers.registerEventListeners(vehicleType: any)` | 105 | ✍ Subscribes to load, load finished, delete, update and wheel configuration change. |
| `Crawlers:onLoad(savegame: table)` | 116 | ✍ Loads every crawler defined in the active wheel configuration through loadCrawlerFromXML and prepares the tables for shared i3d requests and XML handles. |
| `Crawlers:onLoadFinished(savegame: table)` | 133 | ✍ Removes the update listener if no crawler loaded; otherwise applies each crawler's rim material to the inner and outer rim materials and forces an initial updateCrawler. |
| `Crawlers:onDelete()` | 151 | ✍ Deletes pending XML handles, removes shallow water obstacles from the simulation, clears the crawler list and releases the shared i3d load requests. |
| `Crawlers:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 184 | ✍ Updates each crawler while the vehicle is within Crawlers.MAX_UPDATE_DISTANCE (value not in this file) of the player; beyond that, discards the stored last position. |
| `Crawlers:onWheelConfigurationChanged()` | 198 | ✍ Resets the dirt amount of each crawler's washable node to 0 when the wheel configuration changes. |
| `Crawlers:updateCrawler(crawler: any, dt: any)` | 210 | ✍ Computes the distance moved (from the speed reference node or from wheel rotation), scrolls the track shader parameters, rotates rotating parts and, within the alignment distance, repositions and orients the link node between the two reference wheels. |
| `Crawlers:loadCrawlerFromXML(xmlFile: XMLFile, key: any)` | 299 | ✍ Reads one crawler entry: link node or two link wheels, side, track width, offset, speed reference wheels or node, dirt and wetness factors, shallow water obstacle sized from the wheels, rim material, then starts loading the external config file. Returns nothing; skips the crawler with a warning if no link node exists. |
| `Crawlers:loadCrawlerFromConfigFile(crawler: any, xmlFilename: any, linkNode: any)` | 482 | ✍ Opens the crawler config XML and requests the shared i3d it names; onCrawlerI3DLoaded is called when it is ready. Logs warnings and cleans up if the XML or its i3d name is missing. |
| `Crawlers:onCrawlerI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 510 | ✍ Callback of the shared i3d load: links the left or right crawler node, applies offset, loads scroller nodes, rotating parts, dirt nodes, object changes and animations (added to the vehicle's animation table) and registers the crawler. Note: the early return on a missing previous-shader parameter skips the cleanup at the end of the function. |
| `Crawlers:getCrawlerWheelMovedDistance(crawler: table, lastName: string, useOnlyRotation: boolean) → number` | 654 | ✍ Returns, among the crawler wheels with ground contact, the smallest rotation difference or moved distance since the last call (stored under lastName); the sign gives the direction and 0 means no valid wheel. |
| `Crawlers:validateWashableNode(superFunc: any, node: any)` | 708 | ✍ For crawler dirt/snow nodes and mud meshes, returns false with the wheel dirt or mud update function and its data (dirt multipliers, snow save/load callbacks); other nodes go to the parent. Snow state uses g_currentMission.environment:getDirtColors, whose code is not in the dump (UNVERIFIED). |
| `Crawlers.getShallowWaterParameters(crawler: any)` | 807 | ✍ Callback for the shallow water obstacle: returns the x/z velocity from the vehicle's signed speed, a random jitter when the wheel slips or moves, and the link node's Y rotation. Note: 'math.random() * 2 - 1 * slip' multiplies only the 1 by slip because of operator precedence. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `updateCrawler` | 90 |
| registerFunction | `loadCrawlerFromXML` | 91 |
| registerFunction | `loadCrawlerFromConfigFile` | 92 |
| registerFunction | `onCrawlerI3DLoaded` | 93 |
| registerFunction | `getCrawlerWheelMovedDistance` | 94 |
| registerOverwrittenFunction | `validateWashableNode` | 100 |
| registerEventListener | `onLoad` | 106 |
| registerEventListener | `onLoadFinished` | 107 |
| registerEventListener | `onDelete` | 108 |
| registerEventListener | `onUpdate` | 109 |
| registerEventListener | `onWheelConfigurationChanged` | 110 |
