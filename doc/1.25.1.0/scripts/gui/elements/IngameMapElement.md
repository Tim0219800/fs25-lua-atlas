# gui/elements/IngameMapElement.lua

Source: `dataS/scripts/gui/elements/IngameMapElement.lua` — FS25 1.25.1.0

- **IngameMapElement** inherits from `GuiElement` (l.24)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `IngameMapElement.new(target: any, custom_mt: any)` | 35 |  |
| `IngameMapElement:delete()` | 106 |  |
| `IngameMapElement:loadFromXML(xmlFile: any, key: any)` | 115 |  |
| `IngameMapElement:loadProfile(profile: any, applyProfile: any)` | 132 |  |
| `IngameMapElement:copyAttributes(src: any)` | 142 |  |
| `IngameMapElement:onGuiSetupFinished()` | 159 |  |
| `IngameMapElement:addCursorDeadzone(screenX: any, screenY: any, width: any, height: any)` | 180 |  |
| `IngameMapElement:clearCursorDeadzones()` | 186 |  |
| `IngameMapElement:isInputInDeadzones(inputScreenX: any, inputScreenY: any)` | 192 |  |
| `IngameMapElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 206 |  |
| `IngameMapElement:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any, eventUsed: any)` | 289 |  |
| `IngameMapElement:moveCenter(x: any, y: any)` | 393 |  |
| `IngameMapElement:panToHotspot(hotspot: hotspot, extraOffsetX: any)` | 420 |  |
| `IngameMapElement:zoom(direction: zoomTarget, zoomTarget: any)` | 456 |  |
| `IngameMapElement:update(dt: any)` | 519 |  |
| `IngameMapElement:resetFrameInputState()` | 549 |  |
| `IngameMapElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 568 |  |
| `IngameMapElement:onOpen()` | 581 |  |
| `IngameMapElement:onClose()` | 602 |  |
| `IngameMapElement:reset()` | 612 |  |
| `IngameMapElement:updateCursor(deltaX: any, deltaY: any, dt: any)` | 625 |  |
| `IngameMapElement:selectHotspotAt(posX: any, posY: any)` | 672 |  |
| `IngameMapElement:selectHotspotFrom(hotspots: any, posX: any, posY: any)` | 696 |  |
| `IngameMapElement:getLocalPosition(posX: any, posY: any)` | 733 |  |
| `IngameMapElement:getLocalPointerTarget()` | 754 |  |
| `IngameMapElement:onClickMap(localPosX: any, localPosY: any)` | 787 |  |
| `IngameMapElement:localToWorldPos(localPosX: any, localPosY: any)` | 795 |  |
| `IngameMapElement:isPointVisible(x: any, z: any)` | 831 |  |
| `IngameMapElement:setIngameMap(ingameMap: any)` | 836 |  |
| `IngameMapElement:setTerrainSize(terrainSize: any)` | 845 |  |
| `IngameMapElement:registerActionEvents()` | 876 |  |
| `IngameMapElement:removeActionEvents()` | 890 |  |
| `IngameMapElement:onHorizontalCursorInput(_: any, inputValue: any)` | 900 |  |
| `IngameMapElement:onVerticalCursorInput(_: any, inputValue: any)` | 912 |  |
| `IngameMapElement:onAccept()` | 924 |  |
| `IngameMapElement:onZoomInput(_: inputValue, inputValue: direction, direction: any)` | 946 |  |
| `IngameMapElement:onPinchEvent(offset: number, pinchCenterX: pinchCenterX, pinchCenterY: pinchCenterY, distance: number)` | 958 |  |
| `IngameMapElement:checkAndResetMouse()` | 976 |  |
