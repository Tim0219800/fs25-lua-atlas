# gui/InGameMenuStatisticsFrame.lua

*[English version](../../../scripts/gui/InGameMenuStatisticsFrame.md)*

Source: `dataS/scripts/gui/InGameMenuStatisticsFrame.lua` — FS25 1.25.1.0

✍ Cadre d'onglet du menu en jeu affichant les statistiques de la partie (étend `TabbedMenuFrameElement`). Seules quelques fonctions sont décrites : boutons de menu par sous-catégorie et réserve de cellules modèles pour la liste d'attributs.

- **InGameMenuStatisticsFrame** hérite de `TabbedMenuFrameElement` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InGameMenuStatisticsFrame:getMenuButtonInfo() → table` | 332 | ✍ Renvoie la table d'informations de boutons de menu correspondant à la sous-catégorie actuellement choisie dans `subCategoryPaging`. |
| `InGameMenuStatisticsFrame:buildCellDatabase()` | 2016 | ✍ Reconstruit le cache de modèles : supprime les anciens modèles, puis clone chaque élément présent dans `attributesLayout` vers `detailsTemplates` (par nom) et crée un cache de réutilisation vide pour chaque nom. |
| `InGameMenuStatisticsFrame:dequeueDetailsCell(name: string) → table` | 2036 | ✍ Renvoie une cellule pour le nom de modèle donné, réutilisée depuis le cache ou clonée depuis le modèle, et l'ajoute à `attributesLayout`. Renvoie nil si aucun modèle ne porte ce nom. |
| `InGameMenuStatisticsFrame:queueDetailsCell(cell: table)` | 2059 | ✍ Remet une cellule dans le cache de réutilisation de son nom, la retire de `attributesLayout` et la détache de son parent pour pouvoir la redistribuer plus tard. |
