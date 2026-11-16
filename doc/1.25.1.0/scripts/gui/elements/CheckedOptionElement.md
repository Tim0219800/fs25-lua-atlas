# gui/elements/CheckedOptionElement.lua

*[Version française](../../../fr/scripts/gui/elements/CheckedOptionElement.md)*

Source: `dataS/scripts/gui/elements/CheckedOptionElement.lua` — FS25 1.25.1.0

✍ Two-state off/on option element derived from MultiTextOptionElement; the states are the CheckedOptionElement.STATE_UNCHECKED and STATE_CHECKED constants (defined elsewhere). Client-side GUI.

- **CheckedOptionElement** inherits from `MultiTextOptionElement` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `CheckedOptionElement.new(target: any, custom_mt: any)` | 22 | ✍ Constructor; builds the element through MultiTextOptionElement. |
| `CheckedOptionElement:addElement(element: any)` | 30 | ✍ Adds a child; once the element count reaches 3, sets the option texts to the localized off/on labels (`ui_off`, `ui_on`) and reapplies the checked state. |
| `CheckedOptionElement:getIsChecked()` | 41 | ✍ Returns true when the current state equals STATE_CHECKED. |
| `CheckedOptionElement:setIsChecked(isChecked: any)` | 47 | ✍ Sets the state to STATE_CHECKED or STATE_UNCHECKED according to the boolean. |
