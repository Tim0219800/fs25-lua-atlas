---@meta
-- FS25 1.25.1.0 : objects/VehicleSellingPoint.lua (generated stub, FS25 Lua Atlas)

---@class VehicleSellingPoint
VehicleSellingPoint = {}

---@class VehicleSellingPointActivatable
VehicleSellingPointActivatable = {}

---@param schema any
---@param basePath any
function VehicleSellingPoint.registerXMLPaths(schema, basePath) end

---@return table
function VehicleSellingPoint.new() end

---@param components any
---@param xmlFile any
---@param key any
---@param i3dMappings any
function VehicleSellingPoint:load(components, xmlFile, key, i3dMappings) end

function VehicleSellingPoint:delete() end

function VehicleSellingPoint:openMenu() end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function VehicleSellingPoint:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId any
function VehicleSellingPoint:sellAreaTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

function VehicleSellingPoint:determineCurrentVehicles() end

function VehicleSellingPoint:updateIconVisibility() end

---@param player any
function VehicleSellingPoint:playerFarmChanged(player) end

---@param ownerFarmId any
function VehicleSellingPoint:setOwnerFarmId(ownerFarmId) end

function VehicleSellingPoint:getOwnerFarmId() end

---@param sellingPoint any
---@param ownWorkshop any
function VehicleSellingPointActivatable.new(sellingPoint, ownWorkshop) end

function VehicleSellingPointActivatable:getIsActivatable() end

function VehicleSellingPointActivatable:run() end

---@param x any
---@param y any
---@param z any
function VehicleSellingPointActivatable:getDistance(x, y, z) end
