# gui/elements/TableHeaderElement.lua

*[English version](../../../../scripts/gui/elements/TableHeaderElement.md)*

Source: `dataS/scripts/gui/elements/TableHeaderElement.lua` — FS25 1.25.1.0

✍ Élément bouton (dérivé de ButtonElement) servant d'en-tête de colonne d'un tableau, avec un état de tri désactivé, croissant ou décroissant. Les enfants nommés iconAscending ou iconDescending dans le XML d'écran servent d'icônes de tri, et l'en-tête doit se trouver hors du tableau. Il charge targetTableId, columnName, allowSortingAsc et allowSortingDesc depuis le XML ou le profil.

- **TableHeaderElement** hérite de `ButtonElement` (l.37)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TableHeaderElement.new(target: any, custom_mt: any)` | 43 | ✍ Constructeur. N'autorise que l'état désactivé, vide les emplacements d'icônes, met l'ordre sur désactivé et efface l'id du tableau cible et le nom de colonne. |
| `TableHeaderElement:loadFromXML(xmlFile: any, key: any)` | 67 | ✍ Charge targetTableId, columnName, allowSortingAsc et allowSortingDesc depuis le nœud XML après la classe parente, en gardant les valeurs actuelles si un attribut manque. |
| `TableHeaderElement:loadProfile(profile: any, applyProfile: any)` | 81 | ✍ Lit columnName, allowSortingAsc et allowSortingDesc depuis le profil GUI, avec les valeurs actuelles par défaut. targetTableId n'est pas lu depuis les profils. |
| `TableHeaderElement:copyAttributes(src: any)` | 91 | ✍ Copie l'id du tableau cible, le nom de colonne et les états de tri autorisés d'un en-tête source. À noter : unpack est utilisé sur la table des états, dont les entrées false et les clés d'index peuvent ne pas être copiées fidèlement. |
| `TableHeaderElement:onGuiSetupFinished()` | 101 | ✍ Après la configuration parente, parcourt les éléments enfants et enregistre comme icônes de tri ceux dont le nom correspond au tri croissant ou décroissant. |
| `TableHeaderElement:toggleSorting() → The` | 118 | ✍ Passe à l'état de tri autorisé suivant, en rebouclant et en s'arrêtant au pire sur désactivé, rafraîchit les icônes si l'état a changé et retourne le nouvel indice d'ordre. |
| `TableHeaderElement:disableSorting()` | 135 | ✍ Remet l'état sur désactivé et rafraîchit l'affichage des icônes. |
| `TableHeaderElement:updateSortingDisplay()` | 142 | ✍ Affiche seulement l'icône de l'état courant et masque les autres. À noter : appelle setVisible sur chaque entrée de sortingIcons sans test nil, alors que l'état désactivé n'a pas d'icône. |
