# animals/husbandry/placeables/PlaceableHusbandryWater.lua

*[English version](../../../../../scripts/animals/husbandry/placeables/PlaceableHusbandryWater.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryWater.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour l'approvisionnement en eau d'un élevage. L'eau est prélevée dans le stockage de l'élevage ou achetée automatiquement (facturée à la ferme propriétaire), peut afficher un plan d'eau et enregistre des points d'eau comme places d'alimentation dans le moteur d'animaux. Les clés XML sont sous `placeable.husbandry.water` (`#automaticWaterSupply`, `waterPlaces.waterPlace#node`, `waterPlane`).

- **PlaceableHusbandryWater** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryWater.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Vérification des prérequis ; renvoie toujours true, la spécialisation n'exige donc aucune autre spécialisation. |
| `PlaceableHusbandryWater.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre la nouvelle fonction de placeable `updateWaterPlane`. |
| `PlaceableHusbandryWater.registerOverwrittenFunctions(placeableType: any)` | 30 | ✍ Enregistre les surcharges de `updateFeeding`, `getConditionInfos` et `updateInfo`. |
| `PlaceableHusbandryWater.registerEventListeners(placeableType: any)` | 38 | ✍ S'abonne à onLoad, onDelete, onFinalizePlacement, onPostFinalizePlacement, onHusbandryAnimalsUpdate, onHusbandryAnimalsCreated et onHusbandryFillLevelChanged. |
| `PlaceableHusbandryWater.registerXMLPaths(schema: any, basePath: any)` | 50 | ✍ Déclare les chemins XML sous `husbandry.water` : `#automaticWaterSupply` (false par défaut), `waterPlaces.waterPlace#node` répétable et le plan `waterPlane`. |
| `PlaceableHusbandryWater:onLoad(savegame: any)` | 61 | ✍ Initialise l'état, lit `#automaticWaterSupply`, crée le `FillPlane` d'eau optionnel (plein si approvisionnement automatique, sinon vide ; supprimé si le chargement échoue) et charge chaque noeud de point d'eau. |
| `PlaceableHusbandryWater:onPostFinalizePlacement()` | 88 | ✍ Rafraîchit le plan d'eau et les points d'eau une fois le placement finalisé. |
| `PlaceableHusbandryWater:onDelete()` | 94 | ✍ Supprime le plan de remplissage d'eau s'il existe. |
| `PlaceableHusbandryWater:onFinalizePlacement()` | 104 | ✍ Si l'approvisionnement automatique est désactivé mais que le stockage ne gère pas l'eau, journalise un avertissement XML et passe en approvisionnement automatique. |
| `PlaceableHusbandryWater:updateWaterPlane()` | 117 | ✍ Règle l'état du plan d'eau sur niveau divisé par capacité et, si l'élevage moteur existe, appelle `updateFeedingPlace` pour chaque point d'eau enregistré avec le niveau actuel. |
| `PlaceableHusbandryWater:updateFeeding(superFunc: any)` | 141 | ✍ Surcharge. Serveur uniquement : consomme `litersPerHour` multiplié par `timeAdjustment`. Avec l'approvisionnement automatique, facture la ferme propriétaire (`MoneyType.PURCHASE_WATER`) ; sinon retire l'eau du stockage et réduit le facteur parent selon la part réellement fournie. Renvoie le facteur. |
| `PlaceableHusbandryWater:onHusbandryAnimalsCreated(husbandryId: any)` | 164 | ✍ Mémorise l'identifiant de l'élevage moteur et enregistre chaque noeud de point d'eau comme place d'alimentation en eau via `addFeedingPlace` ; la place n'est conservée que si elle est accessible. |
| `PlaceableHusbandryWater:onHusbandryAnimalsUpdate(clusters: any)` | 181 | ✍ Recalcule la demande en eau en litres par heure en sommant, sur les groupes d'animaux, la quantité d'eau journalière selon l'âge multipliée par le nombre d'animaux et divisée par 24. |
| `PlaceableHusbandryWater:onHusbandryFillLevelChanged(fillTypeIndex: any, delta: any)` | 202 | ✍ Rafraîchit le plan et les points d'eau quand le type de remplissage modifié est l'eau. |
| `PlaceableHusbandryWater:getConditionInfos(superFunc: any)` | 211 | ✍ Surcharge. Sauf si l'approvisionnement automatique est actif, ajoute à la liste parente une barre de condition d'eau (niveau et ratio de la capacité). |
| `PlaceableHusbandryWater:updateInfo(superFunc: any, infoTable: any)` | 238 | ✍ Surcharge. Après la fonction parente, ajoute le niveau d'eau en litres entiers à la table d'info, sauf si l'approvisionnement automatique est actif. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `updateWaterPlane` | 25 |
| registerOverwrittenFunction | `updateFeeding` | 31 |
| registerOverwrittenFunction | `getConditionInfos` | 32 |
| registerOverwrittenFunction | `updateInfo` | 33 |
| registerEventListener | `onLoad` | 39 |
| registerEventListener | `onDelete` | 40 |
| registerEventListener | `onFinalizePlacement` | 41 |
| registerEventListener | `onPostFinalizePlacement` | 42 |
| registerEventListener | `onHusbandryAnimalsUpdate` | 43 |
| registerEventListener | `onHusbandryAnimalsCreated` | 44 |
| registerEventListener | `onHusbandryFillLevelChanged` | 45 |
