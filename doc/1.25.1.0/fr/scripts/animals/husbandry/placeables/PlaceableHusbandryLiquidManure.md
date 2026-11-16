# animals/husbandry/placeables/PlaceableHusbandryLiquidManure.lua

*[English version](../../../../../scripts/animals/husbandry/placeables/PlaceableHusbandryLiquidManure.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryLiquidManure.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui fait produire du lisier à un élevage. Elle n'a pas de prérequis mais s'appuie sur des méthodes de stockage d'élevage (`addHusbandryFillLevelFromTool`, `getHusbandryFreeCapacity`, ...) fournies par une autre spécialisation. La production horaire est calculée d'après la courbe de sortie `liquidManure` des clusters d'animaux et ajoutée au stockage sur le serveur ; un réservoir plein ralentit la production de l'élevage.

- **PlaceableHusbandryLiquidManure** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryLiquidManure.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours vrai : aucune spécialisation prérequise n'est nécessaire. |
| `PlaceableHusbandryLiquidManure.registerOverwrittenFunctions(placeableType: any)` | 24 | ✍ Enregistre les surcharges de `updateOutput`, `updateProduction`, `updateInfo` et `getConditionInfos`. |
| `PlaceableHusbandryLiquidManure.registerEventListeners(placeableType: any)` | 33 | ✍ S'abonne à `onLoad`, `onFinalizePlacement` et `onHusbandryAnimalsUpdate`. |
| `PlaceableHusbandryLiquidManure.registerXMLPaths(schema: any, basePath: any)` | 41 | ✍ Enregistre `husbandry.liquidManure.manure#factor` et `#active`. À noter : aucun code de ce fichier ne lit ces deux valeurs. |
| `PlaceableHusbandryLiquidManure:onLoad(savegame: any)` | 51 | ✍ Initialise la production horaire à 0, fixe le type de remplissage sur le lisier et prépare l'entrée d'information. |
| `PlaceableHusbandryLiquidManure:onFinalizePlacement()` | 61 | ✍ Journalise un avertissement XML si le stockage de l'élevage ne supporte pas le type de remplissage lisier. |
| `PlaceableHusbandryLiquidManure:updateOutput(superFunc: any, foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 70 | ✍ Surcharge : sur le serveur ajoute du lisier au stockage de l'élevage (facteur de nourriture fois litres par heure fois ajustement temporel), puis appelle le parent. |
| `PlaceableHusbandryLiquidManure:updateProduction(superFunc: any, foodFactor: any)` | 85 | ✍ Surcharge : sur le serveur multiplie le facteur de production du parent par 0,75 quand le stockage de lisier n'a plus de place. |
| `PlaceableHusbandryLiquidManure:onHusbandryAnimalsUpdate(clusters: any)` | 101 | ✍ Recalcule `litersPerHour` d'après les clusters : lisier quotidien par animal selon son âge fois le nombre d'animaux, divisé par 24. |
| `PlaceableHusbandryLiquidManure:getConditionInfos(superFunc: any)` | 122 | ✍ Surcharge : ajoute une entrée de remplissage du lisier (niveau et ratio borné, barre inversée) ; sans capacité de cuve, l'entrée est désactivée et porte un message de cuve manquante. |
| `PlaceableHusbandryLiquidManure:updateInfo(superFunc: any, infoTable: any)` | 150 | ✍ Surcharge : ajoute à la liste d'informations le niveau actuel de lisier en litres. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `updateOutput` | 25 |
| registerOverwrittenFunction | `updateProduction` | 26 |
| registerOverwrittenFunction | `updateInfo` | 27 |
| registerOverwrittenFunction | `getConditionInfos` | 28 |
| registerEventListener | `onLoad` | 34 |
| registerEventListener | `onFinalizePlacement` | 35 |
| registerEventListener | `onHusbandryAnimalsUpdate` | 36 |
