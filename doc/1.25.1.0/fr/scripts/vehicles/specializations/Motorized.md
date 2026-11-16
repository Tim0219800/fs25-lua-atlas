# vehicles/specializations/Motorized.lua

*[English version](../../../../scripts/vehicles/specializations/Motorized.md)*

Source: `dataS/scripts/vehicles/specializations/Motorized.lua` — FS25 1.25.1.0

✍ Spécialisation des véhicules à moteur (table spec_motorized). Prérequis : FillUnit et VehicleSettings. Elle porte le moteur de simulation (objet VehicleMotor, hors périmètre), les différentiels, les boîtes de vitesses, les consommables (diesel, DEF, électricité, méthane, air), la température moteur, les sons, les tableaux de bord et les effets d'échappement.

EFFETS D'ÉCHAPPEMENT (client uniquement : loadExhaustEffects n'est appelée que si self.isClient, Motorized.lua:410-412). Trois mécanismes coexistent. (1) exhaustParticleSystems : systèmes de particules chargés par ParticleUtil.loadParticleSystem depuis vehicle.motorized.exhaustParticleSystems.exhaustParticleSystem(?), avec minScale (0.5 par défaut) et maxScale (1). (2) exhaustEffects : mesh I3D partagé chargé en asynchrone, qui doit exposer le paramètre de shader « param » (sinon ignoré) ; à chaque tick client, onUpdateTick calcule l'inclinaison du panache d'après le déplacement du point d'émission (effet « traîné » par la vitesse du véhicule, pas par le vent : aucune lecture de vent dans ce fichier), lisse avec un facteur 0.95/0.05, puis envoie via setShaderParameter la taille (interpolée minRpmScale 0.25 / maxRpmScale 0.95 selon le régime) et la couleur « exhaustColor » (interpolée minRpmColor / maxRpmColor). (3) effects : système d'effets générique (g_effectManager, classes d'effets ABSENTES du dump : comportement NON VÉRIFIÉ) dont la densité est réglée sur le ratio de régime. Les volets d'échappement (exhaustFlap) sont des nœuds pivotés avec un bruit aléatoire de ±0.1 sur le ratio de régime.

DONNÉES MOTEUR POUR UN MOD. getMotorRpmReal (tr/min modulés), getMotorRpmPercentage (0..1), getMotorLoadPercentage (charge lissée, de -1 à 1 environ ; la valeur brute est spec.actualLoadPercentage, bornée 0..1, calculée côté serveur), getMotorState (MotorState.OFF / IGNITION / STARTING / ON). Côté réseau : le serveur envoie au client, dans le flux de mise à jour, le régime (11 bits), la charge (7 bits) et l'embrayage ; le client reconstitue donc régime et charge, d'où les effets d'échappement corrects en multijoueur. En revanche la température moteur (spec_motorized.motorTemperature, 20 à 120 °C, ventilateur entre 85 et 95 °C) n'est mise à jour que sur le serveur (updateMotorTemperature appelée dans le bloc isServer d'onUpdateTick) et aucun envoi réseau n'apparaît dans ce fichier (le champ valueSend n'est jamais utilisé) : à noter, la température lue sur un client pur semble donc figée à 20 °C (non vérifié en jeu). Aucun lien code entre cette température et les particules d'échappement n'existe dans ce fichier.

DT ET TEMPS : onUpdate et onUpdateTick reçoivent dt en ms ; la température et les consommations sont proportionnelles à dt (heatingPerMS, coolingByWindPerMS, coolingPerMS). Le lissage du panache d'échappement (0.95/0.05) est par tick et non par dt : sa vitesse dépend donc de la fréquence des ticks (à noter, non vérifié en jeu).

POINTS D'EXTENSION. Événements déclarés (SpecializationUtil.registerEvent) : onStartMotor, onStopMotor, onGearDirectionChanged, onGearChanged, onGearGroupChanged, onMotorBlowOffValveChanged, onClutchCreaking. Fonctions surchargeables par registerOverwrittenFunction (déjà surchargées ici) : getBrakeForce, addToPhysics, removeFromPhysics, getIsOperating, getDeactivateOnLeave, getDeactivateLightsOnLeave, loadDashboardGroupFromXML, getIsDashboardGroupActive, getIsActiveForInteriorLights, getIsActiveForWipers, getUsageCausesDamage, getName, getCanBeSelected, getIsPowered. Pour réagir au démarrage/arrêt, écouter onStartMotor / onStopMotor (émis ailleurs, dans setMotorState dont le corps est absent du dump).

LIMITE DU DUMP : les fonctions setMotorState et getMotorState sont enregistrées (lignes 281-282) mais leurs définitions n'apparaissent pas ; les lignes 2012 à 2150 du fichier sont vides. Leur comportement est donc NON VÉRIFIÉ ici. La table VehicleMotor, MotorState, MotorSetTurnedOnEvent et g_effectManager ne sont pas dans ce fichier.

- **Motorized** (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Motorized.initSpecialization()` | 23 | ✍ Déclare les schémas XML de la spécialisation : chemins moteur, différentiels, consommables, sons, boîtes, configurations de moteur, effets d'échappement (exhaustParticleSystems, exhaustEffects, exhaustFlap, effects), tableaux de bord et valeurs de store. Réservé à l'initialisation des types de véhicules. |
| `Motorized.registerMotorXMLPaths(schema: any, baseKey: any)` | 125 | ✍ Enregistre dans le schéma XML les clés d'une configuration de moteur (régimes, vitesses max, couple, freinage, courbes, etc.). Non relu ligne à ligne. |
| `Motorized.registerDifferentialXMLPaths(schema: any, baseKey: any)` | 202 | ✍ Enregistre les clés XML des différentiels (indices, rapport de couple, rapport de vitesse max). |
| `Motorized.registerConsumerXMLPaths(schema: any, baseKey: any)` | 214 | ✍ Enregistre les clés XML d'un consommable (type de remplissage, usage, capacité, recharge pour l'air). |
| `Motorized.registerSoundXMLPaths(schema: any, baseKey: any)` | 227 | ✍ Enregistre les clés XML des sons moteur, boîte, compresseur d'air, clutch, soupape de décharge, marche arrière, etc. |
| `Motorized.prerequisitesPresent(specializations: any)` | 254 | ✍ Exige les spécialisations FillUnit et VehicleSettings sur le type de véhicule. |
| `Motorized.registerEvents(vehicleType: any)` | 260 | ✍ Déclare les événements onStartMotor, onStopMotor, onGearDirectionChanged, onGearChanged, onGearGroupChanged, onMotorBlowOffValveChanged et onClutchCreaking, que d'autres spécialisations ou mods peuvent écouter. |
| `Motorized.registerFunctions(vehicleType: any)` | 272 | ✍ Enregistre les fonctions publiques du véhicule (chargement, getters moteur, régime, charge, température, boîte, start/stop). Note : y figurent setMotorState et getMotorState dont les définitions sont absentes du dump. |
| `Motorized.registerOverwrittenFunctions(vehicleType: any)` | 318 | ✍ Surcharge quatorze fonctions de base du véhicule (frein, physique, état opérationnel, tableau de bord, essuie-glaces, éclairage intérieur, usure, nom, sélection, alimentation). |
| `Motorized.registerEventListeners(vehicleType: any)` | 337 | ✍ Abonne la spécialisation aux événements du véhicule : cycle de vie (onLoad, onPostLoad, onDelete), flux réseau, onUpdate / onUpdateTick, onStateChange (entrée/sortie du véhicule), niveau des réservoirs, panne (onSetBroken), IA, réglages de boîte et événements propres de boîte. |
| `Motorized:onLoad(savegame: table)` | 366 | ✍ Chargement du véhicule : lit différentiels, moteur, sons, consommables, puis, côté client seulement, les effets d'échappement. Initialise l'état moteur (arrêté), la durée de démarrage (motorStartDuration), les paramètres de freinage, les leviers de vitesses, et la structure de température moteur (20 °C initial, 120 °C max, échauffement 1.5 °C/s à pleine charge, refroidissement par le vent 1 °C/s, ventilateur 85/95 °C, 3 °C/s). |
| `Motorized:onPostLoad(savegame: any)` | 571 | ✍ Côté serveur : recharge les consommables sous 10 % de capacité en facturant le coût au joueur (prix du litre multiplié par 2). Constitue la liste des réservoirs indispensables au fonctionnement (diesel, DEF, électricité, méthane) puis termine le chargement du moteur. |
| `Motorized:onRegisterDashboardValueTypes()` | 611 | ✍ Enregistre les valeurs de tableau de bord : régime (rpm), charge (load, en pourcentage), vitesse, consommation, température moteur et alerte de température, embrayage, rapport, groupe, etc. Utile pour savoir quelles grandeurs moteur sont déjà exposées et leurs plages. |
| `Motorized:onDelete()` | 785 | ✍ Libère le moteur, les fichiers I3D partagés des effets d'échappement, les systèmes de particules d'échappement (ParticleUtil.deleteParticleSystems), les sons, les animations et le système d'effets (g_effectManager:deleteEffects). |
| `Motorized:onReadStream(streamId: any, connection: any)` | 812 | ✍ Lecture réseau à la connexion : reçoit l'état moteur initial et l'applique par setMotorState sans renvoi. |
| `Motorized:onWriteStream(streamId: any, connection: any)` | 819 | ✍ Écriture réseau à la connexion : envoie l'état moteur courant. |
| `Motorized:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 825 | ✍ Lecture du flux de mise à jour. Côté client (flux venant du serveur) : régime égalisé en 11 bits, charge brute en 7 bits, état du compresseur et position de l'embrayage en 5 bits, puis données de boîte. Côté serveur (flux venant d'un client) : état d'embrayage seulement. |
| `Motorized:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 862 | ✍ Écriture du flux de mise à jour, symétrique de la lecture. Le serveur écrit régime, charge, compresseur, embrayage (uniquement si le moteur tourne ou démarre) et, si le drapeau sale est levé, les données de boîte. À noter : la température moteur n'est pas envoyée. |
| `Motorized:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 895 | ✍ Chaque frame, si le moteur démarre ou tourne : passe en ON après motorStartTime (serveur), met à jour le moteur (spec.motor:update(dt)), la charge brute (serveur) et la charge lissée (tous), met à jour consommables et propriétés moteur selon les dégâts (serveur), et côté client les paramètres de son (régime et charge normalisés), compresseur, freins, bip de marche arrière et leviers de vitesses animés avec dt. Cumule aussi la distance parcourue pour les statistiques (serveur). |
| `Motorized:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1113 | ✍ Tick de simulation. Serveur : arrêt automatique du moteur si aucun joueur ou véhicule occupé à moins de 250 m (quand le démarrage automatique est désactivé), appel d'updateMotorTemperature, logique de démarrage/arrêt automatique. Client, moteur en marche : met à l'échelle émission et durée de vie des particules d'échappement d'après le ratio de régime, anime les volets d'échappement, règle la densité du système d'effets, oriente et colore les mesh d'échappement via shader (voir module), puis gère l'affichage de la consommation, les sons d'embrayage et la serrure de contact. À noter : pour les particules, le code lit minScale/maxScale sur la liste spec.exhaustParticleSystems et appelle ParticleUtil.setEmitCountScale avec cette liste plutôt qu'avec le système courant, alors que minScale/maxScale sont stockés par système (lignes 1216-1219, loadExhaustEffects:1721-1722) ; apparent défaut, effet réel NON VÉRIFIÉ en jeu et le corps de ParticleUtil est absent du dump. |
| `Motorized:loadDifferentials(xmlFile: XMLFile, configDifferentialIndex: integer)` | 1368 | ✍ Charge les différentiels de la configuration choisie (indices d'essieux ou de roues, rapport de couple et de vitesse maximale) pour l'ajout ultérieur à la physique. Non relu en détail. |
| `Motorized:loadMotor(xmlFile: XMLFile, motorId: integer)` | 1424 | ✍ Charge la configuration de moteur choisie : nom, type, consommables, régimes min/max, vitesses, accélération, freinage, courbes de couple/puissance, boîte de vitesses, groupes, rapports et amortissements, avec repli sur la configuration 0. Instancie le VehicleMotor. Non relu en détail (hors angle prioritaire). |
| `Motorized:loadGears(xmlFile: any, gearName: any, key: any, motorMaxRpm: any, axleRatio: any, direction: any)` | 1596 | ✍ Charge une série de rapports de boîte depuis le XML (rapports, rapports max/min, vitesses), en tenant compte du régime max et du rapport de pont. Non relu en détail. |
| `Motorized:loadGearGroups(xmlFile: any, key: any, motorMaxRpm: any, axleRatio: any)` | 1658 | ✍ Charge les groupes de rapports (gammes) de la boîte depuis le XML. Non relu en détail. |
| `Motorized:loadExhaustEffects(xmlFile: XMLFile)` | 1713 | ✍ Charge, côté client, les trois familles d'effets d'échappement : systèmes de particules (avec minScale/maxScale), volets (exhaustFlap : nœud, rotation max, axe), mesh d'échappement I3D partagés (chargés en asynchrone, rappel onExhaustEffectI3DLoaded) et effets génériques via g_effectManager (type de remplissage inconnu). Conserve spec.exhaustEffectMaxSteeringSpeed = 0.001, qui n'est pas utilisé ailleurs dans ce fichier. |
| `Motorized:onExhaustEffectI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 1783 | ✍ Rappel de chargement d'un mesh d'échappement : prend le premier enfant du I3D, ne le conserve que s'il possède le paramètre de shader « param », le relie au nœud d'ancrage du véhicule, le masque (visibilité faux au départ) et lit minRpmColor, maxRpmColor, minRpmScale, maxRpmScale et upFactor (valeurs par défaut dans le schéma : couleurs par défaut : noir pour le min, un bleu sombre avec alpha 2.0 pour le max ; échelles 0.25 et 0.95 ; upFactor 0.75). À noter : le nœud est masqué ici et l'endroit où il est rendu visible n'est pas dans ce fichier (non vérifié). |
| `Motorized:loadSounds(xmlFile: XMLFile, baseString: any)` | 1819 | ✍ Charge les échantillons sonores moteur, boîte, compresseur d'air, soupape de décharge, freins, marche arrière, et les paramètres de synthèse sonore. Non relu en détail. |
| `Motorized:loadConsumerConfiguration(xmlFile: any, consumerIndex: any)` | 1873 | ✍ Charge la configuration de consommables (clé consumerConfiguration) : liste des consommables avec type de remplissage, usage, consommation permanente, recharge d'air, et index par nom et par type. |
| `Motorized:getIsMotorStarted() → boolean` | 1952 | ✍ Vrai uniquement si l'état moteur est ON (pas pendant STARTING). |
| `Motorized:getIsMotorInNeutral() → boolean` | 1959 | ✍ Interroge le VehicleMotor pour savoir si la boîte est au point mort. |
| `Motorized:getCanMotorRun()` | 1969 | ✍ Faux si un réservoir indispensable est vide ou si le VehicleMotor refuse de tourner (embrayage non enclenché par exemple). |
| `Motorized:getStopMotorOnLeave()` | 1987 | ✍ Indique si le moteur doit s'arrêter à la sortie du véhicule : option de la configuration et aucune demande de puissance externe (getRequiresPower). |
| `Motorized:getMotorNotAllowedWarning()` | 1993 | ✍ Renvoie le texte d'avertissement à afficher (réservoir vide ou embrayage non enclenché), sinon nil. |
| `Motorized:startMotor(noEventSend: boolean)` | 2152 | ✍ Si le moteur est OFF ou IGNITION : envoie MotorSetTurnedOnEvent(vrai) sauf si noEventSend, puis passe à STARTING. |
| `Motorized:stopMotor(noEventSend: boolean)` | 2163 | ✍ Si le moteur est ON ou STARTING : envoie MotorSetTurnedOnEvent(faux) sauf si noEventSend, puis passe à OFF. |
| `Motorized:updateConsumers(dt: any, accInput: any)` | 2173 | ✍ Serveur uniquement. Calcule un facteur de consommation à partir du régime, de la charge lissée, du réglage de consommation de la sauvegarde (bas 1.0, moyen 1.5, haut 2.5) et des dégâts, retire du carburant (stat « fuelUsage », rachat automatique pour l'IA si l'option est active), expose la consommation horaire (spec.lastFuelUsage) et gère la consommation et la recharge d'air des freins. |
| `Motorized:updateMotorTemperature(dt: any)` | 2280 | ✍ Serveur uniquement. Échauffement proportionnel à dt, modulé par la charge brute et le régime ; refroidissement par le vent proportionnel au carré de min(1, vitesse/30) ; ventilateur qui s'active au-dessus de 95 °C et se coupe sous 85 °C. Température bornée entre 20 et 120 °C. Appelée seulement moteur démarrant ou en marche : aucune décroissance à l'arrêt n'est codée ici (le moteur éteint ne refroidit pas, d'après ce fichier). |
| `Motorized:onGearDirectionChanged(direction: any)` | 2310 | ✍ Serveur : lève le drapeau réseau de boîte. Client : met à jour les valeurs de tableau de bord « gear » et « gearIndex ». |
| `Motorized:onGearChanged(gear: any, targetGear: any, changeTime: any, previousGear: any)` | 2325 | ✍ Anime les leviers de vitesses vers le rapport cible et met à jour sons et tableau de bord côté client. Non relu en détail. |
| `Motorized:onGearGroupChanged(targetGroup: any, changeTime: any)` | 2366 | ✍ Équivalent d'onGearChanged pour les groupes de rapports. Non relu en détail. |
| `Motorized:onMotorBlowOffValveChanged(blowOffValveState: any)` | 2390 | ✍ Joue ou arrête le son de soupape de décharge (turbo) selon l'état transmis par le moteur ; mémorise cet état. |
| `Motorized:onClutchCreaking(isEvent: any, groupTransmission: any, gearIndex: any, groupIndex: any)` | 2408 | ✍ Gère le craquement d'embrayage : son, avertissement et animation des leviers vers la position neutre. Non relu en détail. |
| `Motorized:onReverseDirectionChanged()` | 2442 | ✍ En mode d'inversion manuel, envoie un MotorGearShiftEvent de type changement de direction au serveur. |
| `Motorized:onVehicleSettingChanged(gameSettingId: any, state: any)` | 2450 | ✍ Répercute les réglages de jeu (mode de changement de direction, mode de boîte) sur le moteur ; le mode de boîte est ignoré pour un véhicule conduit par l'IA. |
| `Motorized:onAIJobStarted(job: any)` | 2477 | ✍ Démarre le moteur sans événement réseau et force la boîte en mode automatique pour l'IA. |
| `Motorized:onAIJobFinished(job: any)` | 2488 | ✍ Arrête le moteur sans événement réseau si personne n'est dans le véhicule, puis restaure le mode de boîte choisi. |
| `Motorized:getMotor()` | 2502 | ✍ Renvoie l'objet VehicleMotor. |
| `Motorized:getMotorStartTime()` | 2508 | ✍ Renvoie l'instant (temps de jeu en ms) où le moteur passera de STARTING à ON. |
| `Motorized:getMotorType()` | 2514 | ✍ Renvoie le type de moteur lu dans le XML (#type de la configuration). |
| `Motorized:getMotorRpmPercentage()` | 2520 | ✍ Régime normalisé de 0 à 1 entre régime mini et maxi, d'après le régime modulé du moteur. |
| `Motorized:getMotorRpmReal()` | 2528 | ✍ Régime modulé courant en tr/min (getLastModulatedMotorRpm du moteur). |
| `Motorized:getMotorLoadPercentage()` | 2535 | ✍ Charge lissée du moteur (spec.smoothedLoadPercentage), calculée à chaque onUpdate sur tous les pairs. |
| `Motorized:getMotorBrakeTime()` | 2542 | ✍ Durée en secondes du dernier freinage utile au son d'air comprimé, 0 s'il n'y a pas d'échantillon correspondant. |
| `Motorized:getMotorBlowOffValveState()` | 2554 | ✍ Renvoie l'état de la soupape de décharge mémorisé. |
| `Motorized:getMotorDifferentialSpeed()` | 2561 | ✍ Vitesse du différentiel en km/h (valeur absolue), utilisée par un modificateur de son ; journalise une erreur si le véhicule n'est pas motorisé. |
| `Motorized:getConsumerFillUnitIndex(fillTypeIndex: any)` | 2572 | ✍ Renvoie l'index d'unité de remplissage du consommable pour un type de remplissage donné (nil si absent). |
| `Motorized:getAirConsumerUsage()` | 2584 | ✍ Renvoie le champ usage du consommable AIR, ou 0 s'il n'existe pas (unité : litres par seconde, d'après l'usage dans updateConsumers ; non vérifié en jeu). |
| `Motorized:getBrakeForce(superFunc: any)` | 2593 | ✍ Surcharge : prend le maximum entre la force de frein du véhicule et celle du moteur ; si maxBrakeForceMass est défini, interpole entre force min et max selon la masse totale. |
| `Motorized:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 2612 | ✍ Surcharge : lit en plus les attributs de groupe de tableau de bord isMotorStarting, isMotorRunning, electronicsStarting, electronicsStartingTime (2 par défaut) et electronicsRunning. |
| `Motorized:getIsDashboardGroupActive(superFunc: any, group: any)` | 2629 | ✍ Surcharge : active ou non un groupe de tableau de bord selon l'état du moteur et l'instant d'allumage de l'électronique. |
| `Motorized:getIsActiveForInteriorLights(superFunc: any)` | 2674 | ✍ Surcharge : l'éclairage intérieur est actif dès que le moteur est en IGNITION, STARTING ou ON. |
| `Motorized:getIsActiveForWipers(superFunc: any)` | 2685 | ✍ Surcharge : essuie-glaces inactifs quand le moteur est OFF. |
| `Motorized:getUsageCausesDamage(superFunc: any)` | 2696 | ✍ Surcharge : pas d'usure si le moteur ne tourne pas ni ne démarre. |
| `Motorized:addToPhysics(superFunc: any) → boolean` | 2708 | ✍ Surcharge : après l'ajout de base, côté serveur, déclare chaque différentiel au moteur physique du moteur, met à jour les propriétés moteur et remet les commandes à zéro. |
| `Motorized:removeFromPhysics(superFunc: any)` | 2751 | ✍ Surcharge : côté serveur, retire tous les différentiels avant le retrait de base. |
| `Motorized:updateMotorProperties()` | 2771 | ✍ Envoie au moteur physique (setMotorProperties) les régimes min/max en rad/s, l'inertie, les amortissements et les courbes de couple de la simulation Lua. |
| `Motorized:controlVehicle(acceleratorPedal: any, maxSpeed: any, maxAcceleration: any, minMotorRotSpeed: any, maxMotorRotSpeed: any, maxMotorRotAcceleration: any, minGearRatio: any, maxGearRatio: any, maxClutchTorque: any, neededPtoTorque: any)` | 2781 | ✍ Transmet à la physique (controlVehicle) pédale, vitesse max, accélération, bornes de régime, rapports et couple d'embrayage ; réveille l'objet physique endormi si l'un des paramètres a changé. |
| `Motorized:getIsOperating(superFunc: any) → boolean` | 2818 | ✍ Surcharge : un véhicule moteur est considéré en fonctionnement si le moteur est ON, en plus du résultat de base. |
| `Motorized:getDeactivateOnLeave(superFunc: any) → boolean` | 2826 | ✍ Surcharge : désactivation à la sortie seulement si le démarrage automatique est actif. |
| `Motorized:getDeactivateLightsOnLeave(superFunc: any) → boolean` | 2834 | ✍ Surcharge : renvoie le résultat de base seulement si le démarrage automatique est actif et si le véhicule n'a pas de demande de puissance (getRequiresPower) ; sinon faux. |
| `Motorized:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 2841 | ✍ Enregistre les actions d'entrée (démarrage moteur, changement de rapport, groupe, direction, embrayage) pour le véhicule actif. |
| `Motorized.actionEventShiftGear(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2925 | ✍ Rappel d'entrée : monte ou descend un rapport (boîte manuelle). |
| `Motorized.actionEventSelectGear(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2935 | ✍ Rappel d'entrée : sélection directe d'un rapport. |
| `Motorized.actionEventShiftGroup(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2953 | ✍ Rappel d'entrée : change de groupe de rapports. |
| `Motorized.actionEventSelectGroup(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2963 | ✍ Rappel d'entrée : sélection directe d'un groupe. |
| `Motorized.actionEventDirectionChange(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2981 | ✍ Rappel d'entrée : inversion du sens de marche. |
| `Motorized.actionEventClutch(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2993 | ✍ Rappel d'entrée : pédale d'embrayage (analogique). |
| `Motorized.updateActionEvents(self: any)` | 3010 | ✍ Met à jour l'activité et le texte des actions d'entrée selon l'état moteur et le mode de boîte. |
| `Motorized:getTraveledDistanceStatsActive()` | 3052 | ✍ Indique si la distance parcourue doit être comptée dans les statistiques de ferme. |
| `Motorized:setGearLeversState(gear: any, group: any, time: any, isResetPosition: any)` | 3058 | ✍ Lance l'animation des leviers de vitesses vers un rapport et/ou un groupe sur la durée donnée. |
| `Motorized:generateShiftAnimation(gearLever: any, state: any, time: any, isResetPosition: any)` | 3072 | ✍ Construit la séquence d'interpolations de rotation d'un levier de vitesses vers un état cible. |
| `Motorized:getGearInfoToDisplay() → string, string` | 3192 | ✍ Renvoie le texte du rapport, du groupe et la direction à afficher dans l'interface. |
| `Motorized:setTransmissionDirection(direction: integer)` | 3219 | ✍ Change le sens de marche de la boîte (avant/arrière). |
| `Motorized:getDirectionChangeMode() → directionChangeMode` | 3229 | ✍ Renvoie le mode de changement de direction (automatique ou manuel). |
| `Motorized:getIsManualDirectionChangeAllowed() → boolean` | 3236 | ✍ Indique si l'inversion manuelle est autorisée. |
| `Motorized:getIsManualDirectionChangeActive() → boolean` | 3243 | ✍ Indique si l'inversion manuelle est en vigueur. |
| `Motorized:getGearShiftMode() → gearShiftMode` | 3255 | ✍ Renvoie le mode de changement de vitesse (automatique, manuel). |
| `Motorized:onStateChange(state: any, vehicle: any, isControlling: any)` | 3261 | ✍ Entrée dans le véhicule : démarre le moteur si le démarrage automatique est actif et si aucune serrure de contact n'est utilisée. Sortie : arrête le moteur si requis, puis immobilise le véhicule (stopVehicle). |
| `Motorized:stopVehicle()` | 3282 | ✍ Serveur : envoie à la physique des commandes nulles (pédale 0, vitesse 0). |
| `Motorized:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 3293 | ✍ Quand du diesel est ajouté, recharge proportionnellement le réservoir de DEF s'il existe. |
| `Motorized:onSetBroken()` | 3307 | ✍ Arrête le moteur sans événement réseau lorsque le véhicule est déclaré en panne. |
| `Motorized:getName(superFunc: any)` | 3313 | ✍ Surcharge : renvoie le nom lié à la configuration moteur (vehicleName) s'il est défini, sinon le nom de base. |
| `Motorized:getCanBeSelected(superFunc: any)` | 3323 | ✍ Surcharge : si le démarrage automatique est désactivé, un véhicule est sélectionnable dès qu'un véhicule motorisé existe dans la chaîne attelée (pour pouvoir allumer ou éteindre ce moteur) ; sinon résultat de base. |
| `Motorized:getIsPowered(superFunc: any)` | 3340 | ✍ Surcharge : un outil est alimenté si ce véhicule ou un autre véhicule de la chaîne attelée a un moteur en STARTING/ON ; sinon renvoie l'avertissement correspondant. |
| `Motorized.tryStartMotor(vehicle: table)` | 3371 | ✍ Tente de démarrer chaque moteur capable de tourner dans la chaîne de véhicules attelés. |
| `Motorized.actionEventToggleMotorState(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3383 | ✍ Rappel d'entrée : démarre ou arrête le moteur (basculement). |
| `Motorized.actionEventSetMotorStateIgnition(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3403 | ✍ Rappel d'entrée : met le contact (IGNITION) sans démarrer. |
| `Motorized.actionEventSetMotorStateOn(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3414 | ✍ Rappel d'entrée : démarre le moteur. |
| `Motorized.actionEventSetMotorStateOff(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3432 | ✍ Rappel d'entrée : arrête le moteur. |
| `Motorized.loadSpecValueFuel(xmlFile: any, customEnvironment: any, baseDir: any)` | 3443 | ✍ Lit les données de carburant du store (type, capacité) depuis le XML du véhicule. Non relu en détail. |
| `Motorized.getSpecValueFuelDiesel(storeItem: any, realItem: any, configurations: any)` | 3513 | ✍ Valeur de spécification du store : diesel. |
| `Motorized.getSpecValueFuelElectricCharge(storeItem: any, realItem: any, configurations: any)` | 3519 | ✍ Valeur de spécification du store : charge électrique. |
| `Motorized.getSpecValueFuelMethane(storeItem: any, realItem: any, configurations: any)` | 3525 | ✍ Valeur de spécification du store : méthane. |
| `Motorized.getSpecValueFuel(storeItem: any, realItem: any, configurations: any, fillTypeFilter: any, returnValue: any)` | 3531 | ✍ Calcule le texte/valeur de carburant pour le store selon le type de remplissage demandé. |
| `Motorized.loadSpecValueMaxSpeed(xmlFile: any, customEnvironment: any, baseDir: any)` | 3653 | ✍ Lit la vitesse maximale du store depuis le XML. Non relu en détail. |
| `Motorized.getSpecValueMaxSpeed(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 3692 | ✍ Calcule la vitesse maximale pour le store selon la configuration (bornes ou valeur). |
| `Motorized.loadSpecValuePower(xmlFile: any, customEnvironment: any, baseDir: any)` | 3724 | ✍ Lit la puissance indiquée dans vehicle.storeData.specs.power. |
| `Motorized.getSpecValuePower(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 3730 | ✍ Calcule la puissance min/max pour le store en fonction de la configuration de moteur choisie. |
| `Motorized.loadSpecValueTransmission(xmlFile: any, customEnvironment: any, baseDir: any)` | 3832 | ✍ Lit les informations de transmission du store. Non relu en détail. |
| `Motorized.getSpecValueTransmission(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 3848 | ✍ Calcule le texte de transmission pour le store. Non relu en détail. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onStartMotor` | 261 |
| registerEvent | `onStopMotor` | 262 |
| registerEvent | `onGearDirectionChanged` | 263 |
| registerEvent | `onGearChanged` | 264 |
| registerEvent | `onGearGroupChanged` | 265 |
| registerEvent | `onMotorBlowOffValveChanged` | 266 |
| registerEvent | `onClutchCreaking` | 267 |
| registerFunction | `loadDifferentials` | 273 |
| registerFunction | `loadMotor` | 274 |
| registerFunction | `loadGears` | 275 |
| registerFunction | `loadGearGroups` | 276 |
| registerFunction | `loadExhaustEffects` | 277 |
| registerFunction | `onExhaustEffectI3DLoaded` | 278 |
| registerFunction | `loadSounds` | 279 |
| registerFunction | `loadConsumerConfiguration` | 280 |
| registerFunction | `setMotorState` | 281 |
| registerFunction | `getMotorState` | 282 |
| registerFunction | `getIsMotorStarted` | 283 |
| registerFunction | `getIsMotorInNeutral` | 284 |
| registerFunction | `getCanMotorRun` | 285 |
| registerFunction | `getStopMotorOnLeave` | 286 |
| registerFunction | `getMotorNotAllowedWarning` | 287 |
| registerFunction | `startMotor` | 288 |
| registerFunction | `stopMotor` | 289 |
| registerFunction | `updateMotorProperties` | 290 |
| registerFunction | `controlVehicle` | 291 |
| registerFunction | `updateConsumers` | 292 |
| registerFunction | `updateMotorTemperature` | 293 |
| registerFunction | `getMotor` | 294 |
| registerFunction | `getMotorStartTime` | 295 |
| registerFunction | `getMotorType` | 296 |
| registerFunction | `getMotorRpmPercentage` | 297 |
| registerFunction | `getMotorRpmReal` | 298 |
| registerFunction | `getMotorLoadPercentage` | 299 |
| registerFunction | `getMotorBlowOffValveState` | 300 |
| registerFunction | `getMotorDifferentialSpeed` | 301 |
| registerFunction | `getConsumerFillUnitIndex` | 302 |
| registerFunction | `getAirConsumerUsage` | 303 |
| registerFunction | `getTraveledDistanceStatsActive` | 304 |
| registerFunction | `setGearLeversState` | 305 |
| registerFunction | `generateShiftAnimation` | 306 |
| registerFunction | `getGearInfoToDisplay` | 307 |
| registerFunction | `setTransmissionDirection` | 308 |
| registerFunction | `getDirectionChangeMode` | 309 |
| registerFunction | `getIsManualDirectionChangeAllowed` | 310 |
| registerFunction | `getIsManualDirectionChangeActive` | 311 |
| registerFunction | `getGearShiftMode` | 312 |
| registerFunction | `stopVehicle` | 313 |
| registerOverwrittenFunction | `getBrakeForce` | 319 |
| registerOverwrittenFunction | `addToPhysics` | 320 |
| registerOverwrittenFunction | `removeFromPhysics` | 321 |
| registerOverwrittenFunction | `getIsOperating` | 322 |
| registerOverwrittenFunction | `getDeactivateOnLeave` | 323 |
| registerOverwrittenFunction | `getDeactivateLightsOnLeave` | 324 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 325 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 326 |
| registerOverwrittenFunction | `getIsActiveForInteriorLights` | 327 |
| registerOverwrittenFunction | `getIsActiveForWipers` | 328 |
| registerOverwrittenFunction | `getUsageCausesDamage` | 329 |
| registerOverwrittenFunction | `getName` | 330 |
| registerOverwrittenFunction | `getCanBeSelected` | 331 |
| registerOverwrittenFunction | `getIsPowered` | 332 |
| registerEventListener | `onLoad` | 338 |
| registerEventListener | `onPostLoad` | 339 |
| registerEventListener | `onRegisterDashboardValueTypes` | 340 |
| registerEventListener | `onDelete` | 341 |
| registerEventListener | `onReadStream` | 342 |
| registerEventListener | `onWriteStream` | 343 |
| registerEventListener | `onReadUpdateStream` | 344 |
| registerEventListener | `onWriteUpdateStream` | 345 |
| registerEventListener | `onUpdate` | 346 |
| registerEventListener | `onUpdateTick` | 347 |
| registerEventListener | `onRegisterActionEvents` | 348 |
| registerEventListener | `onStateChange` | 349 |
| registerEventListener | `onFillUnitFillLevelChanged` | 350 |
| registerEventListener | `onSetBroken` | 351 |
| registerEventListener | `onGearDirectionChanged` | 352 |
| registerEventListener | `onGearChanged` | 353 |
| registerEventListener | `onGearGroupChanged` | 354 |
| registerEventListener | `onMotorBlowOffValveChanged` | 355 |
| registerEventListener | `onClutchCreaking` | 356 |
| registerEventListener | `onReverseDirectionChanged` | 357 |
| registerEventListener | `onVehicleSettingChanged` | 358 |
| registerEventListener | `onAIJobStarted` | 359 |
| registerEventListener | `onAIJobFinished` | 360 |
