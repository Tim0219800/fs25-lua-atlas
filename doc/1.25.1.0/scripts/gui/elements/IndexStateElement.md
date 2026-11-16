# gui/elements/IndexStateElement.lua

*[Version française](../../../fr/scripts/gui/elements/IndexStateElement.md)*

Source: `dataS/scripts/gui/elements/IndexStateElement.lua` — FS25 1.25.1.0

✍ IndexStateElement is a BoxLayoutElement that shows one small indicator per page or item, highlighting the current index. It clones a hidden template element for each page and listens to an indexable element (ListElement, PageElement, multi-option) that includes IndexChangeSubjectMixin. XML keys: stateElementTemplateId, indexableElementId, reverseElements, indexMinimizeWidth. Views may also drive it by hand.

- **IndexStateElement** inherits from `BoxLayoutElement` (l.21)

## Functions

| Function | Line | Description |
|---|---|---|
| `IndexStateElement.new(target: any, custom_mt: any)` | 27 | ✍ Constructor. Creates empty page element list, current page index 1, no template or indexable element, and the reverse and minimize-width flags off. |
| `IndexStateElement:loadFromXML(xmlFile: any, key: any)` | 55 | ✍ Reads stateElementTemplateId, indexableElementId, reverseElements and indexMinimizeWidth from the XML node after the parent load. |
| `IndexStateElement:loadProfile(profile: any, applyProfile: any)` | 66 | ✍ Reads the reverseElements and indexMinimizeWidth booleans from the profile. |
| `IndexStateElement:copyAttributes(src: any)` | 75 | ✍ Copies settings from a source element, clones its state template and re-locates the indexable element. Fails if the source has no template. |
| `IndexStateElement:onGuiSetupFinished()` | 89 | ✍ After GUI setup, locates the state template if missing and, when an indexable element id is configured, locates that element too. |
| `IndexStateElement:locateStateElementTemplate()` | 105 | ✍ Looks up the template by id among the parent's descendants, hides it, disables focus handling and unlinks it from the hierarchy. Prints a warning if not found. |
| `IndexStateElement:locateIndexableElement()` | 121 | ✍ Climbs up to 20 parent levels to the view root, finds the indexable element by id and registers onIndexChange as observer if it includes IndexChangeSubjectMixin; warns otherwise. |
| `IndexStateElement:onIndexChange(index: integer, count: integer)` | 148 | ✍ Observer callback. Rebuilds the indicators if the item count changed, then calls setPageIndex (defined elsewhere, not in this file) with the new index. |
| `IndexStateElement:setPageCount(count: integer, initialIndex: integer?)` | 161 | ✍ If the count differs, deletes existing indicators, clones the template count times, invalidates the layout, optionally sets the initial index and updates the size. |
