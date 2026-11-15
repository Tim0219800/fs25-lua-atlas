---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Motorized.lua (stub généré, atlas Lua FS25)

--- Spécialisation des véhicules à moteur (table spec_motorized). Prérequis : FillUnit et VehicleSettings. Elle porte le moteur de simulation (objet VehicleMotor, hors périmètre), les différentiels, les boîtes de vitesses, les consommables (diesel, DEF, électricité, méthane, air), la température moteur, les sons, les tableaux de bord et les effets d'échappement.
--- 
--- EFFETS D'ÉCHAPPEMENT (client uniquement : loadExhaustEffects n'est appelée que si self.isClient, Motorized.lua:410-412). Trois mécanismes coexistent. (1) exhaustParticleSystems : systèmes de particules chargés par ParticleUtil.loadParticleSystem depuis vehicle.motorized.exhaustParticleSystems.exhaustParticleSystem(?), avec minScale (0.5 par défaut) et maxScale (1). (2) exhaustEffects : mesh I3D partagé chargé en asynchrone, qui doit exposer le paramètre de shader « param » (sinon ignoré) ; à chaque tick client, onUpdateTick calcule l'inclinaison du panache d'après le déplacement du point d'émission (effet « traîné » par la vitesse du véhicule, pas par le vent : aucune lecture de vent dans ce fichier), lisse avec un facteur 0.95/0.05, puis envoie via setShaderParameter la taille (interpolée minRpmScale 0.25 / maxRpmScale 0.95 selon le régime) et la couleur « exhaustColor » (interpolée minRpmColor / maxRpmColor). (3) effects : système d'effets générique (g_effectManager, classes d'effets ABSENTES du dump : comportement NON VÉRIFIÉ) dont la densité est réglée sur le ratio de régime. Les volets d'échappement (exhaustFlap) sont des nœuds pivotés avec un bruit aléatoire de ±0.1 sur le ratio de régime.
--- 
--- DONNÉES MOTEUR POUR UN MOD. getMotorRpmReal (tr/min modulés), getMotorRpmPercentage (0..1), getMotorLoadPercentage (charge lissée, de -1 à 1 environ ; la valeur brute est spec.actualLoadPercentage, bornée 0..1, calculée côté serveur), getMotorState (MotorState.OFF / IGNITION / STARTING / ON). Côté réseau : le serveur envoie au client, dans le flux de mise à jour, le régime (11 bits), la charge (7 bits) et l'embrayage ; le client reconstitue donc régime et charge, d'où les effets d'échappement corrects en multijoueur. En revanche la température moteur (spec_motorized.motorTemperature, 20 à 120 °C, ventilateur entre 85 et 95 °C) n'est mise à jour que sur le serveur (updateMotorTemperature appelée dans le bloc isServer d'onUpdateTick) et aucun envoi réseau n'apparaît dans ce fichier (le champ valueSend n'est jamais utilisé) : à noter, la température lue sur un client pur semble donc figée à 20 °C (non vérifié en jeu). Aucun lien code entre cette température et les particules d'échappement n'existe dans ce fichier.
--- 
--- DT ET TEMPS : onUpdate et onUpdateTick reçoivent dt en ms ; la température et les consommations sont proportionnelles à dt (heatingPerMS, coolingByWindPerMS, coolingPerMS). Le lissage du panache d'échappement (0.95/0.05) est par tick et non par dt : sa vitesse dépend donc de la fréquence des ticks (à noter, non vérifié en jeu).
--- 
--- POINTS D'EXTENSION. Événements déclarés (SpecializationUtil.registerEvent) : onStartMotor, onStopMotor, onGearDirectionChanged, onGearChanged, onGearGroupChanged, onMotorBlowOffValveChanged, onClutchCreaking. Fonctions surchargeables par registerOverwrittenFunction (déjà surchargées ici) : getBrakeForce, addToPhysics, removeFromPhysics, getIsOperating, getDeactivateOnLeave, getDeactivateLightsOnLeave, loadDashboardGroupFromXML, getIsDashboardGroupActive, getIsActiveForInteriorLights, getIsActiveForWipers, getUsageCausesDamage, getName, getCanBeSelected, getIsPowered. Pour réagir au démarrage/arrêt, écouter onStartMotor / onStopMotor (émis ailleurs, dans setMotorState dont le corps est absent du dump).
--- 
--- LIMITE DU DUMP : les fonctions setMotorState et getMotorState sont enregistrées (lignes 281-282) mais leurs définitions n'apparaissent pas ; les lignes 2012 à 2150 du fichier sont vides. Leur comportement est donc NON VÉRIFIÉ ici. La table VehicleMotor, MotorState, MotorSetTurnedOnEvent et g_effectManager ne sont pas dans ce fichier.
---@class Motorized
Motorized = {}

--- Déclare les schémas XML de la spécialisation : chemins moteur, différentiels, consommables, sons, boîtes, configurations de moteur, effets d'échappement (exhaustParticleSystems, exhaustEffects, exhaustFlap, effects), tableaux de bord et valeurs de store. Réservé à l'initialisation des types de véhicules.
function Motorized.initSpecialization() end

--- Enregistre dans le schéma XML les clés d'une configuration de moteur (régimes, vitesses max, couple, freinage, courbes, etc.). Non relu ligne à ligne.
---@param schema any
---@param baseKey any
function Motorized.registerMotorXMLPaths(schema, baseKey) end

--- Enregistre les clés XML des différentiels (indices, rapport de couple, rapport de vitesse max).
---@param schema any
---@param baseKey any
function Motorized.registerDifferentialXMLPaths(schema, baseKey) end

--- Enregistre les clés XML d'un consommable (type de remplissage, usage, capacité, recharge pour l'air).
---@param schema any
---@param baseKey any
function Motorized.registerConsumerXMLPaths(schema, baseKey) end

--- Enregistre les clés XML des sons moteur, boîte, compresseur d'air, clutch, soupape de décharge, marche arrière, etc.
---@param schema any
---@param baseKey any
function Motorized.registerSoundXMLPaths(schema, baseKey) end

--- Exige les spécialisations FillUnit et VehicleSettings sur le type de véhicule.
---@param specializations any
function Motorized.prerequisitesPresent(specializations) end

--- Déclare les événements onStartMotor, onStopMotor, onGearDirectionChanged, onGearChanged, onGearGroupChanged, onMotorBlowOffValveChanged et onClutchCreaking, que d'autres spécialisations ou mods peuvent écouter.
---@param vehicleType any
function Motorized.registerEvents(vehicleType) end

--- Enregistre les fonctions publiques du véhicule (chargement, getters moteur, régime, charge, température, boîte, start/stop). Note : y figurent setMotorState et getMotorState dont les définitions sont absentes du dump.
---@param vehicleType any
function Motorized.registerFunctions(vehicleType) end

--- Surcharge quatorze fonctions de base du véhicule (frein, physique, état opérationnel, tableau de bord, essuie-glaces, éclairage intérieur, usure, nom, sélection, alimentation).
---@param vehicleType any
function Motorized.registerOverwrittenFunctions(vehicleType) end

--- Abonne la spécialisation aux événements du véhicule : cycle de vie (onLoad, onPostLoad, onDelete), flux réseau, onUpdate / onUpdateTick, onStateChange (entrée/sortie du véhicule), niveau des réservoirs, panne (onSetBroken), IA, réglages de boîte et événements propres de boîte.
---@param vehicleType any
function Motorized.registerEventListeners(vehicleType) end

--- Chargement du véhicule : lit différentiels, moteur, sons, consommables, puis, côté client seulement, les effets d'échappement. Initialise l'état moteur (arrêté), la durée de démarrage (motorStartDuration), les paramètres de freinage, les leviers de vitesses, et la structure de température moteur (20 °C initial, 120 °C max, échauffement 1.5 °C/s à pleine charge, refroidissement par le vent 1 °C/s, ventilateur 85/95 °C, 3 °C/s).
---@param savegame table
function Motorized:onLoad(savegame) end

--- Côté serveur : recharge les consommables sous 10 % de capacité en facturant le coût au joueur (prix du litre multiplié par 2). Constitue la liste des réservoirs indispensables au fonctionnement (diesel, DEF, électricité, méthane) puis termine le chargement du moteur.
---@param savegame any
function Motorized:onPostLoad(savegame) end

--- Enregistre les valeurs de tableau de bord : régime (rpm), charge (load, en pourcentage), vitesse, consommation, température moteur et alerte de température, embrayage, rapport, groupe, etc. Utile pour savoir quelles grandeurs moteur sont déjà exposées et leurs plages.
function Motorized:onRegisterDashboardValueTypes() end

--- Libère le moteur, les fichiers I3D partagés des effets d'échappement, les systèmes de particules d'échappement (ParticleUtil.deleteParticleSystems), les sons, les animations et le système d'effets (g_effectManager:deleteEffects).
function Motorized:onDelete() end

--- Lecture réseau à la connexion : reçoit l'état moteur initial et l'applique par setMotorState sans renvoi.
---@param streamId any
---@param connection any
function Motorized:onReadStream(streamId, connection) end

--- Écriture réseau à la connexion : envoie l'état moteur courant.
---@param streamId any
---@param connection any
function Motorized:onWriteStream(streamId, connection) end

--- Lecture du flux de mise à jour. Côté client (flux venant du serveur) : régime égalisé en 11 bits, charge brute en 7 bits, état du compresseur et position de l'embrayage en 5 bits, puis données de boîte. Côté serveur (flux venant d'un client) : état d'embrayage seulement.
---@param streamId any
---@param timestamp any
---@param connection any
function Motorized:onReadUpdateStream(streamId, timestamp, connection) end

--- Écriture du flux de mise à jour, symétrique de la lecture. Le serveur écrit régime, charge, compresseur, embrayage (uniquement si le moteur tourne ou démarre) et, si le drapeau sale est levé, les données de boîte. À noter : la température moteur n'est pas envoyée.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Motorized:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Chaque frame, si le moteur démarre ou tourne : passe en ON après motorStartTime (serveur), met à jour le moteur (spec.motor:update(dt)), la charge brute (serveur) et la charge lissée (tous), met à jour consommables et propriétés moteur selon les dégâts (serveur), et côté client les paramètres de son (régime et charge normalisés), compresseur, freins, bip de marche arrière et leviers de vitesses animés avec dt. Cumule aussi la distance parcourue pour les statistiques (serveur).
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Motorized:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Tick de simulation. Serveur : arrêt automatique du moteur si aucun joueur ou véhicule occupé à moins de 250 m (quand le démarrage automatique est désactivé), appel d'updateMotorTemperature, logique de démarrage/arrêt automatique. Client, moteur en marche : met à l'échelle émission et durée de vie des particules d'échappement d'après le ratio de régime, anime les volets d'échappement, règle la densité du système d'effets, oriente et colore les mesh d'échappement via shader (voir module), puis gère l'affichage de la consommation, les sons d'embrayage et la serrure de contact. À noter : pour les particules, le code lit minScale/maxScale sur la liste spec.exhaustParticleSystems et appelle ParticleUtil.setEmitCountScale avec cette liste plutôt qu'avec le système courant, alors que minScale/maxScale sont stockés par système (lignes 1216-1219, loadExhaustEffects:1721-1722) ; apparent défaut, effet réel NON VÉRIFIÉ en jeu et le corps de ParticleUtil est absent du dump.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Motorized:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Charge les différentiels de la configuration choisie (indices d'essieux ou de roues, rapport de couple et de vitesse maximale) pour l'ajout ultérieur à la physique. Non relu en détail.
---@param xmlFile XMLFile
---@param configDifferentialIndex integer
function Motorized:loadDifferentials(xmlFile, configDifferentialIndex) end

--- Charge la configuration de moteur choisie : nom, type, consommables, régimes min/max, vitesses, accélération, freinage, courbes de couple/puissance, boîte de vitesses, groupes, rapports et amortissements, avec repli sur la configuration 0. Instancie le VehicleMotor. Non relu en détail (hors angle prioritaire).
---@param xmlFile XMLFile
---@param motorId integer
function Motorized:loadMotor(xmlFile, motorId) end

--- Charge une série de rapports de boîte depuis le XML (rapports, rapports max/min, vitesses), en tenant compte du régime max et du rapport de pont. Non relu en détail.
---@param xmlFile any
---@param gearName any
---@param key any
---@param motorMaxRpm any
---@param axleRatio any
---@param direction any
function Motorized:loadGears(xmlFile, gearName, key, motorMaxRpm, axleRatio, direction) end

--- Charge les groupes de rapports (gammes) de la boîte depuis le XML. Non relu en détail.
---@param xmlFile any
---@param key any
---@param motorMaxRpm any
---@param axleRatio any
function Motorized:loadGearGroups(xmlFile, key, motorMaxRpm, axleRatio) end

--- Charge, côté client, les trois familles d'effets d'échappement : systèmes de particules (avec minScale/maxScale), volets (exhaustFlap : nœud, rotation max, axe), mesh d'échappement I3D partagés (chargés en asynchrone, rappel onExhaustEffectI3DLoaded) et effets génériques via g_effectManager (type de remplissage inconnu). Conserve spec.exhaustEffectMaxSteeringSpeed = 0.001, qui n'est pas utilisé ailleurs dans ce fichier.
---@param xmlFile XMLFile
function Motorized:loadExhaustEffects(xmlFile) end

--- Rappel de chargement d'un mesh d'échappement : prend le premier enfant du I3D, ne le conserve que s'il possède le paramètre de shader « param », le relie au nœud d'ancrage du véhicule, le masque (visibilité faux au départ) et lit minRpmColor, maxRpmColor, minRpmScale, maxRpmScale et upFactor (valeurs par défaut dans le schéma : couleurs 0 0 0 1 et 0.0384 0.0359 0.0627 2.0 ; échelles 0.25 et 0.95 ; upFactor 0.75). À noter : le nœud est masqué ici et l'endroit où il est rendu visible n'est pas dans ce fichier (non vérifié).
---@param i3dNode any
---@param failedReason any
---@param args any
function Motorized:onExhaustEffectI3DLoaded(i3dNode, failedReason, args) end

--- Charge les échantillons sonores moteur, boîte, compresseur d'air, soupape de décharge, freins, marche arrière, et les paramètres de synthèse sonore. Non relu en détail.
---@param xmlFile XMLFile
---@param baseString any
function Motorized:loadSounds(xmlFile, baseString) end

--- Charge la configuration de consommables (clé consumerConfiguration) : liste des consommables avec type de remplissage, usage, consommation permanente, recharge d'air, et index par nom et par type.
---@param xmlFile any
---@param consumerIndex any
function Motorized:loadConsumerConfiguration(xmlFile, consumerIndex) end

--- Vrai uniquement si l'état moteur est ON (pas pendant STARTING).
---@return boolean
function Motorized:getIsMotorStarted() end

--- Interroge le VehicleMotor pour savoir si la boîte est au point mort.
---@return boolean
function Motorized:getIsMotorInNeutral() end

--- Faux si un réservoir indispensable est vide ou si le VehicleMotor refuse de tourner (embrayage non enclenché par exemple).
function Motorized:getCanMotorRun() end

--- Indique si le moteur doit s'arrêter à la sortie du véhicule : option de la configuration et aucune demande de puissance externe (getRequiresPower).
function Motorized:getStopMotorOnLeave() end

--- Renvoie le texte d'avertissement à afficher (réservoir vide ou embrayage non enclenché), sinon nil.
function Motorized:getMotorNotAllowedWarning() end

--- Si le moteur est OFF ou IGNITION : envoie MotorSetTurnedOnEvent(vrai) sauf si noEventSend, puis passe à STARTING.
---@param noEventSend boolean
function Motorized:startMotor(noEventSend) end

--- Si le moteur est ON ou STARTING : envoie MotorSetTurnedOnEvent(faux) sauf si noEventSend, puis passe à OFF.
---@param noEventSend boolean
function Motorized:stopMotor(noEventSend) end

--- Serveur uniquement. Calcule un facteur de consommation à partir du régime, de la charge lissée, du réglage de consommation de la sauvegarde (bas 1.0, moyen 1.5, haut 2.5) et des dégâts, retire du carburant (stat « fuelUsage », rachat automatique pour l'IA si l'option est active), expose la consommation horaire (spec.lastFuelUsage) et gère la consommation et la recharge d'air des freins.
---@param dt any
---@param accInput any
function Motorized:updateConsumers(dt, accInput) end

--- Serveur uniquement. Échauffement proportionnel à dt, modulé par la charge brute et le régime ; refroidissement par le vent proportionnel au carré de min(1, vitesse/30) ; ventilateur qui s'active au-dessus de 95 °C et se coupe sous 85 °C. Température bornée entre 20 et 120 °C. Appelée seulement moteur démarrant ou en marche : aucune décroissance à l'arrêt n'est codée ici (le moteur éteint ne refroidit pas, d'après ce fichier).
---@param dt any
function Motorized:updateMotorTemperature(dt) end

--- Serveur : lève le drapeau réseau de boîte. Client : met à jour les valeurs de tableau de bord « gear » et « gearIndex ».
---@param direction any
function Motorized:onGearDirectionChanged(direction) end

--- Anime les leviers de vitesses vers le rapport cible et met à jour sons et tableau de bord côté client. Non relu en détail.
---@param gear any
---@param targetGear any
---@param changeTime any
---@param previousGear any
function Motorized:onGearChanged(gear, targetGear, changeTime, previousGear) end

--- Équivalent d'onGearChanged pour les groupes de rapports. Non relu en détail.
---@param targetGroup any
---@param changeTime any
function Motorized:onGearGroupChanged(targetGroup, changeTime) end

--- Joue ou arrête le son de soupape de décharge (turbo) selon l'état transmis par le moteur ; mémorise cet état.
---@param blowOffValveState any
function Motorized:onMotorBlowOffValveChanged(blowOffValveState) end

--- Gère le craquement d'embrayage : son, avertissement et animation des leviers vers la position neutre. Non relu en détail.
---@param isEvent any
---@param groupTransmission any
---@param gearIndex any
---@param groupIndex any
function Motorized:onClutchCreaking(isEvent, groupTransmission, gearIndex, groupIndex) end

--- En mode d'inversion manuel, envoie un MotorGearShiftEvent de type changement de direction au serveur.
function Motorized:onReverseDirectionChanged() end

--- Répercute les réglages de jeu (mode de changement de direction, mode de boîte) sur le moteur ; le mode de boîte est ignoré pour un véhicule conduit par l'IA.
---@param gameSettingId any
---@param state any
function Motorized:onVehicleSettingChanged(gameSettingId, state) end

--- Démarre le moteur sans événement réseau et force la boîte en mode automatique pour l'IA.
---@param job any
function Motorized:onAIJobStarted(job) end

--- Arrête le moteur sans événement réseau si personne n'est dans le véhicule, puis restaure le mode de boîte choisi.
---@param job any
function Motorized:onAIJobFinished(job) end

--- Renvoie l'objet VehicleMotor.
function Motorized:getMotor() end

--- Renvoie l'instant (temps de jeu en ms) où le moteur passera de STARTING à ON.
function Motorized:getMotorStartTime() end

--- Renvoie le type de moteur lu dans le XML (#type de la configuration).
function Motorized:getMotorType() end

--- Régime normalisé de 0 à 1 entre régime mini et maxi, d'après le régime modulé du moteur.
function Motorized:getMotorRpmPercentage() end

--- Régime modulé courant en tr/min (getLastModulatedMotorRpm du moteur).
function Motorized:getMotorRpmReal() end

--- Charge lissée du moteur (spec.smoothedLoadPercentage), calculée à chaque onUpdate sur tous les pairs.
function Motorized:getMotorLoadPercentage() end

--- Durée en secondes du dernier freinage utile au son d'air comprimé, 0 s'il n'y a pas d'échantillon correspondant.
function Motorized:getMotorBrakeTime() end

--- Renvoie l'état de la soupape de décharge mémorisé.
function Motorized:getMotorBlowOffValveState() end

--- Vitesse du différentiel en km/h (valeur absolue), utilisée par un modificateur de son ; journalise une erreur si le véhicule n'est pas motorisé.
function Motorized:getMotorDifferentialSpeed() end

--- Renvoie l'index d'unité de remplissage du consommable pour un type de remplissage donné (nil si absent).
---@param fillTypeIndex any
function Motorized:getConsumerFillUnitIndex(fillTypeIndex) end

--- Renvoie le champ usage du consommable AIR, ou 0 s'il n'existe pas (unité : litres par seconde, d'après l'usage dans updateConsumers ; non vérifié en jeu).
function Motorized:getAirConsumerUsage() end

--- Surcharge : prend le maximum entre la force de frein du véhicule et celle du moteur ; si maxBrakeForceMass est défini, interpole entre force min et max selon la masse totale.
---@param superFunc any
function Motorized:getBrakeForce(superFunc) end

--- Surcharge : lit en plus les attributs de groupe de tableau de bord isMotorStarting, isMotorRunning, electronicsStarting, electronicsStartingTime (2 par défaut) et electronicsRunning.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param group any
function Motorized:loadDashboardGroupFromXML(superFunc, xmlFile, key, group) end

--- Surcharge : active ou non un groupe de tableau de bord selon l'état du moteur et l'instant d'allumage de l'électronique.
---@param superFunc any
---@param group any
function Motorized:getIsDashboardGroupActive(superFunc, group) end

--- Surcharge : l'éclairage intérieur est actif dès que le moteur est en IGNITION, STARTING ou ON.
---@param superFunc any
function Motorized:getIsActiveForInteriorLights(superFunc) end

--- Surcharge : essuie-glaces inactifs quand le moteur est OFF.
---@param superFunc any
function Motorized:getIsActiveForWipers(superFunc) end

--- Surcharge : pas d'usure si le moteur ne tourne pas ni ne démarre.
---@param superFunc any
function Motorized:getUsageCausesDamage(superFunc) end

--- Surcharge : après l'ajout de base, côté serveur, déclare chaque différentiel au moteur physique du moteur, met à jour les propriétés moteur et remet les commandes à zéro.
---@param superFunc any
---@return boolean
function Motorized:addToPhysics(superFunc) end

--- Surcharge : côté serveur, retire tous les différentiels avant le retrait de base.
---@param superFunc any
function Motorized:removeFromPhysics(superFunc) end

--- Envoie au moteur physique (setMotorProperties) les régimes min/max en rad/s, l'inertie, les amortissements et les courbes de couple de la simulation Lua.
function Motorized:updateMotorProperties() end

--- Transmet à la physique (controlVehicle) pédale, vitesse max, accélération, bornes de régime, rapports et couple d'embrayage ; réveille l'objet physique endormi si l'un des paramètres a changé.
---@param acceleratorPedal any
---@param maxSpeed any
---@param maxAcceleration any
---@param minMotorRotSpeed any
---@param maxMotorRotSpeed any
---@param maxMotorRotAcceleration any
---@param minGearRatio any
---@param maxGearRatio any
---@param maxClutchTorque any
---@param neededPtoTorque any
function Motorized:controlVehicle(acceleratorPedal, maxSpeed, maxAcceleration, minMotorRotSpeed, maxMotorRotSpeed, maxMotorRotAcceleration, minGearRatio, maxGearRatio, maxClutchTorque, neededPtoTorque) end

--- Surcharge : un véhicule moteur est considéré en fonctionnement si le moteur est ON, en plus du résultat de base.
---@param superFunc any
---@return boolean
function Motorized:getIsOperating(superFunc) end

--- Surcharge : désactivation à la sortie seulement si le démarrage automatique est actif.
---@param superFunc any
---@return boolean
function Motorized:getDeactivateOnLeave(superFunc) end

--- Surcharge : renvoie le résultat de base seulement si le démarrage automatique est actif et si le véhicule n'a pas de demande de puissance (getRequiresPower) ; sinon faux.
---@param superFunc any
---@return boolean
function Motorized:getDeactivateLightsOnLeave(superFunc) end

--- Enregistre les actions d'entrée (démarrage moteur, changement de rapport, groupe, direction, embrayage) pour le véhicule actif.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Motorized:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Rappel d'entrée : monte ou descend un rapport (boîte manuelle).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventShiftGear(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : sélection directe d'un rapport.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventSelectGear(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : change de groupe de rapports.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventShiftGroup(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : sélection directe d'un groupe.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventSelectGroup(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : inversion du sens de marche.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventDirectionChange(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : pédale d'embrayage (analogique).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventClutch(self, actionName, inputValue, callbackState, isAnalog) end

--- Met à jour l'activité et le texte des actions d'entrée selon l'état moteur et le mode de boîte.
---@param self any
function Motorized.updateActionEvents(self) end

--- Indique si la distance parcourue doit être comptée dans les statistiques de ferme.
function Motorized:getTraveledDistanceStatsActive() end

--- Lance l'animation des leviers de vitesses vers un rapport et/ou un groupe sur la durée donnée.
---@param gear any
---@param group any
---@param time any
---@param isResetPosition any
function Motorized:setGearLeversState(gear, group, time, isResetPosition) end

--- Construit la séquence d'interpolations de rotation d'un levier de vitesses vers un état cible.
---@param gearLever any
---@param state any
---@param time any
---@param isResetPosition any
function Motorized:generateShiftAnimation(gearLever, state, time, isResetPosition) end

--- Renvoie le texte du rapport, du groupe et la direction à afficher dans l'interface.
---@return string
---@return string
function Motorized:getGearInfoToDisplay() end

--- Change le sens de marche de la boîte (avant/arrière).
---@param direction integer
function Motorized:setTransmissionDirection(direction) end

--- Renvoie le mode de changement de direction (automatique ou manuel).
---@return directionChangeMode
function Motorized:getDirectionChangeMode() end

--- Indique si l'inversion manuelle est autorisée.
---@return boolean
function Motorized:getIsManualDirectionChangeAllowed() end

--- Indique si l'inversion manuelle est en vigueur.
---@return boolean
function Motorized:getIsManualDirectionChangeActive() end

--- Renvoie le mode de changement de vitesse (automatique, manuel).
---@return gearShiftMode
function Motorized:getGearShiftMode() end

--- Entrée dans le véhicule : démarre le moteur si le démarrage automatique est actif et si aucune serrure de contact n'est utilisée. Sortie : arrête le moteur si requis, puis immobilise le véhicule (stopVehicle).
---@param state any
---@param vehicle any
---@param isControlling any
function Motorized:onStateChange(state, vehicle, isControlling) end

--- Serveur : envoie à la physique des commandes nulles (pédale 0, vitesse 0).
function Motorized:stopVehicle() end

--- Quand du diesel est ajouté, recharge proportionnellement le réservoir de DEF s'il existe.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Motorized:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

--- Arrête le moteur sans événement réseau lorsque le véhicule est déclaré en panne.
function Motorized:onSetBroken() end

--- Surcharge : renvoie le nom lié à la configuration moteur (vehicleName) s'il est défini, sinon le nom de base.
---@param superFunc any
function Motorized:getName(superFunc) end

--- Surcharge : si le démarrage automatique est désactivé, un véhicule est sélectionnable dès qu'un véhicule motorisé existe dans la chaîne attelée (pour pouvoir allumer ou éteindre ce moteur) ; sinon résultat de base.
---@param superFunc any
function Motorized:getCanBeSelected(superFunc) end

--- Surcharge : un outil est alimenté si ce véhicule ou un autre véhicule de la chaîne attelée a un moteur en STARTING/ON ; sinon renvoie l'avertissement correspondant.
---@param superFunc any
function Motorized:getIsPowered(superFunc) end

--- Tente de démarrer chaque moteur capable de tourner dans la chaîne de véhicules attelés.
---@param vehicle table
function Motorized.tryStartMotor(vehicle) end

--- Rappel d'entrée : démarre ou arrête le moteur (basculement).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventToggleMotorState(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : met le contact (IGNITION) sans démarrer.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventSetMotorStateIgnition(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : démarre le moteur.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventSetMotorStateOn(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : arrête le moteur.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventSetMotorStateOff(self, actionName, inputValue, callbackState, isAnalog) end

--- Lit les données de carburant du store (type, capacité) depuis le XML du véhicule. Non relu en détail.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Motorized.loadSpecValueFuel(xmlFile, customEnvironment, baseDir) end

--- Valeur de spécification du store : diesel.
---@param storeItem any
---@param realItem any
---@param configurations any
function Motorized.getSpecValueFuelDiesel(storeItem, realItem, configurations) end

--- Valeur de spécification du store : charge électrique.
---@param storeItem any
---@param realItem any
---@param configurations any
function Motorized.getSpecValueFuelElectricCharge(storeItem, realItem, configurations) end

--- Valeur de spécification du store : méthane.
---@param storeItem any
---@param realItem any
---@param configurations any
function Motorized.getSpecValueFuelMethane(storeItem, realItem, configurations) end

--- Calcule le texte/valeur de carburant pour le store selon le type de remplissage demandé.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param fillTypeFilter any
---@param returnValue any
function Motorized.getSpecValueFuel(storeItem, realItem, configurations, fillTypeFilter, returnValue) end

--- Lit la vitesse maximale du store depuis le XML. Non relu en détail.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Motorized.loadSpecValueMaxSpeed(xmlFile, customEnvironment, baseDir) end

--- Calcule la vitesse maximale pour le store selon la configuration (bornes ou valeur).
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Motorized.getSpecValueMaxSpeed(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Lit la puissance indiquée dans vehicle.storeData.specs.power.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Motorized.loadSpecValuePower(xmlFile, customEnvironment, baseDir) end

--- Calcule la puissance min/max pour le store en fonction de la configuration de moteur choisie.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Motorized.getSpecValuePower(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Lit les informations de transmission du store. Non relu en détail.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Motorized.loadSpecValueTransmission(xmlFile, customEnvironment, baseDir) end

--- Calcule le texte de transmission pour le store. Non relu en détail.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Motorized.getSpecValueTransmission(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
