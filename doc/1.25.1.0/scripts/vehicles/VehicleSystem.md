# vehicles/VehicleSystem.lua

Source: `dataS/scripts/vehicles/VehicleSystem.lua` — FS25 1.25.1.0

✍ Classe de gestion (pas une spécialisation) : registre global de tous les véhicules de la partie (vehicles, vehicleByUniqueId, enterables, interactiveVehicles, joints d'attache), chargement/sauvegarde des véhicules en XML et commandes console de débogage. Instance créée par la mission (accès exact, par ex. g_currentMission.vehicleSystem, dans FSBaseMission/Mission00 absents du dump : NON VÉRIFIÉ). POINT CLÉ MÉTÉO : VehicleSystem:update(dt) (VehicleSystem.lua:~137-175) est le SEUL endroit du vanilla (parmi les fichiers lus) qui pilote l'HUMIDITÉ des véhicules : côté serveur seulement (g_server ~= nil), il lit weather:getRainFallScale(), puis, si > 0.1, weather:getTimeSinceLastRain() et weather:getCurrentTemperature() ; si temps depuis la dernière pluie < 30 et température > 0, il appelle pour chaque véhicule présent (hors showroom, avec updateWetness) vehicle:updateWetness(true, dt x échelle de temps effective) quand le véhicule est à l'extérieur (indoorMask:getIsIndoorAtWorldPosition(x, z) à la position de rootNode) et updateWetness(false, ...) quand il est à l'intérieur (donc séchage sous abri), en tenant à jour la table wetVehicles. Quand rainScale <= 0.1 et que wetVehicles n'est pas vide, tous les véhicules mouillés sèchent (updateWetness(false)) jusqu'à ne plus l'être. À noter : si rainScale > 0.1 mais que la condition (temps depuis la pluie < 30 ET température > 0) est fausse, aucun branchement ne sèche ni ne mouille (apparent trou de logique ; non vérifié en jeu). L'échelle de temps vient de g_currentMission:getEffectiveTimeScale() (corps absent du dump : NON VÉRIFIÉ) : c'est donc ici que la pause/l'accélération du temps est prise en compte pour l'humidité. Unités et plages des valeurs météo : implémentation Weather absente du dump, NON VÉRIFIÉ. Aucune lecture du vent ici. RÉSEAU : le registre existe sur toutes les machines ; la mise à jour d'humidité et la sauvegarde/le chargement sont côté serveur (le chargement exige un serveur pour la plupart des commandes console). Les valeurs d'humidité résultantes sont ensuite synchronisées par Washable. Chargement : asynchrone via g_asyncTaskManager et VehicleLoadingData ; les véhicules sont ajoutés à la physique seulement quand tous sont chargés (loadVehicleFinished). Points d'extension pour un moddeur : surcharger VehicleSystem:update (global, non enregistré par SpecializationUtil) pour modifier la règle de mouillage ou prendre en compte d'autres sources ; lire vehicles / wetVehicles / enterables pour énumérer les véhicules sans scan global ; s'abonner aux messages MessageType.VEHICLE_ADDED / VEHICLE_REMOVED publiés par addVehicle / removeVehicle.

- **VehicleSystem** (l.14)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `VehicleSystem.new(mission: any, customMt: any)` | 18 | ✍ Crée le registre (tables vehicles, wetVehicles, enterables, interactiveVehicles, joints, chargements en attente), déclare les commandes console (certaines seulement serveur ou avec g_addCheatCommands / g_addTestCommands) et s'abonne à BuyVehicleEvent. |
| `VehicleSystem:delete()` | 74 | ✍ Annule les chargements en attente, supprime tous les véhicules, vide les tables, désabonne les messages et retire les commandes console. |
| `VehicleSystem:deleteAll()` | 126 | ✍ Supprime tous les véhicules enregistrés et renvoie leur nombre. |
| `VehicleSystem:update(dt: any)` | 152 | ✍ Par frame. Charge éventuellement le prochain véhicule de débogage ; côté serveur, applique la logique d'humidité décrite dans le module : lecture de la pluie, de la durée depuis la dernière pluie et de la température, mouillage des véhicules extérieurs, séchage des véhicules sous abri ou une fois la pluie finie, avec dt x échelle de temps effective. |
| `VehicleSystem:draw()` | 202 | ✍ Appelle drawUIInfo pour chaque véhicule entrable (informations d'interface). |
| `VehicleSystem:addVehicle(vehicle: any)` | 221 | ✍ Enregistre un véhicule (vérifie le type et l'unicité de l'identifiant unique, en génère un au besoin), l'ajoute à wetVehicles s'il est déjà mouillé et publie VEHICLE_ADDED. |
| `VehicleSystem:removeVehicle(vehicle: any)` | 254 | ✍ Retire un véhicule des tables (dont wetVehicles) et publie VEHICLE_REMOVED. |
| `VehicleSystem:getVehicleByUniqueId(uniqueId: any)` | 271 | ✍ Renvoie le véhicule associé à un identifiant unique. |
| `VehicleSystem:addPendingVehicleLoad(vehicleLoadingData: any)` | 277 | ✍ Mémorise un chargement de véhicule en cours. |
| `VehicleSystem:removePendingVehicleLoad(vehicleLoadingData: any)` | 283 | ✍ Retire un chargement de véhicule terminé. |
| `VehicleSystem:canStartMission()` | 293 | ✍ Vrai si tous les véhicules sont synchronisés et qu'aucun chargement n'est en attente. |
| `VehicleSystem:addEnterableVehicle(vehicle: any)` | 309 | ✍ Ajoute un véhicule à la liste des véhicules entrables. |
| `VehicleSystem:removeEnterableVehicle(vehicle: any)` | 315 | ✍ Retire un véhicule entrable et recale l'indice du dernier véhicule utilisé (pour la touche de changement). |
| `VehicleSystem:setEnteredVehicle(vehicle: any)` | 324 | ✍ Mémorise l'indice du véhicule dans lequel le joueur est entré. |
| `VehicleSystem:getNextEnterableVehicle(currentVehicle: any, delta: any)` | 335 | ✍ Trouve le prochain véhicule entrable et utilisable (tabbable) selon un pas (+1 ou -1) : le dernier véhicule utilisé quand le joueur est à pied avec un pas positif, le dernier de la liste avec un pas négatif. |
| `VehicleSystem:registerInputAttacherJoint(vehicle: any, inputAttacherJointIndex: any, inputAttacherJoint: any)` | 385 | ✍ Enregistre un joint d'attache avec sa position monde et renvoie la structure d'info. |
| `VehicleSystem:updateInputAttacherJoint(inputAttacherJointInfo: any)` | 401 | ✍ Met à jour la position monde d'un joint d'attache enregistré. |
| `VehicleSystem:removeInputAttacherJoint(inputAttacherJointInfo: any)` | 408 | ✍ Retire un joint d'attache enregistré. |
| `VehicleSystem:addInteractiveVehicle(vehicle: any)` | 414 | ✍ Marque un véhicule comme interactif. |
| `VehicleSystem:removeInteractiveVehicle(vehicle: any)` | 420 | ✍ Retire un véhicule des véhicules interactifs. |
| `VehicleSystem:save(xmlFilename: any, usedModNames: any)` | 426 | ✍ Crée le fichier XML de sauvegarde des véhicules et y écrit tous ceux qui doivent l'être. |
| `VehicleSystem:saveToXML(vehicles: any, xmlFile: any, usedModNames: any)` | 436 | ✍ Écrit dans le fichier les véhicules dont getNeedsSaving est vrai. |
| `VehicleSystem:saveVehicleToXML(vehicle: any, xmlFile: any, index: any, i: any, usedModNames: any)` | 453 | ✍ Écrit un véhicule (nom de mod, nom de fichier réseau) puis délègue à vehicle:saveToXMLFile (donc aux spécialisations, dont Washable). |
| `VehicleSystem:load(xmlFilename: any, asyncCallbackFunction: any, asyncCallbackObject: any, asyncCallbackArguments: any, resetVehicles: any)` | 471 | ✍ Ouvre le XML de sauvegarde des véhicules et lance le chargement ; en cas d'absence, rappelle le callback avec une erreur. |
| `VehicleSystem:loadFromXMLFile(xmlFile: any, asyncCallbackFunction: any, asyncCallbackObject: any, asyncCallbackArguments: any, resetVehicles: any, keepPosition: any)` | 487 | ✍ Planifie le chargement asynchrone de chaque véhicule d'un fichier XML (mise en file si un chargement est en cours). |
| `VehicleSystem:loadVehicleFromXML(xmlFile: any, key: any, defaultItemsToSPFarm: any, resetVehicles: any, keepPosition: any)` | 538 | ✍ Charge un véhicule : vérifie s'il est autorisé (propriété par défaut, compétitif, solo), retrouve l'élément de magasin, gère les emplacements disponibles (rembourse sinon) et lance VehicleLoadingData. |
| `VehicleSystem:loadVehicleFinished(vehicles: any, loadingState: any)` | 591 | ✍ À chaque fin de chargement : accumule les véhicules ; quand tous sont terminés, les ajoute à la physique, appelle le callback et passe à la file de chargements en attente. |
| `VehicleSystem:updatePendingSavegameLoadings()` | 623 | ✍ Lance le prochain chargement de sauvegarde en attente, le cas échéant. |
| `VehicleSystem:onVehicleBuyEvent(errorCode: any, leaseVehicle: any, price: any)` | 634 | ✍ Après un achat : compte les véhicules motorisés et attachables de la ferme locale (hors big bags) pour débloquer des succès. |
| `VehicleSystem:getVehicleByNodeId(nodeId: any, subShapeId: any)` | 656 | ✍ Retrouve le véhicule à partir d'un nœud physique et de son sous-nœud (gère les composés) via g_currentMission.nodeToObject ; nil si ce n'est pas un Vehicle. |
| `VehicleSystem:consoleCommandShowVehicleDistance(active: any)` | 697 | ✍ Commande console : active ou bascule l'affichage de la distance véhicule-caméra (g_showVehicleDistance). |
| `VehicleSystem:consoleCommandReloadVehicle(resetVehicle: any, radius: any)` | 703 | ✍ Commande console (serveur) : recharge le véhicule contrôlé ou ceux d'un rayon donné. Non relu en détail. |
| `VehicleSystem:consoleCommandAddPallet(palletFillTypeName: any, amount: any, worldX: any, worldZ: any)` | 853 | ✍ Commande console (triche) : ajoute une palette d'un type de remplissage donné. Non relu en détail. |
| `VehicleSystem:consoleCommandSetFuel(fuelLevel: any)` | 961 | ✍ Commande console (triche) : fixe le carburant du véhicule contrôlé. Non relu en détail. |
| `VehicleSystem:consoleCommandSetMotorTemperature(temperature: any)` | 993 | ✍ Commande console (triche) : fixe la température du moteur. Non relu en détail. |
| `VehicleSystem:consoleCommandFillUnitAdd(fillUnitIndex: any, fillTypeName: any, amount: any)` | 1019 | ✍ Commande console (triche) : ajoute du contenu à une unité de remplissage. Non relu en détail. |
| `VehicleSystem:consoleCommandSetOperatingTime(operatingTime: any)` | 1111 | ✍ Commande console (triche) : fixe la durée de fonctionnement. Non relu en détail. |
| `VehicleSystem:consoleCommandAddDirtAmount(amount: any)` | 1139 | ✍ Commande console (triche, serveur) : ajoute une quantité de saleté à tous les véhicules de la chaîne du véhicule contrôlé via setDirtAmount. Utile pour tester la boue. |
| `VehicleSystem:consoleCommandAddWearAmount(amount: any)` | 1164 | ✍ Commande console (triche) : ajoute de l'usure. Non relu en détail. |
| `VehicleSystem:consoleCommandAddWetnessAmount(amount: any)` | 1186 | ✍ Commande console (triche, serveur) : ajoute une quantité d'humidité (addWetnessAmount) à tous les véhicules de la chaîne du véhicule contrôlé. Utile pour tester le rendu d'humidité sans pluie. |
| `VehicleSystem:consoleCommandAddDamageAmount(amount: any)` | 1208 | ✍ Commande console (triche) : ajoute des dégâts. Non relu en détail. |
| `VehicleSystem:consoleCommandLoadAllVehicles(loadConfigs: any, modsOnly: any, palletsOnly: any, verbose: any)` | 1230 | ✍ Commande console (triche) : charge tous les véhicules du magasin pour test. Non relu en détail. |
| `VehicleSystem:consoleCommandLoadAllVehiclesNext()` | 1358 | ✍ Passe au prochain véhicule du chargement de test (appelée depuis update). Non relu en détail. |
| `VehicleSystem:consoleCommandVehicleRemoveAll()` | 1439 | ✍ Commande console (test) : supprime tous les véhicules. Non relu en détail. |
| `VehicleSystem:consoleCommandVehicleToggleRandomFail()` | 1454 | ✍ Commande console (test) : active ou désactive l'échec aléatoire de chargement. Non relu en détail. |
| `VehicleSystem:consoleCommandExportVehicleSets()` | 1462 | ✍ Commande console (test) : exporte des ensembles de véhicules. Non relu en détail. |

## Messages

- publishes `MessageType.VEHICLE_ADDED` (l.247)
- publishes `MessageType.VEHICLE_REMOVED` (l.266)
