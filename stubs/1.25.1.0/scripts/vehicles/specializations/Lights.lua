---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Lights.lua (generated stub, FS25 Lua Atlas)

--- Spécialisation d'éclairage des véhicules (spec_lights) : feux de croisement/route, feux de travail, de stop, de recul, clignotants, gyrophares, feux d'intérieur, feux de jour, feux hauts/bas. Elle pilote deux familles de feux décrites dans le XML du véhicule : les feux statiques (StaticLight : matériaux/shaders émissifs, sans source lumineuse) et les feux réels (RealLight : sources de lumière du moteur). Les classes StaticLight, SharedLight, StaticLightCompound et BeaconLight sont dans d'autres fichiers ; seul RealLight.lua est présent dans le dump (vehicles/specializations/components/RealLight.lua).
--- 
--- MODÈLE DE DONNÉES. L'état est un masque de bits spec.lightsTypesMask : le bit n correspond au type de lumière n. Les valeurs des constantes Lights.LIGHT_TYPE_* et Lights.TURNLIGHT_* sont NON VÉRIFIÉES : elles sont définies dans l'en-tête du fichier, dont les lignes sont vides dans le dump (on voit seulement que LIGHT_TYPE_DEFAULT, LIGHT_TYPE_WORK_BACK, LIGHT_TYPE_WORK_FRONT et LIGHT_TYPE_HIGHBEAM existent). Les types « de base » vont jusqu'à maxLightState (au moins HIGHBEAM) ; la spécialisation ajoute huit types juste après : bottomLight, topLight, brakeLight, turnLightLeft, turnLightRight, turnLightAny, reverseLight, interiorLight (limite totale de 31 bits, onLoad). Les états successifs de la touche de lumière viennent de vehicle.lights.states.state(?)#lightTypes ; automaticState#lightTypes (défaut « 0 ») et #lightTypesWork (défaut « 0 1 2 ») servent aux éclairages automatiques.
--- 
--- FEUX RÉELS ET PROFILS. Deux jeux de feux réels sont chargés : realLights.low et realLights.high. Un seul est actif : getUseHighProfile compare le réglage LIGHTS_PROFILE à GS_PROFILE_HIGH (réglage forçable par Platform.gameplay.lightsProfile). Dans setLightsTypesMask le profil inactif reçoit un masque nul. Pour un mod de brouillard : pour savoir si un phare est allumé, lire getLightsTypesMask() et tester le bit voulu, ou écouter l'événement onLightsTypesMaskChanged ; pour retrouver la source de lumière d'un phare, getRealLightFromNode puis les champs de l'objet RealLight. À noter dans RealLight.lua : la diffusion de lumière dans l'air (setLightUseLightScattering, setLightScatteringConeAngle, setLightScatteringIntensity fixée à 1) est activée par RealLight:updateLightScattering (components/RealLight.lua:212-258) seulement si la source a une portée supérieure à 7.5, avec le profil haut pour les feux par défaut/route et le profil très haut pour les autres feux typés. C'est l'effet natif de « faisceau visible » ; son rendu dans un brouillard et son interaction avec le brouillard du moteur sont NON VÉRIFIÉS (code moteur et classe Environment absents du dump).
--- 
--- RÉSEAU. Le serveur ajoute lui-même les bits supplémentaires (clignotants, haut/bas, stop, recul, intérieur) et diffuse VehicleSetLightEvent (masque sur totalNumLightTypes bits) ; le client reçoit le masque complet mais recalcule localement les bits haut/bas et intérieur. Clignotants (VehicleSetTurnLightEvent) et gyrophares (VehicleSetBeaconLightEvent) ont leur propre événement. À la connexion, onWriteStream envoie masque et état des gyrophares.
--- 
--- TEMPS. Aucun dt dans ce fichier : le clignotement est calculé à partir de getShaderTimeSec() ; onUpdate relance raiseActive tant qu'un clignotant est actif. Les feux de jour suivent onStartMotor / onStopMotor. L'éclairage automatique (updateAutomaticLights) ne dépend que de environment.isSunOn (Environment absent du dump) : aucune lecture de brouillard, pluie ou visibilité n'apparaît ici. La luminosité des feux d'intérieur dépend de l'heure (voir getInteriorLightBrightness).
--- 
--- POINTS D'EXTENSION. Événements déclarés : onTurnLightStateChanged, onTopLightsVisibilityChanged, onBrakeLightsVisibilityChanged, onReverseLightsVisibilityChanged, onLightsTypesMaskChanged, onBeaconLightsVisibilityChanged. Fonctions surchargées ici : loadDashboardGroupFromXML, getIsDashboardGroupActive. Fonctions prévues pour être surchargées par d'autres spécialisations : getIsActiveForInteriorLights (faux ici, surchargée par Motorized) et getDeactivateLightsOnLeave (vrai ici, surchargée par Motorized). Abonnements au centre de messages : DAY_NIGHT_CHANGED, changement du réglage LIGHTS_PROFILE, changement du réglage REAL_BEACON_LIGHTS. À noter : ils sont faits dans onLoad et aucun désabonnement n'apparaît dans ce fichier, y compris dans onDelete (non vérifié en jeu).
---@class Lights
Lights = {}

