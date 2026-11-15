---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Wheels.lua (generated stub, FS25 Lua Atlas)

--- Spécialisation de véhicule (sans prérequis) qui possède la liste des roues (spec_wheels.wheels, objets Wheel), les moyeux, essieux, nœuds de direction (Ackermann), sons de surface et configurations de roues. C'est le point d'entrée de toute la chaîne roue : Wheels -> Wheel -> WheelPhysics / WheelEffects / WheelDestruction. DONNÉES MÉTÉO : lit weather:getGroundWetness() à chaque frame (onUpdate, Wheels.lua:844) et à chaque tick (onUpdateTick, Wheels.lua:935) puis la distribue aux roues ; une valeur numérique unique, dont l'implémentation (Weather) est absente du dump : NON VÉRIFIÉ (plage et unité non confirmées ici). La neige : abonnement au message MessageType.SNOW_HEIGHT_CHANGED (onWheelSnowHeightChanged). La pluie, le vent et la température ne sont pas lus ici ; ils arrivent aux fonctions de saleté (updateWheelDirtAmount, updateWheelMudAmount) comme paramètres rainScale / timeSinceLastRain / temperature fournis par Washable.lua (voir cette spécialisation). CONTACT PNEU/SOL : voir WheelPhysics (contact, densityType, hasSnowContact, hasWaterContact), utilisés ici pour les sons de surface (getCurrentSurfaceSound), la saleté des roues et la pente du véhicule (getVehicleWorldXRot, getVehicleWorldDirection, basés sur hasGroundContact). SALETÉ / BOUE : validateWashableNode détecte, par paramètres de shader dans les enfants de la roue, les nœuds « scratches_dirt_snow_wetness » (saleté + neige + humidité) et « mudAmount » (boue 3D) et leur associe des fonctions de mise à jour de saleté spécifiques aux roues. EFFET SUR LE MONDE : destruction des cultures et neige par les roues (WheelDestruction.update appelé ici, Wheels.lua:865, seulement si le véhicule est actif, option de sauvegarde fruitDestruction active, sans IA, et sans blocage par le véhicule) ; déformation du terrain désactivée pendant le travail d'une IA (onAIFieldWorkerStart/End, onAIImplementStart/End). CADENCE : le compteur currentUpdateIndex cycle de 1 à 4 à chaque frame pour répartir la mesure de contact entre les roues ; dt est en ms. RÉSEAU : seules les roues avec physics.isSynchronized sont envoyées (flux initial et flux de mise à jour, drapeau sale levé en continu côté serveur dès qu'il y a des roues) ; le client interpole (networkTimeInterpolator) et n'exécute pas la physique. Événements déclarés : onBrake, onFinishedWheelLoading, onWheelConfigurationChanged. Points d'extension pour un moddeur : fonctions enregistrées surchargeables par type de véhicule (updateWheelDirtAmount et updateWheelMudAmount sont des registerFunction, donc remplaçables pour changer la logique de boue/saleté de roue ; getCurrentSurfaceSound, getBrakeForce, brake, getWheels), surcharges déclarées (validateWashableNode, addToPhysics, getVehicleWorldXRot...), événements ci-dessus et listeners onUpdate/onUpdateTick. À noter : setCustomBrakeForce est enregistré par registerFunction mais aucune définition de Wheels.setCustomBrakeForce n'existe dans ce fichier (non vérifié en jeu : fonction nil ou définie ailleurs) ; Wheels:getBrakeForce renvoie spec.customBrakeForce (0 par défaut). Le fichier fait 2489 lignes : le chargement XML des roues, des essieux, des moyeux et des valeurs de magasin n'a pas été relu en détail.
---@class Wheels
Wheels = {}

--- Aucun prérequis (renvoie toujours vrai).
---@param specializations any
function Wheels.prerequisitesPresent(specializations) end

--- Déclare les événements onBrake, onFinishedWheelLoading et onWheelConfigurationChanged.
---@param vehicleType any
function Wheels.registerEvents(vehicleType) end

--- Enregistre les fonctions de la spécialisation (chargement de roues/moyeux, accès, freinage, sons de surface, updateWheelDirtAmount, updateWheelMudAmount, onWheelSnowHeightChanged, direction...). Elles sont donc remplaçables par un mod via les mécanismes de SpecializationUtil. Enregistre aussi setCustomBrakeForce, non définie dans ce fichier.
---@param vehicleType any
function Wheels.registerFunctions(vehicleType) end

--- Déclare les surcharges : addToPhysics, removeFromPhysics, getComponentMass, getVehicleWorldXRot, getVehicleWorldDirection, validateWashableNode, getAIDirectionNode, getAIRootNode, getSupportsMountKinematic, loadBendingNodeFromXML.
---@param vehicleType any
function Wheels.registerOverwrittenFunctions(vehicleType) end

--- Abonne la spécialisation à onPreLoad, onLoad, onLoadFinished, onRegisterDashboardValueTypes, onDelete, flux réseau, onUpdate, onPostUpdate, onUpdateTick, onUpdateEnd, onLeaveVehicle, onPreAttach, onPostDetach, onRegisterAnimationValueTypes, onPostAttachImplement et événements IA.
---@param vehicleType any
function Wheels.registerEventListeners(vehicleType) end

--- Enregistre le schéma XML de la spécialisation (wheels, roues, moyeux, configurations, essieux, sons de surface, Ackermann) et les chemins de sauvegarde. Non relu en détail.
function Wheels.initSpecialization() end

--- Déclare les clés XML de la direction Ackermann.
---@param schema any
---@param key any
function Wheels.registerAckermannSteeringXMLPaths(schema, key) end

--- Lit l'identifiant de configuration de roues et applique une configuration générée si elle existe.
---@param savegame any
function Wheels:onPreLoad(savegame) end

--- Charge la configuration de roues : matériaux de jante/moyeu, roues (loadWheelsFromXML), moyeux, nœuds de direction, essieux, sons de surface par type de pneu (type wheel_<nom> ou wheel), drapeau réseau, abonnement à SNOW_HEIGHT_CHANGED . Non relu intégralement.
---@param savegame any
function Wheels:onLoad(savegame) end

--- Serveur : ajoute la masse des roues à la masse par défaut du véhicule ; si la configuration de roues sauvegardée a changé, remet à zéro la saleté et la boue des roues et lève onWheelConfigurationChanged ; applique les matériaux de jante, moyeu et boulons ; appelle ensuite Wheel:update une fois avec dt = 99999, groundWetness = 0 et force vrai pour placer les roues visuelles (Wheels.lua:633).
---@param savegame any
function Wheels:onLoadFinished(savegame) end

--- Déclare des valeurs de tableau de bord liées aux roues. Non relu.
function Wheels:onRegisterDashboardValueTypes() end

--- Sauvegarde l'identifiant de configuration de roues (#lastConfigId).
---@param xmlFile any
---@param key any
---@param usedModNames any
function Wheels:saveToXMLFile(xmlFile, key, usedModNames) end

--- Libère fichiers I3D partagés, moyeux, roues, roues chargées dynamiquement et sons de surface.
function Wheels:onDelete() end

--- Client : réinitialise l'interpolateur temporel et lit l'état de chaque roue synchronisée (avec mise à jour directe).
---@param streamId any
---@param connection any
function Wheels:onReadStream(streamId, connection) end

--- Serveur : écrit l'état de chaque roue synchronisée.
---@param streamId any
---@param connection any
function Wheels:onWriteStream(streamId, connection) end

--- Client : lit, si le drapeau est présent, l'état de chaque roue synchronisée et le temps de rotation (rotatedTime, 8 bits) comme cibles d'interpolation. Non relu entièrement.
---@param streamId any
---@param timestamp any
---@param connection any
function Wheels:onReadUpdateStream(streamId, timestamp, connection) end

--- Serveur : écrit l'état des roues synchronisées et rotatedTime (8 bits) quand le drapeau sale est levé.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Wheels:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Par frame. Client pur : interpolation réseau des roues et de rotatedTime. Après la première mise à jour : lit weather:getGroundWetness() une fois, appelle Wheel:update pour chaque roue (avec le compteur cyclique 1..4), puis, si le véhicule est actif, la destruction des cultures/neige (sauf IA, option de sauvegarde désactivée ou blocage), les essieux (serveur), les sons de surface et les nœuds de direction. Le serveur lève le drapeau réseau à chaque frame s'il y a des roues.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Wheels:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Serveur : appelle postUpdate des roues pour appliquer position/friction en attente.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Wheels:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Par tick : relit weather:getGroundWetness() et appelle Wheel:updateTick avec la distance de mise à jour du véhicule (pilote couleur/saleté de piste et effets de roue).
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Wheels:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client : appelle onUpdateEnd des roues (arrêt d'effets) et coupe le son de surface en cours.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Wheels:onUpdateEnd(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Charge tous les moyeux déclarés dans vehicle.wheels.hubs.hub.
function Wheels:loadHubsFromXML() end

--- Charge le matériau d'un moyeu (base, jante ou couleur de design selon les options XML).
---@param vehicle any
---@param xmlFile any
---@param key any
---@param hub any
---@param materialName any
function Wheels.loadHubMaterial(vehicle, xmlFile, key, hub, materialName) end

--- Charge un moyeu : modèle I3D partagé, lien, matériaux. Non relu en détail.
---@param xmlFile any
---@param key any
function Wheels:loadHubFromXML(xmlFile, key) end

--- Rappel de chargement I3D d'un moyeu : l'attache au nœud de roue. Non relu en détail.
---@param i3dNode integer
---@param failedReason table
---@param args table
function Wheels:onWheelHubI3DLoaded(i3dNode, failedReason, args) end

--- Charge un réglage de direction Ackermann. Non relu en détail.
---@param xmlFile any
---@param ackermannSteeringIndex any
---@param ackermannSteeringAngle any
function Wheels:loadAckermannSteeringFromXML(xmlFile, ackermannSteeringIndex, ackermannSteeringAngle) end

--- Charge toutes les roues de la configuration donnée en instanciant Wheel.new. Non relu en détail.
---@param xmlFile any
---@param key any
---@param wheelConfigurationId any
function Wheels:loadWheelsFromXML(xmlFile, key, wheelConfigurationId) end

--- Charge une roue en appelant wheel:loadFromXML ; renvoie son résultat (fonction enregistrée, donc remplaçable).
---@param wheel any
function Wheels:loadWheelFromXML(wheel) end

--- Crochet appelé pour chaque cale de roue chargée (corps vide : point d'extension).
---@param wheelChock any
function Wheels:onLoadWheelChockFromXML(wheelChock) end

--- Indique si une cale de roue est autorisée (renvoie vrai par défaut).
---@param wheelChock any
function Wheels:getIsWheelChockAllowed(wheelChock) end

--- Surcharge : après le parent, ajoute chaque roue à la physique avec la force de freinage courante, puis serre le frein à fond côté serveur.
---@param superFunc any
function Wheels:addToPhysics(superFunc) end

--- Surcharge : retire les roues de la physique côté serveur.
---@param superFunc any
function Wheels:removeFromPhysics(superFunc) end

--- Surcharge : ajoute la masse des roues portées par le composant.
---@param superFunc boolean
---@param component any
---@return number
function Wheels:getComponentMass(superFunc, component) end

--- Surcharge : estime l'inclinaison longitudinale du véhicule à partir de la hauteur des roues en contact avec le sol (hasGroundContact). Non relu en détail.
---@param superFunc any
---@return number
function Wheels:getVehicleWorldXRot(superFunc) end

--- Surcharge : estime la direction du véhicule à partir des roues en contact avec le sol. Non relu en détail.
---@param superFunc any
---@return number
---@return number
---@return number
function Wheels:getVehicleWorldDirection(superFunc) end

--- Surcharge pour Washable : une fois le véhicule chargé, repère dans chaque roue les nœuds de shader « scratches_dirt_snow_wetness » (saleté, neige, humidité) et « mudAmount » (boue) et leur associe des données de saleté propres à la roue (multiplicateurs champ/route, facteur d'eau, vitesse de changement de couleur) et les fonctions updateWheelDirtAmount ou updateWheelMudAmount. Sauvegarde la valeur snowScale de la roue. Pour la boue, fait pivoter aléatoirement le maillage et applique un multiplicateur de nettoyage de 4. Sinon, délègue au parent.
---@param superFunc any
---@param node any
function Wheels:validateWashableNode(superFunc, node) end

--- Surcharge : renvoie le nœud de centre de direction des roues s'il existe, sinon le résultat du parent.
---@param superFunc any
function Wheels:getAIDirectionNode(superFunc) end

--- Surcharge : idem getAIDirectionNode (centre de direction des roues, sinon parent).
---@param superFunc any
function Wheels:getAIRootNode(superFunc) end

--- Surcharge : montage cinématique supporté seulement si le véhicule n'a aucune roue et que le parent l'autorise.
---@param superFunc any
function Wheels:getSupportsMountKinematic(superFunc) end

--- Surcharge : lit #wheelIndices d'un nœud de déformation de feuillage pour l'associer à des roues. Non relu en détail.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param bendingNode any
function Wheels:loadBendingNodeFromXML(superFunc, xmlFile, key, bendingNode, ...) end

--- Fonction de saleté pour un nœud de roue, appelée par Washable avec rainScale, timeSinceLastRain et temperature. Retourne la variation de saleté et d'humidité. N'agit que si la roue touche quelque chose (ou mise à jour forcée). Sur sol de champ, saleté x fieldDirtMultiplier ; hors champ et hors herbage, la saleté diminue proportionnellement à la vitesse (streetDirtMultiplier), multipliée par 0.15 quand rainScale > 0.1 (la boue colle plus par temps de pluie, d'après le commentaire du code). Limite l'écart entre la saleté de la roue et la saleté globale du véhicule. Fait évoluer snowScale (vers 1 avec contact neige et température < 1, sinon retour lent) et la couleur du nœud entre couleur de saleté et couleur de neige (environment:getDirtColors, non vérifié). L'humidité augmente avec waterWetnessFactor en cas de contact avec l'eau, diminue avec la vitesse sinon (séchage par rotation).
---@param nodeData any
---@param dt any
---@param allowsWashingByRain any
---@param rainScale any
---@param timeSinceLastRain any
---@param temperature any
function Wheels:updateWheelDirtAmount(nodeData, dt, allowsWashingByRain, rainScale, timeSinceLastRain, temperature) end

--- Fonction de boue 3D pour les nœuds mudAmount : suit la saleté de la roue associée. Quantité maximale de boue = WheelEffects.MAX_MUD_AMOUNT[type de sol] (table non définie ici : NON VÉRIFIÉ), réduite de moitié quand rainScale <= 0.1 (boue pleine seulement par temps de pluie). Dépose de la boue si la saleté de roue dépasse 0.75 et que le maximum n'est pas atteint, retire sinon, selon la vitesse. L'humidité et la couleur suivent celles du nœud de roue.
---@param nodeData any
---@param dt any
---@param allowsWashingByRain any
---@param rainScale any
---@param timeSinceLastRain any
---@param temperature any
function Wheels:updateWheelMudAmount(nodeData, dt, allowsWashingByRain, rainScale, timeSinceLastRain, temperature) end

--- Réapplique frein et propriétés physiques à toutes les roues.
---@param dt any
function Wheels:forceUpdateWheelPhysics(dt) end

--- Message SNOW_HEIGHT_CHANGED : quand la hauteur de neige tombe à 0 ou moins, remet snowScale des roues à zéro, force la mise à jour de la saleté et réveille le véhicule.
---@param heightPct any
---@param heightAbs any
function Wheels:onWheelSnowHeightChanged(heightPct, heightAbs) end

--- Retourne le nœud de direction associé à un nœud donné (non relu).
---@param node any
function Wheels:getSteeringNodeByNode(node) end

--- Met à jour les nœuds de direction à partir de rotatedTime et de leurs limites (non relu en détail).
---@param dt any
function Wheels:updateSteeringNodes(dt) end

--- Applique la rotation/translation de la barre de direction visuelle (non relu en détail).
---@param steeringNode table
---@param steeringAngle number
function Wheels:updateSteeringNodeBar(steeringNode, steeringAngle) end

--- Renvoie l'échantillon sonore correspondant à la surface sous la première roue à état de contact synchronisé (ou la dernière roue), d'après WheelPhysics:getSurfaceSoundAttributes.
function Wheels:getCurrentSurfaceSound() end

--- Les sons de surface sont actifs si le véhicule est actif pour le son local (isActiveForLocalSound).
function Wheels:getAreSurfaceSoundsActive() end

--- Renvoie vrai : les roues pivotantes libres sont toujours actives (peut être surchargé).
---@param wheel any
function Wheels:getIsVersatileYRotActive(wheel) end

--- Renvoie la roue d'indice donné (1..n).
---@param wheelIndex any
function Wheels:getWheelFromWheelIndex(wheelIndex) end

--- Retrouve une roue par nœud (repr, driveNode ou linkNode) ou nom i3dMapping.
---@param wheelNode any
function Wheels:getWheelByWheelNode(wheelNode) end

--- Renvoie la liste des roues du véhicule (spec_wheels.wheels). Point d'accès standard pour un mod qui veut lire contact, sol, glissement par roue.
function Wheels:getWheels() end

--- Fixe la pédale de frein (0..1) sur toutes les roues et lève onBrake si elle change.
---@param brakePedal any
function Wheels:brake(brakePedal) end

--- Renvoie la force de freinage personnalisée (0 par défaut).
function Wheels:getBrakeForce() end

--- Serveur : à la sortie du véhicule, met couple à zéro et applique le freinage courant aux roues.
function Wheels:onLeaveVehicle() end

--- Appelle onPreAttach de chaque roue (cales de roue).
function Wheels:onPreAttach() end

--- Appelle onPostDetach de chaque roue (cales de roue).
function Wheels:onPostDetach() end

--- Convertit une courbure en temps de rotation de volant (Ackermann) ; non relu en détail.
---@param curvature any
function Wheels:getSteeringRotTimeByCurvature(curvature) end

--- Convertit un temps de rotation du volant en rayon de braquage ; non relu en détail.
---@param rotTime any
function Wheels:getTurningRadiusByRotTime(rotTime) end

--- Déclare des valeurs d'animation liées aux roues ; non relu en détail.
function Wheels:onRegisterAnimationValueTypes() end

--- Relance l'événement onBrake pour que la force de freinage du nouvel outil soit prise en compte.
---@param object any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function Wheels:onPostAttachImplement(object, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- Désactive la déformation du terrain et sa collision pour toutes les roues pendant le travail de l'IA.
function Wheels:onAIFieldWorkerStart() end

--- Idem : désactive la déformation du terrain pour l'outil conduit par l'IA.
function Wheels:onAIImplementStart() end

--- Réactive la déformation du terrain et sa collision.
function Wheels:onAIFieldWorkerEnd() end

--- Réactive la déformation du terrain et sa collision.
function Wheels:onAIImplementEnd() end

--- Mesure la dispersion de compression de suspension entre roues (écart maximal à la moyenne) ; le nom est écrit ainsi dans le code (Modfier).
function Wheels:getWheelSuspensionModfier() end

--- Liste les noms de pneus des roues d'une instance de véhicule (utilisé pour la fiche magasin).
---@param instance any
function Wheels.getTireNames(instance) end

--- Liste les marques de pneus d'après une liste d'éléments (magasin) ; non relu en détail.
---@param items any
function Wheels.getBrands(items) end

--- Filtre des éléments de roue par marque ; non relu en détail.
---@param items any
---@param brand any
function Wheels.getWheelsByBrand(items, brand) end

--- Valeur de fiche magasin : masse des roues d'après la configuration de roues par défaut ou sélectionnable ; non relu en détail.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Wheels.loadSpecValueWheelWeight(xmlFile, customEnvironment, baseDir) end

--- Valeur de fiche magasin : liste de roues (non relu en détail).
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Wheels.loadSpecValueWheels(xmlFile, customEnvironment, baseDir) end

--- Valeur de fiche magasin : noms de pneus de l'objet réel, séparés par « / »; nil sans objet réel.
---@param storeItem any
---@param realItem any
function Wheels.getSpecValueWheels(storeItem, realItem) end

--- Construit la correspondance entre configurations de roues et configuration de base (#baseConfig) ; signale une auto-référence comme erreur XML.
---@param xmlFile table
---@return table
---@return table
function Wheels.createConfigToParentConfigMapping(xmlFile) end
