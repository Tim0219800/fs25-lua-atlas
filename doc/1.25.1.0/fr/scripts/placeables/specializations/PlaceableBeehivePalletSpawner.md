# placeables/specializations/PlaceableBeehivePalletSpawner.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableBeehivePalletSpawner.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableBeehivePalletSpawner.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour l'emplacement de palettes de miel de la ferme. Elle encapsule un `PalletSpawner`, accumule du miel côté serveur et crée ou remplit une palette de HONEY dès qu'assez de litres sont en attente, et synchronise vers les clients un indicateur de trop de palettes. Elle s'enregistre auprès de `beehiveSystem` ; un seul exemplaire est achetable par ferme.

- **PlaceableBeehivePalletSpawner** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableBeehivePalletSpawner.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceableBeehivePalletSpawner.registerFunctions(placeableType: any)` | 23 | ✍ Enregistre `addFillLevel`, `updatePallets` et `getPalletCallback` sur le type de placeable. |
| `PlaceableBeehivePalletSpawner.registerOverwrittenFunctions(placeableType: any)` | 31 | ✍ Surcharge `canBuy` et `updateInfo`. |
| `PlaceableBeehivePalletSpawner.registerEventListeners(placeableType: any)` | 38 | ✍ S'abonne à `onLoad`, `onDelete`, `onFinalizePlacement` et aux quatre événements de flux réseau (flux initial et flux de mise à jour, lecture et écriture). |
| `PlaceableBeehivePalletSpawner.registerXMLPaths(schema: any, basePath: any)` | 50 | ✍ Déclare les clés XML du générateur de palettes sous `beehivePalletSpawner` en déléguant à `PalletSpawner.registerXMLPaths`. |
| `PlaceableBeehivePalletSpawner.registerSavegameXMLPaths(schema: any, basePath: any)` | 58 | ✍ Déclare la clé de sauvegarde `beehivePalletSpawner#pendingLiters`. |
| `PlaceableBeehivePalletSpawner:onLoad(savegame: table)` | 65 | ✍ Crée et charge le `PalletSpawner` ; en cas d'échec, journalise une erreur XML et passe l'état de chargement en ERROR. Initialise aussi les litres en attente, les indicateurs, le type de remplissage HONEY et un drapeau de modification. |
| `PlaceableBeehivePalletSpawner:onDelete()` | 88 | ✍ Supprime le générateur de palettes (s'il est chargé) et désenregistre ce générateur de `beehiveSystem`. |
| `PlaceableBeehivePalletSpawner:onFinalizePlacement()` | 98 | ✍ Enregistre ce générateur de palettes auprès de `beehiveSystem`. |
| `PlaceableBeehivePalletSpawner:onReadStream(streamId: any, connection: any)` | 104 | ✍ Côté client : lit l'indicateur de limite de palettes dans le flux initial de connexion. |
| `PlaceableBeehivePalletSpawner:onWriteStream(streamId: any, connection: any)` | 113 | ✍ Côté serveur : écrit l'indicateur de limite de palettes dans le flux initial de connexion. |
| `PlaceableBeehivePalletSpawner:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 123 | ✍ Côté client : lit l'indicateur de limite de palettes dans un flux de mise à jour, sans test de masque de modification. |
| `PlaceableBeehivePalletSpawner:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 132 | ✍ Côté serveur : écrit l'indicateur de limite de palettes dans un flux de mise à jour, sans tester le masque de modification. |
| `PlaceableBeehivePalletSpawner:loadFromXMLFile(xmlFile: any, key: any)` | 142 | ✍ Restaure les litres de miel en attente depuis la sauvegarde, en conservant la valeur actuelle si elle est absente. |
| `PlaceableBeehivePalletSpawner:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 150 | ✍ Sauvegarde les litres en attente, seulement s'ils sont supérieurs à zéro. |
| `PlaceableBeehivePalletSpawner:addFillLevel(fillLevel: any)` | 161 | ✍ Serveur uniquement : ajoute les litres donnés à la quantité de miel en attente ; ignoré si nil. |
| `PlaceableBeehivePalletSpawner:updatePallets()` | 173 | ✍ Serveur uniquement : quand plus de 10 litres sont en attente et qu'aucune création n'est en cours, demande une palette au générateur, avec `getPalletCallback` comme rappel. |
| `PlaceableBeehivePalletSpawner:getPalletCallback(pallet: any, result: any, fillTypeIndex: any)` | 186 | ✍ Gestionnaire du résultat de création : pour une nouvelle palette, la vide puis la remplit avec les litres en attente et retranche ce qui a été accepté. En cas de limite de palettes, il active l'indicateur synchronisé ; sans place, rien n'est fait (TODO dans le code). |
| `PlaceableBeehivePalletSpawner:updateInfo(superFunc: any, infoTable: any)` | 215 | ✍ Appelle `updateInfo` du parent, puis ajoute une ligne « trop de palettes » quand l'indicateur de limite est actif. |
| `PlaceableBeehivePalletSpawner:canBuy(superFunc: any)` | 225 | ✍ Complète la vérification du parent : refuse l'achat avec un avertissement « un seul par ferme » si la ferme locale possède déjà un générateur de palettes de ruches. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `addFillLevel` | 24 |
| registerFunction | `updatePallets` | 25 |
| registerFunction | `getPalletCallback` | 26 |
| registerOverwrittenFunction | `canBuy` | 32 |
| registerOverwrittenFunction | `updateInfo` | 33 |
| registerEventListener | `onLoad` | 39 |
| registerEventListener | `onDelete` | 40 |
| registerEventListener | `onFinalizePlacement` | 41 |
| registerEventListener | `onReadStream` | 42 |
| registerEventListener | `onWriteStream` | 43 |
| registerEventListener | `onReadUpdateStream` | 44 |
| registerEventListener | `onWriteUpdateStream` | 45 |
