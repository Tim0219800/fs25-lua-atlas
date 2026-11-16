# placeables/specializations/PlaceableMultiBunkerSilo.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableMultiBunkerSilo.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableMultiBunkerSilo.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour les silos-couloirs pouvant contenir plusieurs objets BunkerSilo choisis par une configuration, avec parois latérales optionnelles. Les silos extensibles de même type et de même propriétaire s'alignent lors du placement et masquent les parois qui les séparent. Elle déclare un type de configuration bunkerSilo et s'enregistre dans le système de placeables de la mission ; BunkerSilo est défini ailleurs.

- **PlaceableMultiBunkerSilo** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableMultiBunkerSilo.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceableMultiBunkerSilo.initSpecialization()` | 25 | ✍ Enregistre le type de configuration de placeable bunkerSilo (avec son libellé localisé) dans le gestionnaire de configurations. |
| `PlaceableMultiBunkerSilo.registerEventListeners(placeableType: any)` | 31 | ✍ S'abonne à onLoad, onDelete, onFinalizePlacement, onReadStream, onWriteStream et onSell. |
| `PlaceableMultiBunkerSilo.registerFunctions(placeableType: any)` | 42 | ✍ Enregistre updateBunkerSiloWalls, setWallVisibility et getIsBunkerSiloExtendable sur le type de placeable. |
| `PlaceableMultiBunkerSilo.registerOverwrittenFunctions(placeableType: any)` | 50 | ✍ Surcharge getPlacementPosition, getPlacementRotation, getHasOverlap, startPlacementCheck, canBeSold et setOwnerFarmId. |
| `PlaceableMultiBunkerSilo.registerXMLPaths(schema: any, basePath: any)` | 61 | ✍ Déclare les clés XML bunkerSilo : isExtendable, siloToSiloDistance, snapDistance (défaut 1,1 fois la distance), texte d'avertissement de vente, nœud et collision de wallLeft/wallBack/wallRight, et entrées BunkerSilo par configuration. |
| `PlaceableMultiBunkerSilo.registerSavegameXMLPaths(schema: any, basePath: any)` | 84 | ✍ Enregistre les clés de sauvegarde de chaque entrée bunkerSilo en déléguant à BunkerSilo.registerSavegameXMLPaths. |
| `PlaceableMultiBunkerSilo:onLoad(savegame: table)` | 93 | ✍ Charge les nœuds de parois, le texte d'avertissement de vente et un BunkerSilo par entrée de la configuration choisie, puis lit isExtendable et les distances (erreur et état de chargement ERROR si siloToSiloDistance manque). À noter : la paroi arrière est lue depuis wallRight puis écrase spec.wallRight avec wallBack, donc spec.wallBack n'est jamais défini. |
| `PlaceableMultiBunkerSilo:onDelete()` | 156 | ✍ Rétablit les parois des silos voisins, supprime tous les objets BunkerSilo et retire ce placeable de la liste des silos du système de placeables. |
| `PlaceableMultiBunkerSilo:onFinalizePlacement()` | 171 | ✍ Masque les parois partagées avec les silos voisins, enregistre chaque BunkerSilo comme objet réseau avec la ferme propriétaire et ajoute le placeable à la liste des silos du système de placeables. |
| `PlaceableMultiBunkerSilo:onReadStream(streamId: any, connection: any)` | 187 | ✍ Côté client à la connexion : lit l'identifiant d'objet et les données de flux de chaque BunkerSilo et termine son enregistrement client. |
| `PlaceableMultiBunkerSilo:onWriteStream(streamId: any, connection: any)` | 199 | ✍ Côté serveur à la connexion : écrit l'identifiant d'objet et les données de flux de chaque BunkerSilo et l'enregistre dans le flux de la connexion. |
| `PlaceableMultiBunkerSilo:loadFromXMLFile(xmlFile: any, key: any)` | 211 | ✍ Chargement de sauvegarde : charge chaque BunkerSilo depuis sa clé bunkerSilo indexée ; renvoie false si l'un d'eux échoue. |
| `PlaceableMultiBunkerSilo:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 227 | ✍ Écriture de sauvegarde : écrit chaque BunkerSilo sous une clé bunkerSilo indexée. |
| `PlaceableMultiBunkerSilo:setWallVisibility(isLeftVisible: any, isBackVisible: any, isRightVisible: any)` | 238 | ✍ Affiche ou masque les parois gauche, arrière et droite (visibilité du nœud et corps de collision statique/aucun). À noter : chaque indicateur est combiné à l'état actuel par un 'ou', donc une paroi visible ne peut pas être masquée ainsi, et la paroi droite utilise l'indicateur gauche. |
| `PlaceableMultiBunkerSilo:getIsBunkerSiloExtendable()` | 280 | ✍ Indique si ce silo est déclaré extensible dans le XML. |
| `PlaceableMultiBunkerSilo:updateBunkerSiloWalls(isDeleting: any)` | 287 | ✍ Pour les autres silos extensibles de même fichier de config et de même ferme à moins de siloToSiloDistance + 0,5 m, appelle setWallVisibility sur le voisin : masque la paroi en regard au placement, l'affiche à la suppression. |
| `PlaceableMultiBunkerSilo:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 328 | ✍ Surcharge : appelle le parent puis applique la même ferme propriétaire à chaque BunkerSilo sans envoyer d'événement. |
| `PlaceableMultiBunkerSilo:onSell()` | 342 | ✍ À la vente, vide la zone de chaque BunkerSilo. |
| `PlaceableMultiBunkerSilo:canBeSold(superFunc: any)` | 351 | ✍ Surcharge : renvoie toujours true, avec le texte d'avertissement de vente si un BunkerSilo a un niveau de remplissage supérieur à zéro, sinon nil. |
| `PlaceableMultiBunkerSilo:startPlacementCheck(superFunc: function, x: number?, y: number?, z: number?, rotY: number?)` | 371 | ✍ Surcharge : après le parent, pour les silos extensibles, cherche le silo le plus proche de la ferme locale et de même config à moins de snapDistance et mémorise celui-ci ainsi que le côté (signe du x local) pour l'alignement. |
| `PlaceableMultiBunkerSilo:getHasOverlap(superFunc: any, x: any, y: any, z: any, rotY: any, checkFunc: any)` | 404 | ✍ Surcharge : si un silo d'alignement a été trouvé, enveloppe le test de chevauchement pour ignorer les collisions avec ce silo ; sinon transmet le test au parent. |
| `PlaceableMultiBunkerSilo:getPlacementRotation(superFunc: any, x: any, y: any, z: any)` | 428 | ✍ Surcharge : renvoie la rotation du parent, remplacée par l'orientation Y du silo d'alignement s'il y en a un. |
| `PlaceableMultiBunkerSilo:getPlacementPosition(superFunc: any, x: any, y: any, z: any)` | 442 | ✍ Surcharge : renvoie la position du parent, remplacée par un point à siloToSiloDistance sur le côté du silo d'alignement s'il y en a un. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 32 |
| registerEventListener | `onDelete` | 33 |
| registerEventListener | `onFinalizePlacement` | 34 |
| registerEventListener | `onReadStream` | 35 |
| registerEventListener | `onWriteStream` | 36 |
| registerEventListener | `onSell` | 37 |
| registerFunction | `updateBunkerSiloWalls` | 43 |
| registerFunction | `setWallVisibility` | 44 |
| registerFunction | `getIsBunkerSiloExtendable` | 45 |
| registerOverwrittenFunction | `getPlacementPosition` | 51 |
| registerOverwrittenFunction | `getPlacementRotation` | 52 |
| registerOverwrittenFunction | `getHasOverlap` | 53 |
| registerOverwrittenFunction | `startPlacementCheck` | 54 |
| registerOverwrittenFunction | `canBeSold` | 55 |
| registerOverwrittenFunction | `setOwnerFarmId` | 56 |
