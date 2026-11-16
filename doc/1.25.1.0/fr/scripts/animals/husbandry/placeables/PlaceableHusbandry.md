# animals/husbandry/placeables/PlaceableHusbandry.lua

*[English version](../../../../../scripts/animals/husbandry/placeables/PlaceableHusbandry.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandry.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable de base commune à tous les élevages. Elle charge en option une UnloadingStation, un Storage et une LoadingStation depuis le XML `placeable.husbandry`, les enregistre auprès du système de stockage de la mission et tient l'élevage inscrit dans husbandrySystem. Chaque heure sur le serveur, elle appelle updateFeeding, updateProduction et updateOutput (des stubs ici, à surcharger) et fait monter ou descendre un facteur de production global autour d'un seuil. Elle déclenche les événements onHusbandryFillLevelChanged et onFinishedFeeding.

- **PlaceableHusbandry** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandry.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Retourne toujours true : cette spécialisation n'a aucune spécialisation prérequise. |
| `PlaceableHusbandry.registerEvents(placeableType: any)` | 24 | ✍ Enregistre les événements de placeable onHusbandryFillLevelChanged et onFinishedFeeding. |
| `PlaceableHusbandry.registerFunctions(placeableType: any)` | 31 | ✍ Enregistre les fonctions de la spécialisation sur le type de placeable : callbacks de stations, mises à jour d'alimentation et de production, getters d'infos et aides de niveau de remplissage. À noter : getProductionFactor est enregistrée mais aucune fonction de ce nom n'existe dans ce fichier, elle est donc enregistrée à nil. |
| `PlaceableHusbandry.registerOverwrittenFunctions(placeableType: any)` | 55 | ✍ Surcharge setOwnerFarmId, collectPickObjects, getCanBePlacedAt, canBuy et getNeedHourChanged du placeable. |
| `PlaceableHusbandry.registerEventListeners(placeableType: any)` | 65 | ✍ Abonne la spécialisation à onLoad, onDelete, onFinalizePlacement, aux quatre événements de flux, à onHourChanged et à onBuy. |
| `PlaceableHusbandry.registerXMLPaths(schema: any, basePath: any)` | 79 | ✍ Enregistre les chemins XML `.husbandry` : saveId, hasStatistics, seuil de production et taux d'augmentation et de diminution par heure, ainsi que les schémas imbriqués unloadingStation, storage et loadingStation. |
| `PlaceableHusbandry.registerSavegameXMLPaths(schema: any, basePath: any)` | 94 | ✍ Enregistre les chemins de sauvegarde : noms de modules, globalProductionFactor, productionFactor et le schéma de sauvegarde du stockage. |
| `PlaceableHusbandry:onLoad(savegame: table)` | 106 | ✍ Crée l'unloading station, le storage et la loading station présents dans le XML (en cas d'échec, journalise une erreur et met l'état de chargement du placeable à ERROR) et lit le seuil de production (défaut 0.25, borné de 0.01 à 0.99) et les variations horaires. Prépare le callback de niveau de remplissage qui déclenche l'événement associé. |
| `PlaceableHusbandry:onDelete()` | 169 | ✍ Retire et supprime les stations et le stockage du système de stockage, retire la loading station de lisier si elle le gère, désabonne les messages de stockage et retire le placeable de husbandrySystem. |
| `PlaceableHusbandry:onFinalizePlacement()` | 206 | ✍ S'abonne aux messages d'ajout et de retrait de stockage, enregistre les stations et le stockage auprès du système de stockage (la ferme propriétaire EVERYONE devient NOBODY), les relie, ajoute les extensions de stockage utilisables à portée et inscrit l'élevage dans husbandrySystem. |
| `PlaceableHusbandry:onReadStream(streamId: any, connection: any)` | 273 | ✍ Connexion d'un client : lit chaque station et stockage existant avec son identifiant d'objet et termine l'enregistrement, puis lit les deux facteurs de production sous forme d'octets divisés par 255. |
| `PlaceableHusbandry:onWriteStream(streamId: any, connection: any)` | 300 | ✍ Connexion côté serveur : écrit chaque station et stockage avec son identifiant d'objet et enregistre l'objet dans le flux, puis les deux facteurs de production ramenés à un octet (fois 255). |
| `PlaceableHusbandry:onReadUpdateStream(streamId: any, connection: any)` | 327 | ✍ Lit les deux facteurs de production sous forme d'octets divisés par 100. À noter : le flux de connexion utilise l'échelle 255 et les flux de mise à jour l'échelle 100, les deux chemins sont donc incohérents. |
| `PlaceableHusbandry:onWriteUpdateStream(streamId: any, connection: any)` | 336 | ✍ Écrit les deux facteurs de production sous forme d'octets à l'échelle 100 (voir la note d'échelle de onReadUpdateStream). |
| `PlaceableHusbandry:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 345 | ✍ Sauvegarde le stockage (sous `.storage`) et les facteurs de production global et courant dans la sauvegarde. |
| `PlaceableHusbandry:loadFromXMLFile(xmlFile: any, key: any)` | 357 | ✍ Charge le stockage et les deux facteurs de production depuis la sauvegarde, avec les valeurs courantes par défaut. |
| `PlaceableHusbandry:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 368 | ✍ Surcharge : après l'appel du parent, propage la ferme propriétaire au stockage et aux deux stations (EVERYONE devient NOBODY) et rattache les extensions de stockage à portée pour un vrai propriétaire. |
| `PlaceableHusbandry:collectPickObjects(superFunc: any, node: any, target: any)` | 408 | ✍ Surcharge : ignore les noeuds qui sont les noeuds racine de remplissage exact de l'unloading station ou les noeuds de déclencheur de la loading station, afin qu'ils ne soient pas pris pour le placeable ; les autres vont au parent. |
| `PlaceableHusbandry:getCanBePlacedAt(superFunc: any, x: any, y: any, z: any, farmId: any)` | 432 | ✍ Surcharge : retourne false avec un message de trop nombreux élevages quand la limite est atteinte, sinon délègue au parent. À noter : farmId n'est pas transmis au parent. |
| `PlaceableHusbandry:canBuy(superFunc: any)` | 442 | ✍ Surcharge : retourne false avec un message de trop nombreux élevages quand la limite est atteinte, sinon délègue au parent. |
| `PlaceableHusbandry:onHourChanged(currentHour: any)` | 452 | ✍ Serveur seulement. Exécute l'alimentation, déclenche onFinishedFeeding, calcule le facteur de production et fait monter le facteur global (au-dessus du seuil, taux increasePerHour) ou descendre (en dessous, taux decreasePerHour), borné de 0 à 1. Appelle ensuite updateOutput et marque le flux de mise à jour. |
| `PlaceableHusbandry:onBuy()` | 480 | ✍ Après l'achat, rattache les extensions de stockage utilisables à portée à l'unloading station et, si présente, à la loading station. |
| `PlaceableHusbandry:getNeedHourChanged(superFunc: any)` | 502 | ✍ Surcharge qui retourne toujours true pour que le placeable reçoive les événements de changement d'heure. |
| `PlaceableHusbandry:updateFeeding()` | 508 | ✍ Étape d'alimentation par défaut : retourne un facteur de nourriture de 1. Les spécialisations la surchargent avec la vraie logique. |
| `PlaceableHusbandry:updateProduction(foodFactor: any)` | 514 | ✍ Étape de production par défaut : stocke le facteur de nourriture comme facteur de production courant et le retourne. Appelée chaque heure sur le serveur. |
| `PlaceableHusbandry:updateOutput(foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 522 | ✍ Point d'entrée vide appelé chaque heure avec les facteurs de nourriture, de production et de production globale ; surchargé par les sous-classes pour produire la sortie. |
| `PlaceableHusbandry:getGlobalProductionFactor()` | 527 | ✍ Retourne le facteur de production global, à variation lente (0 à 1). |
| `PlaceableHusbandry:getConditionInfos()` | 539 | ✍ Liste d'infos d'état par défaut pour le menu des animaux : une table vide. Surchargée ou étendue par d'autres spécialisations. |
| `PlaceableHusbandry:getFoodInfos()` | 545 | ✍ Liste d'infos de nourriture par défaut : une table vide, à surcharger. |
| `PlaceableHusbandry:getAnimalInfos()` | 551 | ✍ Liste d'infos des animaux par défaut : une table vide, à surcharger. |
| `PlaceableHusbandry:getAnimalDescription(cluster: any)` | 557 | ✍ Texte de description par défaut d'un groupe d'animaux : une chaîne vide, à surcharger. |
| `PlaceableHusbandry:getHusbandryCapacity(fillTypeIndex: any, farmId: any)` | 563 | ✍ Retourne la capacité de l'unloading station pour un type de remplissage et une ferme (ferme propriétaire par défaut), ou 0 sans unloading station. |
| `PlaceableHusbandry:getHusbandryFreeCapacity(fillTypeIndex: any, farmId: any)` | 573 | ✍ Retourne la capacité libre de l'unloading station pour un type de remplissage et une ferme, ou 0 sans unloading station. |
| `PlaceableHusbandry:addHusbandryFillLevelFromTool(farmId: any, deltaFillLevel: any, fillTypeIndex: any, fillPositionData: any, toolType: any, extraAttributes: any)` | 583 | ✍ Ajoute du remplissage à l'unloading station depuis un outil et retourne la quantité appliquée ; retourne 0 sans unloading station. Les paramètres sont transmis à la station. |
| `PlaceableHusbandry:removeHusbandryFillLevel(farmId: integer, deltaFillLevel: number, fillTypeIndex: integer) → number` | 597 | ✍ Retire du remplissage via la loading station et retourne le delta restant ; sans loading station, il retourne le delta inchangé. |
| `PlaceableHusbandry:getHusbandryFillLevel(fillTypeIndex: any, farmId: any)` | 607 | ✍ Retourne le niveau de remplissage de l'unloading station pour un type de remplissage et une ferme, ou 0 sans unloading station. |
| `PlaceableHusbandry:getHusbandryIsFillTypeSupported(fillTypeIndex: any)` | 617 | ✍ Retourne si l'unloading station gère le type de remplissage ; false sans unloading station. |
| `PlaceableHusbandry:onAddedStorageToLoadingStation(storage: any, loadingStation: any)` | 627 | ✍ Callback de message : si la loading station est celle de cet élevage, écoute les changements de niveau du stockage avec le callback de la spécialisation. |
| `PlaceableHusbandry:onRemovedStorageFromLoadingStation(storage: any, loadingStation: any)` | 636 | ✍ Callback de message : si la loading station est celle de cet élevage, cesse d'écouter les changements de niveau du stockage. |
| `PlaceableHusbandry:onAddedStorageToUnloadingStation(storage: any, unloadingStation: any)` | 645 | ✍ Callback de message : si l'unloading station est celle de cet élevage, écoute les changements de niveau du stockage avec le callback de la spécialisation. |
| `PlaceableHusbandry:onRemovedStorageFromUnloadingStation(storage: any, unloadingStation: any)` | 654 | ✍ Callback de message : si l'unloading station est celle de cet élevage, cesse d'écouter les changements de niveau du stockage. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onHusbandryFillLevelChanged` | 25 |
| registerEvent | `onFinishedFeeding` | 26 |
| registerFunction | `onAddedStorageToLoadingStation` | 32 |
| registerFunction | `onRemovedStorageFromLoadingStation` | 33 |
| registerFunction | `onAddedStorageToUnloadingStation` | 34 |
| registerFunction | `onRemovedStorageFromUnloadingStation` | 35 |
| registerFunction | `updateFeeding` | 36 |
| registerFunction | `updateProduction` | 37 |
| registerFunction | `updateOutput` | 38 |
| registerFunction | `getGlobalProductionFactor` | 39 |
| registerFunction | `getProductionFactor` | 40 |
| registerFunction | `getConditionInfos` | 41 |
| registerFunction | `getFoodInfos` | 42 |
| registerFunction | `getAnimalInfos` | 43 |
| registerFunction | `getAnimalDescription` | 44 |
| registerFunction | `getHusbandryCapacity` | 45 |
| registerFunction | `getHusbandryFreeCapacity` | 46 |
| registerFunction | `addHusbandryFillLevelFromTool` | 47 |
| registerFunction | `removeHusbandryFillLevel` | 48 |
| registerFunction | `getHusbandryFillLevel` | 49 |
| registerFunction | `getHusbandryIsFillTypeSupported` | 50 |
| registerOverwrittenFunction | `setOwnerFarmId` | 56 |
| registerOverwrittenFunction | `collectPickObjects` | 57 |
| registerOverwrittenFunction | `getCanBePlacedAt` | 58 |
| registerOverwrittenFunction | `canBuy` | 59 |
| registerOverwrittenFunction | `getNeedHourChanged` | 60 |
| registerEventListener | `onLoad` | 66 |
| registerEventListener | `onDelete` | 67 |
| registerEventListener | `onFinalizePlacement` | 68 |
| registerEventListener | `onReadStream` | 69 |
| registerEventListener | `onWriteStream` | 70 |
| registerEventListener | `onReadUpdateStream` | 71 |
| registerEventListener | `onWriteUpdateStream` | 72 |
| registerEventListener | `onHourChanged` | 73 |
| registerEventListener | `onBuy` | 74 |

## Messages

- s'abonne à `MessageType.STORAGE_ADDED_TO_LOADING_STATION` (l.209)
- s'abonne à `MessageType.STORAGE_REMOVED_FROM_LOADING_STATION` (l.210)
- s'abonne à `MessageType.STORAGE_ADDED_TO_UNLOADING_STATION` (l.211)
- s'abonne à `MessageType.STORAGE_REMOVED_FROM_UNLOADING_STATION` (l.212)
