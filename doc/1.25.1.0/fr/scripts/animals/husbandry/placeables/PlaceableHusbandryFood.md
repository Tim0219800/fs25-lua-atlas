# animals/husbandry/placeables/PlaceableHusbandryFood.lua

*[English version](../../../../../scripts/animals/husbandry/placeables/PlaceableHusbandryFood.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryFood.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui gère le stock de nourriture d'un élevage. Elle exige `PlaceableHusbandryAnimals`, garde un niveau de remplissage par type supporté (issu des groupes de nourriture et des mélanges de l'`animalFoodSystem`), l'affiche avec un plan de remplissage dynamique et un plan de nourriture, et expose des déclencheurs de déchargement comme auges. Elle calcule la consommation horaire d'après les clusters, consomme la nourriture dans `updateFeeding`, enregistre les places d'alimentation dans l'élevage moteur et synchronise les niveaux par le réseau (autoritaire côté serveur).

- **PlaceableHusbandryFood** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryFood.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie vrai uniquement si `PlaceableHusbandryAnimals` est présent. |
| `PlaceableHusbandryFood.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre les méthodes de nourriture (plans de remplissage, places, ajout/retrait, totaux, capacité, litres par heure) sur le type de placeable. `getAvailableFood` et `getFoodLitersPerHour` n'ont pas de corps dans le dump du SDK. |
| `PlaceableHusbandryFood.registerOverwrittenFunctions(placeableType: any)` | 38 | ✍ Enregistre les surcharges de `updateInfo`, `updateFeeding`, `getFoodInfos`, `collectPickObjects` et `getAnimalDescription`. |
| `PlaceableHusbandryFood.registerEventListeners(placeableType: any)` | 48 | ✍ S'abonne aux événements de chargement, suppression, placement, flux et flux de mise à jour, ainsi qu'à `onHusbandryAnimalsUpdate` et `onHusbandryAnimalsCreated`. |
| `PlaceableHusbandryFood.registerXMLPaths(schema: any, basePath: any)` | 64 | ✍ Enregistre les clés XML sous `husbandry.food` : capacité de l'auge, places de nourriture, plan de nourriture dynamique, plan de nourriture et chemins des déclencheurs de déchargement. |
| `PlaceableHusbandryFood.registerSavegameXMLPaths(schema: any, basePath: any)` | 81 | ✍ Enregistre les clés de sauvegarde `fillLevel(?)#fillType` et `#fillLevel`. |
| `PlaceableHusbandryFood.initSpecialization()` | 90 | ✍ Ajoute la spécification de boutique `animalFoodFillTypes` (icônes de types de remplissage dans la liste de la boutique). |
| `PlaceableHusbandryFood:onLoad(savegame: any)` | 96 | ✍ Initialise l'état de nourriture, lit la capacité (5000 par défaut), crée les déclencheurs de déchargement des auges (état d'erreur s'il n'y en a aucun), le plan de nourriture dynamique et le plan de nourriture optionnels avec leurs types par défaut, et les places de nourriture. |
| `PlaceableHusbandryFood:onPostLoad()` | 173 | ✍ Lit le type d'animal et construit les types de remplissage supportés à partir des groupes de nourriture et des mélanges du système de nourriture animale, chaque niveau de groupe commençant à 0. |
| `PlaceableHusbandryFood:onDelete()` | 201 | ✍ Supprime les déclencheurs des auges, le noeud du plan de nourriture dynamique et le plan de nourriture. |
| `PlaceableHusbandryFood:onFinalizePlacement()` | 224 | ✍ Enregistre chaque déclencheur d'auge comme objet réseau. |
| `PlaceableHusbandryFood:onPostFinalizePlacement()` | 235 | ✍ Rafraîchit les plans de remplissage de nourriture une fois le placement terminé. |
| `PlaceableHusbandryFood:onReadStream(streamId: any, connection: any)` | 241 | ✍ Lecture réseau : lit le niveau de chaque type de remplissage, puis l'identifiant d'objet et les données de flux de chaque auge, et termine son enregistrement côté client. |
| `PlaceableHusbandryFood:onWriteStream(streamId: any, connection: any)` | 265 | ✍ Écriture réseau : écrit le niveau de chaque type de remplissage, puis l'identifiant d'objet et les données de flux de chaque auge, en l'enregistrant dans la connexion. |
| `PlaceableHusbandryFood:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 288 | ✍ Lecture de mise à jour côté client : lit la position de remplissage optionnelle, puis les niveaux optionnels et applique chaque différence via `addFood` ou `removeFood`. Ignorée si la connexion ne vient pas du serveur. |
| `PlaceableHusbandryFood:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 314 | ✍ Écriture de mise à jour côté serveur : envoie la dernière position de remplissage et les niveaux quand leurs indicateurs sont activés. Sans effet pour la connexion du serveur. |
| `PlaceableHusbandryFood:loadFromXMLFile(xmlFile: any, key: any)` | 334 | ✍ Lit les entrées `fillLevel` sauvegardées et ajoute chaque quantité via `addFood`, uniquement pour les types de remplissage supportés par cet élevage. |
| `PlaceableHusbandryFood:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 350 | ✍ Sauvegarde chaque type de remplissage dont le niveau est supérieur à zéro comme entrée `fillLevel` (nom et quantité). |
| `PlaceableHusbandryFood:updateFeeding(superFunc: any)` | 368 | ✍ Surcharge : sur le serveur consomme la nourriture via le système de nourriture animale pour le besoin horaire actuel (fois l'ajustement temporel), retire les quantités consommées et renvoie le facteur du parent multiplié par le facteur de consommation. |
| `PlaceableHusbandryFood:updateInfo(superFunc: any, infoTable: any)` | 391 | ✍ Surcharge : ajoute à la liste d'informations la quantité totale de nourriture en litres. |
| `PlaceableHusbandryFood:getFoodInfos(superFunc: any)` | 402 | ✍ Surcharge : ajoute une entrée par groupe de nourriture avec son titre, le pourcentage de poids de production, le niveau cumulé, la capacité et le ratio de remplissage. |
| `PlaceableHusbandryFood:updateFillPlanes(fillTypeIndex: any)` | 438 | ✍ Règle l'état du plan de nourriture sur le total de nourriture divisé par la capacité (borné de 0 à 1) et, s'il y a de la nourriture et un type donné, applique le matériau de ce type au plan. |
| `PlaceableHusbandryFood:collectPickObjects(superFunc: any, node: any)` | 459 | ✍ Surcharge : ignore les noeuds qui sont la racine de remplissage exact d'une auge pour qu'ils ne soient pas collectés comme objets sélectionnables ; sinon délègue au parent. |
| `PlaceableHusbandryFood:onHusbandryAnimalsCreated(husbandryId: any)` | 475 | ✍ Quand l'élevage moteur existe, ajoute chaque place de nourriture comme place d'alimentation (type nourriture) et mémorise son indice seulement si elle est accessible sur le maillage de navigation. |
| `PlaceableHusbandryFood:updateFoodPlaces()` | 492 | ✍ Transmet le niveau total de nourriture à chaque place d'alimentation accessible de l'élevage moteur. |
| `PlaceableHusbandryFood:getTotalFood()` | 506 | ✍ Renvoie la somme des niveaux de tous les types de remplissage, en litres. |
| `PlaceableHusbandryFood:getFoodCapacity()` | 523 | ✍ Renvoie la capacité de l'auge. |
| `PlaceableHusbandryFood:getFreeFoodCapacity(fillTypeIndex: any)` | 529 | ✍ Renvoie la capacité moins la nourriture totale, ou 0 si le type n'est pas supporté (la capacité est partagée entre tous les types). |
| `PlaceableHusbandryFood:addFood(farmId: any, deltaFillLevel: any, fillTypeIndex: any, fillPositionData: any, toolType: any, extraAttributes: any)` | 540 | ✍ Ajoute de la nourriture d'un type donné, limitée par la capacité libre, et renvoie la quantité réellement ajoutée (0 si non supporté ou plein). Les mélanges sont répartis en ingrédients selon leur poids ; remplit aussi le plan dynamique et signale la mise à jour réseau sur le serveur. À noter : la condition de changement de position mélange `and`/`or` sans parenthèses, donc la seconde partie est évaluée même sur un client. |
| `PlaceableHusbandryFood:removeFood(absDeltaFillLevel: any, fillTypeIndex: any)` | 630 | ✍ Retire jusqu'à la quantité donnée d'un type de remplissage (jamais plus que le stock), met à jour le plan dynamique et les places, signale la mise à jour réseau sur le serveur, et renvoie la quantité retirée. |
| `PlaceableHusbandryFood:onHusbandryAnimalsUpdate(clusters: any)` | 668 | ✍ Recalcule `litersPerHour` pour chaque cluster : le besoin quotidien en nourriture par animal selon son âge fois le nombre d'animaux, divisé par 24. |
| `PlaceableHusbandryFood:getAnimalDescription(superFunc: any, cluster: any)` | 689 | ✍ Surcharge : ajoute le texte localisé de description en pourcentage à celui du parent. |
| `PlaceableHusbandryFood.loadSpecValueAnimalFoodFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 697 | ✍ Chargeur de spécification de boutique : lit le nom du type d'animal et si l'élevage nécessite un apport d'eau (pas d'alimentation automatique en eau). Renvoie nil si aucun des deux noeuds n'existe. |
| `PlaceableHusbandryFood.getSpecValueAnimalFoodFillTypes(storeItem: any, realItem: any)` | 715 | ✍ Accesseur de spécification de boutique : liste les types de remplissage des groupes de nourriture et des mélanges du type d'animal, plus l'eau si nécessaire. Renvoie nil si la spécification ou le type d'animal manque. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `updateFillPlanes` | 25 |
| registerFunction | `updateFoodPlaces` | 26 |
| registerFunction | `addFood` | 27 |
| registerFunction | `removeFood` | 28 |
| registerFunction | `getTotalFood` | 29 |
| registerFunction | `getAvailableFood` | 30 |
| registerFunction | `getFoodCapacity` | 31 |
| registerFunction | `getFreeFoodCapacity` | 32 |
| registerFunction | `getFoodLitersPerHour` | 33 |
| registerOverwrittenFunction | `updateInfo` | 39 |
| registerOverwrittenFunction | `updateFeeding` | 40 |
| registerOverwrittenFunction | `getFoodInfos` | 41 |
| registerOverwrittenFunction | `collectPickObjects` | 42 |
| registerOverwrittenFunction | `getAnimalDescription` | 43 |
| registerEventListener | `onLoad` | 49 |
| registerEventListener | `onPostLoad` | 50 |
| registerEventListener | `onDelete` | 51 |
| registerEventListener | `onFinalizePlacement` | 52 |
| registerEventListener | `onPostFinalizePlacement` | 53 |
| registerEventListener | `onReadStream` | 54 |
| registerEventListener | `onWriteStream` | 55 |
| registerEventListener | `onReadUpdateStream` | 56 |
| registerEventListener | `onWriteUpdateStream` | 57 |
| registerEventListener | `onHusbandryAnimalsUpdate` | 58 |
| registerEventListener | `onHusbandryAnimalsCreated` | 59 |
