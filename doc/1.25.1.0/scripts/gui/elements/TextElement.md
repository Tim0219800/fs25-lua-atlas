# gui/elements/TextElement.lua

Source: `dataS/scripts/gui/elements/TextElement.lua` — FS25 1.25.1.0

- **TextElement** inherits from `GuiElement` (l.57)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `TextElement.new(target: any, custom_mt: any)` | 96 |  |
| `TextElement:loadFromXML(xmlFile: any, key: any)` | 164 |  |
| `TextElement:loadProfile(profile: any, applyProfile: any)` | 307 |  |
| `TextElement:copyAttributes(src: any)` | 423 |  |
| `TextElement:delete()` | 516 |  |
| `TextElement:setTextSize(size: any)` | 525 |  |
| `TextElement:setAbsolutePosition(x: any, y: any)` | 533 |  |
| `TextElement:setDisabled(isDisabled: any)` | 543 |  |
| `TextElement:updateAbsolutePosition()` | 551 |  |
| `TextElement:setText(text: any, forceTextSize: any, isInitializing: any, forceScrollingParameterUpdate: any) → string` | 572 |  |
| `TextElement:setTextInternal(text: any, forceTextSize: any, skipCallback: any, doNotUpdateSize: any)` | 586 |  |
| `TextElement:getText()` | 743 |  |
| `TextElement:setValue(value: any)` | 749 |  |
| `TextElement:getValue()` | 756 |  |
| `TextElement:setFormat(format: any)` | 762 |  |
| `TextElement:setLocaKey(key: any)` | 789 |  |
| `TextElement:updateFormattedText()` | 798 |  |
| `TextElement:updateScrollingParameters()` | 835 |  |
| `TextElement:setTextColor(r: any, g: any, b: any, a: any)` | 866 |  |
| `TextElement:setTextSelectedColor(r: any, g: any, b: any, a: any)` | 872 |  |
| `TextElement:setTextFocusedColor(r: any, g: any, b: any, a: any)` | 878 |  |
| `TextElement:setTextFocusedSelectedColor(r: any, g: any, b: any, a: any)` | 884 |  |
| `TextElement:setTextHighlightedSelectedColor(r: any, g: any, b: any, a: any)` | 890 |  |
| `TextElement:setTextHighlightedColor(r: any, g: any, b: any, a: any)` | 896 |  |
| `TextElement:getTextColor()` | 902 |  |
| `TextElement:setText2Color(r: any, g: any, b: any, a: any)` | 930 |  |
| `TextElement:setText2SelectedColor(r: any, g: any, b: any, a: any)` | 936 |  |
| `TextElement:setText2FocusedColor(r: any, g: any, b: any, a: any)` | 942 |  |
| `TextElement:setText2HighlightedColor(r: any, g: any, b: any, a: any)` | 948 |  |
| `TextElement:getText2Color()` | 954 |  |
| `TextElement:getTextWidth(useSourceText: any)` | 971 |  |
| `TextElement:getTextHeight(includeNegativeSpacing: any)` | 989 |  |
| `TextElement:getTextOffset()` | 1018 |  |
| `TextElement:getText2Offset()` | 1041 |  |
| `TextElement:getIsScrollingAllowed()` | 1053 |  |
| `TextElement:getTextLayoutMode()` | 1059 |  |
| `TextElement:getDoRenderText()` | 1069 |  |
| `TextElement:getTextPositionX()` | 1075 |  |
| `TextElement:getTextPositionY(lineHeight: any, totalHeight: any)` | 1087 |  |
| `TextElement:update(dt: any)` | 1113 |  |
| `TextElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 1145 |  |
| `TextElement:updateScrollingLayoutMode()` | 1267 |  |
| `TextElement:updateScaledWidth(xScale: number)` | 1278 |  |
| `TextElement:updateSize(forceTextSize: any)` | 1293 |  |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.780)
- subscribes `MessageType.SETTING_CHANGED` (l.782)
