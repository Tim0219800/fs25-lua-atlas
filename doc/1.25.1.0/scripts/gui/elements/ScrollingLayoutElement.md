# gui/elements/ScrollingLayoutElement.lua

Source: `dataS/scripts/gui/elements/ScrollingLayoutElement.lua` — FS25 1.25.1.0

- **ScrollingLayoutElement** inherits from `BoxLayoutElement` (l.14)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ScrollingLayoutElement.new(target: any, custom_mt: any)` | 20 |  |
| `ScrollingLayoutElement:loadFromXML(xmlFile: any, key: any)` | 51 |  |
| `ScrollingLayoutElement:copyAttributes(src: any)` | 68 |  |
| `ScrollingLayoutElement:onGuiSetupFinished()` | 78 |  |
| `ScrollingLayoutElement:invalidateLayout(ignoreVisibility: any, blockLayoutUpdate: any)` | 115 |  |
| `ScrollingLayoutElement:onSliderValueChanged(slider: any, newValue: any)` | 161 |  |
| `ScrollingLayoutElement:scrollTo(startPos: any, updateSlider: any, noUpdateTarget: any)` | 181 |  |
| `ScrollingLayoutElement:raiseSliderUpdateEvent()` | 276 |  |
| `ScrollingLayoutElement:removeElement(element: any)` | 317 |  |
| `ScrollingLayoutElement:removeActionEvents()` | 481 |  |
| `ScrollingLayoutElement:onVerticalCursorInput(_: any, inputValue: any)` | 487 |  |
