# gui/ShopItemsFrame.lua

*[Version française](../../fr/scripts/gui/ShopItemsFrame.md)*

Source: `dataS/scripts/gui/ShopItemsFrame.lua` — FS25 1.25.1.0

✍ Shop frame of the in-game menu listing purchasable items (extends `TabbedMenuFrameElement`). Only the pooled detail cells of the attributes layout are described here.

- **ShopItemsFrame** inherits from `TabbedMenuFrameElement` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `ShopItemsFrame:buildCellDatabase()` | 502 | ✍ Rebuilds the template cache: deletes old templates, then clones every element currently in `attributesLayout` into `detailsTemplates` by element name and creates an empty reuse cache for each name. |
| `ShopItemsFrame:dequeueDetailsCell(name: string) → table` | 522 | ✍ Returns a cell for the given template name, reusing one from the cache or cloning the template, and adds it to `attributesLayout`. Returns nil if no template has that name. |
| `ShopItemsFrame:queueDetailsCell(cell: table)` | 545 | ✍ Puts a cell back into the reuse cache for its name, removes it from `attributesLayout` and unlinks it from its parent so it can be handed out again later. |
