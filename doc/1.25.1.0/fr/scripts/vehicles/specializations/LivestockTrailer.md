# vehicles/specializations/LivestockTrailer.lua

*[English version](../../../../scripts/vehicles/specializations/LivestockTrailer.md)*

Source: `dataS/scripts/vehicles/specializations/LivestockTrailer.lua` — FS25 1.25.1.0

✍ Spécialisation pour les remorques transportant des animaux vivants. Les animaux sont gérés par un `AnimalClusterSystem` ; pour chaque type d'animal le XML définit des nœuds d'emplacement où sont chargés les modèles d'animaux. Un déclencheur de chargement recense les animaux montables, des spawn places définissent les zones de déchargement et un `LivestockTrailerActivatable` ouvre l'interaction. La remorque ajoute poids et valeur (75 pour cent) des animaux à la masse et au prix de vente, fait vieillir ses clusters au changement de jour/période et s'enregistre auprès de `g_currentMission.husbandrySystem`. Aucun prérequis.

- **LivestockTrailer** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LivestockTrailer.initSpecialization()` | 17 | ✍ Enregistre les types de spec boutique pour le nombre de vaches, porcs, moutons et chevaux, le schéma XML (type d'animal, nœud, nombre d'emplacements, déclencheur, spawn places) et les attributs de sauvegarde dont les chemins des clusters. |
| `LivestockTrailer.prerequisitesPresent(specializations: any)` | 42 | ✍ Renvoie toujours vrai : aucune autre spécialisation n'est requise. |
| `LivestockTrailer.registerFunctions(vehicleType: any)` | 48 | ✍ Enregistre sur le type de véhicule les fonctions d'animaux, clusters, emplacements, déclencheur, places de déchargement et contrôleur d'écran de cette spécialisation. |
| `LivestockTrailer.registerOverwrittenFunctions(vehicleType: any)` | 75 | ✍ Surcharge `getAdditionalComponentMass`, `getSellPrice`, `dayChanged` et `periodChanged`. |
| `LivestockTrailer.registerEventListeners(vehicleType: any)` | 84 | ✍ S'abonne aux événements onLoad, onLoadFinished, onDelete, onReadStream et onWriteStream. |
| `LivestockTrailer:onLoad(savegame: table)` | 95 | ✍ Construit les places et emplacements d'animaux par type, ajoute le déclencheur de chargement et les spawn places, crée l'activatable et le système de clusters, s'abonne à `AnimalClusterUpdateEvent` et s'enregistre auprès du husbandry system. À noter : la largeur par défaut d'une spawn place est 15 dans le schéma mais 5 dans le chargeur. |
| `LivestockTrailer:onLoadFinished(savegame: any)` | 173 | ✍ Charge les données de clusters depuis la sauvegarde (sauf réinitialisation des véhicules) et rafraîchit immédiatement le système de clusters. |
| `LivestockTrailer:onDelete()` | 186 | ✍ Efface les animaux, se désabonne des mises à jour de clusters, se retire du husbandry system, supprime déclencheur et activatable, détache les écouteurs de suppression des montures et libère le lien du déclencheur de chargement. |
| `LivestockTrailer:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 218 | ✍ Sauvegarde le système de clusters dans l'entrée de sauvegarde du véhicule. |
| `LivestockTrailer:onReadStream(streamId: any, connection: any)` | 225 | ✍ Connexion client : lit le système de clusters depuis le flux. |
| `LivestockTrailer:onWriteStream(streamId: any, connection: any)` | 232 | ✍ Connexion côté serveur : écrit le système de clusters dans le flux. |
| `LivestockTrailer:getSupportsAnimalType(animalTypeIndex: any)` | 239 | ✍ Renvoie vrai si la remorque définit une place pour l'index de type d'animal donné. |
| `LivestockTrailer:getSupportsAnimalSubType(subTypeIndex: any)` | 245 | ✍ Renvoie vrai si le type auquel appartient l'index de sous-type d'animal donné est géré par cette remorque. |
| `LivestockTrailer:getCurrentAnimalType()` | 255 | ✍ Renvoie la table du type d'animal du premier cluster chargé, ou nil si la remorque est vide. |
| `LivestockTrailer:setLoadingTrigger(trigger: any)` | 271 | ✍ Mémorise le déclencheur de chargement d'animaux actuellement lié à cette remorque. |
| `LivestockTrailer:getLoadingTrigger()` | 277 | ✍ Renvoie le déclencheur de chargement lié, ou nil. |
| `LivestockTrailer:setAnimalScreenController(controller: any)` | 283 | ✍ Mémorise le contrôleur d'écran d'animaux notifié quand des montures entrent ou sortent du déclencheur. |
| `LivestockTrailer:addAnimals(subTypeIndex: any, numAnimals: any, age: any)` | 289 | ✍ Crée un ou plusieurs clusters pour un sous-type avec le nombre et l'âge donnés et les ajoute. Les clusters fusionnables forment un seul cluster ; sinon un cluster d'un animal par animal. |
| `LivestockTrailer:addCluster(cluster: any)` | 309 | ✍ Met le cluster en attente d'ajout dans le système de clusters et le met à jour immédiatement. |
| `LivestockTrailer:getClusters()` | 318 | ✍ Renvoie la liste des clusters d'animaux présents sur la remorque. |
| `LivestockTrailer:getRideablesInTrigger()` | 325 | ✍ Renvoie la table des animaux montables gérés actuellement dans le déclencheur de chargement. |
| `LivestockTrailer:getClusterById(id: any)` | 332 | ✍ Renvoie le cluster portant l'identifiant donné dans le système de clusters. |
| `LivestockTrailer:getClusterSystem()` | 339 | ✍ Renvoie l'`AnimalClusterSystem` de la remorque. |
| `LivestockTrailer:getNumOfAnimals()` | 346 | ✍ Renvoie le nombre d'emplacements occupés pour le type d'animal actuel (0 si vide). |
| `LivestockTrailer:getMaxNumOfAnimals(animalType: any)` | 363 | ✍ Renvoie la capacité en emplacements pour le type d'animal donné, ou le type actuel si nil. Renvoie 0 si la remorque est vide sans type donné, contient un autre type ou ne gère pas ce type. |
| `LivestockTrailer:getNumOfFreeAnimalSlots(subTypeIndex: any)` | 387 | ✍ Renvoie les emplacements libres pour le type du sous-type donné : capacité moins nombre d'animaux actuel. |
| `LivestockTrailer:updatedClusters(trailer: any)` | 399 | ✍ Callback du message center : si la remorque mise à jour est celle-ci, reconstruit les animaux visibles et marque la masse comme à recalculer. |
| `LivestockTrailer:updateAnimals()` | 408 | ✍ Efface les modèles existants puis charge de façon asynchrone un modèle d'animal posé par animal dans des emplacements consécutifs, selon sous-type et âge. |
| `LivestockTrailer:clearAnimals()` | 443 | ✍ Libère les requêtes de chargement i3D partagées et supprime tous les modèles d'animaux chargés dans tous les emplacements. |
| `LivestockTrailer:onAnimalLoaded(i3dNode: any, failedReason: any, args: any)` | 463 | ✍ Callback de chargement asynchrone : en cas de succès, rattache le modèle à son nœud d'emplacement et règle le paramètre shader d'atlas UV de la variation visuelle, avec saleté nulle. |
| `LivestockTrailer:getAdditionalComponentMass(superFunc: any, component: any)` | 483 | ✍ Surcharge : ajoute le poids des animaux (masse par litre du fill type fois nombre d'animaux) à la masse du composant. |
| `LivestockTrailer:getSellPrice(superFunc: any)` | 502 | ✍ Surcharge : ajoute 75 pour cent du prix de vente total des animaux au prix de vente du véhicule. |
| `LivestockTrailer:dayChanged(superFunc: any)` | 518 | ✍ Surcharge : après le comportement parent, appelle `onDayChanged` sur chaque cluster. |
| `LivestockTrailer:periodChanged(superFunc: any)` | 530 | ✍ Surcharge : après le comportement parent, appelle `onPeriodChanged` sur chaque cluster. |
| `LivestockTrailer:onAnimalLoadTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 542 | ✍ Callback du déclencheur : suit les animaux montables d'un sous-type géré qui entrent ou sortent du déclencheur, écoute leur suppression et notifie le contrôleur d'écran d'animaux. |
| `LivestockTrailer:onAnimalRideableDeleted(rideable: any)` | 571 | ✍ Callback de l'écouteur de suppression : retire la monture supprimée de la liste du déclencheur et notifie le contrôleur d'écran d'animaux. |
| `LivestockTrailer:getAnimalUnloadPlaces()` | 583 | ✍ Construit et renvoie une liste de descripteurs de places de déchargement (position de départ, rotation, directions, largeur, taille illimitée, décalage y de 1) à partir des nœuds de spawn place. |
| `LivestockTrailer.loadSpecValueNumberAnimals(xmlFile: any, customEnvironment: any, baseDir: any, animalTypeName: any)` | 611 | ✍ Lit le `numSlots` de la première entrée `livestockTrailer.animal` correspondant au nom de type d'animal donné (insensible à la casse) dans le XML d'un article de boutique ; renvoie nil sinon. |
| `LivestockTrailer.loadSpecValueNumberAnimalsCow(xmlFile: any, customEnvironment: any, baseDir: any)` | 635 | ✍ Chargeur de spec boutique pour le nombre d'emplacements de vaches. |
| `LivestockTrailer.loadSpecValueNumberAnimalsPig(xmlFile: any, customEnvironment: any, baseDir: any)` | 641 | ✍ Chargeur de spec boutique pour le nombre d'emplacements de porcs. |
| `LivestockTrailer.loadSpecValueNumberAnimalsSheep(xmlFile: any, customEnvironment: any, baseDir: any)` | 647 | ✍ Chargeur de spec boutique pour le nombre d'emplacements de moutons. |
| `LivestockTrailer.loadSpecValueNumberAnimalsHorse(xmlFile: any, customEnvironment: any, baseDir: any)` | 653 | ✍ Chargeur de spec boutique pour le nombre d'emplacements de chevaux. |
| `LivestockTrailer.getSpecValueNumberAnimals(storeItem: any, realItem: any, specName: any)` | 659 | ✍ Formate le nombre d'emplacements enregistré pour la spec nommée sous forme de texte avec l'unité de pièces ; renvoie nil si l'article n'a pas cette spec. |
| `LivestockTrailer.getSpecValueNumberAnimalsCow(storeItem: any, realItem: any)` | 668 | ✍ Getter de spec boutique pour le texte du nombre d'emplacements de vaches. |
| `LivestockTrailer.getSpecValueNumberAnimalsPig(storeItem: any, realItem: any)` | 674 | ✍ Getter de spec boutique pour le texte du nombre d'emplacements de porcs. |
| `LivestockTrailer.getSpecValueNumberAnimalsSheep(storeItem: any, realItem: any)` | 680 | ✍ Getter de spec boutique pour le texte du nombre d'emplacements de moutons. |
| `LivestockTrailer.getSpecValueNumberAnimalsHorse(storeItem: any, realItem: any)` | 686 | ✍ Getter de spec boutique pour le texte du nombre d'emplacements de chevaux. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getCurrentAnimalType` | 49 |
| registerFunction | `getSupportsAnimalType` | 50 |
| registerFunction | `getSupportsAnimalSubType` | 51 |
| registerFunction | `setLoadingTrigger` | 52 |
| registerFunction | `getLoadingTrigger` | 53 |
| registerFunction | `updateAnimals` | 54 |
| registerFunction | `updatedClusters` | 55 |
| registerFunction | `clearAnimals` | 56 |
| registerFunction | `addAnimals` | 57 |
| registerFunction | `addCluster` | 58 |
| registerFunction | `getClusters` | 59 |
| registerFunction | `getRideablesInTrigger` | 60 |
| registerFunction | `getClusterById` | 61 |
| registerFunction | `getClusterSystem` | 62 |
| registerFunction | `getNumOfAnimals` | 63 |
| registerFunction | `getMaxNumOfAnimals` | 64 |
| registerFunction | `getNumOfFreeAnimalSlots` | 65 |
| registerFunction | `onAnimalLoaded` | 66 |
| registerFunction | `onAnimalLoadTriggerCallback` | 67 |
| registerFunction | `getAnimalUnloadPlaces` | 68 |
| registerFunction | `setAnimalScreenController` | 69 |
| registerFunction | `onAnimalRideableDeleted` | 70 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 76 |
| registerOverwrittenFunction | `getSellPrice` | 77 |
| registerOverwrittenFunction | `dayChanged` | 78 |
| registerOverwrittenFunction | `periodChanged` | 79 |
| registerEventListener | `onLoad` | 85 |
| registerEventListener | `onLoadFinished` | 86 |
| registerEventListener | `onDelete` | 87 |
| registerEventListener | `onReadStream` | 88 |
| registerEventListener | `onWriteStream` | 89 |
