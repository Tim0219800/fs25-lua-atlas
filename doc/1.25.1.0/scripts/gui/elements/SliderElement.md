# gui/elements/SliderElement.lua

Source : `dataS/scripts/gui/elements/SliderElement.lua` — FS25 1.25.1.0

- **SliderElement** hérite de `GuiElement` (l.36)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SliderElement.new(target: any, custom_mt: any)` | 46 |  |
| `SliderElement:delete()` | 96 |  |
| `SliderElement:loadFromXML(xmlFile: any, key: any)` | 107 |  |
| `SliderElement:loadProfile(profile: any, applyProfile: any)` | 164 |  |
| `SliderElement:copyAttributes(src: any)` | 210 |  |
| `SliderElement:setSliderVisible(visible: any)` | 249 |  |
| `SliderElement:onGuiSetupFinished()` | 255 |  |
| `SliderElement:addElement(element: any)` | 297 |  |
| `SliderElement:setDataElement(element: any)` | 331 |  |
| `SliderElement:setValue(newValue: any, doNotUpdateDataElement: any, immediateMode: any)` | 347 |  |
| `SliderElement:updateSliderButtons()` | 400 |  |
| `SliderElement:setMinValue(minValue: any)` | 412 |  |
| `SliderElement:setMaxValue(maxValue: any, newCurrentValue: any)` | 425 |  |
| `SliderElement:getMinValue()` | 442 |  |
| `SliderElement:getMaxValue()` | 448 |  |
| `SliderElement:getValue()` | 454 |  |
| `SliderElement:updateAbsolutePosition()` | 460 |  |
| `SliderElement:setSize(x: any, y: any)` | 467 |  |
| `SliderElement:setSliderSize(visibleItems: any, maxItems: any)` | 474 |  |
| `SliderElement:updateSliderLimits()` | 501 |  |
| `SliderElement:setAlpha(alpha: any)` | 511 |  |
| `SliderElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 523 |  |
| `SliderElement:updateSliderPosition()` | 608 |  |
| `SliderElement:callOnChanged()` | 630 |  |
| `SliderElement:keyEvent(unicode: any, sym: any, modifier: any, isDown: any, eventUsed: any)` | 636 |  |
| `SliderElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 648 |  |
| `SliderElement:canReceiveFocus()` | 707 |  |
| `SliderElement:onFocusActivate()` | 713 |  |
| `SliderElement:onScrollUp()` | 719 |  |
| `SliderElement:onScrollDown()` | 725 |  |
| `SliderElement:onBindUpdate(element: any)` | 731 |  |
| `SliderElement:isOutOfBound(posX: any, posY: any)` | 776 |  |
