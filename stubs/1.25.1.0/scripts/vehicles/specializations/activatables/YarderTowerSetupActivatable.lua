---@meta
-- FS25 1.25.1.0 : vehicles/specializations/activatables/YarderTowerSetupActivatable.lua (stub généré, atlas Lua FS25)

---@class YarderTowerSetupActivatable
YarderTowerSetupActivatable = {}

---@param vehicle table
---@return table
function YarderTowerSetupActivatable.new(vehicle) end

---@param inputContext any
function YarderTowerSetupActivatable:registerCustomInput(inputContext) end

---@param inputContext any
function YarderTowerSetupActivatable:removeCustomInput(inputContext) end

function YarderTowerSetupActivatable:onToggleSetupMode() end

function YarderTowerSetupActivatable:onSetTarget() end

function YarderTowerSetupActivatable:updateActionEventTexts() end

function YarderTowerSetupActivatable:getIsActivatable() end

function YarderTowerSetupActivatable:activate() end

function YarderTowerSetupActivatable:deactivate() end

---@param x any
---@param y any
---@param z any
function YarderTowerSetupActivatable:getDistance(x, y, z) end

function YarderTowerSetupActivatable:draw() end
