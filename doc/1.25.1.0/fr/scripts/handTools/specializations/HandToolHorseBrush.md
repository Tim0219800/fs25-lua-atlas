# handTools/specializations/HandToolHorseBrush.lua

*[English version](../../../../scripts/handTools/specializations/HandToolHorseBrush.md)*

Source: `dataS/scripts/handTools/specializations/HandToolHorseBrush.lua` — FS25 1.25.1.0

✍ Spécialisation d'outil à main pour la brosse à chevaux. Le joueur propriétaire cible les animaux (drapeau de collision ANIMAL, portée de 3 m) et, tant que l'entrée d'activation est maintenue, brosse l'animal visé ; le nettoyage est envoyé au serveur via AnimalCleanEvent avec une quantité cumulée. Nécessite le système d'élevage et les droits d'accès à la ferme. À noter : `onHeldEnd` est enregistré comme écouteur mais aucune fonction de ce nom n'existe dans ce fichier, et `treeTypeCrosshair` utilisé dans `onDraw` n'y est jamais assigné.

- **HandToolHorseBrush** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolHorseBrush.registerXMLPaths(xmlSchema: any)` | 14 | ✍ Enregistre `handTool.horseBrush#node` (le nœud de la brosse) et les échantillons sonores `cleaning`. |
| `HandToolHorseBrush.registerEventListeners(handToolType: any)` | 25 | ✍ Abonne la spécialisation à `onLoad`, `onDelete`, `onUpdate`, `onDraw`, `onHeldStart`, `onHeldEnd` et `onRegisterActionEvents`. |
| `HandToolHorseBrush.prerequisitesPresent(specializations: any)` | 37 | ✍ Renvoie toujours true : aucun prérequis. |
| `HandToolHorseBrush:onLoad(xmlFile: any)` | 43 | ✍ Initialise la distance de détection (3), le nœud de brosse et sa position de repos, le son et les réticules côté client, un indicateur de modification, une vitesse de nettoyage de 0,01 par milliseconde et le texte de l'action. |
| `HandToolHorseBrush:onDelete()` | 74 | ✍ Libère les échantillons sonores et les deux réticules. |
| `HandToolHorseBrush:onUpdate(dt: any)` | 91 | ✍ Pour le propriétaire, trouve le groupe d'animaux visé, active l'action, anime le nœud de brosse pendant le nettoyage et lève un indicateur quand la cible change. Les clients jouent ou arrêtent le son ; avec une cible, il cumule le temps et envoie un AnimalCleanEvent au serveur à chaque dépassement de 5. |
| `HandToolHorseBrush:onDraw()` | 168 | ✍ Affiche le réticule de brosse quand un animal est visé, sinon le réticule par défaut ; affiche aussi `treeTypeCrosshair` s'il existe (jamais défini dans ce fichier). |
| `HandToolHorseBrush:onRegisterActionEvents()` | 184 | ✍ Enregistre l'entrée ACTIVATE_HANDTOOL avec `onBrushAction`, priorité très haute, initialement inactive et sans texte. Ignoré si l'outil n'est pas actif pour les entrées. |
| `HandToolHorseBrush:onBrushAction(_: any, inputValue: any)` | 200 | ✍ Rappel d'entrée : met l'indicateur de nettoyage à true tant que la valeur d'entrée est positive. |
| `HandToolHorseBrush:onHeldStart()` | 207 | ✍ Pour le joueur propriétaire seulement, ajoute un type de cible ANIMAL au ciblage du joueur, avec 0,5 minimum et la distance de détection. |
| `HandToolHorseBrush.getHusbandryAndClusterFromNode(carryingPlayer: any, node: any)` | 234 | ✍ Associe un nœud de collision ciblé à son élevage et à son groupe d'animaux. Ne renvoie les deux que si la ferme a accès à l'élevage et que le groupe gère la saleté et un nom ; sinon renvoie nil, nil. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 26 |
| registerEventListener | `onDelete` | 27 |
| registerEventListener | `onUpdate` | 28 |
| registerEventListener | `onDraw` | 29 |
| registerEventListener | `onHeldStart` | 30 |
| registerEventListener | `onHeldEnd` | 31 |
| registerEventListener | `onRegisterActionEvents` | 32 |
