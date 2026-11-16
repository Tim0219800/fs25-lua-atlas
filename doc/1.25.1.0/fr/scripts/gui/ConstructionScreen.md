# gui/ConstructionScreen.lua

*[English version](../../../scripts/gui/ConstructionScreen.md)*

Source: `dataS/scripts/gui/ConstructionScreen.lua` — FS25 1.25.1.0

✍ Écran de construction côté client, dérivé de ScreenElement. Il possède une caméra vue de dessus, un curseur, les sons de construction, le pinceau actif et des caches de cellules de menu pour la liste d'objets et les détails d'attributs. Il obtient les classes de pinceaux via g_constructionBrushTypeManager et gère contextes d'entrée et événements d'action. L'essentiel du fichier est hors des entrées décrites.

- **ConstructionScreen** hérite de `ScreenElement` (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ConstructionScreen.new(target: table, custom_mt: table) → ConstructionScreen` | 36 | ✍ Crée l'écran avec une GuiTopDownCamera, un GuiTopDownCursor et un ConstructionSound, sans pinceau, avec des tables vides pour objets, événements, cadres de sélection, éléments clonés et caches de cellules. Le mode souris est actif par défaut. |
| `ConstructionScreen:onOpen()` | 123 | ✍ Active le contexte d'entrée de construction, la caméra et le curseur, décale la zone de sécurité de la largeur du menu et crée les pinceaux de sélection et de destruction à la première utilisation. Il sélectionne ensuite le pinceau de sélection, reconstruit les données, affiche l'aide de saisie et s'abonne aux messages. À pied en vue subjective, il affiche le modèle du joueur. |
| `ConstructionScreen:onClose(element: table)` | 191 | ✍ Inverse onOpen : recache le modèle du joueur s'il était affiché, se désabonne des messages, restaure l'aide de saisie et la zone de sécurité et efface l'heure d'ouverture. Il retire le pinceau, désactive curseur et caméra, retire les événements d'action du menu et rétablit le contexte d'entrée. |
| `ConstructionScreen:registerBrushActionEvents()` | 556 | ✍ Enregistre les événements d'action d'entrée du pinceau courant (primaire, secondaire, tertiaire, etc.) selon les drapeaux du pinceau, comme la prise en charge du glisser. Stocke les identifiants dans brushEvents et donne une priorité de texte élevée aux boutons principaux. Ne fait rien sans pinceau. |
| `ConstructionScreen:removeBrushActionEvents()` | 705 | ✍ Retire tous les événements d'action listés dans brushEvents et efface les références stockées vers les événements primaire, secondaire, tertiaire, quatrième, axes, magnétisme et affichage des configurations. |
| `ConstructionScreen:buildCellDatabase()` | 2048 | ✍ Construit la table de modèles du layout d'attributs : clone chaque élément de attributesLayout par son nom et crée un cache vide pour chacun. Prépare la réutilisation faite par dequeueDetailsCell et queueDetailsCell. |
| `ConstructionScreen:dequeueDetailsCell(name: string) → table` | 2064 | ✍ Retourne une cellule de détails du nom donné, prise dans le cache ou clonée depuis son modèle, et l'ajoute au layout d'attributs. Retourne nil si aucun modèle n'existe pour ce nom. |
| `ConstructionScreen:queueDetailsCell(cell: table)` | 2087 | ✍ Remet une cellule dans le cache de son nom, la retire du layout d'attributs et la détache. À noter : la cellule n'est pas réinitialisée ici, contrairement à ce qu'on attendrait d'une libération de cache. |

## Messages

- s'abonne à `MessageType.INPUT_MODE_CHANGED` (l.158)
- s'abonne à `MessageType.SLOT_USAGE_CHANGED` (l.173)
- s'abonne à `MessageType.APP_WINDOW_FOCUS_CHANGED` (l.177)
