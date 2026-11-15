---@meta
-- FS25 1.25.1.0 : gui/hud/SteeringSliderDisplay.lua (stub généré, atlas Lua FS25)

---@class SteeringSliderDisplay : HUDDisplayElement
SteeringSliderDisplay = {}

---@param hud string
---@param hudAtlasPath string
function SteeringSliderDisplay.new(hud, hudAtlasPath) end

function SteeringSliderDisplay:delete() end

---@param vehicle table
function SteeringSliderDisplay:setVehicle(vehicle) end

---@param player any
function SteeringSliderDisplay:setPlayer(player) end

function SteeringSliderDisplay:createComponents() end

---@param isVisible boolean
---@param animate boolean
function SteeringSliderDisplay:setVisible(isVisible, animate) end

---@param position any
function SteeringSliderDisplay:onSliderPositionChanged(position) end

function SteeringSliderDisplay:getSteeringValue() end

function SteeringSliderDisplay:getIsSliderActive() end

---@param inputHelpMode any
function SteeringSliderDisplay:onInputHelpModeChange(inputHelpMode) end

---@param state any
---@param vehicle any
function SteeringSliderDisplay:onAIVehicleStateChanged(state, vehicle) end

---@param state any
function SteeringSliderDisplay:onGyroscopeSteeringChanged(state) end

function SteeringSliderDisplay:updateVisibilityState() end

function SteeringSliderDisplay:onSteeringBackSpeedSettingChanged() end

---@param dt any
function SteeringSliderDisplay:update(dt) end

---@param uiScale any
function SteeringSliderDisplay:setScale(uiScale) end

---@param scale scale
---@param width number
---@return number
---@return number
function SteeringSliderDisplay.getBackgroundPosition(scale, width) end

function SteeringSliderDisplay.createBackground() end
