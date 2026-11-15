# gui/elements/FrameElement.lua

Source : `dataS/scripts/gui/elements/FrameElement.lua` — FS25 1.25.1.0

- **FrameElement** hérite de `GuiElement` (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FrameElement.new(target: any, customMt: any)` | 24 |  |
| `FrameElement:clone(parent: any, includeId: any, suppressOnCreate: any, blockFocusHandlingReload: any)` | 44 |  |
| `FrameElement:copyAttributes(src: any)` | 59 |  |
| `FrameElement:delete()` | 69 |  |
| `FrameElement:getRootElement()` | 82 |  |
| `FrameElement:exposeControlsAsFields(viewName: viewName)` | 100 |  |
| `FrameElement:disableInputForDuration(duration: number)` | 132 |  |
| `FrameElement:isInputDisabled()` | 138 |  |
| `FrameElement:update(dt: any)` | 144 |  |
| `FrameElement:setChangeScreenCallback(callback: function)` | 156 |  |
| `FrameElement:setInputContextCallback(callback: function)` | 163 |  |
| `FrameElement:setPlaySampleCallback(callback: function)` | 170 |  |
| `FrameElement:changeScreen(targetScreenClass: table, returnScreenClass: any)` | 177 |  |
| `FrameElement:toggleCustomInputContext(isContextActive: string, contextName: string)` | 190 |  |
| `FrameElement:playSample(sampleName: string)` | 200 |  |