--- Renvoie toujours vrai : aucun prérequis de spécialisation.
---@param specializations table
---@return boolean
function Lights.prerequisitesPresent(specializations) end

--- Enregistre le type de configuration « beaconLight » et les chemins XML : états de lumière, feux statiques par catégorie (par défaut, haut, bas, stop, recul, jour, clignotants), compounds, feux partagés, gyrophares (avec #alwaysActive et configurations), sons, tableaux de bord et attributs #isTopLight / #isBottomLight. #reverseLightActivationSpeed vaut 1 km/h par défaut.
function Lights.initSpecialization() end

--- Enregistre pour un profil réel (low ou high) les sous-clés light, topLight, bottomLight, brakeLight, reverseLight, dayTimeLight, turnLightLeft, turnLightRight et interiorLight via RealLight.registerXMLPaths.
---@param schema any
---@param basePath any
function Lights.registerRealLightSetupXMLPath(schema, basePath) end

--- Déclare les six événements publiés par la spécialisation (clignotants, feux hauts, stop, recul, masque des types, gyrophares).
---@param vehicleType any
function Lights.registerEvents(vehicleType) end

--- Enregistre les fonctions publiques d'éclairage (masque, gyrophares, clignotants, feux hauts/stop/recul/intérieur, accès aux feux par nœud, éclairage automatique).
---@param vehicleType any
function Lights.registerFunctions(vehicleType) end

--- Surcharge loadDashboardGroupFromXML et getIsDashboardGroupActive pour y ajouter les filtres de types de lumière.
---@param vehicleType any
function Lights.registerOverwrittenFunctions(vehicleType) end

--- Abonne la spécialisation au cycle de vie, au réseau, aux actions d'entrée, à l'entrée/sortie du véhicule, au moteur (onStartMotor/onStopMotor), à l'attelage, à l'IA et au train automatique, à la physique du véhicule (onVehiclePhysicsUpdate) et au changement d'exigence des feux hauts.
---@param vehicleType any
function Lights.registerEventListeners(vehicleType) end

--- Lit le seuil de vitesse de recul (valeur XML en km/h divisée par 3600), les états de lumière, les masques automatiques, charge les feux réels (profils low et high), feux statiques, compounds, feux partagés et gyrophares (configuration et toujours-actifs), calcule maxLightState et les huit types supplémentaires, charge les sons et s'abonne aux messages jour/nuit et réglages de lumière. À noter : le test « self.isClient ~= nil » avant le chargement des sons est vrai même sur serveur (intention probable : self.isClient ; non vérifié en jeu).
---@param savegame table
function Lights:onLoad(savegame) end

--- Ajoute les types supplémentaires aux listes de types des feux haut/bas/stop/recul/clignotants/intérieur (clignotants marqués clignotants), finalise chaque feu réel (realLight:finalize) et, dans la salle d'exposition, allume les feux de jour.
---@param savegame table
function Lights:onLoadFinished(savegame) end

--- Enregistre les valeurs de tableau de bord d'éclairage (état de lumière, clignotants, gyrophare). Non relu en détail.
function Lights:onRegisterDashboardValueTypes() end

--- Supprime feux partagés, gyrophares, fichiers XML de feux en cours de chargement, libère les I3D partagés, vide les compounds et supprime les sons. Aucun désabonnement du centre de messages n'y figure.
function Lights:onDelete() end

--- Lecture à la connexion : masque de types (totalNumLightTypes bits) puis état des gyrophares, appliqués sans renvoi réseau.
---@param streamId integer
---@param connection Connection
function Lights:onReadStream(streamId, connection) end

--- Écriture à la connexion du masque de types et de l'état des gyrophares.
---@param streamId integer
---@param connection Connection
function Lights:onWriteStream(streamId, connection) end

--- Client : tant qu'un clignotant est actif, calcule un coefficient de charge de 0 à 1 à partir de la fraction du temps de shader (période d'une seconde) et l'applique aux feux de clignotant gauche/droite ; joue le son de clignotant à chaque période pour le véhicule actif ; maintient le véhicule actif. Aucun dt utilisé.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Lights:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client : active ou coupe les gyrophares « toujours actifs » quand le véhicule devient actif pour les feux, met à jour les feux intérieurs, l'activité des actions d'entrée et, si Platform.gameplay.automaticLights, l'éclairage automatique du véhicule racine non conduit par l'IA selon environment.isSunOn et le sens de marche.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Lights:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Vrai si le joueur est dans le véhicule et peut commander les lumières, ou si le véhicule attelant l'est (récursif). Avec onlyPowered, exige getIsPowered.
---@param onlyPowered any
---@return boolean
function Lights:getIsActiveForLights(onlyPowered) end

