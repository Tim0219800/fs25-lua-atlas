# vehicles/specializations/Wearable.lua

*[English version](../../../../scripts/vehicles/specializations/Wearable.md)*

Source: `dataS/scripts/vehicles/specializations/Wearable.lua` — FS25 1.25.1.0

✍ Spécialisation donnant deux types de vieillissement aux véhicules. Les dégâts (0..1) augmentent côté serveur pendant l'utilisation, réduisent les performances via `getVehicleDamage` et fixent le prix de réparation. L'usure (0..1 par groupe de nœuds) est stockée dans le paramètre de shader `scratches_dirt_snow_wetness` de chaque nœud qui le possède et détermine le prix de repeinture. Les deux sont sauvegardés, synchronisés par drapeaux de modification avec un flux quantifié, et la boutique reçoit une spec « état » si `Platform.gameplay.hasVehicleDamage`. Sur mobile, certains écouteurs (flux, tick, objet en vente) ne sont pas enregistrés.

- **Wearable** (l.19)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Wearable.prerequisitesPresent(specializations: any)` | 29 | ✍ Renvoie toujours true : aucun prérequis. |
| `Wearable.initSpecialization()` | 35 | ✍ Enregistre le type de spec boutique `wearable` (icône d'état) quand les dégâts de véhicule sont activés sur la plateforme, les chemins XML wearDuration (minutes, 600 par défaut), workMultiplier (20), fieldMultiplier (2), showOnHud, ainsi que les attributs de sauvegarde des dégâts et de l'usure par nœud. |
| `Wearable.registerFunctions(vehicleType: any)` | 57 | ✍ Ajoute au type de véhicule les fonctions de gestion des dégâts, de l'usure et des nœuds (addDamageAmount, setNodeWearAmount, repairVehicle, repaintVehicle, validateWearableNode, etc.). À noter : `repaintVehicle` est enregistrée ici mais n'a pas de corps dans ce fichier (NON VÉRIFIÉ). |
| `Wearable.registerOverwrittenFunctions(vehicleType: any)` | 85 | ✍ Surcharge getVehicleDamage, getRepairPrice, getRepaintPrice et showInfo. |
| `Wearable.registerEventListeners(vehicleType: any)` | 94 | ✍ S'abonne à onLoad et onLoadFinished, et, hors mobile, à onSaleItemSet, aux événements de flux et à onUpdateTick. |
| `Wearable:onLoad(savegame: any)` | 110 | ✍ Crée le nœud d'usure par défaut (global), convertit wearDuration de minutes en taux par milliseconde multiplié par `Wearable.WEAR_FACTOR`, initialise dégâts et totaux, lit les multiplicateurs travail/champ et le drapeau HUD, et alloue un drapeau de modification. |
| `Wearable:onLoadFinished(savegame: any)` | 138 | ✍ Charge les dégâts sauvegardés (et en déduit `damageByCurve`), parcourt tous les composants à la recherche de nœuds avec le paramètre de shader d'usure, puis applique l'usure sauvegardée par nœud ou la remet à 0. |
| `Wearable:onSaleItemSet(saleItem: any)` | 168 | ✍ Applique au véhicule les dégâts et l'usure stockés dans un objet en vente, en forçant la synchronisation. |
| `Wearable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 175 | ✍ Sauvegarde la valeur de dégâts et l'usure de chaque nœud dans la sauvegarde. |
| `Wearable:onReadStream(streamId: any, connection: any)` | 190 | ✍ Connexion d'un client : lit dégâts et usure par nœud, quantifiés sur `Wearable.SEND_NUM_BITS` bits, et les applique de force. |
| `Wearable:onWriteStream(streamId: any, connection: any)` | 205 | ✍ Côté serveur lors d'une connexion : écrit dégâts et usure par nœud sous forme d'entiers quantifiés. |
| `Wearable:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 219 | ✍ Client : quand le serveur a signalé un changement, lit dégâts et usure par nœud et les applique. |
| `Wearable:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 238 | ✍ Serveur : écrit un booléen de présence du drapeau de modification, puis dégâts et usure par nœud s'il est posé. |
| `Wearable:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 256 | ✍ Serveur uniquement : ajoute les dégâts calculés par `updateDamageAmount` et, pour chaque nœud d'usure, la variation renvoyée par sa fonction de mise à jour. |
| `Wearable:setDamageAmount(amount: any, force: any)` | 278 | ✍ Borne les dégâts à 0..1, recalcule `damageByCurve` (dégâts au-dessus de 0,3 remis à l'échelle 0..1) et, sur le serveur, pose le drapeau de modification quand la variation depuis le dernier envoi dépasse `Wearable.SEND_THRESHOLD` ou si forcé. |
| `Wearable:updateWearAmount(nodeData: any, dt: any)` | 295 | ✍ Fonction de mise à jour d'usure par défaut d'un nœud : renvoie dt fois le taux d'usure fois `getWearMultiplier`, divisé par deux, ou 0 si l'usage ne cause pas d'usure. |
| `Wearable:updateDamageAmount(dt: any)` | 306 | ✍ Renvoie l'augmentation de dégâts pour dt ms quand l'usage cause des dégâts, pondérée par 0,35 et par un facteur de vieillissement fondé sur l'âge/durée de vie et les heures de fonctionnement avec les constantes de l'économie. Renvoie 0 sinon. |
| `Wearable:getUsageCausesWear()` | 326 | ✍ Renvoie true par défaut : l'usage cause toujours de l'usure. |
| `Wearable:getUsageCausesDamage()` | 332 | ✍ Renvoie true quand le véhicule est actif et n'est pas un véhicule de mission. Pour les véhicules non motorisés, renvoie false si le nœud racine dort (physique). |
| `Wearable:addWearAmount(wearAmount: any, force: any)` | 344 | ✍ Ajoute l'usure donnée à chaque nœud d'usure (bornée par `setNodeWearAmount`). |
| `Wearable:addDamageAmount(amount: any, force: any)` | 355 | ✍ Ajoute la quantité donnée aux dégâts actuels via `setDamageAmount`. |
| `Wearable:setNodeWearAmount(nodeData: any, wearAmount: any, force: any)` | 362 | ✍ Borne et mémorise l'usure d'un groupe de nœuds. Si le changement dépasse le seuil ou est forcé, l'écrit dans le paramètre de shader `scratches_dirt_snow_wetness` de chaque nœud, pose le drapeau de modification sur le serveur et recalcule l'usure totale moyenne. |
| `Wearable:getNodeWearAmount(nodeData: any)` | 388 | ✍ Renvoie l'usure du groupe de nœuds donné. |
| `Wearable:getWearTotalAmount() → number` | 395 | ✍ Renvoie l'usure moyenne (0..1) sur tous les groupes de nœuds. |
| `Wearable:getDamageAmount() → number` | 402 | ✍ Renvoie la valeur de dégâts actuelle (0..1). |
| `Wearable:getDamageShowOnHud() → boolean` | 409 | ✍ Indique si les dégâts doivent être affichés sur le HUD (XML `showOnHud`). |
| `Wearable:repairVehicle()` | 415 | ✍ Sur le serveur, débite le prix de réparation à la ferme propriétaire (MoneyType.VEHICLE_REPAIR), met à jour la statistique de réparations et tente de débloquer les succès ; puis remet les dégâts à 0 (de chaque côté qui l'appelle). |
| `Wearable:getRepairPrice(superFunc: any)` | 449 | ✍ Surcharge : prix de réparation de base plus `calculateRepairPrice` du prix du véhicule et des dégâts actuels. |
| `Wearable.calculateRepairPrice(price: any, damage: any)` | 456 | ✍ Formule du prix de réparation : prix fois dégâts puissance 1,5 fois 0,09 (soit 9 pour cent du prix à dégâts maximaux). Utilisée aussi par le système de vente. |
| `Wearable:getRepaintPrice(superFunc: any)` | 464 | ✍ Surcharge : prix de repeinture de base plus `calculateRepaintPrice` du prix du véhicule et de l'usure totale. |
| `Wearable:showInfo(superFunc: any, box: any)` | 470 | ✍ Surcharge : ajoute une ligne de pourcentage de dégâts à la boîte d'information au-dessus de 1 pour cent, puis appelle l'implémentation précédente. |
| `Wearable.calculateRepaintPrice(price: any, wear: any)` | 482 | ✍ Formule du prix de repeinture : prix fois racine carrée de usure/100 fois 2. À noter : l'usure est une valeur 0..1 ailleurs, la division par 100 paraît donc inhabituelle (déduit du code). |
| `Wearable:getVehicleDamage(superFunc: any)` | 488 | ✍ Surcharge : ajoute les dégâts par courbe à la valeur précédente et plafonne le résultat à 1 ; les dégâts n'affectent donc les performances qu'au-delà de 30 pour cent. |
| `Wearable:addAllSubWearableNodes(rootNode: any)` | 494 | ✍ Parcourt la hiérarchie depuis la racine et déclare usables tous les nœuds possédant le paramètre de shader `scratches_dirt_snow_wetness`. |
| `Wearable:addWearableNode(node: any)` | 502 | ✍ Demande à `validateWearableNode` comment traiter un nœud et l'ajoute au groupe global ou à un groupe local avec sa propre fonction de mise à jour. |
| `Wearable:validateWearableNode(node: any)` | 513 | ✍ Validation par défaut : tout nœud est global. D'autres spécialisations peuvent la surcharger pour renvoyer un groupe local, une fonction de mise à jour, un indice personnalisé et des paramètres supplémentaires. |
| `Wearable:addToGlobalWearableNode(node: any)` | 519 | ✍ Ajoute le nœud au premier groupe d'usure (par défaut), s'il existe. |
| `Wearable:addToLocalWearableNode(node: any, updateFunc: any, customIndex: any, extraParams: any)` | 528 | ✍ Crée un groupe d'usure avec sa propre fonction de mise à jour et des champs supplémentaires, ou, si `customIndex` existe déjà, y ajoute simplement le nœud. |
| `Wearable:removeAllSubWearableNodes(rootNode: any)` | 563 | ✍ Parcourt la hiérarchie depuis la racine et retire de ses groupes d'usure chaque nœud portant le paramètre de shader d'usure. |
| `Wearable:removeWearableNode(node: node)` | 572 | ✍ Retire le nœud de tous les groupes d'usure. |
| `Wearable:getWearMultiplier() → number` | 585 | ✍ Renvoie le multiplicateur de vitesse d'usure : 0 si la dernière vitesse est inférieure à 1, sinon 1, multiplié par le multiplicateur de champ sur un champ. L'argument de nœud n'est pas utilisé ici. |
| `Wearable:getWorkWearMultiplier() → number` | 603 | ✍ Renvoie le multiplicateur de travail du XML (20 par défaut), utilisable pour l'usure liée au travail. |
| `Wearable:updateDebugValues(values: any)` | 611 | ✍ Affichage de debug : ajoute à la liste le taux de dégâts par heure et le taux d'usure par heure de chaque nœud (serveur uniquement). |
| `Wearable.loadSpecValueCondition(xmlFile: any, customEnvironment: any, baseDir: any)` | 629 | ✍ Chargeur de spec boutique : renvoie nil car la spec d'état ne concerne que les objets existants. |
| `Wearable.getSpecValueCondition(storeItem: any, realItem: any)` | 636 | ✍ Accesseur de spec boutique : renvoie les dégâts en pourcentage (chaîne) pour un objet réel, ou nil s'il n'y a pas d'objet ou s'il n'a pas `getDamageAmount`. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `addAllSubWearableNodes` | 58 |
| registerFunction | `addDamageAmount` | 59 |
| registerFunction | `addToGlobalWearableNode` | 60 |
| registerFunction | `addToLocalWearableNode` | 61 |
| registerFunction | `addWearableNode` | 62 |
| registerFunction | `addWearAmount` | 63 |
| registerFunction | `getDamageAmount` | 64 |
| registerFunction | `getDamageShowOnHud` | 65 |
| registerFunction | `getNodeWearAmount` | 66 |
| registerFunction | `getUsageCausesDamage` | 67 |
| registerFunction | `getUsageCausesWear` | 68 |
| registerFunction | `getWearMultiplier` | 69 |
| registerFunction | `getWearTotalAmount` | 70 |
| registerFunction | `getWorkWearMultiplier` | 71 |
| registerFunction | `removeAllSubWearableNodes` | 72 |
| registerFunction | `removeWearableNode` | 73 |
| registerFunction | `repaintVehicle` | 74 |
| registerFunction | `repairVehicle` | 75 |
| registerFunction | `setDamageAmount` | 76 |
| registerFunction | `setNodeWearAmount` | 77 |
| registerFunction | `updateDamageAmount` | 78 |
| registerFunction | `updateWearAmount` | 79 |
| registerFunction | `validateWearableNode` | 80 |
| registerOverwrittenFunction | `getVehicleDamage` | 86 |
| registerOverwrittenFunction | `getRepairPrice` | 87 |
| registerOverwrittenFunction | `getRepaintPrice` | 88 |
| registerOverwrittenFunction | `showInfo` | 89 |
| registerEventListener | `onLoad` | 95 |
| registerEventListener | `onLoadFinished` | 96 |
| registerEventListener | `onSaleItemSet` | 99 |
| registerEventListener | `onReadStream` | 100 |
| registerEventListener | `onWriteStream` | 101 |
| registerEventListener | `onReadUpdateStream` | 102 |
| registerEventListener | `onWriteUpdateStream` | 103 |
| registerEventListener | `onUpdateTick` | 104 |
