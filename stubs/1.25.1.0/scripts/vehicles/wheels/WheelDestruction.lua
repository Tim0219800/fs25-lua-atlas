---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelDestruction.lua (generated stub, FS25 Lua Atlas)

--- Class (not a specialization) instantiated once per wheel (Wheel.lua:57, self.destruction) that handles the effect of wheels on the terrain: crop destruction, removal of fresh snow and smoothing of matter piles (density height). Called every frame from Wheels:onUpdate (Wheels.lua:865) only if the vehicle is active, with an allowFoliageDestruction flag = the fruitDestruction savegame option, and no active AI, and no block from getBlockFoliageDestruction. Execution: server always; client only under an update distance (WheelDestruction.MAX_UPDATE_DISTANCE, value not defined in this file: UNVERIFIED), but the effects on density (FSDensityMapUtil, snowSystem, smoothDensityMapHeightAtWorldPos) act on terrain data: their network synchronization is not in this file (UNVERIFIED). DATA READ: wheel contact (physics.contact, physics.hasSnowContact), real vehicle speed (lastSpeedReal > 0.0002, about 0.7 km/h according to the code comment), farm ownership of the parcel (g_farmlandManager), world snow height (snowSystem.height) and local height. NO rain or moisture data is read. No visual effect is produced here. "Care wheels" (#isCareWheel) do not destroy crops. Extension points: no registered function; override WheelDestruction.* (shared by all wheels) or Wheel:setIsCareWheel. The dt computation is only used for smoothing (at least 0.3 m/s of smoothing).
---@class WheelDestruction
WheelDestruction = {}

--- Creates the destruction object of a wheel: references to the wheel and the vehicle, list of destruction nodes and smoothing accumulator at zero.
---@param wheel any
function WheelDestruction.new(wheel) end

--- Reads #isCareWheel (default false) and physics#smoothGroundRadius (default: max(0.6, 0.75 x wheel width), in meters). Handles the old tire#isCareWheel key.
---@param xmlObject any
function WheelDestruction:loadFromXML(xmlObject) end

--- Builds the destruction nodes: one per visual wheel (node, width, radius); with no visual wheel (tracks, etc.), the physical wheel itself serves as the node.
function WheelDestruction:finalize() end

--- Per frame. If the wheel touches something and the vehicle is moving: (1) destroys the crops under a small parallelogram on the ground (wheel width, length at most 0.5 m), only on a parcel owned by the vehicle's active farm and outside care wheels; (2) if in contact with snow, removes snow by shifting the area by about 0.75 radius in the direction of travel. Then, if Platform.gameplay.wheelDensityHeightSmooth: accumulates a smoothing amount (1.2 m per meter traveled, at least 0.3 m/s x dt) and passes it to smoothHeightAtPosition under each node. The distance test only applies to the client.
---@param dt any
---@param allowFoliageDestruction any
function WheelDestruction:update(dt, allowFoliageDestruction) end

--- Delegates to FSDensityMapUtil.updateWheelDestructionArea on the given triangle (3 world points). The body of this function is absent from the dump (signature file): UNVERIFIED.
---@param x0 any
---@param z0 any
---@param x1 any
---@param z1 any
---@param x2 any
---@param z2 any
function WheelDestruction:destroyFruitArea(x0, z0, x1, z1, x2, z2) end

--- Removes snow only if the snow is fresh (local height equal to the global height within 5 mm) or if it is an unmelted pile (global height < 5 mm and local height > 1 m). Computes a sink depth (70 % of the global snow, or 10 % of the pile), converts it to SnowSystem.MIN_LAYER_HEIGHT layers then calls snowSystem:removeSnow. Useful for any snow/frost effect based on wheel passage.
---@param x0 any
---@param z0 any
---@param x1 any
---@param z1 any
---@param x2 any
---@param z2 any
function WheelDestruction:destroySnowArea(x0, z0, x1, z1, x2, z2) end

--- Smooths a pile of matter (density height type) under the wheel if that type allows smoothing: converts the physical height to an internal height through the type's collision parameters, then calls smoothDensityMapHeightAtWorldPos on the terrain (given radius, 1.2 m margin). Fixed vertical offset of -0.1 m.
---@param x any
---@param y any
---@param z any
---@param radius any
---@param amount any
function WheelDestruction:smoothHeightAtPosition(x, y, z, radius, amount) end

--- Debug: draws the wheel destruction areas (yellow parallelogram) for the wheels that are not care wheels.
function WheelDestruction:drawAreas() end

--- Enables or disables "care wheel" mode (no crop destruction).
---@param isCareWheel any
function WheelDestruction:setIsCareWheel(isCareWheel) end

--- Declares #isCareWheel and physics#smoothGroundRadius.
---@param schema any
---@param key any
function WheelDestruction.registerXMLPaths(schema, key) end
