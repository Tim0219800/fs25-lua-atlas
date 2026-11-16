# placeables/specializations/PlaceableTrainSystem.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableTrainSystem.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableTrainSystem.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui fait circuler un train sur une spline fermée : elle charge les véhicules du train, les déplace le long de la spline d'après la vitesse de la locomotive (serveur) ou des valeurs réseau interpolées (client), et héberge des passages à niveau et des appelants ferroviaires. Elle gère aussi la location du train par ferme (prix horaire facturé chaque jour ou au retour), une plage de conduite limitée optionnelle liée à une station de vente, et la vente du chargement. La synchronisation réseau utilise un drapeau pour le temps de spline et un pour la station de vente ; les événements comme PlaceableTrainSystemRentEvent sont définis ailleurs.

- **PlaceableTrainSystem** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableTrainSystem.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Renvoie toujours true : aucune spécialisation requise. |
| `PlaceableTrainSystem.registerFunctions(placeableType: any)` | 26 | ✍ Enregistre sur le type de placeable les fonctions du système ferroviaire (temps de spline, création des véhicules, location, état de plage, vente et utilitaires). |
| `PlaceableTrainSystem.registerOverwrittenFunctions(placeableType: any)` | 60 | ✍ Surcharge `getNeedDayChanged` sur le type de placeable. |
| `PlaceableTrainSystem.registerEventListeners(placeableType: any)` | 66 | ✍ S'abonne aux événements de chargement, suppression, placement, lecture/écriture de flux (complet et de mise à jour), mise à jour, changement de jour et suppression d'objet (les deux derniers viennent du moteur, liste exacte en partie NON VÉRIFIÉ). |
| `PlaceableTrainSystem.registerXMLPaths(schema: any, basePath: any)` | 80 | ✍ Déclare les clés XML `.trainSystem` (spline, plage de conduite, prix de location, spline d'électricité, véhicules du train) et délègue à RailroadCrossing et RailroadCaller pour leurs entrées. |
| `PlaceableTrainSystem.registerSavegameXMLPaths(schema: any, basePath: any)` | 104 | ✍ Déclare les attributs de sauvegarde : temps de spline, drapeau de location, ferme locataire, prix courant, identifiants uniques des véhicules et données par objet. |
| `PlaceableTrainSystem:onLoad(savegame: table)` | 118 | ✍ Initialise l'état et les aides réseau et lit le prix de location. Valide la spline (doit exister, être une spline et être fermée, sinon l'état de chargement passe à ERROR), lit la plage de conduite et la spline d'électricité optionnelles, met en file les fichiers de véhicules côté serveur, crée passages à niveau et appelants, et trouve pour chacun le temps de spline le plus proche. À noter : la vérification du départ de la spline d'électricité échantillonne deux fois `spec.spline`, donc la distance est toujours 0. |
| `PlaceableTrainSystem:onDelete()` | 304 | ✍ Supprime passages à niveau et appelants, efface la référence au système sur chaque véhicule et retire le système de la mission. |
| `PlaceableTrainSystem:onFinalizePlacement()` | 324 | ✍ Trouve les positions de blocage des passages à niveau, donne aux objets ferroviaires leur temps et position de spline, enregistre le système dans la mission et crée les véhicules maintenant ou au démarrage de la mission. |
| `PlaceableTrainSystem:onReadStream(streamId: any, connection: any)` | 353 | ✍ Côté client à la connexion : lit les identifiants des véhicules, le temps de spline, les données par objet, l'état de location, la ferme locataire et l'identifiant de la station de vente, puis réveille le placeable. |
| `PlaceableTrainSystem:onWriteStream(streamId: any, connection: any)` | 384 | ✍ Côté serveur à la connexion : écrit les véhicules, le dernier temps de spline envoyé, les données par objet, l'état de location, la ferme locataire et le placeable de station de vente. |
| `PlaceableTrainSystem:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 410 | ✍ Côté client : si le bit sale est positionné, lit le temps de spline (alimente les interpolateurs) et les mises à jour par objet ; si le bit de station est positionné, lit l'identifiant de la station de vente. |
| `PlaceableTrainSystem:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 433 | ✍ Côté serveur : écrit le temps de spline et les mises à jour par objet si le drapeau est positionné, et la station de vente si son drapeau l'est. |
| `PlaceableTrainSystem:loadFromXMLFile(xmlFile: any, key: any)` | 454 | ✍ Restaure les données des objets ferroviaires, l'état de location, la ferme locataire, le prix courant, le temps de spline de départ et les identifiants uniques des véhicules sauvegardés. |
| `PlaceableTrainSystem:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 485 | ✍ Sauvegarde le temps de spline, les identifiants uniques des véhicules, les objets qui gèrent la sauvegarde (appel avec un point, donc sans self ; faute possible, NON VÉRIFIÉ), l'état de location, la ferme locataire et le prix courant. |
| `PlaceableTrainSystem:onUpdate(dt: any)` | 510 | ✍ À chaque image : règle une fois la possibilité de passer au train avec Tab, lisse la vitesse sur les clients, met à jour les objets ferroviaires, cumule la location selon le temps écoulé et, sur les clients purs, résout les véhicules synchronisés et interpole le temps de spline. Avec une plage limitée, relie la station de vente et affiche la boîte d'info ou de vente différée ; puis déplace les véhicules et reste actif. |
| `PlaceableTrainSystem:updateRailroadVehiclePositions(dt: any)` | 636 | ✍ Une fois par boucle de mise à jour, fait avancer le temps de spline d'après la vitesse de chaque locomotive, puis aligne quelques véhicules par image (3 au plus, tous si l'un est dans la distance de rendu) sur la spline derrière leur prédécesseur, en mémorisant chaque temps de fin. |
| `PlaceableTrainSystem:createVehicles()` | 703 | ✍ Charge le train : depuis les identifiants uniques sauvegardés s'ils existent (rattache les véhicules existants), sinon charge chaque fichier de véhicule configuré de façon asynchrone, accessible à tous. Vide la liste de fichiers en attente. |
| `PlaceableTrainSystem:railroadVehicleLoaded(vehicles: any, vehicleLoadState: any, args: any)` | 745 | ✍ Callback de chargement d'un véhicule du train : en cas de succès le relie au système et mémorise son indice ; journalise un avertissement en cas d'échec ; quand tous sont chargés, finalise le train. |
| `PlaceableTrainSystem:finalizeTrain(attachVehicles: any)` | 771 | ✍ Trie les véhicules par indice, s'enregistre comme écouteur de suppression, choisit la première locomotive comme racine, attelle éventuellement chaque véhicule au précédent, puis met à jour la longueur du train et la possibilité de le sélectionner. Ne fait rien si le placeable est supprimé. |
| `PlaceableTrainSystem:setIsTrainTabbable(isTabbable: any)` | 806 | ✍ Applique la possibilité de sélection par Tab à chaque véhicule ferroviaire qui la gère ; exige le réglage de jeu correspondant et, avec une plage limitée, que le train soit dans la zone conduisible. |
| `PlaceableTrainSystem:getIsTrainInDriveableRange()` | 824 | ✍ Renvoie si le train était dernièrement dans la zone conduisible (true sans plage limitée). |
| `PlaceableTrainSystem:getSplineTime()` | 830 | ✍ Renvoie le temps de spline courant (0 à 1 sur la spline fermée) de la tête du train. |
| `PlaceableTrainSystem:setSplineTime(startTime: any, endTime: any)` | 836 | ✍ Fixe les temps de spline de tête et de fin en cas de changement : met à jour l'état de conduite, prévient les écouteurs de position, recalcule les vitesses, les transmet aux véhicules et, sur le serveur, lève un drapeau réseau si le déplacement dépasse environ 2 cm. |
| `PlaceableTrainSystem:addSplinePositionUpdateListener(listener: any)` | 896 | ✍ Ajoute un écouteur (devant avoir `onSplinePositionTimeUpdate`) prévenu quand le temps de spline change ; nil est ignoré. |
| `PlaceableTrainSystem:removeSplinePositionUpdateListener(listener: any)` | 905 | ✍ Retire un écouteur de position de spline ajouté précédemment ; nil est ignoré. |
| `PlaceableTrainSystem:updateTrainPositionByLocomotiveSpeed(dt: any, speed: any)` | 914 | ✍ Fait avancer le temps de spline de la distance (vitesse fois dt en ms) divisée par la longueur de la spline, et fixe le temps de queue d'après la longueur du train. |
| `PlaceableTrainSystem:updateTrainPositionByLocomotiveSplinePosition(splinePosition: any)` | 925 | ✍ Fixe directement le temps de spline de tête et en déduit le temps de queue d'après la longueur du train. |
| `PlaceableTrainSystem:updateTrainLength(splinePosition: any)` | 934 | ✍ Additionne la distance avant-arrière de tous les véhicules dans la longueur du train (à noter : ajoute à la valeur existante sans la remettre à zéro), la convertit en temps de spline et repositionne le train. |
| `PlaceableTrainSystem:toggleRent(farmId: any, position: any)` | 945 | ✍ Loue le train à la ferme donnée s'il est libre, ou le rend s'il est loué par cette même ferme ; sinon ne fait rien. |
| `PlaceableTrainSystem:rentRailroad(farmId: any, position: any, noEventSend: any)` | 959 | ✍ Marque le train comme loué par la ferme, demande à la locomotive racine de rejoindre la position de spline demandée, attribue les véhicules à cette ferme et envoie un PlaceableTrainSystemRentEvent. Ne fait rien sans locomotive. |
| `PlaceableTrainSystem:returnRailroad(noEventSend: any)` | 982 | ✍ Met fin à la location. Sur le serveur, elle facture le coût de leasing accumulé à la ferme locataire et renvoie la locomotive en trajet automatique ; les véhicules repassent à la ferme spectateur et un événement de location est envoyé. |
| `PlaceableTrainSystem:onDayChanged()` | 1009 | ✍ Serveur seulement : facture la location accumulée à la ferme locataire comme coûts de leasing et remet le prix à zéro. |
| `PlaceableTrainSystem:getIsRented()` | 1022 | ✍ Renvoie si le train est actuellement loué. |
| `PlaceableTrainSystem:getCanBeRented(farmId: any)` | 1029 | ✍ Renvoie false seulement si le train est loué par une autre ferme que celle donnée. |
| `PlaceableTrainSystem:onDeleteObject(object: any)` | 1043 | ✍ Callback d'écouteur de suppression : retire le véhicule supprimé du train et recalcule sa longueur. |
| `PlaceableTrainSystem:getSplineLength()` | 1052 | ✍ Renvoie la longueur de la spline du train (mètres, supposé). |
| `PlaceableTrainSystem:getElectricitySpline()` | 1059 | ✍ Renvoie le nœud de la spline d'électricité, ou nil si aucune n'a été acceptée. |
| `PlaceableTrainSystem:getElectricitySplineLength()` | 1066 | ✍ Renvoie la longueur de la spline d'électricité, ou 0 s'il n'y en a pas. |
| `PlaceableTrainSystem:getNeedDayChanged(superFunc: any)` | 1073 | ✍ Renvoie toujours true pour que le callback quotidien (facturation de la location) soit exécuté. |
| `PlaceableTrainSystem:getLengthSplineTime()` | 1079 | ✍ Renvoie la longueur du train exprimée en unités de temps de spline. |
| `PlaceableTrainSystem:getSpline()` | 1086 | ✍ Renvoie le nœud de la spline du train. |
| `PlaceableTrainSystem:updateDriveableState(newSplineTime: any)` | 1093 | ✍ Vérifie si le temps de spline est dans la zone conduisible. En sortie : les clients éjectent un joueur à bord et affichent une boîte de dialogue, le serveur passe les locomotives en trajet automatique et rend un train loué vide. En rentrée, il réinitialise les états des locomotives ; met à jour la sélection par Tab. |
| `PlaceableTrainSystem:gsIsTrainFilled()` | 1166 | ✍ Renvoie true si une unité de remplissage d'un véhicule du train contient plus de 0, sinon false. |
| `PlaceableTrainSystem:onSellGoodsQuestion(yes: any)` | 1184 | ✍ Callback de la boîte oui/non : si la réponse est oui, envoie un PlaceableTrainSystemSellEvent au serveur. |
| `PlaceableTrainSystem:sellGoods()` | 1192 | ✍ Logique serveur : verse le niveau de chaque unité de remplissage dans la station de vente liée pour la ferme locataire, retire des véhicules ce qui a été accepté, et rend le train si quelque chose a été vendu. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `updateRailroadVehiclePositions` | 27 |
| registerFunction | `createVehicles` | 28 |
| registerFunction | `railroadVehicleLoaded` | 29 |
| registerFunction | `finalizeTrain` | 30 |
| registerFunction | `setIsTrainTabbable` | 31 |
| registerFunction | `getIsTrainInDriveableRange` | 32 |
| registerFunction | `getSplineTime` | 33 |
| registerFunction | `setSplineTime` | 34 |
| registerFunction | `addSplinePositionUpdateListener` | 35 |
| registerFunction | `removeSplinePositionUpdateListener` | 36 |
| registerFunction | `updateTrainPositionByLocomotiveSpeed` | 37 |
| registerFunction | `updateTrainPositionByLocomotiveSplinePosition` | 38 |
| registerFunction | `updateTrainLength` | 39 |
| registerFunction | `toggleRent` | 40 |
| registerFunction | `getCanBeRented` | 41 |
| registerFunction | `rentRailroad` | 42 |
| registerFunction | `returnRailroad` | 43 |
| registerFunction | `onDeleteObject` | 44 |
| registerFunction | `getIsRented` | 45 |
| registerFunction | `getSplineLength` | 46 |
| registerFunction | `getElectricitySpline` | 47 |
| registerFunction | `getElectricitySplineLength` | 48 |
| registerFunction | `getLengthSplineTime` | 49 |
| registerFunction | `getSpline` | 50 |
| registerFunction | `updateDriveableState` | 51 |
| registerFunction | `gsIsTrainFilled` | 52 |
| registerFunction | `onSellGoodsQuestion` | 53 |
| registerFunction | `sellGoods` | 54 |
| registerFunction | `getTrainPosition` | 55 |
| registerOverwrittenFunction | `getNeedDayChanged` | 61 |
| registerEventListener | `onLoad` | 67 |
| registerEventListener | `onDelete` | 68 |
| registerEventListener | `onFinalizePlacement` | 69 |
| registerEventListener | `onReadStream` | 70 |
| registerEventListener | `onWriteStream` | 71 |
| registerEventListener | `onReadUpdateStream` | 72 |
| registerEventListener | `onWriteUpdateStream` | 73 |
| registerEventListener | `onUpdate` | 74 |
| registerEventListener | `onDayChanged` | 75 |
