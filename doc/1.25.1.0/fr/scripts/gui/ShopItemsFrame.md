# gui/ShopItemsFrame.lua

*[English version](../../../scripts/gui/ShopItemsFrame.md)*

Source: `dataS/scripts/gui/ShopItemsFrame.lua` — FS25 1.25.1.0

✍ Cadre de boutique du menu en jeu listant les objets achetables (étend `TabbedMenuFrameElement`). Seules les cellules de détails réutilisables de la mise en page des attributs sont décrites ici.

- **ShopItemsFrame** hérite de `TabbedMenuFrameElement` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ShopItemsFrame:buildCellDatabase()` | 502 | ✍ Reconstruit le cache de modèles : supprime les anciens modèles, puis clone chaque élément présent dans `attributesLayout` vers `detailsTemplates` (par nom) et crée un cache de réutilisation vide pour chaque nom. |
| `ShopItemsFrame:dequeueDetailsCell(name: string) → table` | 522 | ✍ Renvoie une cellule pour le nom de modèle donné, réutilisée depuis le cache ou clonée depuis le modèle, et l'ajoute à `attributesLayout`. Renvoie nil si aucun modèle ne porte ce nom. |
| `ShopItemsFrame:queueDetailsCell(cell: table)` | 545 | ✍ Remet une cellule dans le cache de réutilisation de son nom, la retire de `attributesLayout` et la détache de son parent pour pouvoir la redistribuer plus tard. |
