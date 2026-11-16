# gui/elements/BreadcrumbsElement.lua

*[Version française](../../../fr/scripts/gui/elements/BreadcrumbsElement.md)*

Source: `dataS/scripts/gui/elements/BreadcrumbsElement.lua` — FS25 1.25.1.0

✍ Breadcrumb trail layout used in deeper menus (shop, ModHub), derived from BoxLayoutElement. At setup it detaches the first TextBackdropElement and the first BitmapElement child as templates for crumb text and separator arrow. Only template handling is in this file; adding crumbs is UNVERIFIED here.

- **BreadcrumbsElement** inherits from `BoxLayoutElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `BreadcrumbsElement.new(target: any, custom_mt: any)` | 18 | ✍ Constructor; creates the box layout and an empty `crumbs` table. |
| `BreadcrumbsElement:copyAttributes(src: any)` | 28 | ✍ Copies the text and arrow templates from the source element by reference and marks this copy as not owning them, so it will not delete them. |
| `BreadcrumbsElement:onGuiSetupFinished()` | 38 | ✍ When no templates were inherited, takes the first TextBackdropElement and first BitmapElement descendants as templates, unlinks them from the layout and takes ownership of them. |
| `BreadcrumbsElement:delete()` | 58 | ✍ Deletes the text and arrow templates when this element owns them, then runs the parent delete. |
