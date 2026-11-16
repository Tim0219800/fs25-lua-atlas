# gui/InGameMenuStatisticsFrame.lua

*[Version française](../../fr/scripts/gui/InGameMenuStatisticsFrame.md)*

Source: `dataS/scripts/gui/InGameMenuStatisticsFrame.lua` — FS25 1.25.1.0

✍ In-game menu tab frame showing game statistics (extends `TabbedMenuFrameElement`). Only a few functions are described here: menu button lookup per sub-category and a template/cache pool for the attribute list cells.

- **InGameMenuStatisticsFrame** inherits from `TabbedMenuFrameElement` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `InGameMenuStatisticsFrame:getMenuButtonInfo() → table` | 332 | ✍ Returns the menu button info table that matches the sub-category currently selected in `subCategoryPaging`. |
| `InGameMenuStatisticsFrame:buildCellDatabase()` | 2016 | ✍ Rebuilds the template cache: deletes old templates, then clones every element currently in `attributesLayout` into `detailsTemplates` by element name and creates an empty reuse cache for each name. |
| `InGameMenuStatisticsFrame:dequeueDetailsCell(name: string) → table` | 2036 | ✍ Returns a cell for the given template name, reusing one from the cache or cloning the template, and adds it to `attributesLayout`. Returns nil if no template has that name. |
| `InGameMenuStatisticsFrame:queueDetailsCell(cell: table)` | 2059 | ✍ Puts a cell back into the reuse cache for its name, removes it from `attributesLayout` and unlinks it from its parent so it can be handed out again later. |
