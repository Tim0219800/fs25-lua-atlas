# animals/husbandry/placeables/PlaceableHusbandryAnimals.lua

*[English version](../../../../../scripts/animals/husbandry/placeables/PlaceableHusbandryAnimals.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryAnimals.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui transforme un bâtiment d'élevage en détenteur de troupeau. Elle exige la spécialisation `PlaceableHusbandry`, lit le type d'animal, le maillage de navigation, la capacité et les zones de livraison sous `placeable.husbandry.animals`, et possède un `AnimalClusterSystem` (données des animaux, autoritaire côté serveur) ainsi qu'un `AnimalClusterHusbandry` (animaux visibles pilotés par le moteur). Elle gère aussi la reproduction au changement de période, la santé, l'équitation, les zones de livraison et la capacité affichée en boutique.

- **PlaceableHusbandryAnimals** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryAnimals.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Renvoie vrai uniquement si la spécialisation `PlaceableHusbandry` fait partie de celles du type de placeable. |
| `PlaceableHusbandryAnimals.registerEvents(placeableType: any)` | 25 | ✍ Déclare les événements `onHusbandryAnimalsCreated` et `onHusbandryAnimalsUpdate` sur le type de placeable. |
| `PlaceableHusbandryAnimals.registerFunctions(placeableType: any)` | 32 | ✍ Enregistre les méthodes publiques de la spécialisation (accès aux clusters, nombres d'animaux, équitation, zone de livraison, maillage de navigation) sur le type de placeable. Certaines méthodes enregistrées n'ont pas de corps dans le dump du SDK. |
| `PlaceableHusbandryAnimals.registerOverwrittenFunctions(placeableType: any)` | 67 | ✍ Enregistre les surcharges de `getNeedDayChanged`, `updateInfo`, `updateOutput`, `canBeSold`, `getConditionInfos`, `getAnimalInfos` et `getAnimalDescription`. |
| `PlaceableHusbandryAnimals.registerEventListeners(placeableType: any)` | 79 | ✍ Abonne la spécialisation à `onLoad`, `onDelete`, `onFinalizePlacement`, `onReadStream`, `onWriteStream`, `onUpdate`, `onPeriodChanged` et `onDayChanged`. |
| `PlaceableHusbandryAnimals.registerXMLPaths(schema: any, basePath: any)` | 92 | ✍ Enregistre les clés XML sous `husbandry.animals` : noeuds et fichier externe de navigation, type et fichier de configuration des animaux, distance de raycast, nombre maximal d'animaux, surface par animal, limite d'animaux visuels, déclencheur de chargement et zones de livraison. |
| `PlaceableHusbandryAnimals.registerSavegameXMLPaths(schema: any, basePath: any)` | 116 | ✍ Enregistre les chemins XML de sauvegarde des clusters d'animaux en déléguant à `AnimalClusterSystem.registerSavegameXMLPaths` sous `.clusters`. |
| `PlaceableHusbandryAnimals.initSpecialization()` | 124 | ✍ Ajoute la spécification de boutique `numberAnimals` (icône de capacité) et, uniquement dans une version de développement, les commandes console `gsHusbandryAddAnimals` et `gsHusbandryDebugToggle`. |
| `PlaceableHusbandryAnimals:onLoad(savegame: any)` | 142 | ✍ Lit le type d'animal (état d'erreur s'il manque ou est inconnu), les réglages du maillage de navigation, les capacités et les zones de livraison, crée le cluster husbandry et le système de clusters, et s'abonne à `AnimalClusterUpdateEvent`. Peut lancer le chargement asynchrone d'un maillage de navigation externe et crée le déclencheur de chargement. |
| `PlaceableHusbandryAnimals:onDelete()` | 243 | ✍ Se désabonne des messages, retire la collision de placement du maillage de navigation, retire et supprime le cluster husbandry, supprime le déclencheur de chargement et libère le fichier i3D partagé de navigation. |
| `PlaceableHusbandryAnimals:onFinalizePlacement()` | 269 | ✍ Crée le maillage de navigation une fois le placement finalisé ; pour un placeable chargé depuis une sauvegarde, programme aussi un rappel unique au démarrage de la mission. |
| `PlaceableHusbandryAnimals:onReadStream(streamId: any, connection: any)` | 279 | ✍ Lecture réseau : le système de clusters lit les données d'animaux envoyées par le serveur quand un client rejoint. |
| `PlaceableHusbandryAnimals:onWriteStream(streamId: any, connection: any)` | 286 | ✍ Écriture réseau : le système de clusters écrit ses données d'animaux dans le flux pour un client qui rejoint. |
| `PlaceableHusbandryAnimals:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 293 | ✍ Sauvegarde les clusters d'animaux sous la clé `.clusters` de la sauvegarde. |
| `PlaceableHusbandryAnimals:loadFromXMLFile(xmlFile: any, key: any)` | 300 | ✍ Charge les clusters d'animaux depuis la clé `.clusters` de la sauvegarde. |
| `PlaceableHusbandryAnimals:onUpdate(dt: any)` | 307 | ✍ Mise à jour par frame : sur le serveur met à jour le système de clusters, puis le cluster husbandry, rafraîchit les animaux visuels si demandé, et maintient le placeable actif tant que l'élevage a besoin de mises à jour. |
| `PlaceableHusbandryAnimals:onExternalNavigationMeshLoaded(node: any, failedReason: any, args: any)` | 329 | ✍ Rappel du chargement asynchrone du fichier de navigation externe : sélectionne le noeud de maillage par son chemin, le rattache sous le noeud racine de navigation, supprime la racine chargée et termine la tâche de chargement. Journalise une erreur si le noeud manque. |
| `PlaceableHusbandryAnimals:createHusbandry()` | 488 | ✍ Valide le maillage de navigation (présent, de type maillage de navigation, surface non nulle), puis crée l'élevage moteur avec le masque de collision animal solo ou multijoueur et l'enregistre dans le husbandry system. Déclenche `onHusbandryAnimalsCreated` en cas de succès. |
| `PlaceableHusbandryAnimals:updateInfo(superFunc: any, infoTable: any)` | 539 | ✍ Complète la liste d'informations de base avec le nombre d'animaux (actuel / maximum) et la santé moyenne en pourcentage de tous les clusters. |
| `PlaceableHusbandryAnimals:getNeedDayChanged(superFunc: any)` | 564 | ✍ Surcharge qui renvoie toujours vrai : cet élevage demande toujours les rappels de changement de jour. |
| `PlaceableHusbandryAnimals:onMissionStarted(isNewSavegame: any)` | 570 | ✍ Rappel unique au démarrage de la mission qui rafraîchit les animaux visuels, afin qu'un serveur dédié (en pause au démarrage) les montre au premier joueur qui rejoint. |
| `PlaceableHusbandryAnimals:updateVisualAnimals()` | 579 | ✍ Transmet les clusters actuels au cluster husbandry pour que les animaux visibles correspondent aux données, et maintient le placeable actif. |
| `PlaceableHusbandryAnimals:getAnimalTypeIndex()` | 588 | ✍ Renvoie l'indice du type d'animal de cet élevage. |
| `PlaceableHusbandryAnimals:updateOutput(superFunc: any, foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 595 | ✍ Surcharge : sur le serveur met à jour la santé de chaque cluster avec le facteur de nourriture, puis appelle l'implémentation parente. |
| `PlaceableHusbandryAnimals:onPeriodChanged()` | 611 | ✍ Serveur uniquement. Pour chaque cluster exécute sa logique de période et de reproduction ; les nouveau-nés forment un nouveau cluster en attente, limité par les places libres, et la statistique d'élevage de la ferme est mise à jour. |
| `PlaceableHusbandryAnimals:onDayChanged()` | 649 | ✍ Serveur uniquement : appelle le gestionnaire de changement de jour de chaque cluster d'animaux. |
| `PlaceableHusbandryAnimals:getNumOfAnimals()` | 661 | ✍ Renvoie le nombre total d'animaux, somme sur tous les clusters. |
| `PlaceableHusbandryAnimals:getMaxNumOfAnimals()` | 674 | ✍ Renvoie la capacité actuelle : `spec.maxNumAnimals` s'il est défini, sinon le maximum de base du XML. |
| `PlaceableHusbandryAnimals:getNumOfFreeAnimalSlots()` | 681 | ✍ Renvoie le nombre de places libres (capacité moins animaux), jamais inférieur à zéro. |
| `PlaceableHusbandryAnimals:getSupportsAnimalSubType(subTypeIndex: any)` | 689 | ✍ Renvoie vrai si le sous-type d'animal donné appartient au type d'animal de cet élevage. |
| `PlaceableHusbandryAnimals:getNumOfClusters()` | 699 | ✍ Renvoie le nombre de clusters d'animaux de l'élevage. |
| `PlaceableHusbandryAnimals:getClusters()` | 707 | ✍ Renvoie la liste des clusters d'animaux du système de clusters. |
| `PlaceableHusbandryAnimals:getCluster(index: any)` | 714 | ✍ Renvoie le cluster à l'indice donné dans le système de clusters. |
| `PlaceableHusbandryAnimals:getClusterById(id: any)` | 721 | ✍ Renvoie le cluster portant l'identifiant donné dans le système de clusters. |
| `PlaceableHusbandryAnimals:addCluster(cluster: any)` | 728 | ✍ Place un cluster en attente d'ajout dans le système de clusters et réveille le placeable. Sans effet si le cluster est nil. |
| `PlaceableHusbandryAnimals:addAnimals(subTypeIndex: any, numAnimals: any, age: any)` | 738 | ✍ Ajoute des animaux d'un sous-type avec un âge donné : en un seul cluster fusionné si le cluster le permet, sinon en un cluster d'un animal par animal. |
| `PlaceableHusbandryAnimals:getClusterSystem()` | 759 | ✍ Renvoie l'`AnimalClusterSystem` de cet élevage. |
| `PlaceableHusbandryAnimals:updatedClusters(husbandry: any)` | 766 | ✍ Gestionnaire de `AnimalClusterUpdateEvent` ; s'il concerne cet élevage, déclenche `onHusbandryAnimalsUpdate`, publie `HUSBANDRY_ANIMALS_CHANGED` et demande un rafraîchissement visuel. |
| `PlaceableHusbandryAnimals:renameAnimal(clusterId: any, name: any, noEventSend: any)` | 782 | ✍ Envoie un `AnimalNameEvent` (synchronisation réseau sauf si `noEventSend`) et applique le nouveau nom au cluster ayant cet identifiant. |
| `PlaceableHusbandryAnimals:getAnimalSupportsRiding(clusterId: any)` | 794 | ✍ Renvoie vrai si le cluster portant cet identifiant possède un fichier de véhicule montable. |
| `PlaceableHusbandryAnimals:getAnimalCanBeRidden(clusterId: any)` | 809 | ✍ Demande au husbandry system si la ferme propriétaire peut ajouter un autre animal montable ; l'identifiant du cluster n'est pas utilisé. |
| `PlaceableHusbandryAnimals:startRiding(clusterId: any, player: any)` | 816 | ✍ Sur un client, envoie un `AnimalRidingEvent` au serveur. Sur le serveur retire un animal du cluster et fait apparaître le véhicule montable à sa position ; le joueur y entre une fois chargé. |
| `PlaceableHusbandryAnimals:onLoadedRideable(vehicles: any, vehicleLoadState: any, arguments: any)` | 851 | ✍ Rappel après chargement du véhicule montable : en cas d'échec rend l'animal au cluster ; en cas de succès clone le cluster avec un animal, l'assigne au véhicule et fait entrer le joueur. |
| `PlaceableHusbandryAnimals:loadDeliveryArea(xmlFile: any, key: any, area: any)` | 870 | ✍ Lit une zone de livraison (noeuds de départ, de largeur et de hauteur) depuis le XML ; journalise un avertissement et renvoie faux si un noeud manque. |
| `PlaceableHusbandryAnimals:getIsInAnimalDeliveryArea(x: any, z: any)` | 898 | ✍ Teste si la position monde (x, z) est dans la zone de livraison : le polygone de contour extérieur s'il existe, sinon l'un des parallélogrammes de livraison, sinon à moins de 30 m de la racine du placeable si aucune zone n'est définie. |
| `PlaceableHusbandryAnimals.loadSpecValueNumberAnimals(xmlFile: any, customEnvironment: any, baseDir: any)` | 935 | ✍ Chargeur de spécification de boutique : renvoie le nombre maximal d'animaux et le nom du type d'animal si le XML contient `placeable.husbandry.animals`, sinon nil. |
| `PlaceableHusbandryAnimals.getSpecValueNumberAnimals(storeItem: any, realItem: any)` | 949 | ✍ Accesseur de spécification de boutique : renvoie le nombre maximal d'animaux et le profil d'icône de boutique correspondant à vache, mouton, cheval, porc ou poule (profil nil pour les autres types). |
| `PlaceableHusbandryAnimals:canBeSold(superFunc: any)` | 976 | ✍ Surcharge : refuse la vente avec un message tant que l'élevage contient des animaux, sinon délègue au parent. |
| `PlaceableHusbandryAnimals:getConditionInfos(superFunc: any)` | 986 | ✍ Surcharge : pour les types d'animaux autres que cheval et porc, ajoute une entrée de productivité (facteur global fois facteur local, en pourcentage). |
| `PlaceableHusbandryAnimals:getAnimalInfos(superFunc: any, cluster: any)` | 1006 | ✍ Surcharge : récupère la liste d'infos du parent et laisse le cluster y ajouter les siennes. À noter : appelle le parent sans lui transmettre l'argument cluster. |
| `PlaceableHusbandryAnimals:getAnimalDescription(superFunc: any, cluster: any)` | 1016 | ✍ Surcharge : ajoute au texte du parent la description boutique du visuel correspondant au sous-type et à l'âge du cluster. |
| `PlaceableHusbandryAnimals.consoleCommandAddAnimals(_: any, numAnimals: any, subTypeIndex: any)` | 1099 | ✍ Commande console de développement `gsHusbandryAddAnimals` : lance un raycast sous la caméra active pour trouver l'élevage, puis ajoute des animaux (nombre positif, sous-type optionnel) ou en retire (nombre négatif). Renvoie un message d'état. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onHusbandryAnimalsCreated` | 26 |
| registerEvent | `onHusbandryAnimalsUpdate` | 27 |
| registerFunction | `onExternalNavigationMeshLoaded` | 33 |
| registerFunction | `createNavigationMeshFromContour` | 34 |
| registerFunction | `createNavigationMesh` | 35 |
| registerFunction | `setMaxNumAnimals` | 36 |
| registerFunction | `createHusbandry` | 37 |
| registerFunction | `updateVisualAnimals` | 38 |
| registerFunction | `getNumOfFreeAnimalSlots` | 39 |
| registerFunction | `getNumOfAnimals` | 40 |
| registerFunction | `getMaxNumOfAnimals` | 41 |
| registerFunction | `getNumOfClusters` | 42 |
| registerFunction | `getSupportsAnimalSubType` | 43 |
| registerFunction | `getClusters` | 44 |
| registerFunction | `getCluster` | 45 |
| registerFunction | `getClusterById` | 46 |
| registerFunction | `getClusterSystem` | 47 |
| registerFunction | `getAnimalTypeIndex` | 48 |
| registerFunction | `renameAnimal` | 49 |
| registerFunction | `addCluster` | 50 |
| registerFunction | `addAnimals` | 51 |
| registerFunction | `updatedClusters` | 52 |
| registerFunction | `consoleCommandAddAnimals` | 53 |
| registerFunction | `getAnimalSupportsRiding` | 54 |
| registerFunction | `getAnimalCanBeRidden` | 55 |
| registerFunction | `startRiding` | 56 |
| registerFunction | `onLoadedRideable` | 57 |
| registerFunction | `getIsInAnimalDeliveryArea` | 58 |
| registerFunction | `loadDeliveryArea` | 59 |
| registerFunction | `getOutdoorContourPolygon` | 60 |
| registerFunction | `createNavigationMeshPlacementCollision` | 61 |
| registerFunction | `deleteNavigationMeshPlacementCollision` | 62 |
| registerOverwrittenFunction | `getNeedDayChanged` | 68 |
| registerOverwrittenFunction | `updateInfo` | 69 |
| registerOverwrittenFunction | `updateOutput` | 70 |
| registerOverwrittenFunction | `canBeSold` | 71 |
| registerOverwrittenFunction | `getConditionInfos` | 72 |
| registerOverwrittenFunction | `getAnimalInfos` | 73 |
| registerOverwrittenFunction | `getAnimalDescription` | 74 |
| registerEventListener | `onLoad` | 80 |
| registerEventListener | `onDelete` | 81 |
| registerEventListener | `onFinalizePlacement` | 82 |
| registerEventListener | `onReadStream` | 83 |
| registerEventListener | `onWriteStream` | 84 |
| registerEventListener | `onUpdate` | 85 |
| registerEventListener | `onPeriodChanged` | 86 |
| registerEventListener | `onDayChanged` | 87 |

## Messages

- publie `MessageType.HUSBANDRY_ANIMALS_CHANGED` (l.773)
