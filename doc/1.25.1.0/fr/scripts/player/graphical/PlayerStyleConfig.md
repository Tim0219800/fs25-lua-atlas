# player/graphical/PlayerStyleConfig.lua

*[English version](../../../../scripts/player/graphical/PlayerStyleConfig.md)*

Source: `dataS/scripts/player/graphical/PlayerStyleConfig.lua` — FS25 1.25.1.0

✍ Représente un emplacement d'un PlayerStyle (visage, barbe, haut, etc.) avec sa liste d'items, l'item sélectionné et la couleur. Définit aussi les filtres de lecture qui déterminent quels items d'un emplacement sont utilisables. La majeure partie de la classe (constructeur, chargement XML, flux) est absente du dump du SDK ; seuls les filtres et utilitaires de recherche sont documentés.

- **PlayerStyleConfig** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerStyleConfig:ENABLED_GETTER_FILTER(index: integer) → boolean` | 34 | ✍ Filtre : retourne true sauf si le style propriétaire a désactivé cette config pour la sélection courante. |
| `PlayerStyleConfig:NOT_HIDDEN_GETTER_FILTER(index: integer, gear: PlayerStyleItem) → boolean` | 43 | ✍ Filtre : accepte un item seulement si son indicateur hidden n'est pas activé. |
| `PlayerStyleConfig:NOT_FOR_HAT_GETTER_FILTER(index: integer, hair: PlayerStyleItem) → boolean` | 52 | ✍ Filtre : accepte une coiffure seulement si ce n'est pas la variante prévue pour être portée sous un chapeau. |
| `PlayerStyleConfig:SELECTED_GETTER_FILTER(index: integer) → boolean` | 60 | ✍ Filtre : n'accepte que l'item dont l'index correspond à l'index d'item actuellement sélectionné. |
| `PlayerStyleConfig:NO_ONEPIECE_GETTER_FILTER(index: integer) → boolean` | 68 | ✍ Filtre : retourne true seulement si aucune combinaison intégrale n'est sélectionnée (son index vaut 0), utilisé par le haut et le bas. |
| `PlayerStyleConfig:BEARD_FACE_GETTER_FILTER(index: integer, beard: PlayerStyleItem) → boolean` | 77 | ✍ Filtre : accepte une barbe sans restriction de visage, ou dont le nom de visage correspond à l'item de visage actuellement sélectionné. |
| `PlayerStyleConfig:getItemNameIndex(itemName: string) → integer` | 247 | ✍ Retourne l'index de l'item portant le nom donné, ou nil si le nom est nil, vide ou inconnu. |
| `PlayerStyleConfig:getItemIndex(item: PlayerStyleItem) → integer` | 270 | ✍ Retourne l'index de l'item donné dans cette config, ou nil s'il est nil ou absent. L'item vide d'index 0 est traité comme cas particulier. |
| `PlayerStyleConfig:getSelectedItem() → PlayerStyleItem` | 291 | ✍ Retourne l'item actuellement sélectionné, ou nil si l'index sélectionné ne correspond à aucun item. |
