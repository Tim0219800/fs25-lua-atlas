# placeables/specializations/PlaceableRollercoaster.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableRollercoaster.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableRollercoaster.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour des montagnes russes utilisables, exigeant PlaceableConstructible. Elle charge un clip d'animation joué sur le circuit, des wagons avec sièges (caméra et personnage par siège), des points de sortie, un déclencheur joueur, des sons liés à une spline et un point d'intérêt sur la carte avec téléportation optionnelle. Le nombre de tours par joueur est sauvegardé par identifiant utilisateur unique et l'occupation des sièges est transmise aux clients entrants. Les fonctions de logique de manège (entrer, sortir, démarrer, temps d'animation) sont enregistrées mais sans corps dans le dump : NON VÉRIFIÉ.

- **PlaceableRollercoaster** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableRollercoaster.prerequisitesPresent(specializations: table) → boolean` | 37 | ✍ Exige la spécialisation PlaceableConstructible. |
| `PlaceableRollercoaster.registerFunctions(placeableType: any)` | 43 | ✍ Enregistre l'API du manège (getCanEnter, startRide, endRide, enterRide, exitRide, écouteurs de changement de passagers, déclencheur joueur, getNumRides, etc.). Seule onSharedAnimationFileLoaded a un corps dans ce dump ; le reste est NON VÉRIFIÉ. |
| `PlaceableRollercoaster.registerOverwrittenFunctions(placeableType: any)` | 68 | ✍ Surcharge getHotspot et finalizeConstruction ; leurs corps ne sont pas dans ce dump. |
| `PlaceableRollercoaster.registerEventListeners(placeableType: any)` | 75 | ✍ Abonne à onLoad, onFinalizePlacement, onDelete, onUpdate, onReadStream et onWriteStream. |
| `PlaceableRollercoaster.registerXMLPaths(schema: any, basePath: any)` | 86 | ✍ Déclare le XML sous placeable.rollercoaster : clip d'animation, sources audio mobiles, cinq sons de roulage, déclencheur joueur, points de sortie, nœuds de lien et de téléportation du point d'intérêt, et wagons avec sièges (caméra et personnage). |
| `PlaceableRollercoaster.registerSavegameXMLPaths(schema: any, basePath: any)` | 124 | ✍ Déclare les clés de sauvegarde : indice d'état, temps sur la spline, et par joueur l'identifiant utilisateur unique avec son nombre de tours. |
| `PlaceableRollercoaster:onLoad(savegame: table)` | 134 | ✍ Charge la configuration d'animation (i3d partagé asynchrone pour le clip), le déclencheur joueur, l'activatable, les wagons et sièges avec caméra/personnage, les points de sortie (avertit s'ils sont moins nombreux que les sièges), les nœuds du point d'intérêt et, côté client, les sources audio mobiles et les échantillons de roulage. S'abonne à USER_REMOVED. |
| `PlaceableRollercoaster:onSharedAnimationFileLoaded(node: any, failedReason: any, args: any)` | 277 | ✍ Callback après chargement de l'i3d d'animation : clone son jeu de personnage d'animation sur le nœud racine du clip, lie le clip nommé à la piste 0 (sans boucle, avec échelle de vitesse), stocke sa durée, supprime le nœud chargé, réinitialise les compteurs de tours, initialise les états de la machine d'états constructible et termine la tâche de chargement. |
| `PlaceableRollercoaster:onFinalizePlacement(savegame: any)` | 318 | ✍ Configure le point d'intérêt de la carte (placeable, sans ferme propriétaire, positions monde et de téléportation) et l'ajoute à la mission. La première montagne russe finalisée devient PlaceableRollercoaster.INSTANCE. |
| `PlaceableRollercoaster:onDelete()` | 340 | ✍ Se désabonne des messages, retire et supprime le point d'intérêt, libère l'i3d d'animation, supprime personnages et caméras des sièges, retire les sons mobiles et échantillons, retire le déclencheur joueur et efface INSTANCE si c'était ce placeable. |
| `PlaceableRollercoaster:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 388 | ✍ Sauvegarde l'identifiant utilisateur unique et le nombre de tours de chaque joueur. |
| `PlaceableRollercoaster:loadFromXMLFile(xmlFile: any, key: any)` | 402 | ✍ Restaure les compteurs de tours par joueur depuis la sauvegarde, en ignorant les entrées incomplètes. |
| `PlaceableRollercoaster:onReadStream(streamId: any, connection: any)` | 417 | ✍ Synchronisation initiale côté client : pour chaque siège occupé, lit l'objet joueur et appelle enterRide pour ce siège. |
| `PlaceableRollercoaster:onWriteStream(streamId: any, connection: any)` | 431 | ✍ Synchronisation initiale côté serveur : écrit pour chaque siège s'il est occupé et, le cas échéant, l'objet du joueur. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onSharedAnimationFileLoaded` | 44 |
| registerFunction | `getCanEnter` | 45 |
| registerFunction | `getFreeSeatIndex` | 46 |
| registerFunction | `getCanStart` | 47 |
| registerFunction | `startRide` | 48 |
| registerFunction | `endRide` | 49 |
| registerFunction | `getAnimation` | 50 |
| registerFunction | `setAnimationTime` | 51 |
| registerFunction | `updateFxModifierValues` | 52 |
| registerFunction | `tryEnterRide` | 53 |
| registerFunction | `enterRide` | 54 |
| registerFunction | `exitRide` | 55 |
| registerFunction | `onUserRemoved` | 56 |
| registerFunction | `registerRidersChangedListener` | 57 |
| registerFunction | `unregisterRidersChangedListener` | 58 |
| registerFunction | `getParentComponent` | 59 |
| registerFunction | `passengerCharacterLoaded` | 60 |
| registerFunction | `playerTriggerCallback` | 61 |
| registerFunction | `setPlayerTriggerState` | 62 |
| registerFunction | `getNumRides` | 63 |
| registerOverwrittenFunction | `getHotspot` | 69 |
| registerOverwrittenFunction | `finalizeConstruction` | 70 |
| registerEventListener | `onLoad` | 76 |
| registerEventListener | `onFinalizePlacement` | 77 |
| registerEventListener | `onDelete` | 78 |
| registerEventListener | `onUpdate` | 79 |
| registerEventListener | `onReadStream` | 80 |
| registerEventListener | `onWriteStream` | 81 |

## Messages

- s'abonne à `MessageType.USER_REMOVED` (l.271)
