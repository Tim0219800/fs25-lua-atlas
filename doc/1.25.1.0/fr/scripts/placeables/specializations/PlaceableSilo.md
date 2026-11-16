# placeables/specializations/PlaceableSilo.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableSilo.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableSilo.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable sans prérequis pour les silos. Elle construit un UnloadingStation, un LoadingStation et un ou plusieurs objets Storage (un par emplacement de ferme si storages perFarm est actif et en multijoueur), les enregistre auprès de g_currentMission.storageSystem, les transmet aux clients, sauvegarde le contenu, gère la vente avec un avertissement sur la valeur du contenu et affiche les niveaux dans le HUD d'infos. Le même fichier définit aussi PlaceableSiloActivatable (action de remplissage) et PlaceableSiloRefillEvent (demande de remplissage client vers serveur).

- **PlaceableSilo** (l.11)
- **PlaceableSiloActivatable** (l.561)
- **PlaceableSiloRefillEvent** hérite de `Event` (l.596)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableSilo.prerequisitesPresent(specializations: table) → boolean` | 21 | ✍ Retourne toujours true. |
| `PlaceableSilo.registerOverwrittenFunctions(placeableType: any)` | 27 | ✍ Surcharge collectPickObjects, setOwnerFarmId, canBeSold et updateInfo. |
| `PlaceableSilo.registerFunctions(placeableType: any)` | 36 | ✍ Enregistre setAmount, refillAmount, getFillLevels et onPlayerActionTriggerCallback sur le type de placeable. |
| `PlaceableSilo.registerEventListeners(placeableType: any)` | 45 | ✍ Abonne à onLoad, onDelete, onFinalizePlacement, onReadStream, onWriteStream et onSell. |
| `PlaceableSilo.registerXMLPaths(schema: any, basePath: any)` | 56 | ✍ Déclare le XML sous placeable.silo : texte d'avertissement de vente, déclencheur d'action du joueur, indicateurs perFarm et foreignSilo, ainsi que les définitions de la station de déchargement, de la station de chargement et des stockages. |
| `PlaceableSilo.registerSavegameXMLPaths(schema: any, basePath: any)` | 71 | ✍ Déclare les clés de sauvegarde de chaque stockage : son indice et les données de sauvegarde de Storage. |
| `PlaceableSilo.initSpecialization()` | 80 | ✍ Ajoute le type de spécification de boutique siloVolume (icône de capacité) pour les placeables. |
| `PlaceableSilo:onLoad(savegame: table)` | 87 | ✍ Charge le déclencheur joueur et l'activatable, les stations de déchargement et de chargement, et les stockages (un jeu par emplacement de ferme si perFarm et multijoueur, sinon un seul). Chaque stockage reçoit son identifiant de ferme et l'indicateur foreignSilo. Lit le texte d'avertissement de vente. |
| `PlaceableSilo:onDelete()` | 144 | ✍ Détache les stockages des stations et du système de stockage, puis supprime stockages, stations (en retirant aussi une station de chargement de lisier), l'activatable et le déclencheur. À noter : il passe spec.storageFilLLevelChangedCallback à removeFillLevelChangedListeners, un champ jamais défini dans ce fichier. |
| `PlaceableSilo:onFinalizePlacement()` | 190 | ✍ Enregistre stations et stockages comme objets réseau, les ajoute au système de stockage et les relie, attribue aux stockages mono-propriétaire la ferme du placeable, rattache les extensions de stockage à portée et active le déclencheur d'action du joueur. |
| `PlaceableSilo:onReadStream(streamId: any, connection: any)` | 246 | ✍ Synchronisation initiale côté client : lit la station de déchargement, la station de chargement et chaque stockage (identifiant d'objet puis données) et termine leur enregistrement auprès de g_client. |
| `PlaceableSilo:onWriteStream(streamId: any, connection: any)` | 266 | ✍ Synchronisation initiale côté serveur : écrit identifiant d'objet et données de la station de déchargement, de la station de chargement et de chaque stockage, en les enregistrant dans le flux. |
| `PlaceableSilo:collectPickObjects(superFunc: any, node: any)` | 286 | ✍ Ignore les nœuds qui sont le nœud racine de remplissage exact d'un déclencheur de déchargement ou un nœud de déclencheur de chargement ; sinon délègue au parent. |
| `PlaceableSilo:canBeSold(superFunc: any)` | 313 | ✍ Retourne false pour les silos par ferme. Sinon retourne true et, si le premier stockage contient quelque chose, un avertissement listant chaque type de remplissage avec une valeur de vente estimée (prix le plus bas d'un point de vente fois PRICE_SELL_FACTOR) ; le total est conservé pour onSell. |
| `PlaceableSilo:loadFromXMLFile(xmlFile: any, key: any)` | 362 | ✍ Charge chaque stockage sauvegardé selon son indice dans l'objet de stockage correspondant. |
| `PlaceableSilo:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 381 | ✍ Sauvegarde chaque stockage avec son indice commençant à 1. |
| `PlaceableSilo:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 393 | ✍ Appelle le parent, puis sur le serveur propage l'identifiant de ferme à tous les stockages sauf si le silo est par ferme. |
| `PlaceableSilo:setAmount(fillType: any, amount: any)` | 409 | ✍ Définit le niveau d'un type de remplissage en remplissant les stockages dans l'ordre, chacun jusqu'à sa capacité libre, jusqu'à épuisement de la quantité. |
| `PlaceableSilo:refillAmount(fillTypeIndex: any, amount: any, price: any)` | 429 | ✍ Achète de la matière pour remplir le silo. Sur un client, envoie PlaceableSiloRefillEvent au serveur ; sur le serveur, ajoute la quantité dans les stockages et débite la ferme (BOUGHT_MATERIALS). Ne fait rien si un argument est nil. |
| `PlaceableSilo:getFillLevels()` | 463 | ✍ Retourne une table indice de type de remplissage vers niveau, combinée depuis tous les stockages, en ne gardant que les types permis par self.fillTypes s'il est défini. À noter : pour un type présent dans plusieurs stockages, la dernière valeur écrase les précédentes au lieu de s'additionner. |
| `PlaceableSilo:onSell()` | 479 | ✍ Serveur uniquement : verse à la ferme la valeur totale du contenu calculée dans canBeSold, en HARVEST_INCOME. |
| `PlaceableSilo:onPlayerActionTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 491 | ✍ Quand le joueur local de la ferme propriétaire entre dans le déclencheur ou en sort, ajoute ou retire l'activatable de remplissage. |
| `PlaceableSilo:updateInfo(superFunc: any, infoTable: any)` | 506 | ✍ Appelle le parent, puis ajoute au tableau d'infos les plus gros niveaux (au-dessus de 0,1) de la station de chargement pour la ferme locale, jusqu'à INFO_TRIGGER_NUM_DISPLAYED_FILLTYPES entrées, ou une ligne de silo vide. |
| `PlaceableSilo.loadSpecValueVolume(xmlFile: any, customEnvironment: any, baseDir: any)` | 544 | ✍ Lit la capacité du premier stockage depuis le XML de l'article de boutique. |
| `PlaceableSilo.getSpecValueVolume(storeItem: any, realItem: any)` | 550 | ✍ Retourne le volume du silo formaté pour la boutique, ou nil si l'article n'en a pas. |
| `PlaceableSiloActivatable.new(placeable: any)` | 565 | ✍ Crée l'activatable de remplissage pour un placeable silo, avec le texte de l'action de remplissage. |
| `PlaceableSiloActivatable:run()` | 576 | ✍ Additionne la capacité libre par type de remplissage sur tous les stockages et ouvre RefillDialog, dont la confirmation appelle refillAmount du placeable. |
| `PlaceableSiloRefillEvent.emptyNew()` | 602 | ✍ Crée un événement de remplissage vide, utilisé à la lecture depuis le réseau. |
| `PlaceableSiloRefillEvent.new(placeable: any, fillTypeIndex: any, amount: any, price: any)` | 609 | ✍ Crée un événement de remplissage contenant le placeable, l'indice du type de remplissage, la quantité et le prix. |
| `PlaceableSiloRefillEvent:writeStream(streamId: any, connection: any)` | 622 | ✍ Écrit dans le flux le placeable, la quantité et le prix (int32) ainsi que l'indice du type de remplissage. |
| `PlaceableSiloRefillEvent:readStream(streamId: any, connection: any)` | 631 | ✍ Lit le placeable, la quantité, le prix et l'indice du type de remplissage, puis exécute aussitôt l'événement. |
| `PlaceableSiloRefillEvent:run(connection: any)` | 642 | ✍ Sur le serveur récepteur (connexion qui ne mène pas à un serveur), appelle refillAmount sur le placeable avec les valeurs transmises. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `collectPickObjects` | 28 |
| registerOverwrittenFunction | `setOwnerFarmId` | 29 |
| registerOverwrittenFunction | `canBeSold` | 30 |
| registerOverwrittenFunction | `updateInfo` | 31 |
| registerFunction | `setAmount` | 37 |
| registerFunction | `refillAmount` | 38 |
| registerFunction | `getFillLevels` | 39 |
| registerFunction | `onPlayerActionTriggerCallback` | 40 |
| registerEventListener | `onLoad` | 46 |
| registerEventListener | `onDelete` | 47 |
| registerEventListener | `onFinalizePlacement` | 48 |
| registerEventListener | `onReadStream` | 49 |
| registerEventListener | `onWriteStream` | 50 |
| registerEventListener | `onSell` | 51 |
