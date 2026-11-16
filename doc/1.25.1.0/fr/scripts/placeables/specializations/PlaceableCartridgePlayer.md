# placeables/specializations/PlaceableCartridgePlayer.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableCartridgePlayer.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableCartridgePlayer.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour l'ordinateur de jeu qui fait défiler des cartouches. Les cartouches sont les enfants visibles d'un nœud d'objets ; l'activation déplace le contenu de la cartouche sur un nœud connecteur et affiche l'enfant d'écran et la lumière correspondants. Un nœud de déclencheur avec le bit de collision joueur le rend utilisable par le joueur local.

- **PlaceableCartridgePlayer** (l.11)
- **PlaceableCartridgePlayerActivatable** (l.173)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableCartridgePlayer.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceableCartridgePlayer.registerFunctions(placeableType: any)` | 23 | ✍ Enregistre `cartridgePlayerTriggerCallback` et `activatePlayer`. |
| `PlaceableCartridgePlayer.registerEventListeners(placeableType: any)` | 30 | ✍ S'abonne à `onLoad` et `onDelete`. |
| `PlaceableCartridgePlayer.registerXMLPaths(schema: any, basePath: any)` | 37 | ✍ Déclare les clés de nœuds `cartridgePlayer` : `itemsNode`, `monitorNode`, `monitorLightNode`, `connectorNode`, `triggerNode`, et un échantillon sonore `play`. |
| `PlaceableCartridgePlayer:onLoad(savegame: any)` | 52 | ✍ Charge les nœuds et, s'il existe un déclencheur, vérifie qu'il porte le bit de collision joueur (sinon journalise une erreur et renvoie nil) avant d'enregistrer le déclencheur et l'activable. Charge le son sur les clients. Renvoie self. |
| `PlaceableCartridgePlayer:onDelete()` | 85 | ✍ Retire l'activable et le nœud de déclencheur, et supprime les échantillons sonores côté client. |
| `PlaceableCartridgePlayer:cartridgePlayerTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 100 | ✍ Rappel du déclencheur : quand le joueur local entre, ajoute l'activable au système d'activables ; quand il sort, le retire. |
| `PlaceableCartridgePlayer:activatePlayer()` | 115 | ✍ Remet la cartouche actuelle en place, choisit la cartouche visible suivante (avec retour au début), puis déplace son contenu sur le connecteur et affiche son écran. Affiche un message s'il n'y a aucune cartouche et joue un son côté client quand la sélection change. |
| `PlaceableCartridgePlayerActivatable.new(placeable: any)` | 177 | ✍ Crée l'activable pour un placeable lecteur de cartouches, avec le texte d'action « changer de cartouche ». |
| `PlaceableCartridgePlayerActivatable:run()` | 188 | ✍ Gestionnaire d'activation : appelle `activatePlayer` sur le placeable propriétaire. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `cartridgePlayerTriggerCallback` | 24 |
| registerFunction | `activatePlayer` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onDelete` | 32 |
