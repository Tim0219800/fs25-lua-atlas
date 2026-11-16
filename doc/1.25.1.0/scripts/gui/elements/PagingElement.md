# gui/elements/PagingElement.lua

*[Version française](../../../fr/scripts/gui/elements/PagingElement.md)*

Source: `dataS/scripts/gui/elements/PagingElement.lua` — FS25 1.25.1.0

✍ GUI container that shows one of several page children at a time. Every child added becomes a page; named children use the localization key 'ui_' plus the name as their title. It extends GuiElement and includes IndexChangeSubjectMixin so observers learn about page and page-count changes. Pages can be disabled, in which case they are left out of the visible page mapping. Several methods (such as setPage) are absent from this dump (UNVERIFIED).

- **PagingElement** inherits from `GuiElement` (l.20)

## Functions

| Function | Line | Description |
|---|---|---|
| `PagingElement.new(target: any, custom_mt: any)` | 26 | ✍ Constructor. Creates the element with the index-change mixin and empty page structures: the page list, an id-to-page hash, the visible-page mapping and current page indices set to 1. |
| `PagingElement:loadFromXML(xmlFile: any, key: any)` | 48 | ✍ Loads the base element, then registers the onPageChange and onPageUpdate callbacks from the XML. |
| `PagingElement:copyAttributes(src: any)` | 57 | ✍ Copies the two page callbacks from a source element and clones the index-change mixin. |
| `PagingElement:onGuiSetupFinished()` | 67 | ✍ Runs the base setup-finished handling, then builds the visible page mapping. |
| `PagingElement:addElement(element: any)` | 100 | ✍ Adds the child as usual and registers it as a page. If it has a name with an existing 'ui_<name>' text, the page id is the upper-cased name and the title the translation; otherwise the id is the element's string form and the title empty. addPage itself is not in this dump (UNVERIFIED). |
| `PagingElement:removeElement(element: any)` | 229 | ✍ Removes the child through the parent, then removes any page whose root element is that child. |
| `PagingElement:getCurrentPageId()` | 236 | ✍ Returns the id of the page at the current page index. |
| `PagingElement:getPageMappingIndex(pageId: any)` | 242 | ✍ Returns the position of the given page among the visible (non-disabled) pages. Errors if the id is unknown; disabled pages report 1. |
| `PagingElement:getIsPageDisabled(pageId: any)` | 248 | ✍ Returns whether the page with the given id is disabled. Errors if the id is unknown. |
| `PagingElement:getPageById(pageId: any)` | 254 | ✍ Returns the page table registered under the given id, or nil if none. |
| `PagingElement:setPageDisabled(page: any, disabled: any)` | 260 | ✍ Enables or disables a page (nil page is ignored), rebuilds the visible page mapping and raises the onPageUpdate callback with the page and this element. |
| `PagingElement:updatePageMapping()` | 279 | ✍ Rebuilds the list of visible page indices and titles, skipping disabled pages. If the current page became disabled it clamps the mapping index and calls setPage (unless neuterPageUpdates is set); otherwise it notifies index observers of the new count. |
