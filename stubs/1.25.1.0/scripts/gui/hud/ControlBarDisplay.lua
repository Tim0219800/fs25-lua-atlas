---@meta
-- FS25 1.25.1.0 : gui/hud/ControlBarDisplay.lua (generated stub, FS25 Lua Atlas)

---@class ControlBarDisplay : HUDDisplayElement
ControlBarDisplay = {}

---@param hud string
---@param hudAtlasPath string
---@param controlHudAtlasPath any
function ControlBarDisplay.new(hud, hudAtlasPath, controlHudAtlasPath) end

function ControlBarDisplay:createComponents() end

---@param vehicle table
function ControlBarDisplay:setVehicle(vehicle) end

---@param player any
function ControlBarDisplay:setPlayer(player) end

---@param dt any
function ControlBarDisplay:update(dt) end

---@param inputHelpMode any
---@param force any
function ControlBarDisplay:onInputHelpModeChange(inputHelpMode, force) end

---@param state any
---@param vehicle any
---@param force any
function ControlBarDisplay:onAIVehicleStateChanged(state, vehicle, force) end

---@param state any
function ControlBarDisplay:onGyroscopeSteeringChanged(state) end

---@param force any
function ControlBarDisplay:updatePositionState(force) end

---@param state any
---@param force any
function ControlBarDisplay:setPositionState(state, force) end

function ControlBarDisplay:addFillLevelControl() end

---@param fillType any
---@param fillLevel any
---@param capacity any
---@param precision any
---@param maxReached any
function ControlBarDisplay:addFillLevel(fillType, fillLevel, capacity, precision, maxReached) end

---@param vehicle any
function ControlBarDisplay:updateFillLevelBuffers(vehicle) end

---@param a any
---@param b any
function ControlBarDisplay.sortFillLevelBuffers(a, b) end

---@param fillLevelControl any
---@param fillLevelBuffer any
function ControlBarDisplay:updateFillLevelControl(fillLevelControl, fillLevelBuffer) end

---@param uiScale any
function ControlBarDisplay:setScale(uiScale) end

---@param scale scale
---@param width number
---@return number
---@return number
function ControlBarDisplay.getBackgroundPosition(scale, width) end

function ControlBarDisplay.createBackground() end
