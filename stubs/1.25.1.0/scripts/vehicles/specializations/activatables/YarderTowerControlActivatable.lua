---@meta
-- FS25 1.25.1.0 : vehicles/specializations/activatables/YarderTowerControlActivatable.lua (stub généré, atlas Lua FS25)

---@class YarderTowerControlActivatable
YarderTowerControlActivatable = {}

---@param vehicle table
---@return table
function YarderTowerControlActivatable.new(vehicle) end

---@param inputContext any
function YarderTowerControlActivatable:registerCustomInput(inputContext) end

---@param inputContext any
function YarderTowerControlActivatable:removeCustomInput(inputContext) end

function YarderTowerControlActivatable:onToggleFollowMeMode() end

function YarderTowerControlActivatable:onToggleFollowHome() end

function YarderTowerControlActivatable:onToggleFollowPickup() end

---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function YarderTowerControlActivatable:onManualControlLeftRight(actionName, inputValue, callbackState, isAnalog, isMouse) end

---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function YarderTowerControlActivatable:onManualControlUpDown(actionName, inputValue, callbackState, isAnalog, isMouse) end

---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function YarderTowerControlActivatable:onTreeAttach(actionName, inputValue, callbackState, isAnalog, isMouse) end

---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function YarderTowerControlActivatable:onTreeDetach(actionName, inputValue, callbackState, isAnalog, isMouse) end

---@param dt any
function YarderTowerControlActivatable:update(dt) end

function YarderTowerControlActivatable:updateActionEventTexts() end

function YarderTowerControlActivatable:getIsActivatable() end

function YarderTowerControlActivatable:activate() end

function YarderTowerControlActivatable:deactivate() end

---@param x any
---@param y any
---@param z any
function YarderTowerControlActivatable:getDistance(x, y, z) end

function YarderTowerControlActivatable:draw() end
