# gui/elements/ToggleButtonElement.lua

*[Version française](../../../fr/scripts/gui/elements/ToggleButtonElement.md)*

Source: `dataS/scripts/gui/elements/ToggleButtonElement.lua` — FS25 1.25.1.0

✍ Two-state toggle button derived from BitmapElement. Its first child element is shown when checked and its second when unchecked; children's clicks are routed to onButtonClicked, which flips the state and calls the onClick callback. XML keys: onClick, isChecked. Focus handling is forwarded to the children.

- **ToggleButtonElement** inherits from `BitmapElement` (l.17)

## Functions

| Function | Line | Description |
|---|---|---|
| `ToggleButtonElement.new(target: any, custom_mt: any)` | 23 | ✍ Constructor. Creates the element on BitmapElement, initially unchecked. |
| `ToggleButtonElement:loadFromXML(xmlFile: any, key: any)` | 36 | ✍ Loads the onClick callback and the isChecked flag from XML and applies the state. |
| `ToggleButtonElement:loadProfile(profile: any, applyProfile: any)` | 45 | ✍ Loads isChecked from a GUI profile and applies the state. |
| `ToggleButtonElement:copyAttributes(src: any)` | 53 | ✍ Copies the checked state and click callback from a source element. |
| `ToggleButtonElement:setIsChecked(isChecked: any)` | 61 | ✍ Stores the state and shows the first child when checked, the second when not. Does not call the click callback. |
| `ToggleButtonElement:addElement(element: any)` | 73 | ✍ Adds a child; for the first two children it makes the toggle their target, redirects their click callback to onButtonClicked and re-applies checked and disabled state. |
| `ToggleButtonElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 85 | ✍ When active, highlights the button on hover (or unhighlights) and passes the event to the parent. Returns false when inactive. |
| `ToggleButtonElement:onButtonClicked()` | 101 | ✍ Flips the checked state, then calls onClickCallback as (target, self, isChecked) or (self, isChecked) when no target is set. |
| `ToggleButtonElement:canReceiveFocus()` | 115 | ✍ True unless the button is disabled or not visible. |
| `ToggleButtonElement:getFocusTarget()` | 122 | ✍ Always returns the toggle itself as the focus target, overriding parent behaviour. |
| `ToggleButtonElement:onFocusLeave()` | 129 | ✍ Forwards the focus-leave event to both child elements if present. |
| `ToggleButtonElement:onFocusEnter()` | 140 | ✍ Forwards the focus-enter event to both child elements if present. |
| `ToggleButtonElement:onFocusActivate()` | 151 | ✍ Activation via focus (e.g. confirm button) toggles the state like a click. |
