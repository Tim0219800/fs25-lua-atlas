---@meta
-- FS25 1.25.1.0 : gui/hud/SwitchVehicleDisplay.lua (generated stub, FS25 Lua Atlas)

---@class SwitchVehicleDisplay : HUDDisplayElement
SwitchVehicleDisplay = {}

---@param hud string
---@param hudAtlasPath string
---@param controlHudAtlasPath any
function SwitchVehicleDisplay.new(hud, hudAtlasPath, controlHudAtlasPath) end

---@param vehicle table
function SwitchVehicleDisplay:setVehicle(vehicle) end

---@param player any
function SwitchVehicleDisplay:setPlayer(player) end

function SwitchVehicleDisplay:createComponents() end

---@param x any
---@param y any
---@param isCancel any
function SwitchVehicleDisplay:onSwitchLeft(x, y, isCancel) end

---@param x any
---@param y any
---@param isCancel any
function SwitchVehicleDisplay:onSwitchRight(x, y, isCancel) end

---@param force any
function SwitchVehicleDisplay:updatePositionState(force) end

---@param inputHelpMode any
---@param force any
function SwitchVehicleDisplay:onInputHelpModeChange(inputHelpMode, force) end

---@param state any
function SwitchVehicleDisplay:onGyroscopeSteeringChanged(state) end

---@param state any
---@param force any
function SwitchVehicleDisplay:setPositionState(state, force) end

---@param uiScale any
function SwitchVehicleDisplay:setScale(uiScale) end

---@param scale scale
---@param width number
---@return number
---@return number
function SwitchVehicleDisplay.getBackgroundPosition(scale, width) end

function SwitchVehicleDisplay.createBackground() end
