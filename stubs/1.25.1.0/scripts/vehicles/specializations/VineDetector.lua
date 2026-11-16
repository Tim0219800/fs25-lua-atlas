---@meta
-- FS25 1.25.1.0 : vehicles/specializations/VineDetector.lua (generated stub, FS25 Lua Atlas)

--- Registers the XML paths `vehicle.vineDetector.raycast#node` and `#maxDistance` (default 1).
function VineDetector.initSpecialization() end

--- Always returns true: no prerequisites.
---@param specializations any
function VineDetector.prerequisitesPresent(specializations) end

--- Registers ten functions on the vehicle type (raycast callback, finish/cancel detection, placeable validation and handling, hit position and distance getters). Their implementations are not in this file (UNVERIFIED).
---@param vehicleType any
function VineDetector.registerFunctions(vehicleType) end

--- Subscribes to onLoad and onUpdate.
---@param vehicleType any
function VineDetector.registerEventListeners(vehicleType) end

--- Loads the raycast node (warning if missing) and max distance, and initializes the raycast state table (hit positions, distance, current node) and the detection-active flag.
---@param savegame any
function VineDetector:onLoad(savegame) end

--- Server only: while `getCanStartVineDetection` is true, launches one asynchronous raycast at a time from the node along its -Y direction (callback `raycastCallbackVineDetection`, mask STATIC_OBJECT). When detection is no longer allowed, clears the current vine placeable and calls `finishedVineDetection`. A TODO in the source questions whether the mask is sufficient.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function VineDetector:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end
