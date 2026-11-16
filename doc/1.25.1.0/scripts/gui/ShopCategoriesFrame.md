# gui/ShopCategoriesFrame.lua

*[Version française](../../fr/scripts/gui/ShopCategoriesFrame.md)*

Source: `dataS/scripts/gui/ShopCategoriesFrame.lua` — FS25 1.25.1.0

✍ Shop frame of the in-game menu that shows categories or brands as a tile layout (extends `TabbedMenuFrameElement`). Its XML is `dataS/gui/ShopCategoriesFrame.xml`.

- **ShopCategoriesFrame** inherits from `TabbedMenuFrameElement` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `ShopCategoriesFrame.register()` | 19 | ✍ Creates a new frame instance and loads `dataS/gui/ShopCategoriesFrame.xml` through `g_gui:loadGui` under the name `ShopCategoriesFrame`. Called once at GUI setup. |
