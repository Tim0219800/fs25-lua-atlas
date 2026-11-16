# gui/elements/OptionToggleElement.lua

*[Version française](../../../fr/scripts/gui/elements/OptionToggleElement.md)*

Source: `dataS/scripts/gui/elements/OptionToggleElement.lua` — FS25 1.25.1.0

✍ Thin subclass of MultiTextOptionElement used for toggle-style options. It adds only a single field and no behaviour of its own in this dump, so everything else comes from the parent class.

- **OptionToggleElement** inherits from `MultiTextOptionElement` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `OptionToggleElement.new(target: any, custom_mt: any)` | 13 | ✍ Constructor. Builds a MultiTextOptionElement and adds a dataSouce field initialised to nil (the spelling comes from the source). Nothing else reads it in this file. |
