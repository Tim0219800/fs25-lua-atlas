# gui/base/GuiTopDownCamera.lua

Source: `dataS/scripts/gui/base/GuiTopDownCamera.lua` — FS25 1.25.1.0

- **GuiTopDownCamera** (l.14)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `GuiTopDownCamera:createCameraNodes() → integer, integer` | 114 |  |
| `GuiTopDownCamera:delete()` | 130 |  |
| `GuiTopDownCamera:reset()` | 143 |  |
| `GuiTopDownCamera:setTerrainRootNode(terrainRootNode: any)` | 152 |  |
| `GuiTopDownCamera:activate()` | 159 |  |
| `GuiTopDownCamera:deactivate()` | 179 |  |
| `GuiTopDownCamera:getIsActive()` | 198 |  |
| `GuiTopDownCamera:setCameraPosition(mapX: number, mapZ: number)` | 206 |  |
| `GuiTopDownCamera:determineMapPosition() → number, number, number, number` | 218 |  |
| `GuiTopDownCamera:getPickRay()` | 224 |  |
| `GuiTopDownCamera:updatePosition()` | 235 |  |
| `GuiTopDownCamera:applyMovement(dt: any)` | 287 |  |
| `GuiTopDownCamera:setMouseEdgeScrollingActive(isActive: any)` | 330 |  |
| `GuiTopDownCamera:setEdgeScrollingOffset(xMin: number, yMin: number, xMax: number, yMax: number)` | 340 |  |
| `GuiTopDownCamera:getMouseEdgeScrollingMovement() → X, Z` | 351 |  |
| `GuiTopDownCamera:update(dt: any)` | 380 |  |
| `GuiTopDownCamera:updateMovement(dt: dt)` | 393 |  |
| `GuiTopDownCamera:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any)` | 435 |  |
| `GuiTopDownCamera:resetInputState()` | 460 |  |
| `GuiTopDownCamera:registerActionEvents()` | 470 |  |
| `GuiTopDownCamera:removeActionEvents()` | 491 |  |
| `GuiTopDownCamera:onZoom(_: any, inputValue: any, _: any, isAnalog: any, isMouse: any)` | 501 |  |
| `GuiTopDownCamera:onMoveSide(_: any, inputValue: any)` | 518 |  |
| `GuiTopDownCamera:onMoveForward(_: any, inputValue: any)` | 524 |  |
| `GuiTopDownCamera:onRotate(_: any, inputValue: any, _: any, isAnalog: any, isMouse: any)` | 530 |  |
| `GuiTopDownCamera:onTilt(_: any, inputValue: any, _: any, isAnalog: any, isMouse: any)` | 556 |  |
| `GuiTopDownCamera:onInputModeChanged(inputMode: any)` | 582 |  |

## Messages

- subscribes `MessageType.INPUT_MODE_CHANGED` (l.172)
