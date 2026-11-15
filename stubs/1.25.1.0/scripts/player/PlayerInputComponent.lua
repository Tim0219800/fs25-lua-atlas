---@meta
-- FS25 1.25.1.0 : player/PlayerInputComponent.lua (stub généré, atlas Lua FS25)

---@class PlayerInputComponent
PlayerInputComponent = {}

---@param player Player
---@return PlayerInputComponent
function PlayerInputComponent.new(player) end

---@param isControlling boolean
function PlayerInputComponent:addPauseListeners(isControlling) end

function PlayerInputComponent:registerActionEvents() end

function PlayerInputComponent:unregisterActionEvents() end

function PlayerInputComponent:resetState() end

function PlayerInputComponent:lock() end

function PlayerInputComponent:unlock() end

---@return number
---@return number
function PlayerInputComponent:calculateNormalisedMovementDirection() end

---@return number
---@return number
function PlayerInputComponent:calculateNormalisedWorldMovementDirection() end

---@param _ nil
---@param inputValue number
function PlayerInputComponent:onInputMoveSide(_, inputValue) end

---@param _ nil
---@param inputValue number
function PlayerInputComponent:onInputMoveForward(_, inputValue) end

---@param value any
function PlayerInputComponent:touchEventLookUpDown(value) end

---@param value any
function PlayerInputComponent:touchEventZoomInOut(value) end

---@param value any
function PlayerInputComponent:touchEventLookLeftRight(value) end

---@param _ nil
---@param inputValue number
---@param _ nil
---@param _ nil
---@param isMouse boolean
function PlayerInputComponent:onInputLookLeftRight(_, inputValue, _, _, isMouse) end

---@param _ nil
---@param inputValue number
---@param _ nil
---@param _ nil
---@param isMouse boolean
function PlayerInputComponent:onInputLookUpDown(_, inputValue, _, _, isMouse) end

---@param _ nil
---@param inputValue number
function PlayerInputComponent:onInputRun(_, inputValue) end

---@param _ nil
---@param inputValue number
function PlayerInputComponent:onInputChangeAltitude(_, inputValue) end

---@param _ nil
---@param inputValue number
function PlayerInputComponent:onInputJump(_, inputValue) end

---@param _ nil
---@param inputValue number
function PlayerInputComponent:onInputCrouch(_, inputValue) end

function PlayerInputComponent:onInputSwitchCamera() end

function PlayerInputComponent:onInputEnter() end

---@param isPaused boolean
function PlayerInputComponent:onGamePaused(isPaused) end

---@param x number
---@param y number
---@param textSize number
---@return number
function PlayerInputComponent:debugDraw(x, y, textSize) end
