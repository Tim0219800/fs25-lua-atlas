---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Enterable.lua (generated stub, FS25 Lua Atlas)

--- Spécialisation de véhicule (pas de prérequis déclaré dans les lignes relues) pour tout véhicule dans lequel un joueur peut monter : état d'occupation (isEntered = ce client conduit ; isControlled = quelqu'un conduit, y compris un autre joueur), caméras du véhicule (VehicleCamera), miroirs, personnage au volant, sons de pluie/grêle dans la cabine, tableau de bord (heure, température extérieure), actions d'entrée/sortie, changement de caméra. ANGLE CAMÉRA / CABINE : les caméras sont chargées depuis vehicle.enterable.cameras.camera(i) (loadCamerasFromXML) et la caméra active est spec.activeCamera (accessible via getActiveCamera). setActiveCameraIndex est le point central d'un changement de vue : il fait passer en mode « intérieur » trois systèmes selon le drapeau useOutdoorSounds de la caméra (g_soundManager:setIsIndoor, ambientSoundSystem:setIsIndoor, g_currentMission.environment.environmentMaskSystem:setIsIndoor : sens exact des effets sur la météo visuelle NON VÉRIFIÉ, classes absentes du dump), règle g_currentMission.environmentAreaSystem:setReferenceNode(activeCamera.cameraNode) (la caméra du véhicule sert de point de référence aux zones d'environnement : NON VÉRIFIÉ), gère la visibilité des miroirs et lève l'événement onCameraChanged(camera, index). Un mod qui doit savoir si le joueur est en vue cabine peut lire spec.activeCamera.isInside (champ lu aussi pour l'activation du suivi de tête) ou écouter onCameraChanged ; à la sortie du véhicule les trois indicateurs « indoor » sont remis à faux. Aussi : la mise à jour de la caméra est faite dans onPostUpdate avec dt (ms) seulement si le véhicule est entré par ce client ; la mise à jour du personnage et des miroirs est dans onPostUpdate. DONNÉES MÉTÉO LUES : spec.weatherObject = g_currentMission.environment.weather (Enterable.lua:340) ; onUpdate (client, véhicule contrôlé) lit weather:getRainFallScale() > 0 pour lancer ou arrêter les échantillons sonores « rain » (XML vehicle.enterable.sounds) et weather:getIsHailing() pour « hail » ; le tableau de bord enregistre les valeurs « time », « timeHours », « timeMinutes » (environment:getEnvironmentTime) et « outsideTemperature » (weather:getCurrentTemperature). Unités/plages : Weather et Environment absents du dump, NON VÉRIFIÉ. Pas de lecture de l'humidité du sol, du vent ni de la saleté ici. Note : onUpdate teste le son de pluie selon une pluie > 0 sans tenir compte du seuil 0.1 utilisé par Washable/VehicleSystem, et ne tient pas compte de l'indoor mask ; cet écart entre systèmes est une observation du code. RÉSEAU : le flux initial transmet isTabbable, l'état « contrôlé » et l'identifiant du joueur au client qui rejoint (onReadStream/onWriteStream) ; pas de flux de mise à jour continu dans cette spécialisation ; l'entrée/sortie est pilotée par la logique joueur (player:requestToEnterVehicle, g_localPlayer:leaveVehicle), qui appelle onPlayerEnterVehicle / onPlayerLeaveVehicle sur toutes les machines. onUpdate appelle rootVehicle:raiseActive() tant que le véhicule est contrôlé pour qu'il reste actif. Particularité : onLoad met self.needWaterInfo = true (champ lu ailleurs, usage NON VÉRIFIÉ). Événements déclarés : onEnterVehicle(isControlling), onLeaveVehicle(wasEntered), onCameraChanged, onVehicleCharacterChanged. Points d'extension pour un moddeur : écouter ces événements (par ex. pour activer un effet seulement quand la vue est intérieure), ou surcharger getIsActive / getIsActiveForInput / getDistanceToNode / interact (déclarés comme surcharges). À noter : Enterable.getIsInteractive est enregistrée comme surcharge (ligne 154) mais n'est pas définie dans ce fichier (non vérifié en jeu : fonction nil ou définie ailleurs). Parties non relues en détail : modificateurs de cibles du personnage (IK), sections XML d'initSpecialization, actions de saisie.
---@class Enterable
Enterable = {}

--- Vérifie les spécialisations requises (non relu en détail).
---@param specializations any
function Enterable.prerequisitesPresent(specializations) end

--- Enregistre le schéma XML de la spécialisation (caméras, miroirs, nœuds d'entrée/sortie, personnage, sons, tableaux de bord) et les clés de sauvegarde. Non relu en détail.
function Enterable.initSpecialization() end

--- Déclare les événements onEnterVehicle, onLeaveVehicle, onCameraChanged, onVehicleCharacterChanged.
---@param vehicleType any
function Enterable.registerEvents(vehicleType) end

--- Enregistre les fonctions de la spécialisation (caméras, personnage, état d'entrée, sortie, miroirs...). Elles sont remplaçables par un mod.
---@param vehicleType any
function Enterable.registerFunctions(vehicleType) end

--- Déclare les surcharges : getIsActive, getIsActiveForInput, getDistanceToNode, getInteractionHelp, interact, getIsInteractive (non définie ici), getCanToggleSelectable, getCanToggleAttach, getActiveFarm, loadDashboardGroupFromXML, getIsDashboardGroupActive, mountDynamic, getIsInUse, loadExtraDependentParts, updateExtraDependentParts, getIsMapHotspotVisible.
---@param vehicleType any
function Enterable.registerOverwrittenFunctions(vehicleType) end

--- Abonne la spécialisation à onLoad, onPostLoad, onLoadFinished, onRegisterDashboardValueTypes, onDelete, flux réseau initial, onPreUpdate, onUpdate, onPostUpdate, onDrawUIInfo, actions de saisie et onSetBroken.
---@param vehicleType any
function Enterable.registerEventListeners(vehicleType) end

--- Charge les cartes de miroirs, caméras, personnage, nœuds d'entrée/sortie, hotspot, rayon d'interaction ; mémorise le monde météo (spec.weatherObject), charge les sons de pluie et de grêle (client), crée un nœud de référence de réverbération par défaut à 2 m au-dessus du véhicule, active needWaterInfo, et enregistre le véhicule dans VehicleSystem (interactifs et entrables). Non relu intégralement.
---@param savegame any
function Enterable:onLoad(savegame) end

--- Post-chargement des caméras ; restaure depuis la sauvegarde l'indice de caméra active, isTabbable et isLeavingAllowed (sauf réinitialisation).
---@param savegame any
function Enterable:onPostLoad(savegame) end

--- Si le véhicule est déjà contrôlé (client qui rejoint), ajoute le hotspot de carte du joueur.
---@param savegame any
function Enterable:onLoadFinished(savegame) end

--- Déclare les valeurs de tableau de bord time, timeHours, timeMinutes (environment:getEnvironmentTime), operatingTime et outsideTemperature (weather:getCurrentTemperature).
function Enterable:onRegisterDashboardValueTypes() end

--- Fait quitter le joueur si le véhicule est contrôlé, libère personnage, caméras, hotspot, sons, oublie weatherObject et se retire des listes de VehicleSystem.
function Enterable:onDelete() end

--- Client qui rejoint : lit isTabbable et, si le véhicule est contrôlé, l'identifiant du joueur pour le faire entrer (player:onEnterVehicle).
---@param streamId integer
---@param connection Connection
function Enterable:onReadStream(streamId, connection) end

--- Serveur : écrit isTabbable, l'état contrôlé et l'identifiant du joueur contrôleur.
---@param streamId integer
---@param connection Connection
function Enterable:onWriteStream(streamId, connection) end

--- Sauvegarde chaque caméra, l'indice de caméra active, isTabbable et isLeavingAllowed.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Enterable:saveToXMLFile(xmlFile, key, usedModNames) end

--- Écrit le nom du contrôleur dans les statistiques de partie si le véhicule est contrôlé.
---@param xmlFile any
---@param key any
---@return string
function Enterable:saveStatsToXMLFile(xmlFile, key) end

--- Fait décompter, image par image, les états sales des modificateurs de cibles du personnage et les relance.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Enterable:onPreUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Par frame, seulement si le véhicule est contrôlé. Client : met à jour les modificateurs de cibles du personnage, bascule le personnage additionnel, démarre/arrête les sons de pluie (weather:getRainFallScale() > 0) et de grêle (weather:getIsHailing()) selon le changement d'état, renseigne la position et la direction du véhicule à activatableObjectsSystem si actif pour la saisie. Dans tous les cas, appelle rootVehicle:raiseActive().
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Enterable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client : met à jour la spine du personnage (selon l'accélération), la caméra active (dt, seulement si le véhicule est entré localement et après la première mise à jour), la visibilité du personnage, l'animation du personnage et rend visibles les miroirs si la caméra les utilise.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Enterable:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Affiche le pseudo du conducteur au-dessus du véhicule en multijoueur si l'interface est visible, le réglage SHOW_MULTIPLAYER_NAMES actif, et la caméra à moins de Enterable.NICKNAME_RENDER_DISTANCE (constante hors fichier : NON VÉRIFIÉ).
function Enterable:onDrawUIInfo() end

--- Charge toutes les caméras (VehicleCamera) du XML vehicle.enterable.cameras.camera(i) et mémorise leur nombre.
---@param xmlFile any
---@param savegame any
function Enterable:loadCamerasFromXML(xmlFile, savegame) end

--- Charge les cibles et le nœud d'un personnage additionnel (non relu en détail).
---@param xmlFile any
function Enterable:loadAdditionalCharacterFromXML(xmlFile) end

--- Indique si le personnage additionnel est actif (non relu en détail).
function Enterable:getIsAdditionalCharacterActive() end

--- Charge un modificateur de position de cibles IK du personnage (non relu en détail).
---@param entry any
---@param xmlFile any
---@param xmlKey any
function Enterable:loadCharacterTargetNodeModifier(entry, xmlFile, xmlKey) end

--- Met à jour un modificateur de cibles IK du personnage avec dt (non relu en détail).
---@param dt any
---@param modifier any
function Enterable:updateCharacterTargetNodeModifier(dt, modifier) end

--- Marque l'état d'un nœud cible du personnage comme à recalculer (non relu en détail).
---@param referenceNode any
---@param forceActive any
function Enterable:setCharacterTargetNodeStateDirty(referenceNode, forceActive) end

--- Remet les états par défaut des nœuds cibles du personnage (non relu en détail).
---@param referenceNode any
function Enterable:resetCharacterTargetNodeStateDefaults(referenceNode) end

--- Entrée d'un joueur (appelée sur toutes les machines) : marque le véhicule contrôlé/entré, mémorise farm et utilisateur, force la sélection, choisit la caméra (première caméra intérieure si suivi de tête, caméra 1 si RESET_CAMERA, sinon la dernière), appelle setActiveCameraIndex, informe VehicleSystem, hotspot de carte, personnage et animation d'entrée, lève onEnterVehicle et la notification d'état ENTER_VEHICLE, active les actions de saisie, enregistre le véhicule dans le système de trafic côté serveur si non contrôlé localement.
---@param isControlling boolean
---@param playerStyle integer
---@param farmId integer
---@param userId any
function Enterable:onPlayerEnterVehicle(isControlling, playerStyle, farmId, userId) end

--- Vrai si le véhicule est entré par ce client.
function Enterable:getCanLeave() end

--- Vrai si on peut quitter un véhicule (non monture).
function Enterable:getCanLeaveVehicle() end

--- Vrai si on peut quitter une monture (spécialisation rideable).
function Enterable:getCanLeaveRideable() end

--- Indique si la sortie est autorisée.
function Enterable:getIsLeavingAllowed() end

--- Autorise ou interdit la sortie du véhicule.
---@param isAllowed any
function Enterable:setIsLeavingAllowed(isAllowed) end

--- Réagit au changement du réglage du nombre maximal de miroirs en recalculant les miroirs visibles (corps non relu).
function Enterable:onEnterableMirrorSettingChanged() end

--- Demande au joueur local de quitter le véhicule si la sortie est possible et autorisée.
function Enterable:doLeaveVehicle() end

--- Sortie du joueur : désactive la caméra active, remet à faux les indicateurs « indoor » du son, de l'ambiance et du système de masque d'environnement, coupe les sons de pluie/grêle, retire le hotspot, remet l'état (contrôlé, entré) à zéro, joue l'animation de sortie à l'envers, cache les miroirs, lève onLeaveVehicle et la notification LEAVE_VEHICLE, désactive les actions de saisie et le trafic, désactive le véhicule si getDeactivateOnLeave.
function Enterable:onPlayerLeaveVehicle() end

--- Surcharge : le hotspot de carte du véhicule n'est visible que s'il n'est pas contrôlé.
---@param superFunc any
function Enterable:getIsMapHotspotVisible(superFunc) end

--- Change la caméra active (retour à 1 si hors limites) : désactive l'ancienne, active la nouvelle, règle les indicateurs indoor (son, ambiance, environmentMaskSystem) selon useOutdoorSounds, met à jour les miroirs, règle le nœud de référence de environmentAreaSystem sur la caméra, lève onCameraChanged. Ne fait rien si la caméra demandée est déjà active.
---@param index integer
function Enterable:setActiveCameraIndex(index) end

--- Ajoute à la liste des caméras celles d'un outil attelé.
---@param cameras table
function Enterable:addToolCameras(cameras) end

--- Retire des caméras d'outil et, si l'une était active, revient à la caméra 1.
---@param cameras table
function Enterable:removeToolCameras(cameras) end

--- Renvoie le nœud de sortie du véhicule (exitPoint).
---@param player any
function Enterable:getExitNode(player) end

--- Renvoie le style du joueur mémorisé à l'entrée.
function Enterable:getUserPlayerStyle() end

--- Renvoie le style du personnage actuellement affiché, ou nil.
function Enterable:getCurrentPlayerStyle() end

--- Supprime puis recharge le personnage du véhicule avec un style de joueur, éventuellement adapté par un préréglage personnalisé du véhicule.
---@param playerStyle any
function Enterable:setVehicleCharacter(playerStyle) end

--- Rappel de fin de chargement du personnage (non relu en détail).
---@param loadingState any
---@param arguments any
function Enterable:vehicleCharacterLoaded(loadingState, arguments) end

--- Réagit à un changement de style de joueur (non relu en détail).
---@param style any
---@param userId any
function Enterable:onPlayerStyleChanged(style, userId) end

--- Charge un personnage aléatoire (IA/assistants, non relu en détail).
---@param helper any
function Enterable:setRandomVehicleCharacter(helper) end

--- Restaure le personnage du véhicule (non relu en détail).
function Enterable:restoreVehicleCharacter() end

--- Supprime le personnage du véhicule (non relu en détail).
function Enterable:deleteVehicleCharacter() end

--- Renvoie la durée de fonctionnement en heures décimales (dizaines de minutes) pour le tableau de bord.
function Enterable:getFormattedOperatingTime() end

--- Surcharge : un véhicule entré ou contrôlé est toujours actif.
---@param superFunc any
function Enterable:getIsActive(superFunc) end

--- Surcharge : actif pour la saisie seulement si le parent l'accepte, que le joueur n'est pas figé, et que ce véhicule ou un autre de la chaîne attelée est entré.
---@param superFunc any
---@param ignoreSelection any
---@param activeForAI any
function Enterable:getIsActiveForInput(superFunc, ignoreSelection, activeForAI) end

--- Surcharge : si le véhicule n'est pas contrôlé et qu'un nœud est plus proche que le rayon d'interaction du point d'entrée, renvoie cette distance et positionne l'indicateur d'interaction « entrable ».
---@param superFunc integer
---@param node any
---@return number
function Enterable:getDistanceToNode(superFunc, node) end

--- Surcharge : renvoie le texte d'entrée si l'interaction courante est « entrable ».
---@param superFunc any
---@return string
function Enterable:getInteractionHelp(superFunc) end

--- Surcharge : demande au joueur d'entrer dans le véhicule si l'interaction courante est « entrable ».
---@param superFunc any
---@param player any
function Enterable:interact(superFunc, player) end

--- Affiche ou masque les miroirs : en affichage, trie par priorité puis par angle par rapport à la caméra (seulement miroirs dans le champ de vision) et n'en montre que le nombre maximal défini par le réglage MAX_NUM_MIRRORS.
---@param visible any
function Enterable:setMirrorVisible(visible) end

--- Indique si le véhicule participe au changement par touche tabulation.
function Enterable:getIsTabbable() end

--- Règle isTabbable (nil vaut faux).
---@param isTabbable any
function Enterable:setIsTabbable(isTabbable) end

--- Vrai (client) si le véhicule a un point d'entrée et de sortie, n'est pas cassé ni contrôlé et si le joueur a accès (accessHandler).
function Enterable:getIsEnterable() end

--- Vrai si enterable et autorisé à être sélectionné depuis le menu.
function Enterable:getIsEnterableFromMenu() end

--- Vrai si ce client est entré dans le véhicule.
function Enterable:getIsEntered() end

--- Vrai si un joueur (quelconque) contrôle le véhicule.
function Enterable:getIsControlled() end

--- Vrai si entré et contrôlé.
function Enterable:getIsEnteredForInput() end

--- Pseudo du conducteur, par connexion côté serveur ou par identifiant côté client ; chaîne vide sinon.
function Enterable:getControllerName() end

--- Renvoie la caméra active du véhicule (VehicleCamera).
function Enterable:getActiveCamera() end

--- Renvoie le personnage du véhicule.
function Enterable:getVehicleCharacter() end

--- Renvoie vrai : autorise la mise à jour de visibilité du personnage (remplaçable).
function Enterable:getAllowCharacterVisibilityUpdate() end

--- Indique si le personnage doit être supprimé à la sortie.
function Enterable:getDisableVehicleCharacterOnLeave() end

--- Surcharge : vrai si entré, sinon valeur du parent.
---@param superFunc any
function Enterable:getCanToggleSelectable(superFunc) end

--- Surcharge : faux si non entré, sinon valeur du parent.
---@param superFunc any
function Enterable:getCanToggleAttach(superFunc) end

--- Surcharge : renvoie la ferme du contrôleur si non nulle, sinon celle du parent.
---@param superFunc any
function Enterable:getActiveFarm(superFunc) end

--- Surcharge : lit en plus #isEntered sur un groupe de tableau de bord.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param group any
function Enterable:loadDashboardGroupFromXML(superFunc, xmlFile, key, group) end

--- Surcharge : un groupe de tableau de bord avec #isEntered n'est actif que si l'état d'entrée correspond.
---@param superFunc any
---@param group any
function Enterable:getIsDashboardGroupActive(superFunc, group) end

--- Surcharge : refuse le montage dynamique d'un objet tant que le véhicule est contrôlé.
---@param superFunc any
---@param object any
---@param objectActorId any
---@param jointNode any
---@param mountType any
---@param forceAcceleration any
function Enterable:mountDynamic(superFunc, object, objectActorId, jointNode, mountType, forceAcceleration) end

--- Surcharge : en usage si contrôlé par une autre connexion que celle donnée.
---@param superFunc any
---@param connection any
function Enterable:getIsInUse(superFunc, connection) end

--- Surcharge : lit #updateCharacterTargetModifier sur une pièce dépendante.
---@param superFunc any
---@param xmlFile any
---@param baseName any
---@param entry any
function Enterable:loadExtraDependentParts(superFunc, xmlFile, baseName, entry) end

--- Surcharge : après le parent, marque l'état du personnage à recalculer pour la pièce si demandé.
---@param superFunc any
---@param part any
---@param dt any
function Enterable:updateExtraDependentParts(superFunc, part, dt) end

--- Prépare l'enregistrement des actions de saisie (non relu).
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Enterable:onPreRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Enregistre les actions de sortie, de changement de caméra et de recentrage du suivi de tête (non relu en détail).
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Enterable:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Si le véhicule tombe en panne définitive pendant qu'il est entré, fait quitter le joueur local.
function Enterable:onSetBroken() end

--- Action de saisie : quitte le véhicule (doLeaveVehicle).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Enterable.actionEventLeave(self, actionName, inputValue, callbackState, isAnalog) end

--- Action de saisie : passe à la caméra suivante (hors menu, véhicule entré) via setActiveCameraIndex.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Enterable.actionEventCameraSwitch(self, actionName, inputValue, callbackState, isAnalog) end

--- Action de saisie : recentre le suivi de tête (centerHeadTracking).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Enterable.actionEventResetHeadTracking(self, actionName, inputValue, callbackState, isAnalog) end
