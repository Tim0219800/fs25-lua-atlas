# gui/base/TabbedMenuWithDetails.lua

*[English version](../../../../scripts/gui/base/TabbedMenuWithDetails.md)*

Source: `dataS/scripts/gui/base/TabbedMenuWithDetails.lua` — FS25 1.25.1.0

✍ Extension de TabbedMenu où chaque onglet garde une pile de cadres : une page racine plus des pages de détail empilées, que le retour dépile. Les pages de détail sont des pages normales de la pagination, activées et désactivées à l'empilement et au dépilement. Une note du développeur dans la source décrit un bug connu sur l'index de page et l'index de mapping quand des pages invisibles se trouvent entre les onglets.

- **TabbedMenuWithDetails** hérite de `TabbedMenu` (l.22)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TabbedMenuWithDetails.new(target: any, custom_mt: any)` | 26 | ✍ Crée le menu via TabbedMenu.new et ajoute une table vide de piles, indexée par index de page. |
| `TabbedMenuWithDetails:reset()` | 36 | ✍ Réinitialise l'état du menu de base et supprime toutes les piles de détails. |
| `TabbedMenuWithDetails:getIsDetailMode()` | 44 | ✍ Renvoie true quand l'onglet courant affiche une page de détail et non sa racine. |
| `TabbedMenuWithDetails:exitMenu()` | 50 | ✍ Dépile tous les détails jusqu'à la racine, puis quitte le menu via la classe parente. |
| `TabbedMenuWithDetails:onOpen(element: any)` | 59 | ✍ Remplace volontairement TabbedMenu:onOpen en sautant son code pour éviter un double flou et des sons en trop. À la racine, il rafraîchit les pages et restaure la page mémorisée ; sinon il rouvre le cadre de détail du dessus et ses boutons. |
| `TabbedMenuWithDetails:onPageClicked(oldPage: any)` | 96 | ✍ Au clic sur un onglet, dépile toute la pile de détails jusqu'à la racine. |
| `TabbedMenuWithDetails:onDetailClosed(detailPage: any)` | 102 | ✍ Point d'extension vide appelé après la fermeture d'une page de détail ; à surcharger. |
| `TabbedMenuWithDetails:onDetailOpened(detailPage: any)` | 107 | ✍ Point d'extension vide appelé après l'ouverture d'une page de détail ; à surcharger. |
| `TabbedMenuWithDetails:onButtonBack()` | 112 | ✍ Bouton retour : quitte le menu à la racine, sinon ferme le détail du dessus. |
| `TabbedMenuWithDetails:onPageChange(pageIndex: any, pageMappingIndex: any, element: any, skipTabVisualUpdate: any)` | 122 | ✍ Callback de pagination. Pendant un empilement ou dépilement de détail, il saute la mise à jour visuelle de l'onglet ; pour un changement de page normal il dépile d'abord jusqu'à la racine. Appelle ensuite l'implémentation de base. |
| `TabbedMenuWithDetails:getStack(page: any)` | 139 | ✍ Renvoie la pile de cadres de la page donnée, ou de l'onglet courant, en la créant avec une entrée racine si absente. Les entrées contiennent la page, et pageId et isRoot pour la racine. |
| `TabbedMenuWithDetails:isAtRoot()` | 164 | ✍ Renvoie true quand la pile de l'onglet courant ne contient que la page racine. |
| `TabbedMenuWithDetails:getTopFrame()` | 170 | ✍ Renvoie la page au sommet de la pile de l'onglet courant. |
| `TabbedMenuWithDetails:setPageDisabled(page: any, disabled: any)` | 177 | ✍ Définit l'indicateur désactivé d'une page dans la pagination, retrouvée par son élément. |
| `TabbedMenuWithDetails:pushDetail(detailPage: any)` | 185 | ✍ Empile une page de détail sur la pile courante et l'affiche. Un détail déjà au sommet est d'abord masqué, fermé et désactivé (onDetailClosed). La nouvelle page est activée, sélectionnée sons supprimés, puis onDetailOpened est appelé. |
| `TabbedMenuWithDetails:popDetail()` | 222 | ✍ Retire le détail du sommet, le ferme et le désactive (onDetailClosed), puis rouvre le détail en dessous ou sélectionne la page racine. À noter : à la racine, il journalise une erreur et retourne sans remettre isChangingDetail à false, qui reste true. |
| `TabbedMenuWithDetails:popToRoot()` | 268 | ✍ Dépile les détails un par un jusqu'à ce qu'il ne reste que la racine ; sans effet si déjà à la racine. |
| `TabbedMenuWithDetails:replaceDetail(detailPage: any)` | 281 | ✍ Dépile le détail courant puis empile celui donné, ce qui conserve la profondeur de pile et donc le comportement du retour. Échoue comme popDetail s'il est appelé à la racine. |
| `TabbedMenuWithDetails:getBreadcrumbs(page: any)` | 299 | ✍ Renvoie un tableau des titres de pages (chaîne vide si absent) pour la pile de la page donnée ou courante, de la racine au sommet. |
