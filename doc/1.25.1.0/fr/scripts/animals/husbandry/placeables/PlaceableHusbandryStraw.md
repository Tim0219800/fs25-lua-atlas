# animals/husbandry/placeables/PlaceableHusbandryStraw.lua

*[English version](../../../../../scripts/animals/husbandry/placeables/PlaceableHusbandryStraw.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryStraw.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour la litière de paille d'un élevage : les animaux consomment de la paille et, en option, produisent du fumier. Elle surcharge les fonctions de sortie, de production, de condition et d'info de l'élevage, pilote un plan de remplissage visuel de paille et lit ses réglages sous `placeable.husbandry.straw` (`strawPlane`, `manure#factor`, `manure#active`). Elle s'appuie sur les fonctions de la spécialisation d'élevage (NON VÉRIFIÉ, fichier hors de ce lot).

- **PlaceableHusbandryStraw** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryStraw.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Vérification des prérequis ; renvoie toujours true, la spécialisation n'exige donc aucune autre spécialisation. |
| `PlaceableHusbandryStraw.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre la nouvelle fonction de placeable `updateStrawPlane`. |
| `PlaceableHusbandryStraw.registerOverwrittenFunctions(placeableType: any)` | 30 | ✍ Enregistre les surcharges de `updateOutput`, `updateProduction`, `getConditionInfos` et `updateInfo`. |
| `PlaceableHusbandryStraw.registerEventListeners(placeableType: any)` | 39 | ✍ S'abonne à onLoad, onPostFinalizePlacement, onDelete, onFinalizePlacement, onReadStream, onHusbandryAnimalsUpdate et onHusbandryFillLevelChanged. |
| `PlaceableHusbandryStraw.registerXMLPaths(schema: any, basePath: any)` | 51 | ✍ Déclare les chemins XML sous `husbandry.straw` : le plan `strawPlane`, `manure#factor` (1 par défaut) et `manure#active` (true par défaut). |
| `PlaceableHusbandryStraw:onLoad(savegame: any)` | 62 | ✍ Lit le facteur de fumier et l'indicateur d'activation, crée le `FillPlane` de paille optionnel (supprimé si le chargement échoue), définit la paille en entrée et le fumier en sortie, et initialise les litres par heure et les tables d'info. |
| `PlaceableHusbandryStraw:onPostFinalizePlacement()` | 85 | ✍ Rafraîchit le plan de paille une fois le placement finalisé. |
| `PlaceableHusbandryStraw:onDelete()` | 91 | ✍ Supprime le plan de remplissage de paille s'il existe. |
| `PlaceableHusbandryStraw:onFinalizePlacement()` | 101 | ✍ Journalise un avertissement XML si le stockage de l'élevage n'accepte pas la paille. À noter : le test du fumier lit `self.isManureActive` au lieu de `spec.isManureActive`, donc il n'est probablement jamais vrai (bug apparent). |
| `PlaceableHusbandryStraw:onReadStream(streamId: any, connection: any)` | 113 | ✍ Rafraîchit le plan de paille quand un client reçoit le flux initial. |
| `PlaceableHusbandryStraw:updateStrawPlane()` | 119 | ✍ Règle l'état du plan de paille sur le niveau de paille divisé par la capacité (0 si la capacité est nulle). Ne fait rien sans plan. |
| `PlaceableHusbandryStraw:updateOutput(superFunc: any, foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 135 | ✍ Surcharge. Sur le serveur, retire de la paille selon les litres par heure multipliés par `environment.timeAdjustment`, ajoute du fumier proportionnellement à la paille réellement consommée et rafraîchit le plan. Appelle ensuite la fonction parente. |
| `PlaceableHusbandryStraw:updateProduction(superFunc: any, foodFactor: any)` | 158 | ✍ Surcharge. Prend le facteur de production parent et, sur le serveur, le multiplie par 0,75 s'il y a de la paille mais que le stockage de fumier est plein, ou par 0,9 s'il n'y a pas de paille. Renvoie le facteur. |
| `PlaceableHusbandryStraw:onHusbandryAnimalsUpdate(clusters: any)` | 179 | ✍ Recalcule l'entrée de paille et la sortie de fumier en litres par heure en sommant, sur les groupes d'animaux, les quantités journalières selon l'âge du sous-type multipliées par le nombre d'animaux et divisées par 24. |
| `PlaceableHusbandryStraw:onHusbandryFillLevelChanged(fillTypeIndex: any, delta: any)` | 209 | ✍ Rafraîchit le plan de paille quand le type de remplissage modifié est la paille. |
| `PlaceableHusbandryStraw:getConditionInfos(superFunc: any)` | 218 | ✍ Surcharge. Ajoute à la liste parente une barre de condition pour la paille (valeur et ratio de la capacité) et une pour le fumier (barre inversée, désactivée avec une mention de tas de fumier manquant si la capacité de fumier est 0). |
| `PlaceableHusbandryStraw:updateInfo(superFunc: any, infoTable: any)` | 262 | ✍ Surcharge. Après la fonction parente, ajoute deux entrées d'info à la table : niveaux de paille et de fumier en litres entiers. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `updateStrawPlane` | 25 |
| registerOverwrittenFunction | `updateOutput` | 31 |
| registerOverwrittenFunction | `updateProduction` | 32 |
| registerOverwrittenFunction | `getConditionInfos` | 33 |
| registerOverwrittenFunction | `updateInfo` | 34 |
| registerEventListener | `onLoad` | 40 |
| registerEventListener | `onPostFinalizePlacement` | 41 |
| registerEventListener | `onDelete` | 42 |
| registerEventListener | `onFinalizePlacement` | 43 |
| registerEventListener | `onReadStream` | 44 |
| registerEventListener | `onHusbandryAnimalsUpdate` | 45 |
| registerEventListener | `onHusbandryFillLevelChanged` | 46 |
