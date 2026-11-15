---@meta
-- FS25 1.25.1.0 : gui/hud/PlayerControlPadDisplay.lua (generated stub, FS25 Lua Atlas)

---@class PlayerControlPadDisplay : HUDDisplayElement
PlayerControlPadDisplay = {}

---@param hud string
---@param hudAtlasPath string
function PlayerControlPadDisplay.new(hud, hudAtlasPath) end

---@param player any
function PlayerControlPadDisplay:setPlayer(player) end

function PlayerControlPadDisplay:createComponents() end

---@param isVisible boolean
---@param animate boolean
function PlayerControlPadDisplay:setVisible(isVisible, animate) end

---@param position any
function PlayerControlPadDisplay:onSliderPositionChangedX(position) end

---@param position any
function PlayerControlPadDisplay:onSliderPositionChangedY(position) end

function PlayerControlPadDisplay:updateJoystickPosition() end

---@param inputHelpMode any
function PlayerControlPadDisplay:onInputHelpModeChange(inputHelpMode) end

function PlayerControlPadDisplay:updateVisibilityState() end

---@param dt any
function PlayerControlPadDisplay:update(dt) end

---@param isVisible any
function PlayerControlPadDisplay:onAnimateVisibilityFinished(isVisible) end

---@param uiScale any
function PlayerControlPadDisplay:setScale(uiScale) end

---@param scale scale
---@param width number
---@return number
---@return number
function PlayerControlPadDisplay.getBackgroundPosition(scale, width) end

function PlayerControlPadDisplay.createBackground() end
