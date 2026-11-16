# gui/ShopCategoriesFrame.lua

*[English version](../../../scripts/gui/ShopCategoriesFrame.md)*

Source: `dataS/scripts/gui/ShopCategoriesFrame.lua` — FS25 1.25.1.0

✍ Cadre de boutique du menu en jeu affichant catégories ou marques sous forme de tuiles (étend `TabbedMenuFrameElement`). Son XML est `dataS/gui/ShopCategoriesFrame.xml`.

- **ShopCategoriesFrame** hérite de `TabbedMenuFrameElement` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ShopCategoriesFrame.register()` | 19 | ✍ Crée une nouvelle instance du cadre et charge `dataS/gui/ShopCategoriesFrame.xml` via `g_gui:loadGui` sous le nom `ShopCategoriesFrame`. Appelée une fois lors de l'initialisation de l'interface. |
