---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WorkArea.lua (generated stub, FS25 Lua Atlas)

--- Core specialization that gives implements work areas (start, width and height nodes forming a parallelogram) and runs their processing function every update tick. It requires GroundReference and supports a `workArea` configuration. Each tick it raises `onStartWorkAreaProcessing` and `onEndWorkAreaProcessing`, checks activity (ground contact, direction, lowered state) and farmland access, calls optional pre/process/post functions named in the XML, and adds worked hectares and time to farm stats. Registers the default and auxiliary area types. `getMissionByWorkArea` is registered as a vehicle function but its body is not in the dump (UNVERIFIED).
---@class WorkArea
WorkArea = {}

--- Registers the work area types `default` and `auxiliary`, adds the `workArea` configuration type, and declares the work area XML paths (base and per configuration) plus `#workAreaIndex` for speed rotating parts.
function WorkArea.initSpecialization() end

--- Registers the XML attributes of one work area under a base path: type, ground contact, backwards disabling, owned farmland requirement, function names, the three area nodes, ground reference node index and lowered-only flag.
---@param schema any
---@param basePath any
function WorkArea.registerWorkAreaXMLPaths(schema, basePath) end

--- Returns true only if the vehicle type has the GroundReference specialization.
---@param specializations any
function WorkArea.prerequisitesPresent(specializations) end

--- Registers the vehicle events `onStartWorkAreaProcessing` and `onEndWorkAreaProcessing`.
---@param vehicleType any
function WorkArea.registerEvents(vehicleType) end

--- Registers the work area API on the vehicle type: loading, lookup, activity, width, processing state, typed areas, farmland access, last worked area, mission lookup and AI width.
---@param vehicleType any
function WorkArea.registerFunctions(vehicleType) end

--- Overrides `loadSpeedRotatingPartFromXML`, `getIsSpeedRotatingPartActive`, `checkMovingPartDirtyUpdateNode` and `getImplementAllowAutomaticSteering`.
---@param vehicleType any
function WorkArea.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad and onUpdateTick.
---@param vehicleType any
function WorkArea.registerEventListeners(vehicleType) end

--- Selects the XML section of the chosen `workArea` configuration (falling back to `vehicle.workAreas`), loads every valid work area, computes widths and indexes areas by type. Initializes farmland warning state and texts.
---@param savegame table
function WorkArea:onLoad(savegame) end

--- Returns three values: whether the farm may work at x, z, the farmland owner id, and whether the land is buyable. Mission vehicles defer to `g_missionManager`; unowned or non-buyable land is refused.
---@param farmId boolean
---@param x integer
---@param z boolean
---@param workAreaType any
function WorkArea:getIsAccessibleAtWorldPosition(farmId, x, z, workAreaType) end

--- Keeps the largest worked area value reported during the current tick, later converted to hectares for stats.
---@param area any
function WorkArea:updateLastWorkedArea(area) end

--- Returns the farm id of the last farmland where an owned work area was accessible, or 0 if none.
function WorkArea:getLastTouchedFarmlandFarmId() end

--- Per tick: raises the start event, then for each non-auxiliary area checks activity and farmland access (testing start, width, height and the fourth corner), runs pre, main and post functions, and stores worked hectares and processing time. Shows a blinking warning if no area is on accessible buyable land, raises the end event, then adds hectares and minutes to farm stats.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function WorkArea:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Fills a work area table from XML and returns true on success. Validates the three nodes (distinct positions), type, ground reference (when ground contact is required), mandatory `functionName` that must exist on the vehicle, and optional pre/post functions. Note: the `workArea.type == nil` test can never trigger because of the `or WorkAreaType.DEFAULT` fallback just above it.
---@param workArea table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function WorkArea:loadWorkAreaFromXML(workArea, xmlFile, key) end

--- Returns the work area table at the given 1-based index, or nil.
---@param workAreaIndex any
function WorkArea:getWorkAreaByIndex(workAreaIndex) end

--- True if the area passes its conditions: ground reference node active (if required), not moving backwards (if `disableBackwards`), and implement lowered (if `onlyActiveWhenLowered`).
---@param workArea table
---@return boolean
function WorkArea:getIsWorkAreaActive(workArea) end

--- Recomputes the area's `workWidth` (meters) as the lateral spread of the start, width and height nodes measured from the first component. Does nothing if the index is invalid.
---@param workAreaIndex integer
function WorkArea:updateWorkAreaWidth(workAreaIndex) end

--- Returns the last computed width of the work area at the given index (no nil check on the index).
---@param workAreaIndex integer
function WorkArea:getWorkAreaWidth(workAreaIndex) end

--- True if the area produced a result within the last 200 ms of mission time.
---@param workArea table
function WorkArea:getIsWorkAreaProcessing(workArea) end

--- For the active areas of a type, returns a list of {x, z, x1, z1, x2, z2} corner coordinates to send over the network, a flag telling whether any area was refused for access, and the summed area size. When `needsFieldProperty` is set, checks the local farm's land access.
---@param areaType integer
---@param needsFieldProperty boolean
---@return table
---@return boolean
---@return number
function WorkArea:getTypedNetworkAreas(areaType, needsFieldProperty) end

--- Returns the table of work areas of a given type, or an empty table.
---@param areaType integer
---@return table
function WorkArea:getTypedWorkAreas(areaType) end

--- Returns whether at least one area of the type is active, plus the list of areas of that type.
---@param areaType integer
---@return boolean
---@return table
function WorkArea:getIsTypedWorkAreaActive(areaType) end

--- Returns the largest `workWidth` among areas whose type is flagged as an AI area by the work area type manager (0 if none).
function WorkArea:getAIWorkAreaWidth() end

--- Returns whether the not-owned-farmland warning was raised during the last tick.
function WorkArea:getIsFarmlandNotOwnedWarningShown() end

--- Extends the parent loader: after it succeeds, also reads `#workAreaIndex` into the speed rotating part. Returns false if the parent fails.
---@param superFunc table
---@param speedRotatingPart table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function WorkArea:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

--- If the part is tied to a work area, it is active only while that area is processing; an invalid index logs a warning and returns true. Otherwise defers to the parent. Note: the warning prints the index after it was set to nil.
---@param superFunc table
---@param speedRotatingPart table
---@return boolean
function WorkArea:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

--- Calls the parent check, then logs an XML error if a work area node or ground reference node is under a moving part with a limited update distance.
---@param superFunc any
---@param node any
---@param movingPart any
function WorkArea:checkMovingPartDirtyUpdateNode(superFunc, node, movingPart) end

--- Returns true if any work area has a type flagged for steering assist; otherwise defers to the parent.
---@param superFunc any
function WorkArea:getImplementAllowAutomaticSteering(superFunc) end
