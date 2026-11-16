# animals/husbandry/placeables/PlaceableHusbandryPallets.lua

*[English version](../../../../../scripts/animals/husbandry/placeables/PlaceableHusbandryPallets.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryPallets.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour les élevages qui produisent des marchandises sur palettes (par exemple laine ou oeufs). Elle requiert `PlaceableHusbandryAnimals`. Les animaux produisent des litres par heure, accumulés en litres en attente ; le serveur fait apparaître ou réutilise des palettes via un `PalletSpawner` et les remplit. Elle synchronise niveaux et capacités vers les clients, sauvegarde les litres en attente et lit `placeable.husbandry.pallets.palletSpawner`.

- **PlaceableHusbandryPallets** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryPallets.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie true seulement si le type de placeable possède la spécialisation `PlaceableHusbandryAnimals`. |
| `PlaceableHusbandryPallets.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre les nouvelles fonctions de placeable : callback du déclencheur de palette, requêtes et génération de palettes (`updatePallets`, `addPendingLiters`, `getPalletCallback`), affichage d'avertissements et `updatePalletInfo`. |
| `PlaceableHusbandryPallets.registerOverwrittenFunctions(placeableType: any)` | 37 | ✍ Enregistre les surcharges de `getConditionInfos`, `updateOutput` et `updateInfo`. |
| `PlaceableHusbandryPallets.registerEventListeners(placeableType: any)` | 45 | ✍ S'abonne à onLoad, onDelete, onFinalizePlacement, aux quatre événements de flux (lecture/écriture initiale et de mise à jour) et à onHusbandryAnimalsUpdate. |
| `PlaceableHusbandryPallets.registerXMLPaths(schema: any, basePath: any)` | 58 | ✍ Déclare le XML répétable `husbandry.pallets.palletSpawner` : `palletTrigger#node`, types de remplissage, `#unitText`, `#maxNumPallets` et les chemins de `PalletSpawner`. À noter : `#unitText` est déclaré mais `onLoad` ne le lit pas ici. |
| `PlaceableHusbandryPallets.registerSavegameXMLPaths(schema: any, basePath: any)` | 71 | ✍ Déclare les chemins de sauvegarde `pendingLiters(?)#fillType` et `#liters` servant à conserver la production en attente. |
| `PlaceableHusbandryPallets:onLoad(savegame: any)` | 80 | ✍ Construit les tables par type de remplissage, crée un `PalletSpawner` par spawner XML (avertit des doublons de type) et, sur le serveur, collecte les déclencheurs de palette ayant le bit de collision VEHICLE. Réserve un indicateur dirty et avertit si un sous-type d'animal produit un type de palette non géré. |
| `PlaceableHusbandryPallets:onDelete()` | 176 | ✍ Supprime chaque spawner de palettes et retire les déclencheurs de palette qui avaient été ajoutés. |
| `PlaceableHusbandryPallets:onFinalizePlacement()` | 196 | ✍ Enregistre les déclencheurs de palette avec `addTrigger` et le callback `onPalletTriggerCallback`, en les marquant comme ajoutés. |
| `PlaceableHusbandryPallets:onReadStream(streamId: any, connection: any)` | 213 | ✍ Client : lit, par type de remplissage, le niveau et la capacité (float32) ainsi que l'indicateur de limite de palettes dans le flux initial. |
| `PlaceableHusbandryPallets:onWriteStream(streamId: any, connection: any)` | 225 | ✍ Serveur : écrit les derniers niveaux et capacités envoyés par type de remplissage, puis l'indicateur de limite de palettes. |
| `PlaceableHusbandryPallets:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 238 | ✍ Client : si le bit dirty du serveur est positionné, lit les mêmes données que le flux initial (niveaux, capacités, indicateur de limite). |
| `PlaceableHusbandryPallets:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 254 | ✍ Serveur : quand l'indicateur dirty du placeable figure dans le masque, écrit niveaux, capacités et indicateur de limite vers le client. |
| `PlaceableHusbandryPallets:loadFromXMLFile(xmlFile: any, key: any)` | 270 | ✍ Charge les litres en attente sauvegardés par type de remplissage, puis rafraîchit les infos de palettes. |
| `PlaceableHusbandryPallets:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 285 | ✍ Sauvegarde chaque type de remplissage ayant encore des litres en attente supérieurs à 0 sous `pendingLiters(i)`. |
| `PlaceableHusbandryPallets:onHusbandryAnimalsUpdate(clusters: any)` | 300 | ✍ Remet à zéro les litres par heure et les recalcule à partir des groupes d'animaux (courbe de production à l'âge multipliée par le nombre d'animaux, divisée par 24), et liste les types actuellement produits. |
| `PlaceableHusbandryPallets:onPalletTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 328 | ✍ Callback du déclencheur ; ne traite que les sorties : oublie la palette qui part (palettes courante et suivies) et rafraîchit les infos de palettes. |
| `PlaceableHusbandryPallets:updatePalletInfo()` | 347 | ✍ Serveur uniquement, et seulement si aucune requête n'est en cours : remet à zéro les sommes en attente et demande à chaque spawner toutes ses palettes, `getAllPalletsCallback` recevant la réponse. |
| `PlaceableHusbandryPallets:getAllPalletsCallback(pallets: any, fillTypeIndex: any)` | 367 | ✍ Additionne capacité et niveau de chaque palette aux totaux en attente ; quand toutes les requêtes sont finies, publie niveaux et capacités (maximum de palettes fois la plus grande capacité s'il reste de la place) et lève le dirty flag si une valeur a varié de plus de 1. |
| `PlaceableHusbandryPallets:updatePallets()` | 400 | ✍ Serveur uniquement : si aucune génération n'est en cours, demande au spawner une palette (existante ou nouvelle) pour chaque type ayant plus de 5 litres en attente. |
| `PlaceableHusbandryPallets:addPendingLiters(fillTypeIndex: integer, liters: number) → number` | 420 | ✍ Serveur uniquement : ajoute des litres positifs au stock en attente d'un type géré et déclenche la génération de palettes. Renvoie les litres ajoutés, ou 0 sur un client, pour une quantité non positive ou un type non géré. |
| `PlaceableHusbandryPallets:getPalletCallback(pallet: any, result: any, fillTypeIndex: any)` | 442 | ✍ Réponse du spawner : mémorise la palette, efface l'indicateur de limite, vide une palette nouvellement créée et la remplit avec les litres en attente, relançant s'il en reste plus de 5. Sans place, affiche un avertissement ; à la limite de palettes, active l'indicateur. Rafraîchit enfin les infos. |
| `PlaceableHusbandryPallets:showSpawnerBlockedWarning(fillTypeIndex: any)` | 482 | ✍ Une fois par cycle de production, diffuse sur le serveur `AnimalHusbandryNoMorePalletSpaceEvent` à la ferme propriétaire et affiche l'avertissement local. |
| `PlaceableHusbandryPallets:showPalletBlockedWarning(fillTypeIndex: any)` | 497 | ✍ Client, seulement pour la ferme propriétaire : affiche une notification critique indiquant que le spawner de palettes de cet élevage est bloqué pour ce type. |
| `PlaceableHusbandryPallets:updateInfo(superFunc: any, infoTable: any)` | 509 | ✍ Surcharge. Après la fonction parente, ajoute une entrée mise en évidence signalant trop de palettes quand la limite est atteinte. |
| `PlaceableHusbandryPallets:getConditionInfos(superFunc: any)` | 520 | ✍ Surcharge. Pour chaque type actuellement produit, ajoute une barre de condition inversée avec niveau et ratio de capacité. À noter : elle utilise `spec.fillTypeUnit`, jamais défini dans ce fichier (NON VÉRIFIÉ). |
| `PlaceableHusbandryPallets:updateOutput(superFunc: any, foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 551 | ✍ Surcharge. Appelle le parent, efface l'indicateur d'avertissement et, sur le serveur, ajoute les litres par heure multipliés par les facteurs de production et `timeAdjustment` aux litres en attente, puis génère des palettes si besoin. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onPalletTriggerCallback` | 25 |
| registerFunction | `getAllPalletsCallback` | 26 |
| registerFunction | `updatePallets` | 27 |
| registerFunction | `addPendingLiters` | 28 |
| registerFunction | `getPalletCallback` | 29 |
| registerFunction | `showSpawnerBlockedWarning` | 30 |
| registerFunction | `showPalletBlockedWarning` | 31 |
| registerFunction | `updatePalletInfo` | 32 |
| registerOverwrittenFunction | `getConditionInfos` | 38 |
| registerOverwrittenFunction | `updateOutput` | 39 |
| registerOverwrittenFunction | `updateInfo` | 40 |
| registerEventListener | `onLoad` | 46 |
| registerEventListener | `onDelete` | 47 |
| registerEventListener | `onFinalizePlacement` | 48 |
| registerEventListener | `onReadStream` | 49 |
| registerEventListener | `onWriteStream` | 50 |
| registerEventListener | `onReadUpdateStream` | 51 |
| registerEventListener | `onWriteUpdateStream` | 52 |
| registerEventListener | `onHusbandryAnimalsUpdate` | 53 |
