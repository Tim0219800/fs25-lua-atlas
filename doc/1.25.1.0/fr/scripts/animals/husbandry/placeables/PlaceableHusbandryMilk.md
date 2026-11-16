# animals/husbandry/placeables/PlaceableHusbandryMilk.lua

*[English version](../../../../../scripts/animals/husbandry/placeables/PlaceableHusbandryMilk.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryMilk.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui fait produire du lait à un élevage et peut héberger des robots de traite. Elle exige `PlaceableHusbandry` et `PlaceableHusbandryAnimals`, ajoute un type de configuration de placeable `milk` et lit `husbandry.milk` (ou une `milkConfiguration` choisie). La production par type de remplissage vient de la courbe `milk` des sous-types d'animaux, est ajoutée au stockage de l'élevage sur le serveur, et la production s'arrête dès qu'un réservoir de lait est plein.

- **PlaceableHusbandryMilk** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryMilk.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Renvoie vrai uniquement si `PlaceableHusbandry` et `PlaceableHusbandryAnimals` sont tous deux présents. |
| `PlaceableHusbandryMilk.initSpecialization()` | 25 | ✍ Enregistre le type de configuration `milk` auprès du gestionnaire de configurations de placeables. |
| `PlaceableHusbandryMilk.registerFunctions(placeableType: any)` | 31 | ✍ Enregistre la méthode `onMilkingRobotLoaded`. |
| `PlaceableHusbandryMilk.registerOverwrittenFunctions(placeableType: any)` | 37 | ✍ Enregistre les surcharges de `updateOutput`, `updateProduction`, `updateInfo` et `getConditionInfos`. |
| `PlaceableHusbandryMilk.registerEventListeners(placeableType: any)` | 46 | ✍ S'abonne à `onLoad`, `onDelete`, `onFinalizePlacement` et `onHusbandryAnimalsUpdate`. |
| `PlaceableHusbandryMilk.registerXMLPaths(schema: any, basePath: any)` | 55 | ✍ Enregistre les chemins XML du lait deux fois, sous `husbandry.milk` et sous chaque `milkConfiguration(?)`, via `registerMilkXMLPaths` (non défini dans le dump du SDK, NON VÉRIFIÉ). |
| `PlaceableHusbandryMilk:onLoad(savegame: any)` | 73 | ✍ Choisit la configuration de lait (retombe sur le noeud de base), lit `hasMilkProduction`, collecte les types de lait des sous-types du type d'animal et crée chaque robot de traite depuis sa classe, son fichier et son noeud d'attache (ignoré avec un avertissement si invalide). |
| `PlaceableHusbandryMilk:onMilkingRobotLoaded(robot: any, args: any)` | 144 | ✍ Rappel de fin de chargement d'un robot de traite : termine la tâche de chargement. |
| `PlaceableHusbandryMilk:onDelete()` | 150 | ✍ Supprime chaque robot de traite. |
| `PlaceableHusbandryMilk:onFinalizePlacement()` | 162 | ✍ Si la production de lait est activée, signale les types de lait absents du stockage de l'élevage et transmet la finalisation du placement à chaque robot de traite. |
| `PlaceableHusbandryMilk:updateOutput(superFunc: any, foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 180 | ✍ Surcharge : sur le serveur ajoute du lait par type de remplissage au stockage de l'élevage (facteur de production fois facteur global fois litres par heure fois ajustement temporel), puis appelle le parent. |
| `PlaceableHusbandryMilk:updateProduction(superFunc: any, foodFactor: any)` | 195 | ✍ Surcharge : renvoie le facteur du parent, mais forcé à 0 si un type de lait n'a plus de capacité libre. |
| `PlaceableHusbandryMilk:onHusbandryAnimalsUpdate(clusters: any)` | 214 | ✍ Recalcule les litres par heure de chaque type de lait d'après les clusters (courbe de lait à l'âge de l'animal fois le nombre d'animaux, divisé par 24) et reconstruit la liste des types actifs. |
| `PlaceableHusbandryMilk:updateInfo(superFunc: any, infoTable: any)` | 244 | ✍ Surcharge : ajoute à la liste d'informations les litres stockés de chaque type de lait actif. |
| `PlaceableHusbandryMilk:getConditionInfos(superFunc: any)` | 260 | ✍ Surcharge : ajoute une entrée de remplissage par type de lait actif (niveau et ratio borné, barre inversée). |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onMilkingRobotLoaded` | 32 |
| registerOverwrittenFunction | `updateOutput` | 38 |
| registerOverwrittenFunction | `updateProduction` | 39 |
| registerOverwrittenFunction | `updateInfo` | 40 |
| registerOverwrittenFunction | `getConditionInfos` | 41 |
| registerEventListener | `onLoad` | 47 |
| registerEventListener | `onDelete` | 48 |
| registerEventListener | `onFinalizePlacement` | 49 |
| registerEventListener | `onHusbandryAnimalsUpdate` | 50 |
