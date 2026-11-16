# gui/base/GuiMixin.lua

*[Version française](../../../fr/scripts/gui/base/GuiMixin.md)*

Source: `dataS/scripts/gui/base/GuiMixin.lua` — FS25 1.25.1.0

✍ Base class for GUI element mixins, small objects attached to a GuiElement to add behaviour. The mixin instance is stored on the element under its mixinType key, and concrete mixins subclass this class and override clone.

- **GuiMixin** (l.16)

## Functions

| Function | Line | Description |
|---|---|---|
| `GuiMixin.new(class: class, mixinType: mixinType) → New` | 24 | ✍ Creates a mixin instance; class defaults to the GuiMixin metatable and mixinType to GuiMixin. Subclasses pass their own type table, which is later used as the storage key on the element. |
| `GuiMixin:addTo(guiElement: any)` | 42 | ✍ Attaches this mixin to a GuiElement under element[mixinType] and copies the hasIncluded helper onto it. Returns true on success, false if that mixin type was already present. |
| `GuiMixin.hasIncluded(guiElement: guiElement, mixinType: mixinType)` | 57 | ✍ Returns true when the element holds an entry for the given mixin type. Installed on elements by addTo, so it can be called as element:hasIncluded(type). |
| `GuiMixin.cloneMixin(mixinType: any, srcGuiElement: any, dstGuiElement: any)` | 63 | ✍ Static helper that forwards to mixinType:clone to copy mixin state between two elements. |
| `GuiMixin:clone(srcGuiElement: any, dstGuiElement: any)` | 69 | ✍ Empty hook in the base class; subclasses override it to copy their state from the source element to the destination element. |
