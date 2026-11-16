# placeables/specializations/PlaceableDoghouse.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableDoghouse.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableDoghouse.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour la niche de la ferme. Le serveur fait apparaître un `Dog` et un `DogBall` à des nœuds définis dans le XML (éventuellement par configuration `dogHouse`), un aperçu de construction affiche à la place un modèle de chien texturé, et les joueurs interagissent via un déclencheur pour remplir la gamelle. Une seule niche est autorisée par ferme, suivie dans `g_currentMission.doghouses`, et la gamelle est vidée à chaque heure de jeu.

- **PlaceableDoghouse** (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableDoghouse.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceableDoghouse.initSpecialization()` | 28 | ✍ Ajoute le type de configuration de placeable `dogHouse` (configurations de niche sélectionnables) au gestionnaire de configurations de placeables. |
| `PlaceableDoghouse.registerFunctions(placeableType: any)` | 35 | ✍ Enregistre huit fonctions : rappel du déclencheur d'interaction, vérification et (dés)enregistrement auprès de la mission, état de la gamelle, accesseurs du chien et du nœud d'apparition, et rappel de chargement du chien d'aperçu. |
| `PlaceableDoghouse.registerOverwrittenFunctions(placeableType: any)` | 49 | ✍ Surcharge `setOwnerFarmId`, `canBuy`, `getCanBePlacedAt` et `getNeedHourChanged`. |
| `PlaceableDoghouse.registerEventListeners(placeableType: any)` | 58 | ✍ S'abonne à `onLoad`, `onDelete`, `onFinalizePlacement`, `onWriteStream`, `onReadStream` et `onHourChanged`. |
| `PlaceableDoghouse.registerXMLPaths(schema: any, basePath: any)` | 69 | ✍ Déclare les clés de la niche (nœud du chien, nœud d'aperçu, indices de tuile de texture, XML du chien, plaque de nom, nœud et fichier de la balle, déclencheur d'interaction, nœud de nourriture de la gamelle et son de remplissage) à la fois sous `dogHouse` et sous chaque `dogHouseConfiguration`. |
| `PlaceableDoghouse.registerSavegameXMLPaths(schema: any, basePath: any)` | 92 | ✍ Déclare les clés de sauvegarde en déléguant à `Dog.registerSavegameXMLPaths`. |
| `PlaceableDoghouse:onLoad(savegame: table)` | 101 | ✍ Choisit la configuration active puis, côté serveur (hors aperçu), crée et enregistre le `Dog` et le `DogBall`. En aperçu de construction, charge le modèle du chien de façon asynchrone pour l'affichage. Met en place le déclencheur d'interaction, le nœud de nourriture, le son et l'activable. Si le nœud d'apparition ou le chien est invalide, retire la plupart des écouteurs et s'arrête. |
| `PlaceableDoghouse:onDelete()` | 206 | ✍ Retire l'activable, désenregistre la niche de la mission et, côté serveur, supprime le chien et la balle s'ils ne le sont pas déjà. Retire le déclencheur, supprime le son de remplissage et libère le i3d du chien d'aperçu. |
| `PlaceableDoghouse:onFinalizePlacement()` | 240 | ✍ Serveur : appelle `finalizePlacement` sur le chien. Enregistre ensuite la niche auprès de la mission. |
| `PlaceableDoghouse:onReadStream(streamId: any, connection: any)` | 252 | ✍ Connexion côté client : lit l'objet réseau du chien (et relie le chien à ce placeable) ainsi que la visibilité de la gamelle de nourriture. |
| `PlaceableDoghouse:onWriteStream(streamId: integer, connection: table)` | 269 | ✍ Connexion côté serveur : écrit l'objet réseau du chien et la visibilité de la gamelle de nourriture. |
| `PlaceableDoghouse:loadFromXMLFile(xmlFile: any, key: any)` | 281 | ✍ Délègue le chargement des données de sauvegarde au chien, s'il existe. |
| `PlaceableDoghouse:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 290 | ✍ Délègue la sauvegarde au chien, s'il existe. |
| `PlaceableDoghouse:onPreviewDogLoaded(node: any, failedReason: any, args: any)` | 299 | ✍ Rappel asynchrone du modèle de chien d'aperçu : l'attache au nœud d'aperçu (ou au nœud racine) et règle le paramètre de shader de la tuile d'atlas de texture. Termine toujours la tâche de chargement. |
| `PlaceableDoghouse:dogInteractionTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 319 | ✍ Rappel du déclencheur : quand le joueur local de la ferme propriétaire entre ou sort et qu'un chien existe, ajoute ou retire l'activable de la niche. |
| `PlaceableDoghouse:isDoghouseRegistered() → boolean` | 335 | ✍ Renvoie true si la mission possède déjà une niche pour la ferme propriétaire de ce placeable. |
| `PlaceableDoghouse:registerDoghouseToMission() → boolean` | 343 | ✍ Ajoute ce placeable à `g_currentMission.doghouses` sauf si la ferme en a déjà une ; renvoie si l'ajout a eu lieu. |
| `PlaceableDoghouse:unregisterDoghouseToMission() → boolean` | 355 | ✍ Retire ce placeable de `g_currentMission.doghouses` et renvoie true. |
| `PlaceableDoghouse:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 363 | ✍ Appelle le parent puis, côté serveur, propage le nouvel id de ferme au chien et à la balle. |
| `PlaceableDoghouse:setFoodBowlState(isFilled: any, noEventSend: any)` | 380 | ✍ Envoie un événement d'état de la gamelle, affiche ou masque le nœud de nourriture et, si elle est remplie, signale la gamelle au chien et joue le son de remplissage. Sans effet sans nœud de nourriture. |
| `PlaceableDoghouse:getDog()` | 399 | ✍ Renvoie l'objet `Dog` (nil côté client non encore synchronisé ou si aucun chien n'a été créé). |
| `PlaceableDoghouse:getSpawnNode()` | 405 | ✍ Renvoie le nœud d'apparition du chien. |
| `PlaceableDoghouse:getCanBePlacedAt(superFunc: any, x: any, y: any, z: any, farmId: any)` | 411 | ✍ Refuse le placement avec un avertissement « un seul par ferme » si une niche est déjà enregistrée ; sinon s'en remet au parent. |
| `PlaceableDoghouse:canBuy(superFunc: any)` | 421 | ✍ Exécute la vérification parent puis refuse l'achat avec un avertissement « un seul par ferme » si la ferme possède déjà une niche. |
| `PlaceableDoghouse:getNeedHourChanged(superFunc: any)` | 436 | ✍ Renvoie toujours true pour que le placeable reçoive `onHourChanged`. |
| `PlaceableDoghouse:onHourChanged()` | 442 | ✍ Vide la gamelle à chaque heure de jeu, sans envoyer d'événement (`setFoodBowlState(false, true)`). |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `dogInteractionTriggerCallback` | 36 |
| registerFunction | `isDoghouseRegistered` | 37 |
| registerFunction | `registerDoghouseToMission` | 38 |
| registerFunction | `unregisterDoghouseToMission` | 39 |
| registerFunction | `setFoodBowlState` | 40 |
| registerFunction | `getDog` | 41 |
| registerFunction | `getSpawnNode` | 42 |
| registerFunction | `onPreviewDogLoaded` | 43 |
| registerOverwrittenFunction | `setOwnerFarmId` | 50 |
| registerOverwrittenFunction | `canBuy` | 51 |
| registerOverwrittenFunction | `getCanBePlacedAt` | 52 |
| registerOverwrittenFunction | `getNeedHourChanged` | 53 |
| registerEventListener | `onLoad` | 59 |
| registerEventListener | `onDelete` | 60 |
| registerEventListener | `onFinalizePlacement` | 61 |
| registerEventListener | `onWriteStream` | 62 |
| registerEventListener | `onReadStream` | 63 |
| registerEventListener | `onHourChanged` | 64 |
