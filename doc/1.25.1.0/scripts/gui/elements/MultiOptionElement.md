# gui/elements/MultiOptionElement.lua

*[Version française](../../../fr/scripts/gui/elements/MultiOptionElement.md)*

Source: `dataS/scripts/gui/elements/MultiOptionElement.lua` — FS25 1.25.1.0

✍ MultiOptionElement is a thin subclass of MultiTextOptionElement for multiple-choice text controls. It adds an empty options table and otherwise only forwards to the parent; the real behaviour lives in MultiTextOptionElement, which is not part of this file.

- **MultiOptionElement** inherits from `MultiTextOptionElement` (l.8)

## Functions

| Function | Line | Description |
|---|---|---|
| `MultiOptionElement.new(target: any, custom_mt: any)` | 14 | ✍ Constructor. Builds a MultiTextOptionElement and adds an empty options table. |
| `MultiOptionElement:loadFromXML(xmlFile: any, key: any)` | 24 | ✍ Only calls the parent loadFromXML, no extra keys. |
| `MultiOptionElement:loadProfile(profile: any, applyProfile: any)` | 30 | ✍ Only calls the parent loadProfile, no extra values. |
| `MultiOptionElement:copyAttributes(src: any)` | 36 | ✍ Only calls the parent copyAttributes. |
| `MultiOptionElement:setState(state: any, forceEvent: any)` | 42 | ✍ Forwards the state and the force-event flag to the parent setState. |
| `MultiOptionElement:getState()` | 48 | ✍ Returns the current state field (selected option index). |
