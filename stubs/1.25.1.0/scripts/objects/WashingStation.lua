---@meta
-- FS25 1.25.1.0 : objects/WashingStation.lua (stub généré, atlas Lua FS25)

---@class WashingStation : Object
WashingStation = {}

---@class WashingStationActivatable
WashingStationActivatable = {}

---@param schema any
---@param basePath any
function WashingStation.registerXMLPaths(schema, basePath) end

---@param washingStation any
---@param triggerNode any
function WashingStationActivatable.new(washingStation, triggerNode) end

function WashingStationActivatable:getIsActivatable() end

function WashingStationActivatable:run() end

---@param x any
---@param y any
---@param z any
function WashingStationActivatable:getDistance(x, y, z) end
