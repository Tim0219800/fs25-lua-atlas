---@meta
-- FS25 1.25.1.0 : vehicles/VehicleSystem.lua (stub généré, atlas Lua FS25)

--- Classe de gestion (pas une spécialisation) : registre global de tous les véhicules de la partie (vehicles, vehicleByUniqueId, enterables, interactiveVehicles, joints d'attache), chargement/sauvegarde des véhicules en XML et commandes console de débogage. Instance créée par la mission (accès exact, par ex. g_currentMission.vehicleSystem, dans FSBaseMission/Mission00 absents du dump : NON VÉRIFIÉ). POINT CLÉ MÉTÉO : VehicleSystem:update(dt) (VehicleSystem.lua:~137-175) est le SEUL endroit du vanilla (parmi les fichiers lus) qui pilote l'HUMIDITÉ des véhicules : côté serveur seulement (g_server ~= nil), il lit weather:getRainFallScale(), puis, si > 0.1, weather:getTimeSinceLastRain() et weather:getCurrentTemperature() ; si temps depuis la dernière pluie < 30 et température > 0, il appelle pour chaque véhicule présent (hors showroom, avec updateWetness) vehicle:updateWetness(true, dt x échelle de temps effective) quand le véhicule est à l'extérieur (indoorMask:getIsIndoorAtWorldPosition(x, z) à la position de rootNode) et updateWetness(false, ...) quand il est à l'intérieur (donc séchage sous abri), en tenant à jour la table wetVehicles. Quand rainScale <= 0.1 et que wetVehicles n'est pas vide, tous les véhicules mouillés sèchent (updateWetness(false)) jusqu'à ne plus l'être. À noter : si rainScale > 0.1 mais que la condition (temps depuis la pluie < 30 ET température > 0) est fausse, aucun branchement ne sèche ni ne mouille (apparent trou de logique ; non vérifié en jeu). L'échelle de temps vient de g_currentMission:getEffectiveTimeScale() (corps absent du dump : NON VÉRIFIÉ) : c'est donc ici que la pause/l'accélération du temps est prise en compte pour l'humidité. Unités et plages des valeurs météo : implémentation Weather absente du dump, NON VÉRIFIÉ. Aucune lecture du vent ici. RÉSEAU : le registre existe sur toutes les machines ; la mise à jour d'humidité et la sauvegarde/le chargement sont côté serveur (le chargement exige un serveur pour la plupart des commandes console). Les valeurs d'humidité résultantes sont ensuite synchronisées par Washable. Chargement : asynchrone via g_asyncTaskManager et VehicleLoadingData ; les véhicules sont ajoutés à la physique seulement quand tous sont chargés (loadVehicleFinished). Points d'extension pour un moddeur : surcharger VehicleSystem:update (global, non enregistré par SpecializationUtil) pour modifier la règle de mouillage ou prendre en compte d'autres sources ; lire vehicles / wetVehicles / enterables pour énumérer les véhicules sans scan global ; s'abonner aux messages MessageType.VEHICLE_ADDED / VEHICLE_REMOVED publiés par addVehicle / removeVehicle.
---@class VehicleSystem
VehicleSystem = {}

--- Crée le registre (tables vehicles, wetVehicles, enterables, interactiveVehicles, joints, chargements en attente), déclare les commandes console (certaines seulement serveur ou avec g_addCheatCommands / g_addTestCommands) et s'abonne à BuyVehicleEvent.
---@param mission any
---@param customMt any
function VehicleSystem.new(mission, customMt) end

--- Annule les chargements en attente, supprime tous les véhicules, vide les tables, désabonne les messages et retire les commandes console.
function VehicleSystem:delete() end

--- Supprime tous les véhicules enregistrés et renvoie leur nombre.
function VehicleSystem:deleteAll() end

--- Par frame. Charge éventuellement le prochain véhicule de débogage ; côté serveur, applique la logique d'humidité décrite dans le module : lecture de la pluie, de la durée depuis la dernière pluie et de la température, mouillage des véhicules extérieurs, séchage des véhicules sous abri ou une fois la pluie finie, avec dt x échelle de temps effective.
---@param dt any
function VehicleSystem:update(dt) end

--- Appelle drawUIInfo pour chaque véhicule entrable (informations d'interface).
function VehicleSystem:draw() end

--- Enregistre un véhicule (vérifie le type et l'unicité de l'identifiant unique, en génère un au besoin), l'ajoute à wetVehicles s'il est déjà mouillé et publie VEHICLE_ADDED.
---@param vehicle any
function VehicleSystem:addVehicle(vehicle) end

--- Retire un véhicule des tables (dont wetVehicles) et publie VEHICLE_REMOVED.
---@param vehicle any
function VehicleSystem:removeVehicle(vehicle) end

--- Renvoie le véhicule associé à un identifiant unique.
---@param uniqueId any
function VehicleSystem:getVehicleByUniqueId(uniqueId) end

--- Mémorise un chargement de véhicule en cours.
---@param vehicleLoadingData any
function VehicleSystem:addPendingVehicleLoad(vehicleLoadingData) end

--- Retire un chargement de véhicule terminé.
---@param vehicleLoadingData any
function VehicleSystem:removePendingVehicleLoad(vehicleLoadingData) end

--- Vrai si tous les véhicules sont synchronisés et qu'aucun chargement n'est en attente.
function VehicleSystem:canStartMission() end

--- Ajoute un véhicule à la liste des véhicules entrables.
---@param vehicle any
function VehicleSystem:addEnterableVehicle(vehicle) end

--- Retire un véhicule entrable et recale l'indice du dernier véhicule utilisé (pour la touche de changement).
---@param vehicle any
function VehicleSystem:removeEnterableVehicle(vehicle) end

--- Mémorise l'indice du véhicule dans lequel le joueur est entré.
---@param vehicle any
function VehicleSystem:setEnteredVehicle(vehicle) end

--- Trouve le prochain véhicule entrable et utilisable (tabbable) selon un pas (+1 ou -1) : le dernier véhicule utilisé quand le joueur est à pied avec un pas positif, le dernier de la liste avec un pas négatif.
---@param currentVehicle any
---@param delta any
function VehicleSystem:getNextEnterableVehicle(currentVehicle, delta) end

--- Enregistre un joint d'attache avec sa position monde et renvoie la structure d'info.
---@param vehicle any
---@param inputAttacherJointIndex any
---@param inputAttacherJoint any
function VehicleSystem:registerInputAttacherJoint(vehicle, inputAttacherJointIndex, inputAttacherJoint) end

--- Met à jour la position monde d'un joint d'attache enregistré.
---@param inputAttacherJointInfo any
function VehicleSystem:updateInputAttacherJoint(inputAttacherJointInfo) end

--- Retire un joint d'attache enregistré.
---@param inputAttacherJointInfo any
function VehicleSystem:removeInputAttacherJoint(inputAttacherJointInfo) end

--- Marque un véhicule comme interactif.
---@param vehicle any
function VehicleSystem:addInteractiveVehicle(vehicle) end

--- Retire un véhicule des véhicules interactifs.
---@param vehicle any
function VehicleSystem:removeInteractiveVehicle(vehicle) end

--- Crée le fichier XML de sauvegarde des véhicules et y écrit tous ceux qui doivent l'être.
---@param xmlFilename any
---@param usedModNames any
function VehicleSystem:save(xmlFilename, usedModNames) end

--- Écrit dans le fichier les véhicules dont getNeedsSaving est vrai.
---@param vehicles any
---@param xmlFile any
---@param usedModNames any
function VehicleSystem:saveToXML(vehicles, xmlFile, usedModNames) end

--- Écrit un véhicule (nom de mod, nom de fichier réseau) puis délègue à vehicle:saveToXMLFile (donc aux spécialisations, dont Washable).
---@param vehicle any
---@param xmlFile any
---@param index any
---@param i any
---@param usedModNames any
function VehicleSystem:saveVehicleToXML(vehicle, xmlFile, index, i, usedModNames) end

--- Ouvre le XML de sauvegarde des véhicules et lance le chargement ; en cas d'absence, rappelle le callback avec une erreur.
---@param xmlFilename any
---@param asyncCallbackFunction any
---@param asyncCallbackObject any
---@param asyncCallbackArguments any
---@param resetVehicles any
function VehicleSystem:load(xmlFilename, asyncCallbackFunction, asyncCallbackObject, asyncCallbackArguments, resetVehicles) end

--- Planifie le chargement asynchrone de chaque véhicule d'un fichier XML (mise en file si un chargement est en cours).
---@param xmlFile any
---@param asyncCallbackFunction any
---@param asyncCallbackObject any
---@param asyncCallbackArguments any
---@param resetVehicles any
---@param keepPosition any
function VehicleSystem:loadFromXMLFile(xmlFile, asyncCallbackFunction, asyncCallbackObject, asyncCallbackArguments, resetVehicles, keepPosition) end

--- Charge un véhicule : vérifie s'il est autorisé (propriété par défaut, compétitif, solo), retrouve l'élément de magasin, gère les emplacements disponibles (rembourse sinon) et lance VehicleLoadingData.
---@param xmlFile any
---@param key any
---@param defaultItemsToSPFarm any
---@param resetVehicles any
---@param keepPosition any
function VehicleSystem:loadVehicleFromXML(xmlFile, key, defaultItemsToSPFarm, resetVehicles, keepPosition) end

--- À chaque fin de chargement : accumule les véhicules ; quand tous sont terminés, les ajoute à la physique, appelle le callback et passe à la file de chargements en attente.
---@param vehicles any
---@param loadingState any
function VehicleSystem:loadVehicleFinished(vehicles, loadingState) end

--- Lance le prochain chargement de sauvegarde en attente, le cas échéant.
function VehicleSystem:updatePendingSavegameLoadings() end

--- Après un achat : compte les véhicules motorisés et attachables de la ferme locale (hors big bags) pour débloquer des succès.
---@param errorCode any
---@param leaseVehicle any
---@param price any
function VehicleSystem:onVehicleBuyEvent(errorCode, leaseVehicle, price) end

--- Retrouve le véhicule à partir d'un nœud physique et de son sous-nœud (gère les composés) via g_currentMission.nodeToObject ; nil si ce n'est pas un Vehicle.
---@param nodeId any
---@param subShapeId any
function VehicleSystem:getVehicleByNodeId(nodeId, subShapeId) end

--- Commande console : active ou bascule l'affichage de la distance véhicule-caméra (g_showVehicleDistance).
---@param active any
function VehicleSystem:consoleCommandShowVehicleDistance(active) end

--- Commande console (serveur) : recharge le véhicule contrôlé ou ceux d'un rayon donné. Non relu en détail.
---@param resetVehicle any
---@param radius any
function VehicleSystem:consoleCommandReloadVehicle(resetVehicle, radius) end

--- Commande console (triche) : ajoute une palette d'un type de remplissage donné. Non relu en détail.
---@param palletFillTypeName any
---@param amount any
---@param worldX any
---@param worldZ any
function VehicleSystem:consoleCommandAddPallet(palletFillTypeName, amount, worldX, worldZ) end

--- Commande console (triche) : fixe le carburant du véhicule contrôlé. Non relu en détail.
---@param fuelLevel any
function VehicleSystem:consoleCommandSetFuel(fuelLevel) end

--- Commande console (triche) : fixe la température du moteur. Non relu en détail.
---@param temperature any
function VehicleSystem:consoleCommandSetMotorTemperature(temperature) end

--- Commande console (triche) : ajoute du contenu à une unité de remplissage. Non relu en détail.
---@param fillUnitIndex any
---@param fillTypeName any
---@param amount any
function VehicleSystem:consoleCommandFillUnitAdd(fillUnitIndex, fillTypeName, amount) end

--- Commande console (triche) : fixe la durée de fonctionnement. Non relu en détail.
---@param operatingTime any
function VehicleSystem:consoleCommandSetOperatingTime(operatingTime) end

--- Commande console (triche, serveur) : ajoute une quantité de saleté à tous les véhicules de la chaîne du véhicule contrôlé via setDirtAmount. Utile pour tester la boue.
---@param amount any
function VehicleSystem:consoleCommandAddDirtAmount(amount) end

--- Commande console (triche) : ajoute de l'usure. Non relu en détail.
---@param amount any
function VehicleSystem:consoleCommandAddWearAmount(amount) end

--- Commande console (triche, serveur) : ajoute une quantité d'humidité (addWetnessAmount) à tous les véhicules de la chaîne du véhicule contrôlé. Utile pour tester le rendu d'humidité sans pluie.
---@param amount any
function VehicleSystem:consoleCommandAddWetnessAmount(amount) end

--- Commande console (triche) : ajoute des dégâts. Non relu en détail.
---@param amount any
function VehicleSystem:consoleCommandAddDamageAmount(amount) end

--- Commande console (triche) : charge tous les véhicules du magasin pour test. Non relu en détail.
---@param loadConfigs any
---@param modsOnly any
---@param palletsOnly any
---@param verbose any
function VehicleSystem:consoleCommandLoadAllVehicles(loadConfigs, modsOnly, palletsOnly, verbose) end

--- Passe au prochain véhicule du chargement de test (appelée depuis update). Non relu en détail.
function VehicleSystem:consoleCommandLoadAllVehiclesNext() end

--- Commande console (test) : supprime tous les véhicules. Non relu en détail.
function VehicleSystem:consoleCommandVehicleRemoveAll() end

--- Commande console (test) : active ou désactive l'échec aléatoire de chargement. Non relu en détail.
function VehicleSystem:consoleCommandVehicleToggleRandomFail() end

--- Commande console (test) : exporte des ensembles de véhicules. Non relu en détail.
function VehicleSystem:consoleCommandExportVehicleSets() end
