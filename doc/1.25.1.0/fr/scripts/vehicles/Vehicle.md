# vehicles/Vehicle.lua

*[English version](../../../scripts/vehicles/Vehicle.md)*

Source: `dataS/scripts/vehicles/Vehicle.lua` — FS25 1.25.1.0

✍ Classe de base de tous les véhicules du jeu (hérite de `Object`). Elle charge le XML et l'i3d du véhicule de façon asynchrone, construit les composants physiques et les joints, instancie les spécialisations du type de véhicule et leur distribue les événements de cycle de vie (`onLoad`, `onUpdate`, `onDelete`, ...). Elle gère aussi les flux réseau et l'interpolation de position côté client, la sauvegarde, la sélection des outils attelés, la masse, le prix et l'entretien, la détection d'eau et les valeurs de spécifications de la boutique. Beaucoup de méthodes sont enregistrées comme fonctions surchargeables de chaque type de véhicule via `Vehicle.registerFunctions`. Les classes `Environment`, `XMLFile`, `FSBaseMission` et le système de véhicules ne sont pas dans le dump (NON VÉRIFIÉ).

- **Vehicle** hérite de `Object` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Vehicle.registerInteractionFlag(name: string)` | 66 | ✍ Crée à la première utilisation une constante numérotée `Vehicle.INTERACTION_FLAG_<NOM>` (nom mis en majuscules) et renvoie sa valeur ; un second appel avec le même nom renvoie le drapeau existant. |
| `Vehicle.registerEvents(vehicleType: any)` | 80 | ✍ Enregistre sur un type de véhicule tous les événements de cycle de vie de base (`onPreLoad`, `onLoad`, `onPostLoad`, `onUpdate`, `onUpdateTick`, `onDraw`, `onDelete`, `onSave`, lecture/écriture de flux, sélection, `onSetBroken`, ...). Les spécialisations peuvent ensuite s'y abonner. |
| `Vehicle.registerFunctions(vehicleType: any)` | 125 | ✍ Enregistre une centaine de méthodes de `Vehicle` (position, masse, sélection, limite de vitesse, noms, point de carte, événements d'action, ...) comme fonctions surchargeables d'un type de véhicule via `SpecializationUtil.registerFunction`. |
| `Vehicle.init()` | 269 | ✍ Initialisation unique de la classe : déclare les types de configuration (baseColor, vehicleType, component, design 1 à 16 et designColor), ajoute les types de spécifications de boutique (age, operatingTime, weight, workingWidth, slots, ...), crée les schémas XML (véhicule, sons, sauvegarde) et appelle `Vehicle.registers`. |
| `Vehicle.postInit()` | 307 | ✍ Étape différée après l'init : pour chaque type de configuration connu, ajoute des sous-tâches asynchrones qui enregistrent ses chemins XML dans les schémas véhicule et sauvegarde (dont #workingWidth et #typeDesc), ainsi qu'un ancien chemin `boughtConfiguration` pour la sauvegarde. |
| `Vehicle.registers()` | 333 | ✍ Enregistre les chemins XML de base des fichiers de véhicule (`vehicle.base.*` : fichier, taille, composants de masse, joints, point de carte, limite de vitesse, profondeur d'eau, schéma, spécifications boutique) et les attributs de sauvegarde de `vehicles.vehicle(?)` (uniqueId, age, price, farmId, operatingTime, positions des composants). |
| `Vehicle.registerComponentXMLPaths(schema: any, basePath: any)` | 432 | ✍ Enregistre sous `basePath` les chemins XML des composants physiques (index, masse en kg, centre de masse, échelle d'inertie, itérations du solveur), des joints entre composants (limites, ressorts, moteurs, rupture) et des paires de collision. Sert pour le jeu de composants par défaut et ceux par configuration. |
| `Vehicle.new(isServer: any, isClient: any, customMt: any)` | 487 | ✍ Constructeur. Construit un `Object` avec la métatable du véhicule et initialise l'état et l'étape de chargement, la liste de tâches, l'identifiant unique (nil) et un `VehicleActionController`. Aucun XML ni i3d n'est encore chargé. |
| `Vehicle:setFilename(filename: any)` | 511 | ✍ Mémorise le chemin du XML du véhicule et en déduit le nom nettoyé, le nom d'environnement du mod et le répertoire de base. À appeler avant `setType`. |
| `Vehicle:setConfigurations(configurations: any, boughtConfigurations: any, configurationData: any)` | 520 | ✍ Mémorise les configurations choisies et achetées (et les données de configuration éventuelles) et construit la liste triée alphabétiquement des noms de configuration. |
| `Vehicle:setType(typeDef: any)` | 540 | ✍ Applique le type de véhicule : si une configuration `vehicleType` désigne un autre type connu, il remplace celui fourni (avertissement s'il est inconnu), puis les spécialisations du type sont initialisées sur ce véhicule. Vérifie qu'un nom de fichier a été défini. |
| `Vehicle:setLoadCallback(loadCallbackFunction: any, loadCallbackFunctionTarget: any, loadCallbackFunctionArguments: any)` | 562 | ✍ Mémorise la fonction, la cible et les arguments à appeler quand le chargement se termine ou échoue. Voir `loadCallback`. |
| `Vehicle:loadCallback()` | 570 | ✍ Appelle le rappel de chargement mémorisé avec (cible, véhicule, état de chargement, arguments) puis l'efface : il ne se déclenche donc qu'une fois. |
| `Vehicle:load(vehicleLoadingData: any)` | 581 | ✍ Démarre le chargement depuis le XML : valide le type, charge le XMLFile, résout l'article de boutique, la marque et le fichier de sons, réconcilie les configurations sauvegardées avec les jeux de configuration de l'article, crée les environnements de spécialisation, lève `onPreLoad` et demande l'i3d en asynchrone. Renvoie nil tant que c'est en cours, ou l'état d'erreur/false si le pré-chargement échoue. |
| `Vehicle:i3dFileLoaded(i3dNode: any, failedReason: any, arguments: any, i3dLoadingId: any)` | 701 | ✍ Rappel de la demande d'i3d partagé. En cas d'échec, passe à l'état ERROR et déclenche le rappel de chargement ; sinon mémorise le noeud, le masque et met `loadFinished` en file d'attente du gestionnaire de tâches asynchrones. |
| `Vehicle:loadFinished()` | 719 | ✍ Pipeline principal de chargement asynchrone, découpé en nombreuses tâches nommées : composants et noeuds racine, mappings i3d, joints, paires de collision, taille, données diverses (limite de vitesse, seuils d'eau, abonnements jour/période), puis `onLoad`, `onPostLoad`, `onPreInitComponentPlacement`, valeurs de sauvegarde, placement et sélection. Se termine par `onFinishedLoading` ou attend les sous-i3d. |
| `Vehicle:loadSubSharedI3DFile(filename: any, callOnCreate: any, addToPhysics: any, asyncCallbackFunction: any, asyncCallbackObject: any, asyncCallbackArguments: any)` | 1240 | ✍ Demande un i3d partagé supplémentaire pour le véhicule et enregistre une tâche de chargement pour que le véhicule l'attende. Si le véhicule a été supprimé entre-temps, le noeud chargé est libéré et le rappel reçoit le noeud 0. Renvoie l'identifiant de la demande de chargement partagé. |
| `Vehicle:onFinishedLoading()` | 1284 | ✍ Dernière étape du chargement. Le serveur affiche le véhicule et l'ajoute à la physique (les clients le font plus tard dans `postReadStream`) ; puis lève `onLoadFinished`, crée le point de carte, enregistre le véhicule dans le système de véhicules et les listes possédés/loués, appelle éventuellement `register()`, lève `onLoadEnd` et déclenche le rappel de chargement. |
| `Vehicle:createLoadingTask(target: any) → table` | 1336 | ✍ Crée une tâche de chargement en attente pour `target` via `SpecializationUtil.createLoadingTask` et la renvoie. Le véhicule ne termine pas son chargement avant la fin de la tâche. |
| `Vehicle:finishLoadingTask(task: table)` | 1343 | ✍ Marque une tâche de chargement comme terminée via `SpecializationUtil.finishLoadingTask` ; le déclenchement exact de `onFinishedLoading` se trouve dans cette fonction utilitaire (absente de ce fichier). |
| `Vehicle:delete(immediate: any)` | 1353 | ✍ Supprime le véhicule. Le premier appel nettoie le point de carte, la visite guidée, les messages, le travail IA et les listes possédés/loués, puis (sauf `immediate` ou fermeture du jeu) confie la suppression au système de véhicules pour plus tard. La suppression réelle lève `onPreDelete`/`onDelete`, retire les joints, libère noeuds, i3d et XML, et appelle la superclasse. |
| `Vehicle:reset(forceDelete: any, callback: any, resetPlayer: any)` | 1449 | ✍ Remplace le véhicule par une copie rechargée depuis son propre XML de type sauvegarde (voir `getReloadXML`), en supprimant éventuellement l'ancien d'abord et en sortant le joueur local. Publie `MessageType.VEHICLE_RESET` en cas de succès ; `callback(succès)` est appelé à la fin. Ignoré si une réinitialisation est déjà en cours. |
| `Vehicle:getNeedsSaving()` | 1509 | ✍ Indique si le véhicule est enregistré dans la sauvegarde (indicateur `isSaved` de ses données de chargement). |
| `Vehicle:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 1515 | ✍ Écrit le véhicule dans le XML de sauvegarde : uniqueId, âge, prix, ferme, état de propriété, temps de fonctionnement (secondes), id de visite, indices de sélection sur le véhicule racine, état en panne, positions et rotations mondiales des composants, configurations, puis le `saveToXMLFile` de chaque spécialisation et le contrôleur d'actions. |
| `Vehicle:saveStatsToXMLFile(xmlFile: any, key: any) → string` | 1571 | ✍ Écrit nom, catégorie, type et position du véhicule dans un XML de statistiques (avec les anciennes fonctions `setXML*`) et laisse chaque spécialisation ajouter les siennes. Renvoie false si le véhicule est supprimé, non sauvegardé ou non sélectionnable par tabulation. |
| `Vehicle:readStream(streamId: integer, connection: table, objectId: any)` | 1611 | ✍ Côté client, à la connexion : lit le nom de fichier, les configurations et l'état de propriété dans le flux et lance le chargement asynchrone via `VehicleLoadingData:loadVehicleOnClient`. Journalise une erreur si le chargement était déjà lancé ; prévient `g_client` à la fin. |
| `Vehicle:postReadStream(streamId: integer, connection: table)` | 1649 | ✍ Côté client, une fois le véhicule chargé : lit les positions et rotations compressées des composants, la masse, l'âge, le temps de fonctionnement, le prix et l'état en panne, lève `onReadStream` pour les spécialisations, rend le véhicule visible, l'ajoute à la physique et passe à l'étape SYNCHRONIZED. |
| `Vehicle:writeStream(streamId: integer, connection: table)` | 1702 | ✍ Côté serveur, à la connexion d'un client : écrit le nom de fichier réseau, les configurations et l'état de propriété. Le reste est envoyé ensuite par `postWriteStream`. |
| `Vehicle:postWriteStream(streamId: integer, connection: table)` | 1716 | ✍ Côté serveur, une fois le véhicule chargé chez le client : écrit les positions et rotations compressées des composants, la masse serveur, l'âge, le temps de fonctionnement, le prix et l'état en panne, puis lève `onWriteStream`. Miroir de `postReadStream`. |
| `Vehicle:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 1756 | ✍ Lecture de mise à jour côté client : si le serveur a envoyé une position, transmet les positions/quaternions cibles des composants non statiques aux interpolateurs réseau et lève `onReadPositionUpdateStream` ; puis lève `onReadUpdateStream`. |
| `Vehicle:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 1802 | ✍ Écriture de mise à jour côté serveur : quand l'indicateur de modification du véhicule est levé, écrit les positions et rotations compressées des composants non statiques et lève `onWritePositionUpdateStream` ; lève toujours `onWriteUpdateStream` pour les spécialisations. |
| `Vehicle:updateVehicleSpeed(dt: any)` | 1841 | ✍ Calcule vitesse (m/ms), vitesse signée, sens de déplacement, distance parcourue et accélération du premier composant, à partir de la vitesse physique sur un corps dynamique côté serveur ou à partir du changement de position/de l'interpolation sinon, puis met à jour les valeurs lissées `lastSpeed`, `lastSpeedReal`, etc. |
| `Vehicle:update(dt: any)` | 1927 | ✍ Mise à jour à chaque image. Côté serveur, détecte les positions NaN, hors du monde ou sous le terrain et réinitialise le véhicule. Ensuite met à jour la distance à la caméra, lève `onPreUpdate`, interpole les positions côté client, met à jour vitesse et événements d'action, lève `onUpdate`/`onPostUpdate`, recalcule la masse si nécessaire et garde le véhicule actif tant que la physique n'est pas endormie. |
| `Vehicle:updateTick(dt: number)` | 2075 | ✍ Mise à jour à pas régulier. Rafraîchit les infos d'eau et l'indicateur « sur un champ », côté serveur signale les changements de position pour la synchronisation réseau (toujours si un client en est propriétaire), gère l'alerte d'immersion (casse le véhicule au-delà du seuil), cumule le temps de fonctionnement, puis lève `onUpdateTick`/`onPostUpdateTick`. |
| `Vehicle:updateEnd(dt: any)` | 2169 | ✍ Dernière mise à jour avant la mise en veille du véhicule : met la distance de mise à jour à 0 pour que les spécialisations atteignent un état cohérent, puis lève `onUpdateEnd`. |
| `Vehicle:draw(subDraw: any)` | 2182 | ✍ Passe d'affichage du véhicule occupé, s'il est synchronisé. Dessine aussi le véhicule racine et le véhicule sélectionné quand ils diffèrent, lève `onDraw` sur le véhicule sélectionné/racine, lance l'affichage de débogage et le message clignotant d'avertissement d'eau. |
| `Vehicle:drawUIInfo()` | 2223 | ✍ Si le véhicule est synchronisé, lève `onDrawUIInfo` et, quand `g_showVehicleDistance` est actif, affiche au-dessus du véhicule la distance à la caméra jusqu'à 350 m. |
| `Vehicle:setLoadingState(loadingState: any)` | 2239 | ✍ Définit l'état de chargement si la valeur est un `VehicleLoadingState` valide ; sinon affiche la pile d'appels et journalise une erreur. |
| `Vehicle:setLoadingStep(loadingStep: SpecializationLoadStep)` | 2251 | ✍ Définit l'étape de chargement en déléguant à `SpecializationUtil.setLoadingStep` (la validation s'y fait, pas dans ce fichier). |
| `Vehicle:addToPhysics() → boolean` | 2258 | ✍ Ajoute tous les composants à la physique, relie les composants motorisés par des liens de véhicule et, côté serveur, crée les joints, un rapport de réveil et les réglages de paires de collision ; marque la masse comme à recalculer. Renvoie true si ajouté, false si déjà dans la physique. |
| `Vehicle:removeFromPhysics()` | 2299 | ✍ Retire chaque composant de la physique et, côté serveur, invalide les indices de joints et le rapport de réveil. Renvoie toujours true. |
| `Vehicle:setVisibility(state: boolean)` | 2318 | ✍ Affiche ou masque tous les noeuds de composants du véhicule. |
| `Vehicle:setRelativePosition(positionX: number, offsetY: number, positionZ: number, yRot: number)` | 2330 | ✍ Place le véhicule en (x, z) à `offsetY` au-dessus de la hauteur du terrain en ce point, avec le lacet `yRot` (autres angles à 0), via `setAbsolutePosition`. |
| `Vehicle:setAbsolutePosition(positionX: any, positionY: any, positionZ: any, xRot: any, yRot: any, zRot: any, componentPositions: any)` | 2339 | ✍ Positionne tous les composants par rapport à une racine temporaire placée à la position et rotation mondiales données, d'après les décalages d'origine de chaque composant (ou `componentPositions` si fourni pour chacun), et réinitialise l'interpolation réseau. |
| `Vehicle:getLimitedVehicleYPosition(position: any)` | 2363 | ✍ Renvoie `position.posY` s'il existe, sinon la hauteur du terrain en (posX, posZ) plus `yOffset` (0 par défaut). Malgré son nom, aucun bornage n'apparaît dans ce fichier. |
| `Vehicle:setWorldPosition(x: number, y: number, z: number, xRot: number, yRot: number, zRot: number, componentIndex: integer, changeInterp: boolean)` | 2383 | ✍ Définit la translation mondiale et la rotation (Euler) d'un composant par son index ; avec `changeInterp`, réinitialise aussi ses interpolateurs réseau. Sans effet si l'index est inconnu. |
| `Vehicle:setWorldPositionQuaternion(x: number, y: number, z: number, qx: number, qy: number, qz: number, qw: number, componentIndex: integer, changeInterp: boolean)` | 2407 | ✍ Comme `setWorldPosition` mais avec une rotation en quaternion ; utilisé par les clients pour le mouvement interpolé et la lecture des flux. |
| `Vehicle:setDefaultComponentPosition(componentIndex: integer)` | 2430 | ✍ Replace un composant (pas le premier) à son décalage d'origine par rapport au noeud racine du véhicule. |
| `Vehicle:resetPositionToTerrainHeight()` | 2447 | ✍ Soulève tous les composants au-dessus du terrain (plus forte pénétration plus 10 m) pendant qu'ils sont temporairement retirés de la physique, puis les remet et fait de même pour les véhicules enfants attelés. |
| `Vehicle:getIsNodeActive(node: integer)` | 2475 | ✍ Remonte les parents du noeud pour trouver le noeud de composant de premier niveau qui le contient ; renvoie false si ce composant est désactivé par la configuration ou introuvable, true s'il est actif. |
| `Vehicle:getPrice()` | 2515 | ✍ Renvoie le prix d'achat mémorisé du véhicule. |
| `Vehicle:getSellPrice() → number` | 2522 | ✍ Renvoie le prix de vente calculé par `Vehicle.calculateSellPrice` à partir de l'article de boutique, de l'âge, du temps de fonctionnement, du prix et des coûts de réparation/peinture de ce véhicule. |
| `Vehicle.calculateSellPrice(storeItem: any, age: any, operatingTime: any, price: any, repairPrice: any, repaintPrice: any)` | 2529 | ✍ Calcule une valeur de revente : dépréciation selon les heures de fonctionnement (exposant 1,3 pour les engins non motorisés) et selon l'âge en années (courbe logarithmique plafonnée à 0,85), moins les coûts de réparation et de peinture, jamais sous 3 % du prix. |
| `Vehicle:getIsOnField() → boolean` | 2551 | ✍ Examine le centre de masse de chaque composant et renvoie true si l'un d'eux se trouve sur un champ d'après `FSDensityMapUtil.getFieldDataAtWorldPosition` ; s'arrête dès qu'un composant est à plus de 1 m sous le terrain. |
| `Vehicle:getParentComponent(node: integer) → integer` | 2573 | ✍ Remonte le graphe de scène depuis le noeud donné et renvoie le premier noeud qui est un composant de ce véhicule, ou 0 s'il n'y en a pas. |
| `Vehicle:getLastSpeed(useAttacherVehicleSpeed: boolean) → number` | 2587 | ✍ Renvoie la vitesse lissée en km/h (valeur interne fois 3600) ; avec `useAttacherVehicleSpeed`, elle remonte récursivement au véhicule porteur s'il y en a un. |
| `Vehicle:getDeactivateOnLeave()` | 2600 | ✍ Implémentation par défaut : toujours true (le véhicule est désactivé quand le joueur le quitte). Les spécialisations peuvent la surcharger. |
| `Vehicle:getIsSynchronized()` | 2606 | ✍ Vrai une fois l'étape de chargement arrivée à SYNCHRONIZED (juste après le chargement côté serveur, après `postReadStream` côté client). |
| `Vehicle:getIsVehicleNode(nodeId: integer) → boolean` | 2620 | ✍ Renvoie true si l'id de noeud est l'un des noeuds de composants enregistrés de ce véhicule. |
| `Vehicle:getIsOperating() → boolean` | 2627 | ✍ Par défaut : false. Les spécialisations la surchargent pour indiquer que le véhicule travaille ; `updateTick` ajoute le temps écoulé au temps de fonctionnement tant qu'elle renvoie true. |
| `Vehicle:getIsActive()` | 2633 | ✍ Renvoie false si le véhicule est en panne, true si `forceIsActive` est activé, sinon false. Les spécialisations l'étendent (par exemple quand il est occupé ou en marche). |
| `Vehicle:getIsActiveForInput(ignoreSelection: any, activeForAI: any)` | 2647 | ✍ Indique si ce véhicule peut recevoir les commandes du joueur : saisie autorisée, mission en cours, non piloté par l'IA (sauf `activeForAI`), sélectionné (sauf `ignoreSelection`) et véhicule racine également actif ; une racine non montable doit avoir un porteur. |
| `Vehicle:getIsActiveForSound()` | 2689 | ✍ Obsolète : affiche un avertissement et renvoie false. |
| `Vehicle:getIsLowered(defaultIsLowered: any)` | 2696 | ✍ Par défaut : renvoie false. Les outils la surchargent pour indiquer s'ils sont abaissés. |
| `Vehicle:updateWaterInfo()` | 2702 | ✍ Lance un lancer de rayon asynchrone vers le bas contre l'eau depuis la mi-hauteur du véhicule ; le résultat arrive dans `onWaterRaycastCallback`. Ignoré tant qu'une requête précédente est en attente. |
| `Vehicle:onWaterRaycastCallback(nodeId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 2721 | ✍ Traite le résultat du lancer de rayon : définit `waterY`, `isInWater`, les indicateurs eau peu profonde/moyenne (profondeur de 0,5 m ou moins = peu profonde) et `tailwaterDepth`. Renvoie false pour arrêter le rayon. |
| `Vehicle:setBroken()` | 2747 | ✍ Marque le véhicule comme en panne. Côté serveur, diffuse d'abord un `VehicleBrokenEvent` ; lève `onSetBroken` et interrompt une visite guidée en cours si le véhicule en fait partie. |
| `Vehicle:getVehicleDamage()` | 2764 | ✍ Par défaut : 0 (aucun dommage). Surchargée par les spécialisations d'usure ; utilisée par `getSpeedLimit`. |
| `Vehicle:getRepairPrice()` | 2770 | ✍ Par défaut : 0. Les spécialisations la surchargent pour donner le coût de réparation utilisé dans le prix de vente. |
| `Vehicle:getRepaintPrice()` | 2776 | ✍ Par défaut : 0. Les spécialisations la surchargent pour donner le coût de repeinture utilisé dans le prix de vente. |
| `Vehicle:requestActionEventUpdate()` | 2782 | ✍ Demande au véhicule racine de reconstruire ses événements d'action d'entrée à sa prochaine mise à jour et supprime immédiatement les événements d'action actuels de cette racine. |
| `Vehicle:removeActionEvents()` | 2797 | ✍ Supprime tous les événements d'action d'entrée enregistrés par ce véhicule comme cible dans `g_inputBinding`. |
| `Vehicle:updateActionEvents()` | 2803 | ✍ Réenregistre les événements d'action en partant du véhicule racine (appelle `registerActionEvents` dessus). |
| `Vehicle:registerActionEvents(excludedVehicle: any)` | 2810 | ✍ Enregistre les événements d'entrée de ce véhicule et de ses spécialisations (lève `onPreRegisterActionEvents`/`onRegisterActionEvents`), les actions de changement d'outil quand plusieurs objets sont sélectionnables, les actions de débogage et de contrôle automatique. Ne fait rien si une interface est ouverte, si le joueur est figé ou si le véhicule est exclu. |
| `Vehicle:removeActionEvent(actionEventsTable: any, inputAction: any)` | 2946 | ✍ Retire un événement d'action de la table donnée (par action d'entrée) de `g_inputBinding` et efface l'entrée de la table. |
| `Vehicle:updateSelectableObjects()` | 2961 | ✍ Reconstruit la liste des objets sélectionnables ; seul le véhicule racine la remplit, en appelant `registerSelectableObjects`. |
| `Vehicle:registerSelectableObjects(selectableObjects: any)` | 2970 | ✍ Ajoute l'objet de sélection de ce véhicule à la liste et enregistre son index, s'il peut être sélectionné et que la sélection n'est pas bloquée. |
| `Vehicle:addSubselection(subSelection: any)` | 2979 | ✍ Ajoute une entrée de sous-sélection à l'objet de sélection de ce véhicule et renvoie son index. |
| `Vehicle:clearSubselections()` | 2986 | ✍ Vide la liste des sous-sélections de l'objet de sélection de ce véhicule. |
| `Vehicle:getCanBeSelected()` | 2992 | ✍ Par défaut : vrai seulement quand un mode de débogage de véhicule est actif, ce qui permet d'inspecter n'importe quel véhicule. Les outils et véhicules conduisibles la surchargent. |
| `Vehicle:getBlockSelection()` | 2998 | ✍ Renvoie true quand le XML interdit la sélection (`vehicle.base.selection#allowed`). |
| `Vehicle:getCanToggleSelectable()` | 3004 | ✍ Par défaut : false. Surchargée pour permettre de passer d'un outil sélectionnable à un autre avec les actions d'entrée. |
| `Vehicle:getRootVehicle()` | 3010 | ✍ Renvoie le véhicule racine mis en cache de la chaîne d'attelage (lui-même s'il n'est pas attelé). |
| `Vehicle:findRootVehicle()` | 3016 | ✍ Calcule le véhicule racine en remontant la chaîne ; la version de base renvoie le véhicule lui-même, les spécialisations d'attelage la surchargent. |
| `Vehicle:getChildVehicles()` | 3022 | ✍ Renvoie la table mise en cache de ce véhicule et de tous ses enfants attelés. |
| `Vehicle:getChildVehicleHash()` | 3028 | ✍ Renvoie la chaîne construite à partir des ids des véhicules enfants, utilisable pour détecter un changement de la chaîne d'attelage. |
| `Vehicle:addChildVehicles(vehicles: any, rootVehicle: any)` | 3034 | ✍ Ajoute ce véhicule à la liste donnée et complète le hachage des enfants de la racine avec son id. Les spécialisations d'attelage l'étendent pour ajouter leurs outils. |
| `Vehicle:updateVehicleChain(secondCall: any)` | 3041 | ✍ Recalcule le véhicule racine (en levant `onRootVehicleChanged` s'il change), puis reconstruit la liste et le hachage des enfants depuis la racine et met à jour chaque enfant. |
| `Vehicle:unselectVehicle()` | 3072 | ✍ Retire l'indicateur de sélection de ce véhicule, lève `onUnselect` et demande une mise à jour des événements d'action. |
| `Vehicle:selectVehicle(subSelectionIndex: any, ignoreActionEventUpdate: any)` | 3081 | ✍ Active l'indicateur de sélection de ce véhicule et lève `onSelect` avec l'index de sous-sélection ; demande une mise à jour des événements d'action sauf si `ignoreActionEventUpdate` vaut true. |
| `Vehicle:setSelectedVehicle(vehicle: any, subSelectionIndex: any, ignoreActionEventUpdate: any)` | 3092 | ✍ Sélectionne le véhicule donné, en retombant sur le premier sélectionnable s'il ne peut pas l'être, et délègue à `setSelectedObject`. Renvoie si la sélection a changé. |
| `Vehicle:setSelectedObject(object: any, subSelectionIndex: any, ignoreActionEventUpdate: any)` | 3115 | ✍ Rend courant un objet de sélection s'il figure dans la liste sélectionnable : désélectionne les autres, met à jour index et sous-index et sélectionne le nouveau véhicule. Renvoie true si la sélection a changé ; l'efface si l'ancien objet a disparu. |
| `Vehicle:getIsSelected()` | 3174 | ✍ Indique si l'objet de sélection de ce véhicule est actuellement sélectionné (false s'il n'en a pas). |
| `Vehicle:getSelectedObject()` | 3184 | ✍ Renvoie l'objet de sélection courant du véhicule racine (nil s'il n'y en a pas). |
| `Vehicle:getSelectedVehicle()` | 3195 | ✍ Renvoie le véhicule associé à l'objet de sélection courant, ou nil. |
| `Vehicle:hasInputConflictWithSelection(inputs: any)` | 3205 | ✍ Obsolète : affiche la pile d'appels et un avertissement, renvoie toujours false. |
| `Vehicle:setMassDirty()` | 3213 | ✍ Marque la masse comme à recalculer ; `update` appelle `updateMass` après la première mise à jour. |
| `Vehicle:updateMass()` | 3219 | ✍ Recalcule les masses des composants (masse par défaut plus masse additionnelle), les réduit si la masse totale maximale serait dépassée et, côté serveur, applique `setMass` aux composants dynamiques quand l'écart dépasse 0,02 (masse en tonnes). Met à jour `serverMass` et `precalculatedMass`. |
| `Vehicle:getMaxComponentMassReached()` | 3274 | ✍ Renvoie true quand la masse serveur a atteint le maximum autorisé (maxMass moins la masse précalculée), avec une tolérance de 0,001. |
| `Vehicle:getAvailableComponentMass()` | 3280 | ✍ Renvoie la masse restante pouvant encore être ajoutée avant le maximum, jamais inférieure à 0. |
| `Vehicle:getAdditionalComponentMass(component: any)` | 3286 | ✍ Par défaut : 0. Les spécialisations (unités de remplissage, roues, ...) la surchargent pour ajouter de la masse à un composant. |
| `Vehicle:getTotalMass(onlyGivenVehicle: boolean) → number` | 3294 | ✍ Additionne la masse des composants de ce véhicule (tonnes). La version de base ignore `onlyGivenVehicle` ; les spécialisations d'attelage incluent les outils. |
| `Vehicle:getComponentMass(component: table) → number` | 3308 | ✍ Renvoie la masse de la table de composant donnée, ou 0 si elle est nil. |
| `Vehicle:getDefaultMass()` | 3318 | ✍ Additionne les masses par défaut (à vide) de tous les composants. |
| `Vehicle:getOverallCenterOfMass() → number, number, number` | 3333 | ✍ Renvoie le centre de masse mondial (x, y, z) pondéré par la masse de tous les composants. |
| `Vehicle:getVehicleWorldXRot() → number` | 3351 | ✍ Renvoie l'angle de tangage/pente en radians de l'axe avant du premier composant par rapport à l'horizontale, dans la plage -pi/2 à pi/2. |
| `Vehicle:getVehicleWorldDirection() → number, number, number` | 3366 | ✍ Renvoie la direction avant (x, y, z) en repère monde du premier composant. |
| `Vehicle:getFillLevelInformation(display: table)` | 3373 | ✍ Point d'extension vide (sans corps) ; les spécialisations de niveau de remplissage la surchargent pour ajouter des entrées à la table d'affichage passée. |
| `Vehicle:getHasObjectMounted(object: table) → boolean` | 3380 | ✍ Par défaut : false. Surchargée par les spécialisations pouvant porter des objets montés. |
| `Vehicle:activate()` | 3386 | ✍ Active le contrôleur d'actions et lève `onActivate`. |
| `Vehicle:deactivate()` | 3396 | ✍ Désactive le contrôleur d'actions et lève `onDeactivate`. |
| `Vehicle:setComponentJointFrame(jointDesc: table, anchorActor: integer)` | 3409 | ✍ Recalcule la pose locale d'un point d'ancrage de joint (0 ou 1) à partir du noeud de joint et, si le joint physique existe, met à jour son repère avec `setJointFrame`. |
| `Vehicle:setComponentJointRotLimit(componentJoint: table, axis: integer, minLimit: number, maxLimit: number)` | 3437 | ✍ Serveur uniquement : mémorise de nouvelles limites min/max de rotation pour un axe (1 à 3) du joint et les applique au joint physique, ou désactive la limite si min dépasse max. |
| `Vehicle:setComponentJointTransLimit(componentJoint: table, axis: integer, minLimit: number, maxLimit: number)` | 3458 | ✍ Serveur uniquement : mémorise de nouvelles limites min/max de translation pour un axe (1 à 3) du joint et les applique au joint physique, ou désactive la limite si min dépasse max. |
| `Vehicle:loadComponentFromXML(component: table, xmlFile: XMLFile, key: string, rootPosition: table, i: integer) → boolean` | 3481 | ✍ Initialise un composant : indicateurs de corps rigide (cinématique côté client), avertit si des bits de collision manquent, recentre sur le premier composant, lit la masse (kg, convertie en tonnes), le centre de masse, l'inertie, les itérations du solveur, la distance de clipping et enregistre le noeud comme appartenant à ce véhicule. Renvoie true. |
| `Vehicle:loadComponentJointFromXML(jointDesc: table, xmlFile: XMLFile, key: string, componentJointI: integer, jointNode: integer, index1: integer, index2: integer) → boolean` | 3597 | ✍ Lit la définition d'un joint de composants (limites, ressorts, amortissement, limites de force, noeud de rotation z, rupture, moteurs de rotation/translation) dans `jointDesc` ; les angles sont convertis en radians. Seul le serveur lit les données physiques ; renvoie false si les indices de composants sont invalides. |
| `Vehicle:createComponentJoint(component1: table, component2: table, jointDesc: table) → boolean` | 3740 | ✍ Construit le joint physique entre deux composants à partir de la description (limites, ressorts, moteurs, rupture, collision) avec un `JointConstructor` et stocke son index dans `jointDesc.jointIndex`. Renvoie false s'il manque un argument. |
| `Vehicle:loadSchemaOverlay(xmlFile: XMLFile)` | 3814 | ✍ Lit les réglages du schéma d'affichage du HUD (`vehicle.base.schemaOverlay` : positions, nom avec préfixe de mod, bordures invisibles) dans un `VehicleSchemaOverlayData` ; signale aussi les chemins obsolètes. |
| `Vehicle:getAdditionalSchemaText()` | 3860 | ✍ Par défaut : nil. Surchargée pour fournir un texte supplémentaire affiché sur le schéma du véhicule. |
| `Vehicle:getUseTurnedOnSchema()` | 3866 | ✍ Par défaut : false. Surchargée pour afficher la variante « en marche » du schéma. |
| `Vehicle:dayChanged()` | 3872 | ✍ Point d'extension vide abonné au message de changement de jour ; les spécialisations peuvent l'étendre. |
| `Vehicle:periodChanged()` | 3877 | ✍ Abonnée au message de changement de période ; incrémente l'âge du véhicule de un (l'âge est compté en périodes, soit en mois). |
| `Vehicle:raiseStateChange(state: any, ...: any)` | 3883 | ✍ Lève l'événement `onStateChange` avec l'état donné et les arguments supplémentaires. |
| `Vehicle:doCheckSpeedLimit()` | 3890 | ✍ Par défaut : false. Surchargée par les outils de travail pour que la limite de vitesse ne s'applique que pendant leur travail. |
| `Vehicle:getWorkLoad()` | 3897 | ✍ Par défaut : renvoie 0, 0 (aucune charge de travail). Surchargée par les outils qui déclarent une charge. |
| `Vehicle:interact(player: any)` | 3904 | ✍ Point d'extension vide appelé quand un joueur interagit avec le véhicule ; ne fait rien par défaut. |
| `Vehicle:getInteractionHelp()` | 3909 | ✍ Par défaut : chaîne vide (aucun texte d'aide). |
| `Vehicle:getDistanceToNode(node: any)` | 3919 | ✍ Par défaut : remet le drapeau d'interaction à NONE et renvoie l'infini. Surchargée par les véhicules avec lesquels on peut interagir. |
| `Vehicle:getIsAIActive()` | 3926 | ✍ Indique si une tâche IA conduit ce véhicule, en interrogeant le véhicule porteur s'il y en a un ; false par défaut. |
| `Vehicle:getIsPowered()` | 3939 | ✍ Par défaut : true. Surchargée par les véhicules qui ont besoin d'une alimentation externe. |
| `Vehicle:getRequiresPower()` | 3945 | ✍ Par défaut : false. Surchargée pour indiquer que le véhicule a besoin d'énergie, afin que le moteur puisse démarrer automatiquement. |
| `Vehicle:getIsInShowroom()` | 3951 | ✍ Renvoie true quand l'état de propriété est SHOP_CONFIG (affiché dans la configuration de la boutique). |
| `Vehicle:addVehicleToAIImplementList(list: any)` | 3957 | ✍ Point d'extension vide permettant aux spécialisations d'ajouter ce véhicule à une liste d'outils pour l'IA. |
| `Vehicle:setOperatingTime(operatingTime: any, isLoading: any)` | 3962 | ✍ Définit le temps de fonctionnement (ms, minimum 0). Hors chargement, pour un véhicule loué, prévient le gestionnaire d'économie à chaque passage d'une heure pleine. |
| `Vehicle:getOperatingTime()` | 3971 | ✍ Renvoie le temps de fonctionnement en millisecondes. |
| `Vehicle:doCollisionMaskCheck(targetCollisionMask: any, path: any, node: any, str: any)` | 3977 | ✍ Vérifie que le ou les composants, ou le noeud donné, possèdent tous les bits de `targetCollisionMask` dans leur masque de filtre, sauf si un booléen XML à `path` dispense du contrôle. Journalise un avertissement avec pile d'appels et renvoie false en cas d'échec. |
| `Vehicle:getIsReadyForAutomatedTrainTravel()` | 4005 | ✍ Par défaut : true. Les spécialisations liées aux trains la surchargent. |
| `Vehicle:getIsAutomaticShiftingAllowed()` | 4011 | ✍ Par défaut : true. Surchargée pour interdire le changement de vitesse automatique dans certaines situations. |
| `Vehicle:getSpeedLimit(onlyIfWorking: boolean) → number, boolean` | 4020 | ✍ Renvoie la limite de vitesse effective et si elle est contrôlée : limite brute réduite par les dommages (`DAMAGED_SPEEDLIMIT_REDUCTION`), combinée avec le minimum sur les outils attelés. Avec `onlyIfWorking`, seules comptent les limites des véhicules qui demandent le contrôle. |
| `Vehicle:getRawSpeedLimit() → number` | 4053 | ✍ Renvoie la limite de vitesse mémorisée pour ce véhicule (XML ou valeurs par défaut des spécialisations), sans dommages ni outils. |
| `Vehicle:onVehicleWakeUpCallback(id: any)` | 4059 | ✍ Rappel de réveil physique : appelle `raiseActive` pour que le véhicule soit de nouveau mis à jour. |
| `Vehicle:getCanBeMounted()` | 4065 | ✍ Indique si le noeud du premier composant existe toujours dans le moteur. |
| `Vehicle:getDailyUpkeep() → number` | 4072 | ✍ Renvoie le coût d'entretien quotidien calculé par `Vehicle.calculateDailyUpkeep` pour l'article de boutique, l'âge, le temps de fonctionnement et les configurations de ce véhicule. |
| `Vehicle.calculateDailyUpkeep(storeItem: any, age: any, operatingTime: any, configurations: any)` | 4079 | ✍ Entretien de base de la boutique multiplié par un facteur d'usure croissant avec l'âge (poids jusqu'à 30 %) et les heures de fonctionnement (poids jusqu'à 70 %), mis à l'échelle par `EconomyManager.MAX_DAILYUPKEEP_MULTIPLIER`. Les constantes d'`EconomyManager` ne sont pas dans le dump (NON VÉRIFIÉ). |
| `Vehicle:getUppercaseName() → string` | 4094 | ✍ Renvoie le nom complet (marque plus nom) converti en majuscules avec `utf8ToUpper`. |
| `Vehicle:getName()` | 4102 | ✍ Renvoie le nom affiché : le `vehicleName` de la première configuration active qui en définit un, sinon le nom de l'article de boutique, ou "Unknown" sans article de boutique. |
| `Vehicle:getFullName()` | 4123 | ✍ Renvoie le titre de la marque suivi du nom (marque omise si elle vaut NONE ou en l'absence d'article de boutique). |
| `Vehicle:getBrand()` | 4138 | ✍ Renvoie l'index de la marque : le `vehicleBrand` d'une configuration s'il existe, sinon celui de l'article de boutique, ou `Brand.LIZARD` sans article de boutique. |
| `Vehicle:getImageFilename()` | 4159 | ✍ Renvoie le chemin de l'icône de boutique : le `vehicleIcon` d'une configuration s'il existe, sinon l'image de l'article, ou l'image vide de la boutique sans article. Avertit si un index de configuration est invalide. |
| `Vehicle:getCanBePickedUp(byPlayer: Player) → boolean` | 4184 | ✍ Vrai si le véhicule peut être ramassé à la main (indicateur XML) et si le gestionnaire d'accès autorise le joueur donné. |
| `Vehicle:getCanBeReset()` | 4190 | ✍ Vrai si le XML autorise la réinitialisation et qu'aucune visite guidée n'est en cours. |
| `Vehicle:getResetPlaces()` | 4196 | ✍ Renvoie les emplacements de réinitialisation de la mission et ses emplacements de chargement utilisés (deux valeurs). |
| `Vehicle:getResetDialogTexts() → string, string, string` | 4206 | ✍ Renvoie trois textes localisés (confirmation, succès, échec) affichés autour d'une réinitialisation ; les spécialisations peuvent la surcharger si leur réinitialisation fait autre chose. |
| `Vehicle:getCanBeSold()` | 4216 | ✍ Renvoie l'indicateur `canBeSold` de l'article de boutique, true s'il n'y a pas d'article. |
| `Vehicle:getCanBeAddedToSales()` | 4227 | ✍ Par défaut : true. Surchargée pour empêcher de mettre le véhicule en vente. |
| `Vehicle:getReloadXML() → string` | 4234 | ✍ Crée un XMLFile en mémoire de type sauvegarde contenant ce véhicule (nom de fichier plus données de `saveToXMLFile`), utilisé par `reset` pour le recharger. Renvoie nil en cas d'échec ; l'appelant doit supprimer le XMLFile. |
| `Vehicle:getIsInUse(connection: any)` | 4250 | ✍ Par défaut : false. Surchargée pour indiquer si le véhicule est actuellement utilisé par la connexion donnée. |
| `Vehicle:getPropertyState()` | 4256 | ✍ Renvoie l'état de propriété (possédé, loué, configuration de boutique, ...). |
| `Vehicle:getAreControlledActionsAvailable()` | 4262 | ✍ False tant qu'une IA est active ; sinon interroge le contrôleur d'actions pour savoir si des actions contrôlées sont disponibles (false sans contrôleur). |
| `Vehicle:getAreControlledActionsAccessible()` | 4276 | ✍ False tant qu'une IA est active ; sinon délègue au contrôle d'accessibilité du contrôleur d'actions (false sans contrôleur). |
| `Vehicle:getControlledActionIcons()` | 4290 | ✍ Renvoie les icônes positive/négative et l'indicateur de changement de couleur du contrôleur d'actions, ou `TURN_ON`, `TURN_ON`, true par défaut. |
| `Vehicle:getAreControlledActionsAllowed() → boolean, string` | 4305 | ✍ Renvoie true (autorisé) quand aucune IA n'est active, plus un texte d'avertissement vide. |
| `Vehicle:playControlledActions()` | 4311 | ✍ Demande au contrôleur d'actions de jouer ses actions contrôlées enregistrées, s'il y en a un. |
| `Vehicle:getActionControllerDirection()` | 4319 | ✍ Renvoie la direction du contrôleur d'actions, ou 1 sans contrôleur. |
| `Vehicle:createMapHotspot()` | 4329 | ✍ Crée un `VehicleHotspot` pour ce véhicule (type, ferme propriétaire), le mémorise et l'ajoute aux points de carte de la mission. |
| `Vehicle:deleteMapHotspot()` | 4341 | ✍ Retire le point de carte de la mission et le supprime, s'il existe. |
| `Vehicle:getMapHotspot()` | 4351 | ✍ Renvoie le point de carte du véhicule (nil s'il n'y en a pas). |
| `Vehicle:updateMapHotspot()` | 4357 | ✍ Définit la visibilité du point de carte d'après `getIsMapHotspotVisible` ; appelée à chaque image à la fin de `update`. |
| `Vehicle:getIsMapHotspotVisible()` | 4365 | ✍ Par défaut : true. Surchargée pour masquer le point de carte dans certains états. |
| `Vehicle:getShowInVehiclesOverview()` | 4380 | ✍ Vrai si le XML affiche le véhicule dans le menu des véhicules et s'il est possédé ou loué. |
| `Vehicle:showInfo(box: any)` | 4386 | ✍ Ajoute la ligne « véhicule en panne, réinitialisation nécessaire » à la boîte d'informations du HUD quand le véhicule est en panne. Les spécialisations l'étendent avec leurs lignes. |
| `Vehicle:loadObjectChangeValuesFromXML(xmlFile: integer, key: string, node: integer, object: table)` | 4398 | ✍ Point d'extension vide appelé par le chargeur de changements d'objets pour que les spécialisations lisent des valeurs supplémentaires par changement. |
| `Vehicle:setObjectChangeValues(object: table, isActive: boolean)` | 4405 | ✍ Point d'extension vide appelé quand un changement d'objet est appliqué ou annulé, pour que les spécialisations réagissent. |
| `Vehicle:wakeUp()` | 4410 | ✍ Réveille brièvement la physique du premier composant via `I3DUtil.wakeUpObject`. |
| `Vehicle:register(alreadySent: any)` | 4416 | ✍ Enregistre le véhicule comme objet réseau (superclasse) et lève `onRegistered`. Les détails de l'enregistrement réseau sont dans `Object` (hors de ce fichier). |
| `Vehicle:clearDirtyMask()` | 4424 | ✍ Remet à 0 le masque de modification réseau et lève `onDirtyMaskCleared`. |
| `Vehicle:setOwnerFarmId(farmId: any, noEventSend: any)` | 4431 | ✍ Définit la ferme propriétaire via la superclasse (éventuellement sans envoyer d'événement) et met à jour la ferme propriétaire du point de carte. |
| `Vehicle:getUniqueId() → string` | 4442 | ✍ Renvoie la chaîne d'identifiant unique du véhicule (nil tant qu'elle n'est pas définie), utilisée pour le référencer entre sauvegardes. |
| `Vehicle:setUniqueId(uniqueId: string)` | 4449 | ✍ Mémorise l'identifiant unique. Il ne devrait être défini qu'une fois ; le contrôle est une assertion de débogage retirée du dump. |
| `Vehicle.actionEventToggleSelection(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 4457 | ✍ Rappel d'entrée : déplace la sélection vers la sous-sélection suivante, ou vers l'objet sélectionnable suivant (retour au premier en fin de liste), et l'applique avec `setSelectedObject`. |
| `Vehicle.actionEventToggleSelectionReverse(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 4490 | ✍ Rappel d'entrée pour le sens inverse : passe à la sous-sélection ou à l'objet précédent (retour au dernier au début de liste) et l'applique avec `setSelectedObject`. |
| `Vehicle.getSpecValueDailyUpkeep(storeItem: any, realItem: any, _: any, saleItem: any)` | 4535 | ✍ Texte de spécification de boutique pour l'entretien quotidien (montant formaté), pris sur l'objet réel s'il existe ; renvoie nil si l'entretien vaut 0. |
| `Vehicle.getSpecValueOperatingTime(storeItem: any, realItem: any, _: any, saleItem: any)` | 4553 | ✍ Texte de spécification de boutique pour le temps de fonctionnement en heures et dixièmes, depuis l'objet réel ou l'objet en vente ; nil si aucun n'est fourni. |
| `Vehicle.loadSpecValueWorkingWidth(xmlFile: any, customEnvironment: any, baseDir: any)` | 4573 | ✍ Lit `vehicle.storeData.specs.workingWidth` (et `#minWidth`, identique par défaut) dans une table, ou renvoie nil s'il est absent. |
| `Vehicle.getSpecValueWorkingWidth(storeItem: any, realItem: any)` | 4585 | ✍ Formate la largeur de travail pour la boutique, sous forme de plage si min et max diffèrent ; nil si l'article n'en a pas. |
| `Vehicle.loadSpecValueWorkingWidthConfig(xmlFile: any, customEnvironment: any, baseDir: any)` | 4600 | ✍ Parcourt chaque élément de configuration à la recherche d'un `#workingWidth` (et `#isSelectable`) et renvoie une table par nom et index de configuration, ou nil s'il n'y en a pas. |
| `Vehicle.getSpecValueWorkingWidthConfig(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 4619 | ✍ Renvoie la largeur de travail de la configuration choisie pour un objet réel ou en vente, sinon la plage min-max des configurations sélectionnables. Donne un texte formaté, ou le nombre brut avec `returnValues`. |
| `Vehicle.loadSpecValueSpeedLimit(xmlFile: any, customEnvironment: any, baseDir: any)` | 4664 | ✍ Lit `vehicle.base.speedLimit#value` pour la boutique. |
| `Vehicle.getSpecValueSpeedLimit(storeItem: any, realItem: any)` | 4670 | ✍ Formate la vitesse maximale avec l'unité de vitesse du joueur pour la boutique ; nil si l'article n'a pas de limite de vitesse. |
| `Vehicle.loadSpecValueWeight(xmlFile: any, customEnvironment: any, baseDir: any)` | 4679 | ✍ Lit depuis le XML les données de masse pour la boutique : masses des composants (et par configuration, en tonnes), données de masse des unités de remplissage et des roues, et surcharges/plages de poids de la boutique. Renvoie nil si `weight#ignore` est activé ou si rien n'est trouvé. |
| `Vehicle.getSpecConfigValuesWeight(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 4738 | ✍ Renvoie la liste des poids par configuration issue des données de boutique, ou nil s'il n'y en a pas. |
| `Vehicle.getSpecValueWeight(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 4749 | ✍ Poids en boutique : pour un objet réel, recalcule la masse et prend le total ; sinon utilise le min/max de la boutique ou la somme des masses des composants, des roues et du remplissage initial. Renvoie un texte formaté, ou des nombres avec `returnValues`. |
| `Vehicle.loadSpecValueAdditionalWeight(xmlFile: any, customEnvironment: any, baseDir: any)` | 4795 | ✍ Lit `vehicle.base.components#maxMass` (kg) et le renvoie en tonnes, ou nil s'il est absent. |
| `Vehicle.getSpecValueAdditionalWeight(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 4806 | ✍ Texte de boutique pour la masse qui peut être ajoutée (masse max moins poids de base) ; nil sauf si l'option de sauvegarde `trailerFillLimit` est active. |
| `Vehicle.loadSpecValueCombinations(xmlFile: any, customEnvironment: any, baseDirectory: any)` | 4829 | ✍ Lit les entrées `vehicle.storeData.specs.combination` (xmlFilename, catégories de filtre, spécification et plage de filtre) dans une liste, en avertissant si un véhicule référencé est inconnu. |
| `Vehicle.getSpecValueCombinations(storeItem: any, realItem: any)` | 4867 | ✍ Renvoie la liste de combinaisons mémorisée de l'article de boutique. |
| `Vehicle.getSpecValueSlots(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 4873 | ✍ Texte de boutique pour l'occupation d'emplacements : « +n » à l'achat (somme des éléments d'un lot) ou « -n » à la vente, d'après le système d'emplacements ; nil si l'usage vaut 0. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onPreLoad` | 81 |
| registerEvent | `onLoad` | 82 |
| registerEvent | `onPostLoad` | 83 |
| registerEvent | `onPreInitComponentPlacement` | 84 |
| registerEvent | `onPreLoadFinished` | 85 |
| registerEvent | `onLoadFinished` | 86 |
| registerEvent | `onLoadEnd` | 87 |
| registerEvent | `onRegistered` | 88 |
| registerEvent | `onDirtyMaskCleared` | 89 |
| registerEvent | `onPreDelete` | 90 |
| registerEvent | `onDelete` | 91 |
| registerEvent | `onSave` | 92 |
| registerEvent | `onReadStream` | 93 |
| registerEvent | `onWriteStream` | 94 |
| registerEvent | `onReadUpdateStream` | 95 |
| registerEvent | `onWriteUpdateStream` | 96 |
| registerEvent | `onReadPositionUpdateStream` | 97 |
| registerEvent | `onWritePositionUpdateStream` | 98 |
| registerEvent | `onHandToolTaken` | 99 |
| registerEvent | `onHandToolPlaced` | 100 |
| registerEvent | `onPreUpdate` | 101 |
| registerEvent | `onUpdate` | 102 |
| registerEvent | `onUpdateInterpolation` | 103 |
| registerEvent | `onUpdateDebug` | 104 |
| registerEvent | `onPostUpdate` | 105 |
| registerEvent | `onUpdateTick` | 106 |
| registerEvent | `onPostUpdateTick` | 107 |
| registerEvent | `onUpdateEnd` | 108 |
| registerEvent | `onDraw` | 109 |
| registerEvent | `onDrawUIInfo` | 110 |
| registerEvent | `onActivate` | 111 |
| registerEvent | `onDeactivate` | 112 |
| registerEvent | `onStateChange` | 113 |
| registerEvent | `onPreRegisterActionEvents` | 114 |
| registerEvent | `onRegisterActionEvents` | 115 |
| registerEvent | `onRootVehicleChanged` | 116 |
| registerEvent | `onSelect` | 117 |
| registerEvent | `onUnselect` | 118 |
| registerEvent | `onSetBroken` | 119 |
| registerEvent | `onSaleItemSet` | 120 |
| registerFunction | `register` | 126 |
| registerFunction | `setOwnerFarmId` | 127 |
| registerFunction | `loadSubSharedI3DFile` | 128 |
| registerFunction | `drawUIInfo` | 129 |
| registerFunction | `raiseActive` | 130 |
| registerFunction | `setLoadingState` | 131 |
| registerFunction | `setLoadingStep` | 132 |
| registerFunction | `addToPhysics` | 133 |
| registerFunction | `removeFromPhysics` | 134 |
| registerFunction | `setVisibility` | 135 |
| registerFunction | `setRelativePosition` | 136 |
| registerFunction | `setAbsolutePosition` | 137 |
| registerFunction | `getLimitedVehicleYPosition` | 138 |
| registerFunction | `setWorldPosition` | 139 |
| registerFunction | `setWorldPositionQuaternion` | 140 |
| registerFunction | `setDefaultComponentPosition` | 141 |
| registerFunction | `getIsNodeActive` | 142 |
| registerFunction | `updateVehicleSpeed` | 143 |
| registerFunction | `getUpdatePriority` | 144 |
| registerFunction | `getPrice` | 145 |
| registerFunction | `getSellPrice` | 146 |
| registerFunction | `getDailyUpkeep` | 147 |
| registerFunction | `getIsOnField` | 148 |
| registerFunction | `getParentComponent` | 149 |
| registerFunction | `getLastSpeed` | 150 |
| registerFunction | `getDeactivateOnLeave` | 151 |
| registerFunction | `getOwnerConnection` | 152 |
| registerFunction | `getIsVehicleNode` | 153 |
| registerFunction | `getIsOperating` | 154 |
| registerFunction | `getIsActive` | 155 |
| registerFunction | `getIsActiveForInput` | 156 |
| registerFunction | `getIsActiveForSound` | 157 |
| registerFunction | `getIsLowered` | 158 |
| registerFunction | `updateWaterInfo` | 159 |
| registerFunction | `onWaterRaycastCallback` | 160 |
| registerFunction | `setBroken` | 161 |
| registerFunction | `getVehicleDamage` | 162 |
| registerFunction | `getRepairPrice` | 163 |
| registerFunction | `getRepaintPrice` | 164 |
| registerFunction | `setMassDirty` | 165 |
| registerFunction | `updateMass` | 166 |
| registerFunction | `getMaxComponentMassReached` | 167 |
| registerFunction | `getAdditionalComponentMass` | 168 |
| registerFunction | `getTotalMass` | 169 |
| registerFunction | `getComponentMass` | 170 |
| registerFunction | `getDefaultMass` | 171 |
| registerFunction | `getOverallCenterOfMass` | 172 |
| registerFunction | `getVehicleWorldXRot` | 173 |
| registerFunction | `getVehicleWorldDirection` | 174 |
| registerFunction | `getFillLevelInformation` | 175 |
| registerFunction | `getHasObjectMounted` | 176 |
| registerFunction | `activate` | 177 |
| registerFunction | `deactivate` | 178 |
| registerFunction | `setComponentJointFrame` | 179 |
| registerFunction | `setComponentJointRotLimit` | 180 |
| registerFunction | `setComponentJointTransLimit` | 181 |
| registerFunction | `loadComponentFromXML` | 182 |
| registerFunction | `loadComponentJointFromXML` | 183 |
| registerFunction | `createComponentJoint` | 184 |
| registerFunction | `loadSchemaOverlay` | 185 |
| registerFunction | `getAdditionalSchemaText` | 186 |
| registerFunction | `getUseTurnedOnSchema` | 187 |
| registerFunction | `dayChanged` | 188 |
| registerFunction | `periodChanged` | 189 |
| registerFunction | `raiseStateChange` | 190 |
| registerFunction | `doCheckSpeedLimit` | 191 |
| registerFunction | `interact` | 192 |
| registerFunction | `getInteractionHelp` | 193 |
| registerFunction | `getIsInteractive` | 194 |
| registerFunction | `getDistanceToNode` | 195 |
| registerFunction | `getIsAIActive` | 196 |
| registerFunction | `getIsPowered` | 197 |
| registerFunction | `getRequiresPower` | 198 |
| registerFunction | `getIsInShowroom` | 199 |
| registerFunction | `addVehicleToAIImplementList` | 200 |
| registerFunction | `setOperatingTime` | 201 |
| registerFunction | `requestActionEventUpdate` | 203 |
| registerFunction | `removeActionEvents` | 204 |
| registerFunction | `updateActionEvents` | 205 |
| registerFunction | `registerActionEvents` | 206 |
| registerFunction | `addActionEvent` | 207 |
| registerFunction | `updateSelectableObjects` | 209 |
| registerFunction | `registerSelectableObjects` | 210 |
| registerFunction | `addSubselection` | 211 |
| registerFunction | `getRootVehicle` | 212 |
| registerFunction | `findRootVehicle` | 213 |
| registerFunction | `getChildVehicles` | 214 |
| registerFunction | `addChildVehicles` | 215 |
| registerFunction | `updateVehicleChain` | 216 |
| registerFunction | `getCanBeSelected` | 217 |
| registerFunction | `getBlockSelection` | 218 |
| registerFunction | `getCanToggleSelectable` | 219 |
| registerFunction | `unselectVehicle` | 220 |
| registerFunction | `selectVehicle` | 221 |
| registerFunction | `getIsSelected` | 222 |
| registerFunction | `getSelectedObject` | 223 |
| registerFunction | `getSelectedVehicle` | 224 |
| registerFunction | `setSelectedVehicle` | 225 |
| registerFunction | `setSelectedObject` | 226 |
| registerFunction | `getIsReadyForAutomatedTrainTravel` | 227 |
| registerFunction | `getIsAutomaticShiftingAllowed` | 228 |
| registerFunction | `getSpeedLimit` | 229 |
| registerFunction | `getRawSpeedLimit` | 230 |
| registerFunction | `getActiveFarm` | 231 |
| registerFunction | `onVehicleWakeUpCallback` | 232 |
| registerFunction | `getCanBeMounted` | 233 |
| registerFunction | `getName` | 234 |
| registerFunction | `getFullName` | 235 |
| registerFunction | `getBrand` | 236 |
| registerFunction | `getImageFilename` | 237 |
| registerFunction | `getCanBePickedUp` | 238 |
| registerFunction | `getCanBeReset` | 239 |
| registerFunction | `getResetPlaces` | 240 |
| registerFunction | `getResetDialogTexts` | 241 |
| registerFunction | `reset` | 242 |
| registerFunction | `getCanBeSold` | 243 |
| registerFunction | `getCanBeAddedToSales` | 244 |
| registerFunction | `getReloadXML` | 245 |
| registerFunction | `getIsInUse` | 246 |
| registerFunction | `getPropertyState` | 247 |
| registerFunction | `getAreControlledActionsAllowed` | 248 |
| registerFunction | `getAreControlledActionsAvailable` | 249 |
| registerFunction | `getAreControlledActionsAccessible` | 250 |
| registerFunction | `getControlledActionIcons` | 251 |
| registerFunction | `playControlledActions` | 252 |
| registerFunction | `getActionControllerDirection` | 253 |
| registerFunction | `createMapHotspot` | 254 |
| registerFunction | `getMapHotspot` | 255 |
| registerFunction | `updateMapHotspot` | 256 |
| registerFunction | `getIsMapHotspotVisible` | 257 |
| registerFunction | `getMapHotspotRotation` | 258 |
| registerFunction | `getMapHotspotPosition` | 259 |
| registerFunction | `getShowInVehiclesOverview` | 260 |
| registerFunction | `showInfo` | 261 |
| registerFunction | `loadObjectChangeValuesFromXML` | 262 |
| registerFunction | `setObjectChangeValues` | 263 |
| registerFunction | `getIsSynchronized` | 264 |

## Messages

- s'abonne à `MessageType.DAY_CHANGED` (l.1028)
- s'abonne à `MessageType.PERIOD_CHANGED` (l.1029)
- publie `MessageType.VEHICLE_RESET` (l.1481)
