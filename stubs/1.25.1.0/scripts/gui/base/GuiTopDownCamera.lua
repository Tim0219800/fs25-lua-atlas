---@meta
-- FS25 1.25.1.0 : gui/base/GuiTopDownCamera.lua (stub généré, atlas Lua FS25)

---@class GuiTopDownCamera
GuiTopDownCamera = {}

---@return integer
---@return integer
function GuiTopDownCamera:createCameraNodes() end

function GuiTopDownCamera:delete() end

function GuiTopDownCamera:reset() end

---@param terrainRootNode any
function GuiTopDownCamera:setTerrainRootNode(terrainRootNode) end

function GuiTopDownCamera:activate() end

function GuiTopDownCamera:deactivate() end

function GuiTopDownCamera:getIsActive() end

---@param mapX number
---@param mapZ number
function GuiTopDownCamera:setCameraPosition(mapX, mapZ) end

---@return number
---@return number
---@return number
---@return number
function GuiTopDownCamera:determineMapPosition() end

function GuiTopDownCamera:getPickRay() end

function GuiTopDownCamera:updatePosition() end

---@param dt any
function GuiTopDownCamera:applyMovement(dt) end

---@param isActive any
function GuiTopDownCamera:setMouseEdgeScrollingActive(isActive) end

---@param xMin number
---@param yMin number
---@param xMax number
---@param yMax number
function GuiTopDownCamera:setEdgeScrollingOffset(xMin, yMin, xMax, yMax) end

---@return X
---@return Z
function GuiTopDownCamera:getMouseEdgeScrollingMovement() end

---@param dt any
function GuiTopDownCamera:update(dt) end

---@param dt dt
function GuiTopDownCamera:updateMovement(dt) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
function GuiTopDownCamera:mouseEvent(posX, posY, isDown, isUp, button) end

function GuiTopDownCamera:resetInputState() end

function GuiTopDownCamera:registerActionEvents() end

function GuiTopDownCamera:removeActionEvents() end

---@param _ any
---@param inputValue any
---@param _ any
---@param isAnalog any
---@param isMouse any
function GuiTopDownCamera:onZoom(_, inputValue, _, isAnalog, isMouse) end

---@param _ any
---@param inputValue any
function GuiTopDownCamera:onMoveSide(_, inputValue) end

---@param _ any
---@param inputValue any
function GuiTopDownCamera:onMoveForward(_, inputValue) end

---@param _ any
---@param inputValue any
---@param _ any
---@param isAnalog any
---@param isMouse any
function GuiTopDownCamera:onRotate(_, inputValue, _, isAnalog, isMouse) end

---@param _ any
---@param inputValue any
---@param _ any
---@param isAnalog any
---@param isMouse any
function GuiTopDownCamera:onTilt(_, inputValue, _, isAnalog, isMouse) end

---@param inputMode any
function GuiTopDownCamera:onInputModeChanged(inputMode) end
