# placeables/Placeable.lua

*[English version](../../../scripts/placeables/Placeable.md)*

Source: `dataS/scripts/placeables/Placeable.lua` — FS25 1.25.1.0

✍ Classe de base de tous les placeables (bâtiments, clôtures, points de production, etc.), dérivée de `Object`. Elle gère le chargement en plusieurs étapes (pré-chargement, chargement i3d, fin de chargement, synchronisation), possède les schémas XML du placeable et de la sauvegarde, écrit et lit les flux réseau pour les clients qui rejoignent, sauvegarde dans la partie et déclenche des événements de cycle de vie (`onLoad`, `onFinalizePlacement`, `onDelete`, événements horaires ou quotidiens, etc.) vers les spécialisations de son type de placeable. Les fonctionnalités viennent des spécialisations ; les données d'économie, de terrain et de boutique viennent de l'objet de boutique. Plusieurs fonctions appelées ici sont ailleurs ou absentes du dump (NON VÉRIFIÉ), par exemple `getMonetaryValue`, `getIsOnFarmland`, `getFarmlandId`, `getIsPreplaced`, `updateOwnership`, `PlaceableSystem:markPlaceableForDeletion`.

- **Placeable** hérite de `Object` (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Placeable.registerEvents(placeableType: any)` | 68 | ✍ Déclare les événements que les spécialisations peuvent écouter sur un type de placeable : étapes de chargement, enregistrement, suppression, sauvegarde, flux réseau, placement, mise à jour, changements de jour/heure/minute/période/météo, terrain, achat, vente et changement de propriétaire. |
| `Placeable.registerFunctions(placeableType: any)` | 103 | ✍ Enregistre les fonctions de base du placeable (position, terrain, pose, propriétaire, étape et état de chargement, physique, nom, prix, destruction, couleur de surbrillance, visibilité, etc.) sur le type de placeable afin que les spécialisations puissent les surcharger. |
| `Placeable.init()` | 145 | ✍ Remplit le schéma XML du placeable et celui de la sauvegarde (données de base, données de boutique, correspondances i3d, identifiant unique, nom, position, âge, prix, identifiant de ferme, indicateurs de surcharge, etc.), laisse chaque spécialisation enregistrer ses chemins, ajoute la caractéristique de boutique `placeableSlots` et enregistre le type de configuration de couleur. |
| `Placeable.postInit()` | 206 | ✍ Enregistre les chemins XML et de sauvegarde de chaque classe d'élément de configuration une fois tous les types de configuration connus, y compris l'ancien chemin de sauvegarde `boughtConfiguration`. |
| `Placeable.new(isServer: any, isClient: any, customMt: any)` | 227 | ✍ Crée un objet placeable pour le rôle serveur/client donné avec un état par défaut : étape de chargement CREATED, état OK, état de propriété OWNED, âge 0, prix 0, sans identifiant unique. |
| `Placeable:setFilename(filename: any)` | 260 | ✍ Stocke le nom du fichier XML de configuration, son nom nettoyé, ainsi que le nom du mod et le répertoire de base déduits du chemin. |
| `Placeable:setConfigurations(configurations: any, boughtConfigurations: any, configurationData: any)` | 269 | ✍ Stocke les configurations choisies et achetées ainsi que les données de configuration facultatives, et construit une liste triée alphabétiquement des noms de configuration. |
| `Placeable:setType(typeDef: any)` | 289 | ✍ Applique le type de placeable (jeu de spécialisations) à cet objet. Un élément de configuration `placeableType` peut remplacer le type donné ; un nom inconnu écrit un avertissement. Nécessite d'appeler `setFilename` avant. |
| `Placeable:setLoadCallback(loadCallbackFunction: any, loadCallbackFunctionTarget: any, loadCallbackFunctionArguments: any)` | 311 | ✍ Stocke la fonction, la cible et les arguments à appeler lorsque le chargement se termine ou échoue. |
| `Placeable:loadCallback()` | 319 | ✍ Appelle le rappel de chargement stocké avec le placeable, son état de chargement et les arguments, puis efface la cible et les arguments. |
| `Placeable:load(placeableLoadingData: any)` | 329 | ✍ Démarre le chargement depuis un `PlaceableLoadingData` : ouvre le XML, résout l'objet de boutique, corrige les configurations selon l'objet de boutique et les jeux de configuration, crée les environnements de spécialisation, déclenche `onPreLoad`, puis charge l'i3d de façon asynchrone ou reprend le nœud préplacé. Retourne false en cas d'échec. |
| `Placeable:i3dFileLoaded(i3dNode: any, failedReason: any, args: any, i3dLoadingId: any)` | 463 | ✍ Rappel quand l'i3d est prêt : en cas d'échec met l'état ERROR et appelle le rappel de chargement ; si le placeable a été supprimé entre-temps met CANCELED ; sinon stocke le nœud racine et met `loadFinished` en file comme tâche asynchrone. |
| `Placeable:onFinishedLoading()` | 610 | ✍ Dernière étape du chargement : rend le placeable visible et, côté serveur avec des données de sauvegarde, appelle `loadFromXMLFile` de chaque spécialisation et lit nom, image, âge, prix, identifiant de ferme et indicateurs de surcharge. Déclenche ensuite `onLoadFinished`, finalise le placement pour les chargements de sauvegarde, le marque synchronisé côté serveur, l'enregistre si demandé et appelle le rappel de chargement. |
| `Placeable:onLoadingError(msg: any, ...: any)` | 702 | ✍ Écrit l'erreur (avec contexte XML si le XML est ouvert) et ferme le fichier XML, met l'état de chargement ERROR et appelle le rappel de chargement. |
| `Placeable:createLoadingTask(target: any) → table` | 719 | ✍ Crée une tâche de chargement pour la cible donnée via `SpecializationUtil.createLoadingTask` ; le placeable ne termine son chargement qu'une fois ses tâches finies. |
| `Placeable:finishLoadingTask(task: table)` | 726 | ✍ Marque une tâche de chargement comme terminée via `SpecializationUtil.finishLoadingTask`, ce qui peut déclencher `onFinishedLoading` quand tout est prêt. |
| `Placeable:finalizePlacement()` | 732 | ✍ Appelé quand le placeable est réellement posé : déclenche les événements avant, pendant et après finalisation, l'ajoute à la physique, au système de placeables et aux objets possédés, enregistre les nœuds sélectionnables, gère la propriété du terrain et s'abonne aux messages de jour, heure, minute, météo et période selon les besoins. |
| `Placeable:delete(immediate: any)` | 780 | ✍ Supprime le placeable. Sauf si `immediate` vaut true (ou si le jeu se ferme), il est seulement mis en file via le système de placeables. Sinon déclenche `onPreDelete` et `onDelete`, désabonne les messages, le retire des systèmes, libère l'i3d et le XML et appelle la suppression parente. Écrit une erreur s'il est déjà supprimé. |
| `Placeable:readStream(streamId: integer, connection: table, objectId: any)` | 865 | ✍ Côté client à la connexion : lit s'il est préplacé (index) ou son nom de fichier, sa position et sa rotation, puis les configurations et l'état de propriété, construit un `PlaceableLoadingData` et lance le chargement côté client. Écrit une erreur si le chargement a déjà commencé. |
| `Placeable:writeStream(streamId: integer, connection: table)` | 925 | ✍ Côté serveur à la connexion : écrit l'indicateur de préplacé et l'index, ou le nom de fichier, la translation et la rotation du nœud racine, puis les configurations et l'état de propriété. |
| `Placeable:postReadStream(streamId: integer, connection: table)` | 951 | ✍ Côté client une fois chargé : finalise le placement, déclenche `onReadStream` (avec le nombre de bits par spécialisation si `Placeable.DEBUG_NETWORK` est actif), lit le nom personnalisé, la clé l10n et l'image personnalisée facultatifs, marque le placeable synchronisé et demande les mises à jour. |
| `Placeable:postWriteStream(streamId: integer, connection: table)` | 989 | ✍ Côté serveur après chargement par le client : déclenche `onWriteStream` (avec tailles de débogage si activé) et écrit le nom personnalisé, la clé l10n et le nom de l'image personnalisée facultatifs. |
| `Placeable:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 1021 | ✍ Mise à jour réseau côté client : déclenche `onReadUpdateStream` pour les spécialisations (avec le nombre de bits par spécialisation si `Placeable.DEBUG_NETWORK_UPDATE` est actif). |
| `Placeable:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 1041 | ✍ Mise à jour réseau côté serveur : déclenche `onWriteUpdateStream` avec le masque de modifications (avec tailles de débogage si `Placeable.DEBUG_NETWORK_UPDATE` est actif). |
| `Placeable:saveToXMLFile(xmlFile: string, key: any, usedModNames: any) → string, string` | 1061 | ✍ Écrit le placeable dans le XML de sauvegarde : identifiant unique, nom de fichier, position et rotation (sauf préplacé), âge, prix, identifiant de ferme, identifiant de visite, nom personnalisé (si renommable), clé l10n du nom, indicateurs de surcharge, image personnalisée, configurations, puis les données propres à chaque spécialisation. |
| `Placeable:setPropertyState(state: any)` | 1121 | ✍ Définit l'état de propriété (par exemple possédé ou aperçu de construction). |
| `Placeable:getPropertyState()` | 1127 | ✍ Retourne l'état de propriété. |
| `Placeable:setVisibility(state: any)` | 1173 | ✍ Affiche ou masque tous les nœuds racines des composants du placeable. |
| `Placeable:getIsSynchronized()` | 1181 | ✍ Retourne true quand l'étape de chargement a atteint SYNCHRONIZED. |
| `Placeable:getNeedsSaving()` | 1191 | ✍ Retourne true ; le placeable de base est toujours sauvegardé (le système traite à part les préplacés). |
| `Placeable:getUniqueId() → string` | 1198 | ✍ Retourne l'identifiant unique du placeable, ou nil s'il n'en a pas. |
| `Placeable:setUniqueId(uniqueId: string)` | 1205 | ✍ Définit l'identifiant unique. Il ne devrait plus changer une fois défini (vérifié seulement dans les builds de débogage). |
| `Placeable:update(dt: any)` | 1213 | ✍ Mise à jour à chaque image ; déclenche `onUpdate` avec le delta de temps pour les spécialisations. |
| `Placeable:updateTick(dt: any)` | 1219 | ✍ Mise à jour au tick réseau ; déclenche `onUpdateTick` avec le delta de temps. |
| `Placeable:draw()` | 1225 | ✍ Rappel de dessin ; déclenche `onDraw` pour les spécialisations. |
| `Placeable:drawDebug()` | 1231 | ✍ Dessin de débogage ; déclenche `onDrawDebug` (actif seulement avec le paramètre de démarrage scriptDebug, d'après le commentaire du source). |
| `Placeable:getName() → string` | 1238 | ✍ Retourne le nom affiché : d'abord le nom personnalisé du joueur, puis le nom l10n du cartographe, puis le nom de l'objet de boutique. |
| `Placeable:getImageFilename()` | 1244 | ✍ Retourne le nom de l'image personnalisée si défini, sinon l'image de l'objet de boutique. |
| `Placeable:getCanBeRenamedByFarm(farmId: any)` | 1250 | ✍ Retourne true si le placeable peut être renommé et appartient à l'identifiant de ferme donné. |
| `Placeable:setName(name: string, noEventSend: boolean) → boolean` | 1259 | ✍ Définit ou réinitialise (nil) le nom personnalisé si le renommage est autorisé, en envoyant un `PlaceableNameEvent` sauf si `noEventSend`, et notifie les changements des stations de chargement et de déchargement. Retourne false si non renommable ou si le nom est vide. |
| `Placeable:setNameL10nKey(nameL10nKey: string)` | 1278 | ✍ Stocke une clé de localisation de nom (sans le préfixe `$l10n_`) et le texte traduit si la clé existe pour l'environnement personnalisé de la carte ; sinon ne fait rien. |
| `Placeable:onBuy()` | 1289 | ✍ Déclenche `onBuy`, compte les placeables de la ferme locale et tente de débloquer le succès NumPlaceables. |
| `Placeable:onSell()` | 1304 | ✍ Publie `FARM_PROPERTY_CHANGED` pour la ferme propriétaire et déclenche `onSell`. |
| `Placeable:getPrice()` | 1311 | ✍ Retourne le prix d'achat stocké. |
| `Placeable:canBuy() → boolean` | 1319 | ✍ Retourne true sauf si l'objet de boutique a un nombre maximal déjà atteint par la ferme locale. |
| `Placeable:getCanBePlacedAt(x: any, y: any, z: any, farmId: any)` | 1335 | ✍ Vérification de base pour poser à une position pour une ferme : retourne toujours true, nil (les spécialisations peuvent la surcharger). |
| `Placeable:canBeSold()` | 1341 | ✍ Vérification de base : retourne toujours true, nil (la seconde valeur est probablement une raison facultative, NON VÉRIFIÉ). |
| `Placeable:getDestructionMethod()` | 1347 | ✍ Retourne `Placeable.DESTRUCTION.SELL`, la manière par défaut de retirer le placeable. |
| `Placeable:previewNodeDestructionNodes(node: any)` | 1353 | ✍ Point d'extension de base retournant nil ; les spécialisations peuvent retourner les nœuds qui seraient détruits pour un nœud donné. |
| `Placeable:performNodeDestruction(node: integer) → boolean, boolean` | 1362 | ✍ Point d'extension de base retournant false, false (rien de détruit, placeable à conserver) ; les spécialisations le surchargent. |
| `Placeable:onFarmlandStateChanged(farmlandId: any, farmId: any, loadFromSavegame: any)` | 1368 | ✍ Lors d'un changement de propriétaire d'un terrain, appelle `updateOwnership` si le placeable est acheté avec le terrain et se trouve sur ce terrain. |
| `Placeable:register(alreadySent: any)` | 1381 | ✍ Enregistre l'objet via la classe parente et déclenche `onRegistered`. |
| `Placeable:setOwnerFarmId(farmId: any, noEventSend: any)` | 1394 | ✍ Définit la ferme propriétaire : met à jour la propriété du terrain s'il achète du terrain, appelle le parent, déclenche `onOwnerChanged` après l'étape de chargement et réenregistre l'objet possédé (sauf en aperçu de construction). |
| `Placeable:setLoadingState(loadingState: any)` | 1441 | ✍ Définit l'état de chargement s'il est valide ; sinon affiche la pile d'appels et écrit une erreur. |
| `Placeable:collectPickObjects(node: integer)` | 1455 | ✍ Collecte récursivement les nœuds ayant un corps rigide dans `pickObjects`, utilisés pour relier les nœuds au placeable. |
| `Placeable:setLoadingStep(loadingStep: SpecializationLoadStep)` | 1468 | ✍ Définit l'étape de chargement via `SpecializationUtil.setLoadingStep`, qui écrit une erreur pour une étape invalide. |
| `Placeable:setOverlayColor(r: any, g: any, b: any, alpha: any)` | 1474 | ✍ Règle le paramètre de shader `placeableColorScale` (r, g, b, alpha) sur toutes les formes qui le gèrent, en les cherchant une fois puis en les mettant en cache. |
| `Placeable:setOverlayColorNodes(node: integer, nodeTable: table)` | 1489 | ✍ Collecte récursivement dans la table donnée les nœuds de forme qui ont le paramètre `placeableColorScale` et ne sont pas des décalcomanies de terrain. |
| `Placeable:getDailyUpkeep() → integer` | 1503 | ✍ Retourne l'entretien quotidien issu de l'objet de boutique et des configurations, augmenté avec l'âge jusqu'à `EconomyManager.MAX_DAILYUPKEEP_MULTIPLIER` si l'objet a une durée de vie. |
| `Placeable:getSellPrice() → integer, boolean` | 1519 | ✍ Retourne le prix de vente et un indicateur. Dans `Placeable.UNDO_DURATION` après le placement (et après l'ouverture de l'écran de construction) retourne le prix complet et true, sinon `getMonetaryValue()` et false. |
| `Placeable:getSellAction() → integer` | 1544 | ✍ Retourne `Placeable.SELL_AND_SPECTATOR_FARM` pour les placeables préplacés sur terrain public ou non supprimables, ou si la sauvegarde interdit la suppression ; sinon `Placeable.SELL_AND_DELETE`. |
| `Placeable:addToPhysics()` | 1563 | ✍ Ajoute le nœud racine au monde physique s'il existe. |
| `Placeable:removeFromPhysics()` | 1571 | ✍ Retire le nœud racine du monde physique s'il existe. |
| `Placeable:setPreviewPosition(x: any, y: any, z: any, rotX: any, rotY: any, rotZ: any)` | 1579 | ✍ Déplace le nœud racine à une position monde et règle uniquement la rotation Y (rotX et rotZ sont ignorés). |
| `Placeable:getNeedWeatherChanged()` | 1586 | ✍ Retourne false ; les spécialisations la surchargent pour recevoir les changements de météo. |
| `Placeable:weatherChanged()` | 1592 | ✍ Gestionnaire de message pour les changements jour/nuit (abonné à `DAY_NIGHT_CHANGED`) ; déclenche `onWeatherChanged`. |
| `Placeable:getNeedHourChanged()` | 1598 | ✍ Retourne false ; les spécialisations la surchargent pour recevoir les changements d'heure. |
| `Placeable:hourChanged(hour: any)` | 1604 | ✍ Gestionnaire de message pour les changements d'heure ; déclenche `onHourChanged` avec l'heure. |
| `Placeable:getNeedMinuteChanged()` | 1610 | ✍ Retourne false ; les spécialisations la surchargent pour recevoir les changements de minute. |
| `Placeable:minuteChanged(minute: any)` | 1616 | ✍ Gestionnaire de message pour les changements de minute ; déclenche `onMinuteChanged` avec la minute. |
| `Placeable:getNeedDayChanged()` | 1622 | ✍ Retourne false ; les spécialisations la surchargent pour recevoir les changements de jour. |
| `Placeable:dayChanged(day: any)` | 1628 | ✍ Gestionnaire de message pour les changements de jour ; déclenche `onDayChanged` avec le jour. |
| `Placeable:periodChanged(period: any)` | 1634 | ✍ Gestionnaire de message pour les changements de période : augmente l'âge du placeable de 1 (mois) et déclenche `onPeriodChanged`. |
| `Placeable.getSpecValueSlots(storeItem: any, realItem: any)` | 1641 | ✍ Texte de caractéristique de boutique pour les emplacements utilisés : formate l'usage d'emplacements de l'objet de boutique (première copie ou non) sous la forme '+N $SLOTS$'. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onPreLoad` | 69 |
| registerEvent | `onLoad` | 70 |
| registerEvent | `onPostLoad` | 71 |
| registerEvent | `onPreLoadFinished` | 72 |
| registerEvent | `onLoadFinished` | 73 |
| registerEvent | `onRegistered` | 74 |
| registerEvent | `onPreDelete` | 75 |
| registerEvent | `onDelete` | 76 |
| registerEvent | `onSave` | 77 |
| registerEvent | `onReadStream` | 78 |
| registerEvent | `onWriteStream` | 79 |
| registerEvent | `onReadUpdateStream` | 80 |
| registerEvent | `onWriteUpdateStream` | 81 |
| registerEvent | `onDirtyMaskCleared` | 82 |
| registerEvent | `onPreFinalizePlacement` | 83 |
| registerEvent | `onFinalizePlacement` | 84 |
| registerEvent | `onPostFinalizePlacement` | 85 |
| registerEvent | `onUpdate` | 86 |
| registerEvent | `onUpdateTick` | 87 |
| registerEvent | `onDraw` | 88 |
| registerEvent | `onDrawDebug` | 89 |
| registerEvent | `onHourChanged` | 90 |
| registerEvent | `onMinuteChanged` | 91 |
| registerEvent | `onDayChanged` | 92 |
| registerEvent | `onPeriodChanged` | 93 |
| registerEvent | `onWeatherChanged` | 94 |
| registerEvent | `onFarmlandStateChanged` | 95 |
| registerEvent | `onBuy` | 96 |
| registerEvent | `onSell` | 97 |
| registerEvent | `onOwnerChanged` | 98 |
| registerFunction | `register` | 104 |
| registerFunction | `getPosition` | 105 |
| registerFunction | `getIsOnFarmland` | 106 |
| registerFunction | `getFarmlandId` | 107 |
| registerFunction | `setPose` | 108 |
| registerFunction | `setOwnerFarmId` | 109 |
| registerFunction | `setLoadingStep` | 110 |
| registerFunction | `setLoadingState` | 111 |
| registerFunction | `addToPhysics` | 112 |
| registerFunction | `removeFromPhysics` | 113 |
| registerFunction | `collectPickObjects` | 114 |
| registerFunction | `getNeedWeatherChanged` | 115 |
| registerFunction | `getNeedHourChanged` | 116 |
| registerFunction | `getNeedMinuteChanged` | 117 |
| registerFunction | `getNeedDayChanged` | 118 |
| registerFunction | `getName` | 119 |
| registerFunction | `getImageFilename` | 120 |
| registerFunction | `getCanBeRenamedByFarm` | 121 |
| registerFunction | `setName` | 122 |
| registerFunction | `getPrice` | 123 |
| registerFunction | `canBuy` | 124 |
| registerFunction | `getCanBePlacedAt` | 125 |
| registerFunction | `canBeSold` | 126 |
| registerFunction | `getDestructionMethod` | 127 |
| registerFunction | `previewNodeDestructionNodes` | 128 |
| registerFunction | `performNodeDestruction` | 129 |
| registerFunction | `updateOwnership` | 130 |
| registerFunction | `setOverlayColor` | 131 |
| registerFunction | `setOverlayColorNodes` | 132 |
| registerFunction | `getDailyUpkeep` | 133 |
| registerFunction | `getSellPrice` | 134 |
| registerFunction | `setPreviewPosition` | 135 |
| registerFunction | `setPropertyState` | 136 |
| registerFunction | `getPropertyState` | 137 |
| registerFunction | `setVisibility` | 138 |
| registerFunction | `getIsSynchronized` | 139 |
| registerFunction | `getIsPreplaced` | 140 |

## Messages

- s'abonne à `MessageType.FARMLAND_OWNER_CHANGED` (l.754)
- s'abonne à `MessageType.DAY_NIGHT_CHANGED` (l.761)
- s'abonne à `MessageType.HOUR_CHANGED` (l.764)
- s'abonne à `MessageType.MINUTE_CHANGED` (l.767)
- s'abonne à `MessageType.DAY_CHANGED` (l.770)
- s'abonne à `MessageType.PERIOD_CHANGED` (l.772)
- publie `MessageType.FARM_PROPERTY_CHANGED` (l.774)
- publie `MessageType.PLACEABLE_PRE_DELETE` (l.822)
- publie `MessageType.UNLOADING_STATIONS_CHANGED` (l.1268)
- publie `MessageType.LOADING_STATIONS_CHANGED` (l.1269)
- publie `MessageType.FARM_PROPERTY_CHANGED` (l.1305)
