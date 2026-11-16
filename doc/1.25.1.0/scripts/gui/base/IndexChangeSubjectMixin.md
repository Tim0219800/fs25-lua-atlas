# gui/base/IndexChangeSubjectMixin.lua

*[Version française](../../../fr/scripts/gui/base/IndexChangeSubjectMixin.md)*

Source: `dataS/scripts/gui/base/IndexChangeSubjectMixin.lua` — FS25 1.25.1.0

✍ GuiMixin that gives a GuiElement an observer list for index changes (paging, option selectors, lists). Observers register a callback receiving the new index and the item count. Prerequisite: the element must be decorated through the GuiMixin mechanism.

- **IndexChangeSubjectMixin** inherits from `GuiMixin` (l.21)

## Functions

| Function | Line | Description |
|---|---|---|
| `IndexChangeSubjectMixin.new()` | 25 | ✍ Creates the mixin with an empty callbacks table keyed by observer. Note: it passes `IndexableElementMixin_mt` to `GuiMixin.new`, apparently a copy-paste slip instead of its own metatable. |
| `IndexChangeSubjectMixin:addTo(guiElement: any)` | 34 | ✍ Attaches the mixin to a GuiElement through the parent `addTo` and, on success, adds `addIndexChangeObserver` and `notifyIndexChange` as methods of the element. Returns whether it was added. |
| `IndexChangeSubjectMixin.addIndexChangeObserver(guiElement: guiElement, observer: observer, indexChangeCallback: indexChangeCallback)` | 50 | ✍ Registers or replaces the callback of an observer; it is called as callback(observer, index, count). One callback per observer. |
| `IndexChangeSubjectMixin.notifyIndexChange(guiElement: guiElement, index: index, count: count)` | 59 | ✍ Calls every registered callback with the observer, the new index and the item count. Iteration uses `pairs`, so call order is not defined. |
| `IndexChangeSubjectMixin:clone(srcGuiElement: any, dstGuiElement: any)` | 69 | ✍ Copies the callbacks table (shallow clone) from a source GuiElement to its clone when the source has one. |
