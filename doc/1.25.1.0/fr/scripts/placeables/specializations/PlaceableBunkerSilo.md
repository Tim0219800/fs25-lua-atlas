# placeables/specializations/PlaceableBunkerSilo.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableBunkerSilo.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableBunkerSilo.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui encapsule un objet `BunkerSilo` (chargé depuis `placeable.bunkerSilo`) et le synchronise vers les clients qui rejoignent. Elle gère aussi les silos extensibles qui s'alignent à côté d'un silo de même configuration en masquant les murs communs, avertit à la vente si le silo n'est pas vide et nettoie la zone du silo à la vente.

- **PlaceableBunkerSilo** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableBunkerSilo.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceableBunkerSilo.registerEventListeners(placeableType: any)` | 24 | ✍ S'abonne à `onLoad`, `onDelete`, `onFinalizePlacement`, `onReadStream`, `onWriteStream` et `onSell`. |
| `PlaceableBunkerSilo.registerFunctions(placeableType: any)` | 35 | ✍ Enregistre `updateBunkerSiloWalls`, `setWallVisibility` et `getIsBunkerSiloExtendable`. |
| `PlaceableBunkerSilo.registerOverwrittenFunctions(placeableType: any)` | 43 | ✍ Surcharge les fonctions de placement `getPlacementPosition`, `getPlacementRotation`, `getHasOverlap`, `startPlacementCheck`, ainsi que `canBeSold` et `setOwnerFarmId`. |
| `PlaceableBunkerSilo.registerXMLPaths(schema: any, basePath: any)` | 54 | ✍ Déclare les clés XML `bunkerSilo` (en déléguant à `BunkerSilo`) ainsi que `isExtendable`, `siloToSiloDistance`, `snapDistance` (1,1 fois la distance entre silos par défaut) et `sellWarningText`. |
| `PlaceableBunkerSilo.registerSavegameXMLPaths(schema: any, basePath: any)` | 66 | ✍ Déclare les clés XML de sauvegarde en déléguant à `BunkerSilo.registerSavegameXMLPaths`. |
| `PlaceableBunkerSilo:onLoad(savegame: table)` | 75 | ✍ Crée et charge le `BunkerSilo` (le supprime en cas d'échec) et lit les réglages d'extension. Si le silo est extensible mais que `siloToSiloDistance` manque, journalise une erreur XML et passe l'état de chargement en ERROR. |
| `PlaceableBunkerSilo:onDelete()` | 99 | ✍ Rétablit les murs des silos voisins, supprime le `BunkerSilo` et retire ce placeable de la liste des silos du système de placeables. |
| `PlaceableBunkerSilo:onFinalizePlacement()` | 111 | ✍ Masque les murs partagés avec les silos voisins, enregistre l'objet réseau `BunkerSilo` avec l'id de la ferme propriétaire et ajoute le placeable à la liste des silos du système. |
| `PlaceableBunkerSilo:onReadStream(streamId: any, connection: any)` | 123 | ✍ Connexion côté client : lit l'id d'objet du silo, lit son flux et termine son enregistrement. |
| `PlaceableBunkerSilo:onWriteStream(streamId: any, connection: any)` | 133 | ✍ Connexion côté serveur : écrit l'id d'objet du silo et son flux, et l'enregistre dans le flux de la connexion. |
| `PlaceableBunkerSilo:loadFromXMLFile(xmlFile: any, key: any)` | 143 | ✍ Charge les données de sauvegarde via le `BunkerSilo` et renvoie son résultat. |
| `PlaceableBunkerSilo:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 151 | ✍ Sauvegarde les données du `BunkerSilo`. |
| `PlaceableBunkerSilo:setWallVisibility(isLeftVisible: any, isRightVisible: any)` | 159 | ✍ Transmet au `BunkerSilo` les indicateurs de visibilité des murs gauche et droit. Passer nil pour un côté le laisse inchangé (NON VÉRIFIÉ : dépend de `BunkerSilo`). |
| `PlaceableBunkerSilo:getIsBunkerSiloExtendable()` | 166 | ✍ Renvoie si ce silo est marqué extensible dans le XML. |
| `PlaceableBunkerSilo:updateBunkerSiloWalls(isDeleting: any)` | 173 | ✍ Trouve les silos extensibles de même configuration et de même ferme à moins de l'espacement des silos plus 0,5 m, et masque (ou affiche, en cas de suppression) leur mur du côté tourné vers ce silo. |
| `PlaceableBunkerSilo:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 209 | ✍ Appelle le parent puis propage le nouvel id de ferme au `BunkerSilo` sans envoyer d'événement. |
| `PlaceableBunkerSilo:onSell()` | 221 | ✍ Appelle `clearSiloArea` sur le `BunkerSilo` lorsque le placeable est vendu. |
| `PlaceableBunkerSilo:canBeSold(superFunc: any)` | 229 | ✍ Autorise toujours la vente ; renvoie le texte d'avertissement en second résultat quand le niveau du silo est supérieur à zéro, sinon nil. |
| `PlaceableBunkerSilo:startPlacementCheck(superFunc: function, x: number?, y: number?, z: number?, rotY: number?)` | 247 | ✍ Exécute la vérification parent puis, pour les silos extensibles, cherche le silo possédé de même configuration le plus proche dans la distance d'accroche et le mémorise, avec son côté, comme cible d'alignement. |
| `PlaceableBunkerSilo:getHasOverlap(superFunc: any, x: any, y: any, z: any, rotY: any, checkFunc: any)` | 280 | ✍ Quand un silo d'accroche est trouvé, enveloppe le test de chevauchement pour que ce silo ne compte pas comme obstacle, puis appelle le parent. |
| `PlaceableBunkerSilo:getPlacementRotation(superFunc: any, x: any, y: any, z: any)` | 305 | ✍ Renvoie la rotation du parent, remplacée par l'orientation Y du silo d'accroche quand l'accroche est active. |
| `PlaceableBunkerSilo:getPlacementPosition(superFunc: any, x: any, y: any, z: any)` | 319 | ✍ Renvoie la position du parent, remplacée par un point décalé de l'espacement des silos à gauche ou à droite du silo d'accroche quand l'accroche est active. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 25 |
| registerEventListener | `onDelete` | 26 |
| registerEventListener | `onFinalizePlacement` | 27 |
| registerEventListener | `onReadStream` | 28 |
| registerEventListener | `onWriteStream` | 29 |
| registerEventListener | `onSell` | 30 |
| registerFunction | `updateBunkerSiloWalls` | 36 |
| registerFunction | `setWallVisibility` | 37 |
| registerFunction | `getIsBunkerSiloExtendable` | 38 |
| registerOverwrittenFunction | `getPlacementPosition` | 44 |
| registerOverwrittenFunction | `getPlacementRotation` | 45 |
| registerOverwrittenFunction | `getHasOverlap` | 46 |
| registerOverwrittenFunction | `startPlacementCheck` | 47 |
| registerOverwrittenFunction | `canBeSold` | 48 |
| registerOverwrittenFunction | `setOwnerFarmId` | 49 |