--- Renvoie faux par défaut ; Motorized le surcharge pour renvoyer vrai quand le contact est mis.
---@return boolean
function Lights:getIsActiveForInteriorLights() end

--- Faux si l'IA conduit ou si aucun type de lumière n'est défini ; sinon vrai uniquement pour le véhicule actuellement occupé par le joueur local.
---@return boolean
function Lights:getCanToggleLight() end

--- Vrai si le réglage LIGHTS_PROFILE (ou Platform.gameplay.lightsProfile s'il est défini) est supérieur ou égal à GS_PROFILE_HIGH : sélectionne les feux réels du profil haut.
---@return boolean
function Lights:getUseHighProfile() end

--- Passe à l'état de lumière suivant (ou précédent) dans la liste des états du XML, revient à zéro après le dernier ou si des feux étaient allumés depuis l'état 0, recompose le masque en conservant les bits supplémentaires puis appelle setLightsTypesMask.
---@param increment any
function Lights:setNextLightsState(increment) end

--- Cœur du système : compose les bits supplémentaires (serveur : clignotants, haut/bas, stop, recul, intérieur ; client : haut/bas et intérieur localement), diffuse VehicleSetLightEvent sauf noEventSend, joue le son de commutation si les bits de base changent, applique le masque à tous les feux statiques et compounds et aux feux réels du profil actif (masque 0 pour l'autre), met à jour le tableau de bord et lève onLightsTypesMaskChanged. Point d'entrée à observer pour synchroniser un effet de brouillard sur les phares.
---@param lightsTypesMask integer
---@param force boolean
---@param noEventSend boolean
---@return boolean
function Lights:setLightsTypesMask(lightsTypesMask, force, noEventSend) end

--- Renvoie le masque courant des types de lumière actifs.
---@return integer
function Lights:getLightsTypesMask() end

--- Active ou coupe les gyrophares, diffuse VehicleSetBeaconLightEvent, active aussi l'état « dispositif » si le véhicule est actif pour l'entrée, met à jour le tableau de bord et lève onBeaconLightsVisibilityChanged.
---@param visibility boolean
---@param force boolean
---@param noEventSend boolean
---@return boolean
function Lights:setBeaconLightsVisibility(visibility, force, noEventSend) end

--- Renvoie l'état des gyrophares.
---@return boolean
function Lights:getBeaconLightsVisibility() end

--- Définit l'état des clignotants (constantes Lights.TURNLIGHT_*), diffuse VehicleSetTurnLightEvent, mémorise le profil de feux actif pour les clignotants, réinitialise le compteur de répétition du son, recalcule le masque côté serveur et lève onTurnLightStateChanged.
---@param state integer
---@param force boolean
---@param noEventSend boolean
---@return boolean
function Lights:setTurnLightState(state, force, noEventSend) end

--- Renvoie l'état des clignotants.
---@return integer
function Lights:getTurnLightState() end

--- Choisit entre feux hauts et feux bas, recalcule le masque sans diffusion réseau et lève onTopLightsVisibilityChanged.
---@param visibility boolean
---@return boolean
function Lights:setTopLightsVisibility(visibility) end

--- Active ou coupe le bit des feux stop, recalcule le masque et lève onBrakeLightsVisibilityChanged.
---@param visibility boolean
---@return boolean
function Lights:setBrakeLightsVisibility(visibility) end

--- Active ou coupe le bit des feux de recul, recalcule le masque et lève onReverseLightsVisibilityChanged.
---@param visibility boolean
---@return boolean
function Lights:setReverseLightsVisibility(visibility) end

--- Active ou coupe les feux d'intérieur selon la luminosité horaire (éteints si elle vaut 0) ; force le recalcul du masque sans diffusion.
---@param visibility boolean
---@return boolean
function Lights:setInteriorLightsVisibility(visibility) end

--- Renvoie la luminosité d'intérieur de 0 à 1 d'après l'heure du jeu (currentHour et currentMinute de environment, absent du dump) : décroissance linéaire jusqu'à 10 h, nulle entre 10 h et 16 h, croissante après 16 h ; avec updateState, la recalcule et signale si elle a changé.
---@param updateState boolean
---@return number
---@return boolean
function Lights:getInteriorLightBrightness(updateState) end

--- Éteint tout : masque à 0, gyrophares et clignotants (sauf warning conservé si demandé), stop, recul, intérieur ; remet l'état de lumière à zéro.
---@param keepHazardLightsOn any
function Lights:deactivateLights(keepHazardLightsOn) end

--- Désactive les gyrophares réels et leur état dispositif.
function Lights:deactivateBeaconLights() end

--- Surcharge : lit en plus #lightTypes et #excludedLightTypes pour un groupe de tableau de bord.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param group any
function Lights:loadDashboardGroupFromXML(superFunc, xmlFile, key, group) end

--- Surcharge : un groupe n'est actif que si au moins un type de lumière demandé est allumé et qu'aucun type exclu ne l'est.
---@param superFunc any
---@param group any
function Lights:getIsDashboardGroupActive(superFunc, group) end

--- Renvoie vrai par défaut (surchargée par Motorized) : les lumières s'éteignent à la sortie du véhicule.
function Lights:getDeactivateLightsOnLeave() end

--- Charge un feu partagé (SharedLight) depuis le XML ; en cas de succès l'ajoute à la liste et, s'il a un compound, à celle des compounds.
---@param xmlFile any
---@param key any
function Lights:loadSharedLight(xmlFile, key) end

--- Lit #isTopLight et #isBottomLight (faux par défaut) d'un feu.
---@param xmlFile any
---@param key any
---@param light any
function Lights:loadAdditionalLightAttributesFromXML(xmlFile, key, light) end

--- Un feu « haut » n'est actif que si les feux hauts sont visibles, un feu « bas » seulement s'ils ne le sont pas, les autres toujours.
---@param light any
function Lights:getIsLightActive(light) end

--- Cherche un feu statique par son nœud dans toutes les catégories ; nil sinon.
---@param node any
function Lights:getStaticLightFromNode(node) end

--- Cherche un feu réel par son nœud dans les deux profils ; nil sinon.
---@param node any
function Lights:getRealLightFromNode(node) end

--- Applique le masque automatique (travail ou non) si allumé, sinon coupe tout si un masque non nul est présent.
---@param isTurnedOn any
---@param isWorking any
function Lights:updateAutomaticLights(isTurnedOn, isWorking) end

--- Rappel du message jour/nuit : affiche le texte de l'action « lumières » seulement quand le soleil est couché (environment.isSunOn faux).
function Lights:lightsWeatherChanged() end

--- Rappel du changement de profil d'éclairage : informe chaque feu réel, puis réapplique le masque sans diffusion (bascule les feux réels actifs).
---@param lightsProfile any
function Lights:onLightsProfileChanged(lightsProfile) end

--- Rappel du réglage « gyrophares réels » : informe chaque gyrophare.
function Lights:onLightsRealBeaconLightChanged() end

--- Enregistre les touches de lumière (feux, arrière, avant, travail avant/arrière, route, clignotants, warning, gyrophare) pour le véhicule occupé ; masque leur texte d'aide sauf celui des lumières, visible la nuit.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Lights:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Enregistre l'action externe « lights » d'un déclencheur si le véhicule a des états de lumière.
---@param trigger any
---@param name any
---@param xmlFile any
---@param key any
function Lights:onRegisterExternalActionEvents(trigger, name, xmlFile, key) end

--- À l'entrée, réapplique masque, gyrophares et clignotants en forçant l'état.
---@param isControlling any
function Lights:onEnterVehicle(isControlling) end

--- À la sortie, éteint lumières et gyrophares si getDeactivateLightsOnLeave, et coupe l'état dispositif des gyrophares.
function Lights:onLeaveVehicle() end

--- Désactive les gyrophares si getDeactivateLightsOnLeave.
function Lights:onDeactivate() end

--- Réagit à l'événement d'exigence de feux hauts en appelant setTopLightsVisibility.
---@param requiresTopLights any
function Lights:onRequiresTopLightsChanged(requiresTopLights) end

--- Réapplique le masque et allume les feux de jour.
function Lights:onStartMotor() end

--- Réapplique le masque et éteint les feux de jour (sauf en salle d'exposition).
function Lights:onStopMotor() end

--- Réapplique le masque (force) si des feux sont allumés.
function Lights:onStartReverseDirectionChange() end

--- Un outil attelé copie masque, gyrophares et clignotants du véhicule attelant, s'il expose getLightsTypesMask.
---@param attacherVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
function Lights:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Éteint tous les feux de l'outil détaché.
function Lights:onPostDetach() end

--- Train automatique : éclairage automatique selon environment.isSunOn, sans mode travail.
function Lights:onAutomatedTrainTravelActive() end

--- Conduite IA : éclairage automatique selon environment.isSunOn, sans mode travail.
function Lights:onAIDriveableActive() end

--- Fin de conduite IA : éteint les lumières si personne ne contrôle le véhicule et coupe les gyrophares.
function Lights:onAIDriveableEnd() end

--- Début de travail IA : coupe les gyrophares.
function Lights:onAIFieldWorkerStart() end

--- Travail IA en cours : éclairage automatique selon environment.isSunOn, en mode travail.
function Lights:onAIFieldWorkerActive() end

--- IA bloquée par un obstacle : allume les gyrophares.
function Lights:onAIJobVehicleBlock() end

--- IA reprend la route : coupe les gyrophares.
function Lights:onAIJobVehicleContinue() end

--- Fin de travail IA : éteint les lumières si personne ne contrôle le véhicule et coupe les gyrophares.
function Lights:onAIFieldWorkerEnd() end

--- Appelé par la physique : feux de stop selon la pédale de frein (hors frein automatique) et feux de recul selon la vitesse (seuil reverseLightActivationSpeed) ou la pédale d'accélérateur négative, si le sens du reverser est normal.
---@param acceleratorPedal any
---@param brakePedal any
---@param automaticBrake any
---@param currentSpeed any
function Lights:onVehiclePhysicsUpdate(acceleratorPedal, brakePedal, automaticBrake, currentSpeed) end

--- Charge un profil de feux réels (par défaut, haut, bas, stop, recul, clignotants, intérieur) via RealLight.loadLightsFromXML ; les feux d'intérieur reçoivent getInteriorLightBrightness comme fonction de charge.
---@param xmlFile any
---@param key any
---@param lightTable any
---@param realLightToLight any
function Lights:loadRealLightSetup(xmlFile, key, lightTable, realLightToLight) end

--- Ajoute un type de lumière supplémentaire aux feux d'une liste et, si demandé, les marque clignotants.
---@param lights any
---@param lightType any
---@param isBlinking any
function Lights:applyAdditionalActiveLightType(lights, lightType, isBlinking) end

--- Rappel d'entrée : bascule le bit du type LIGHT_TYPE_DEFAULT dans le masque.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleLightFront(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : passe à l'état de lumière suivant (setNextLightsState(1)).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleLights(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : passe à l'état de lumière précédent (setNextLightsState(-1)).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleLightsBack(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : bascule le bit des feux de travail arrière.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleWorkLightBack(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : bascule le bit des feux de travail avant.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleWorkLightFront(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : bascule le bit des feux de route.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleHighBeamLight(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : active ou coupe les feux de détresse.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleTurnLightHazard(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : active ou coupe le clignotant gauche.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleTurnLightLeft(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : active ou coupe le clignotant droit.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleTurnLightRight(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : bascule les gyrophares.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleBeaconLights(self, actionName, inputValue, callbackState, isAnalog) end

--- Enregistre l'action d'entrée TOGGLE_LIGHTS_EXTERNAL d'un déclencheur externe ; son rappel passe le véhicule à l'état de lumière suivant.
---@param data any
---@param vehicle any
function Lights.externalActionEventRegister(data, vehicle) end

--- Mise à jour de l'action externe : corps vide.
---@param data any
---@param vehicle any
function Lights.externalActionEventUpdate(data, vehicle) end

--- Lit les attributs de tableau de bord d'éclairage (#lightTypes, #excludedLightTypes) et initialise l'état de chaque type.
---@param self any
---@param xmlFile any
---@param key any
---@param dashboard any
---@param isActive any
function Lights.dashboardLightAttributes(self, xmlFile, key, dashboard, isActive) end

--- Calcule l'état d'un tableau de bord d'éclairage : multi-états (un état par type allumé) ou valeur simple.
---@param self any
---@param dashboard any
---@param newValue any
---@param minValue any
---@param maxValue any
---@param isActive any
function Lights.dashboardLightState(self, dashboard, newValue, minValue, maxValue, isActive) end

--- Commande console de développement : inverse feux hauts/bas du véhicule occupé.
function Lights.consoleCommandTopLights() end

--- Commande console de développement : bascule le réglage LIGHTS_PROFILE entre bas et très haut (journalise le résultat).
function Lights.consoleCommandProfile() end
