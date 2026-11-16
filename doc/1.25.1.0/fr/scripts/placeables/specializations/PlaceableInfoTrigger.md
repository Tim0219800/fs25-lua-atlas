# placeables/specializations/PlaceableInfoTrigger.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableInfoTrigger.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableInfoTrigger.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui affiche une boîte d'informations dans le HUD tant que le joueur local se trouve dans un déclencheur. Elle lève les événements onInfoTriggerEnter et onInfoTriggerLeave et appelle updateInfo à chaque image pour que d'autres spécialisations ajoutent des lignes. La boîte est montrée à la ferme propriétaire, ou à tous si showAllPlayers est défini, et seulement sur les plateformes qui activent l'info de placeable.

- **PlaceableInfoTrigger** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableInfoTrigger.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Aucun prérequis : renvoie toujours true. |
| `PlaceableInfoTrigger.registerEvents(placeableType: any)` | 24 | ✍ Déclare les événements onInfoTriggerEnter et onInfoTriggerLeave. |
| `PlaceableInfoTrigger.registerEventListeners(placeableType: any)` | 31 | ✍ Abonne la spécialisation aux événements de chargement, suppression, finalisation du placement et dessin. |
| `PlaceableInfoTrigger.registerFunctions(placeableType: any)` | 40 | ✍ Enregistre updateInfo et onInfoTriggerCallback sur le type de placeable. |
| `PlaceableInfoTrigger.registerXMLPaths(schema: any, basePath: any)` | 47 | ✍ Déclare infoTrigger#triggerNode et infoTrigger#showAllPlayers. |
| `PlaceableInfoTrigger:onLoad(savegame: table)` | 57 | ✍ Lit le noeud déclencheur (avertit si son masque de collision n'a pas le bit joueur) et showAllPlayers, et crée la boîte clé-valeur du HUD si la plateforme affiche l'info de placeable. |
| `PlaceableInfoTrigger:onDelete()` | 77 | ✍ Retire le déclencheur, arrête l'affichage, retire l'élément dessinable et détruit la boîte du HUD. |
| `PlaceableInfoTrigger:onFinalizePlacement()` | 95 | ✍ Enregistre le callback du déclencheur sur le noeud une fois le placeable posé. |
| `PlaceableInfoTrigger:onDraw()` | 104 | ✍ Tant que le joueur est dedans et autorisé à voir, collecte les lignes via updateInfo et remplit la boîte du HUD (titre = nom du placeable, lignes pouvant être accentuées), puis l'affiche pour l'image suivante. La liste est vidée à chaque image. |
| `PlaceableInfoTrigger:onInfoTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 134 | ✍ Callback du déclencheur ne réagissant qu'au noeud racine du joueur local : à l'entrée, active showInfo, enregistre le dessin et lève onInfoTriggerEnter ; à la sortie, annule et lève onInfoTriggerLeave. Ignoré sur un serveur dédié. |
| `PlaceableInfoTrigger:updateInfo(info: any)` | 156 | ✍ Point d'extension vide : d'autres spécialisations le surchargent pour ajouter des entrées (title, text, accentuate) à la table d'infos. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onInfoTriggerEnter` | 25 |
| registerEvent | `onInfoTriggerLeave` | 26 |
| registerEventListener | `onLoad` | 32 |
| registerEventListener | `onDelete` | 33 |
| registerEventListener | `onFinalizePlacement` | 34 |
| registerEventListener | `onDraw` | 35 |
| registerFunction | `updateInfo` | 41 |
| registerFunction | `onInfoTriggerCallback` | 42 |
