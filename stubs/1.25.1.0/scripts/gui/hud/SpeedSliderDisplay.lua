---@meta
-- FS25 1.25.1.0 : gui/hud/SpeedSliderDisplay.lua (stub généré, atlas Lua FS25)

---@class SpeedSliderDisplay : HUDDisplayElement
SpeedSliderDisplay = {}

---@param hud string
---@param hudAtlasPath string
---@param controlHudAtlasPath any
function SpeedSliderDisplay.new(hud, hudAtlasPath, controlHudAtlasPath) end

function SpeedSliderDisplay:delete() end

function SpeedSliderDisplay:createComponents() end

---@param state any
function SpeedSliderDisplay:setSliderState(state) end

function SpeedSliderDisplay:hideSlider() end

function SpeedSliderDisplay:showSlider() end

function SpeedSliderDisplay:updateElementsVisibility() end

---@param visibility any
function SpeedSliderDisplay:onSliderVisibilityChangeFinished(visibility) end

---@param vehicle table
function SpeedSliderDisplay:setVehicle(vehicle) end

---@param player any
function SpeedSliderDisplay:setPlayer(player) end

---@param position any
---@param size any
---@param color any
function SpeedSliderDisplay:createBar(position, size, color) end

---@param position any
function SpeedSliderDisplay:onSliderPositionChanged(position) end

function SpeedSliderDisplay:getAccelerateAndBrakeValue() end

function SpeedSliderDisplay:onJumpEventCallback() end

---@param dt any
function SpeedSliderDisplay:update(dt) end

function SpeedSliderDisplay:getIsSliderActive() end

---@param inputHelpMode any
function SpeedSliderDisplay:onInputHelpModeChange(inputHelpMode) end

---@param state any
---@param vehicle any
function SpeedSliderDisplay:onAIVehicleStateChanged(state, vehicle) end

function SpeedSliderDisplay:updateVisibilityState() end

function SpeedSliderDisplay:draw() end

---@param guiName any
---@param overlappingDialog any
function SpeedSliderDisplay:onDialogOpened(guiName, overlappingDialog) end

function SpeedSliderDisplay:onGuiOpen() end

---@param uiScale any
function SpeedSliderDisplay:setScale(uiScale) end

---@param scale scale
---@param width number
---@return number
---@return number
function SpeedSliderDisplay.getBackgroundPosition(scale, width) end

function SpeedSliderDisplay.createBackground() end
