# vehicles/specializations/Enterable.lua

Source: `dataS/scripts/vehicles/specializations/Enterable.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule (pas de prérequis déclaré dans les lignes relues) pour tout véhicule dans lequel un joueur peut monter : état d'occupation (isEntered = ce client conduit ; isControlled = quelqu'un conduit, y compris un autre joueur), caméras du véhicule (VehicleCamera), miroirs, personnage au volant, sons de pluie/grêle dans la cabine, tableau de bord (heure, température extérieure), actions d'entrée/sortie, changement de caméra. ANGLE CAMÉRA / CABINE : les caméras sont chargées depuis vehicle.enterable.cameras.camera(i) (loadCamerasFromXML) et la caméra active est spec.activeCamera (accessible via getActiveCamera). setActiveCameraIndex est le point central d'un changement de vue : il fait passer en mode « intérieur » trois systèmes selon le drapeau useOutdoorSounds de la caméra (g_soundManager:setIsIndoor, ambientSoundSystem:setIsIndoor, g_currentMission.environment.environmentMaskSystem:setIsIndoor : sens exact des effets sur la météo visuelle NON VÉRIFIÉ, classes absentes du dump), règle g_currentMission.environmentAreaSystem:setReferenceNode(activeCamera.cameraNode) (la caméra du véhicule sert de point de référence aux zones d'environnement : NON VÉRIFIÉ), gère la visibilité des miroirs et lève l'événement onCameraChanged(camera, index). Un mod qui doit savoir si le joueur est en vue cabine peut lire spec.activeCamera.isInside (champ lu aussi pour l'activation du suivi de tête) ou écouter onCameraChanged ; à la sortie du véhicule les trois indicateurs « indoor » sont remis à faux. Aussi : la mise à jour de la caméra est faite dans onPostUpdate avec dt (ms) seulement si le véhicule est entré par ce client ; la mise à jour du personnage et des miroirs est dans onPostUpdate. DONNÉES MÉTÉO LUES : spec.weatherObject = g_currentMission.environment.weather (Enterable.lua:340) ; onUpdate (client, véhicule contrôlé) lit weather:getRainFallScale() > 0 pour lancer ou arrêter les échantillons sonores « rain » (XML vehicle.enterable.sounds) et weather:getIsHailing() pour « hail » ; le tableau de bord enregistre les valeurs « time », « timeHours », « timeMinutes » (environment:getEnvironmentTime) et « outsideTemperature » (weather:getCurrentTemperature). Unités/plages : Weather et Environment absents du dump, NON VÉRIFIÉ. Pas de lecture de l'humidité du sol, du vent ni de la saleté ici. Note : onUpdate teste le son de pluie selon une pluie > 0 sans tenir compte du seuil 0.1 utilisé par Washable/VehicleSystem, et ne tient pas compte de l'indoor mask ; cet écart entre systèmes est une observation du code. RÉSEAU : le flux initial transmet isTabbable, l'état « contrôlé » et l'identifiant du joueur au client qui rejoint (onReadStream/onWriteStream) ; pas de flux de mise à jour continu dans cette spécialisation ; l'entrée/sortie est pilotée par la logique joueur (player:requestToEnterVehicle, g_localPlayer:leaveVehicle), qui appelle onPlayerEnterVehicle / onPlayerLeaveVehicle sur toutes les machines. onUpdate appelle rootVehicle:raiseActive() tant que le véhicule est contrôlé pour qu'il reste actif. Particularité : onLoad met self.needWaterInfo = true (champ lu ailleurs, usage NON VÉRIFIÉ). Événements déclarés : onEnterVehicle(isControlling), onLeaveVehicle(wasEntered), onCameraChanged, onVehicleCharacterChanged. Points d'extension pour un moddeur : écouter ces événements (par ex. pour activer un effet seulement quand la vue est intérieure), ou surcharger getIsActive / getIsActiveForInput / getDistanceToNode / interact (déclarés comme surcharges). À noter : Enterable.getIsInteractive est enregistrée comme surcharge (ligne 154) mais n'est pas définie dans ce fichier (non vérifié en jeu : fonction nil ou définie ailleurs). Parties non relues en détail : modificateurs de cibles du personnage (IK), sections XML d'initSpecialization, actions de saisie.

- **Enterable** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Enterable.prerequisitesPresent(specializations: any)` | 20 | ✍ Vérifie les spécialisations requises (non relu en détail). |
| `Enterable.initSpecialization()` | 26 | ✍ Enregistre le schéma XML de la spécialisation (caméras, miroirs, nœuds d'entrée/sortie, personnage, sons, tableaux de bord) et les clés de sauvegarde. Non relu en détail. |
| `Enterable.registerEvents(vehicleType: any)` | 92 | ✍ Déclare les événements onEnterVehicle, onLeaveVehicle, onCameraChanged, onVehicleCharacterChanged. |
| `Enterable.registerFunctions(vehicleType: any)` | 101 | ✍ Enregistre les fonctions de la spécialisation (caméras, personnage, état d'entrée, sortie, miroirs...). Elles sont remplaçables par un mod. |
| `Enterable.registerOverwrittenFunctions(vehicleType: any)` | 148 | ✍ Déclare les surcharges : getIsActive, getIsActiveForInput, getDistanceToNode, getInteractionHelp, interact, getIsInteractive (non définie ici), getCanToggleSelectable, getCanToggleAttach, getActiveFarm, loadDashboardGroupFromXML, getIsDashboardGroupActive, mountDynamic, getIsInUse, loadExtraDependentParts, updateExtraDependentParts, getIsMapHotspotVisible. |
| `Enterable.registerEventListeners(vehicleType: any)` | 169 | ✍ Abonne la spécialisation à onLoad, onPostLoad, onLoadFinished, onRegisterDashboardValueTypes, onDelete, flux réseau initial, onPreUpdate, onUpdate, onPostUpdate, onDrawUIInfo, actions de saisie et onSetBroken. |
| `Enterable:onLoad(savegame: any)` | 188 | ✍ Charge les cartes de miroirs, caméras, personnage, nœuds d'entrée/sortie, hotspot, rayon d'interaction ; mémorise le monde météo (spec.weatherObject), charge les sons de pluie et de grêle (client), crée un nœud de référence de réverbération par défaut à 2 m au-dessus du véhicule, active needWaterInfo, et enregistre le véhicule dans VehicleSystem (interactifs et entrables). Non relu intégralement. |
| `Enterable:onPostLoad(savegame: any)` | 372 | ✍ Post-chargement des caméras ; restaure depuis la sauvegarde l'indice de caméra active, isTabbable et isLeavingAllowed (sauf réinitialisation). |
| `Enterable:onLoadFinished(savegame: any)` | 388 | ✍ Si le véhicule est déjà contrôlé (client qui rejoint), ajoute le hotspot de carte du joueur. |
| `Enterable:onRegisterDashboardValueTypes()` | 398 | ✍ Déclare les valeurs de tableau de bord time, timeHours, timeMinutes (environment:getEnvironmentTime), operatingTime et outsideTemperature (weather:getCurrentTemperature). |
| `Enterable:onDelete()` | 422 | ✍ Fait quitter le joueur si le véhicule est contrôlé, libère personnage, caméras, hotspot, sons, oublie weatherObject et se retire des listes de VehicleSystem. |
| `Enterable:onReadStream(streamId: integer, connection: Connection)` | 461 | ✍ Client qui rejoint : lit isTabbable et, si le véhicule est contrôlé, l'identifiant du joueur pour le faire entrer (player:onEnterVehicle). |
| `Enterable:onWriteStream(streamId: integer, connection: Connection)` | 479 | ✍ Serveur : écrit isTabbable, l'état contrôlé et l'identifiant du joueur contrôleur. |
| `Enterable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 491 | ✍ Sauvegarde chaque caméra, l'indice de caméra active, isTabbable et isLeavingAllowed. |
| `Enterable:saveStatsToXMLFile(xmlFile: any, key: any) → string` | 505 | ✍ Écrit le nom du contrôleur dans les statistiques de partie si le véhicule est contrôlé. |
| `Enterable:onPreUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 521 | ✍ Fait décompter, image par image, les états sales des modificateurs de cibles du personnage et les relance. |
| `Enterable:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 549 | ✍ Par frame, seulement si le véhicule est contrôlé. Client : met à jour les modificateurs de cibles du personnage, bascule le personnage additionnel, démarre/arrête les sons de pluie (weather:getRainFallScale() > 0) et de grêle (weather:getIsHailing()) selon le changement d'état, renseigne la position et la direction du véhicule à activatableObjectsSystem si actif pour la saisie. Dans tous les cas, appelle rootVehicle:raiseActive(). |
| `Enterable:onPostUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 622 | ✍ Client : met à jour la spine du personnage (selon l'accélération), la caméra active (dt, seulement si le véhicule est entré localement et après la première mise à jour), la visibilité du personnage, l'animation du personnage et rend visibles les miroirs si la caméra les utilise. |
| `Enterable:onDrawUIInfo()` | 660 | ✍ Affiche le pseudo du conducteur au-dessus du véhicule en multijoueur si l'interface est visible, le réglage SHOW_MULTIPLAYER_NAMES actif, et la caméra à moins de Enterable.NICKNAME_RENDER_DISTANCE (constante hors fichier : NON VÉRIFIÉ). |
| `Enterable:loadCamerasFromXML(xmlFile: any, savegame: any)` | 680 | ✍ Charge toutes les caméras (VehicleCamera) du XML vehicle.enterable.cameras.camera(i) et mémorise leur nombre. |
| `Enterable:loadAdditionalCharacterFromXML(xmlFile: any)` | 707 | ✍ Charge les cibles et le nœud d'un personnage additionnel (non relu en détail). |
| `Enterable:getIsAdditionalCharacterActive()` | 722 | ✍ Indique si le personnage additionnel est actif (non relu en détail). |
| `Enterable:loadCharacterTargetNodeModifier(entry: any, xmlFile: any, xmlKey: any)` | 728 | ✍ Charge un modificateur de position de cibles IK du personnage (non relu en détail). |
| `Enterable:updateCharacterTargetNodeModifier(dt: any, modifier: any)` | 792 | ✍ Met à jour un modificateur de cibles IK du personnage avec dt (non relu en détail). |
| `Enterable:setCharacterTargetNodeStateDirty(referenceNode: any, forceActive: any)` | 871 | ✍ Marque l'état d'un nœud cible du personnage comme à recalculer (non relu en détail). |
| `Enterable:resetCharacterTargetNodeStateDefaults(referenceNode: any)` | 909 | ✍ Remet les états par défaut des nœuds cibles du personnage (non relu en détail). |
| `Enterable:onPlayerEnterVehicle(isControlling: boolean, playerStyle: integer, farmId: integer, userId: any)` | 926 | ✍ Entrée d'un joueur (appelée sur toutes les machines) : marque le véhicule contrôlé/entré, mémorise farm et utilisateur, force la sélection, choisit la caméra (première caméra intérieure si suivi de tête, caméra 1 si RESET_CAMERA, sinon la dernière), appelle setActiveCameraIndex, informe VehicleSystem, hotspot de carte, personnage et animation d'entrée, lève onEnterVehicle et la notification d'état ENTER_VEHICLE, active les actions de saisie, enregistre le véhicule dans le système de trafic côté serveur si non contrôlé localement. |
| `Enterable:getCanLeave()` | 1001 | ✍ Vrai si le véhicule est entré par ce client. |
| `Enterable:getCanLeaveVehicle()` | 1008 | ✍ Vrai si on peut quitter un véhicule (non monture). |
| `Enterable:getCanLeaveRideable()` | 1015 | ✍ Vrai si on peut quitter une monture (spécialisation rideable). |
| `Enterable:getIsLeavingAllowed()` | 1022 | ✍ Indique si la sortie est autorisée. |
| `Enterable:setIsLeavingAllowed(isAllowed: any)` | 1028 | ✍ Autorise ou interdit la sortie du véhicule. |
| `Enterable:onEnterableMirrorSettingChanged()` | 1034 | ✍ Réagit au changement du réglage du nombre maximal de miroirs en recalculant les miroirs visibles (corps non relu). |
| `Enterable:doLeaveVehicle()` | 1041 | ✍ Demande au joueur local de quitter le véhicule si la sortie est possible et autorisée. |
| `Enterable:onPlayerLeaveVehicle()` | 1052 | ✍ Sortie du joueur : désactive la caméra active, remet à faux les indicateurs « indoor » du son, de l'ambiance et du système de masque d'environnement, coupe les sons de pluie/grêle, retire le hotspot, remet l'état (contrôlé, entré) à zéro, joue l'animation de sortie à l'envers, cache les miroirs, lève onLeaveVehicle et la notification LEAVE_VEHICLE, désactive les actions de saisie et le trafic, désactive le véhicule si getDeactivateOnLeave. |
| `Enterable:getIsMapHotspotVisible(superFunc: any)` | 1125 | ✍ Surcharge : le hotspot de carte du véhicule n'est visible que s'il n'est pas contrôlé. |
| `Enterable:setActiveCameraIndex(index: integer)` | 1136 | ✍ Change la caméra active (retour à 1 si hors limites) : désactive l'ancienne, active la nouvelle, règle les indicateurs indoor (son, ambiance, environmentMaskSystem) selon useOutdoorSounds, met à jour les miroirs, règle le nœud de référence de environmentAreaSystem sur la caméra, lève onCameraChanged. Ne fait rien si la caméra demandée est déjà active. |
| `Enterable:addToolCameras(cameras: table)` | 1168 | ✍ Ajoute à la liste des caméras celles d'un outil attelé. |
| `Enterable:removeToolCameras(cameras: table)` | 1180 | ✍ Retire des caméras d'outil et, si l'une était active, revient à la caméra 1. |
| `Enterable:getExitNode(player: any)` | 1213 | ✍ Renvoie le nœud de sortie du véhicule (exitPoint). |
| `Enterable:getUserPlayerStyle()` | 1220 | ✍ Renvoie le style du joueur mémorisé à l'entrée. |
| `Enterable:getCurrentPlayerStyle()` | 1226 | ✍ Renvoie le style du personnage actuellement affiché, ou nil. |
| `Enterable:setVehicleCharacter(playerStyle: any)` | 1237 | ✍ Supprime puis recharge le personnage du véhicule avec un style de joueur, éventuellement adapté par un préréglage personnalisé du véhicule. |
| `Enterable:vehicleCharacterLoaded(loadingState: any, arguments: any)` | 1265 | ✍ Rappel de fin de chargement du personnage (non relu en détail). |
| `Enterable:onPlayerStyleChanged(style: any, userId: any)` | 1279 | ✍ Réagit à un changement de style de joueur (non relu en détail). |
| `Enterable:setRandomVehicleCharacter(helper: any)` | 1294 | ✍ Charge un personnage aléatoire (IA/assistants, non relu en détail). |
| `Enterable:restoreVehicleCharacter()` | 1310 | ✍ Restaure le personnage du véhicule (non relu en détail). |
| `Enterable:deleteVehicleCharacter()` | 1323 | ✍ Supprime le personnage du véhicule (non relu en détail). |
| `Enterable:getFormattedOperatingTime()` | 1337 | ✍ Renvoie la durée de fonctionnement en heures décimales (dizaines de minutes) pour le tableau de bord. |
| `Enterable:getIsActive(superFunc: any)` | 1348 | ✍ Surcharge : un véhicule entré ou contrôlé est toujours actif. |
| `Enterable:getIsActiveForInput(superFunc: any, ignoreSelection: any, activeForAI: any)` | 1359 | ✍ Surcharge : actif pour la saisie seulement si le parent l'accepte, que le joueur n'est pas figé, et que ce véhicule ou un autre de la chaîne attelée est entré. |
| `Enterable:getDistanceToNode(superFunc: integer, node: any) → number` | 1396 | ✍ Surcharge : si le véhicule n'est pas contrôlé et qu'un nœud est plus proche que le rayon d'interaction du point d'entrée, renvoie cette distance et positionne l'indicateur d'interaction « entrable ». |
| `Enterable:getInteractionHelp(superFunc: any) → string` | 1422 | ✍ Surcharge : renvoie le texte d'entrée si l'interaction courante est « entrable ». |
| `Enterable:interact(superFunc: any, player: any)` | 1432 | ✍ Surcharge : demande au joueur d'entrer dans le véhicule si l'interaction courante est « entrable ». |
| `Enterable:setMirrorVisible(visible: any)` | 1450 | ✍ Affiche ou masque les miroirs : en affichage, trie par priorité puis par angle par rapport à la caméra (seulement miroirs dans le champ de vision) et n'en montre que le nombre maximal défini par le réglage MAX_NUM_MIRRORS. |
| `Enterable:getIsTabbable()` | 1505 | ✍ Indique si le véhicule participe au changement par touche tabulation. |
| `Enterable:setIsTabbable(isTabbable: any)` | 1511 | ✍ Règle isTabbable (nil vaut faux). |
| `Enterable:getIsEnterable()` | 1521 | ✍ Vrai (client) si le véhicule a un point d'entrée et de sortie, n'est pas cassé ni contrôlé et si le joueur a accès (accessHandler). |
| `Enterable:getIsEnterableFromMenu()` | 1529 | ✍ Vrai si enterable et autorisé à être sélectionné depuis le menu. |
| `Enterable:getIsEntered()` | 1535 | ✍ Vrai si ce client est entré dans le véhicule. |
| `Enterable:getIsControlled()` | 1541 | ✍ Vrai si un joueur (quelconque) contrôle le véhicule. |
| `Enterable:getIsEnteredForInput()` | 1547 | ✍ Vrai si entré et contrôlé. |
| `Enterable:getControllerName()` | 1554 | ✍ Pseudo du conducteur, par connexion côté serveur ou par identifiant côté client ; chaîne vide sinon. |
| `Enterable:getActiveCamera()` | 1572 | ✍ Renvoie la caméra active du véhicule (VehicleCamera). |
| `Enterable:getVehicleCharacter()` | 1578 | ✍ Renvoie le personnage du véhicule. |
| `Enterable:getAllowCharacterVisibilityUpdate()` | 1584 | ✍ Renvoie vrai : autorise la mise à jour de visibilité du personnage (remplaçable). |
| `Enterable:getDisableVehicleCharacterOnLeave()` | 1590 | ✍ Indique si le personnage doit être supprimé à la sortie. |
| `Enterable:getCanToggleSelectable(superFunc: any)` | 1596 | ✍ Surcharge : vrai si entré, sinon valeur du parent. |
| `Enterable:getCanToggleAttach(superFunc: any)` | 1605 | ✍ Surcharge : faux si non entré, sinon valeur du parent. |
| `Enterable:getActiveFarm(superFunc: any)` | 1614 | ✍ Surcharge : renvoie la ferme du contrôleur si non nulle, sinon celle du parent. |
| `Enterable:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 1627 | ✍ Surcharge : lit en plus #isEntered sur un groupe de tableau de bord. |
| `Enterable:getIsDashboardGroupActive(superFunc: any, group: any)` | 1639 | ✍ Surcharge : un groupe de tableau de bord avec #isEntered n'est actif que si l'état d'entrée correspond. |
| `Enterable:mountDynamic(superFunc: any, object: any, objectActorId: any, jointNode: any, mountType: any, forceAcceleration: any)` | 1651 | ✍ Surcharge : refuse le montage dynamique d'un objet tant que le véhicule est contrôlé. |
| `Enterable:getIsInUse(superFunc: any, connection: any)` | 1663 | ✍ Surcharge : en usage si contrôlé par une autre connexion que celle donnée. |
| `Enterable:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 1674 | ✍ Surcharge : lit #updateCharacterTargetModifier sur une pièce dépendante. |
| `Enterable:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 1686 | ✍ Surcharge : après le parent, marque l'état du personnage à recalculer pour la pièce si demandé. |
| `Enterable:onPreRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1696 | ✍ Prépare l'enregistrement des actions de saisie (non relu). |
| `Enterable:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1703 | ✍ Enregistre les actions de sortie, de changement de caméra et de recentrage du suivi de tête (non relu en détail). |
| `Enterable:onSetBroken()` | 1745 | ✍ Si le véhicule tombe en panne définitive pendant qu'il est entré, fait quitter le joueur local. |
| `Enterable.actionEventLeave(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1754 | ✍ Action de saisie : quitte le véhicule (doLeaveVehicle). |
| `Enterable.actionEventCameraSwitch(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1760 | ✍ Action de saisie : passe à la caméra suivante (hors menu, véhicule entré) via setActiveCameraIndex. |
| `Enterable.actionEventResetHeadTracking(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1781 | ✍ Action de saisie : recentre le suivi de tête (centerHeadTracking). |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onEnterVehicle` | 93 |
| registerEvent | `onLeaveVehicle` | 94 |
| registerEvent | `onCameraChanged` | 95 |
| registerEvent | `onVehicleCharacterChanged` | 96 |
| registerFunction | `onPlayerEnterVehicle` | 102 |
| registerFunction | `doLeaveVehicle` | 103 |
| registerFunction | `onPlayerLeaveVehicle` | 104 |
| registerFunction | `setActiveCameraIndex` | 105 |
| registerFunction | `addToolCameras` | 106 |
| registerFunction | `removeToolCameras` | 107 |
| registerFunction | `getExitNode` | 108 |
| registerFunction | `getUserPlayerStyle` | 109 |
| registerFunction | `getCurrentPlayerStyle` | 110 |
| registerFunction | `setVehicleCharacter` | 111 |
| registerFunction | `vehicleCharacterLoaded` | 112 |
| registerFunction | `onPlayerStyleChanged` | 113 |
| registerFunction | `setRandomVehicleCharacter` | 114 |
| registerFunction | `restoreVehicleCharacter` | 115 |
| registerFunction | `deleteVehicleCharacter` | 116 |
| registerFunction | `getFormattedOperatingTime` | 117 |
| registerFunction | `loadCharacterTargetNodeModifier` | 118 |
| registerFunction | `updateCharacterTargetNodeModifier` | 119 |
| registerFunction | `setCharacterTargetNodeStateDirty` | 120 |
| registerFunction | `resetCharacterTargetNodeStateDefaults` | 121 |
| registerFunction | `setMirrorVisible` | 122 |
| registerFunction | `getIsTabbable` | 123 |
| registerFunction | `setIsTabbable` | 124 |
| registerFunction | `getIsEnterable` | 125 |
| registerFunction | `getIsEnterableFromMenu` | 126 |
| registerFunction | `getIsEntered` | 127 |
| registerFunction | `getIsControlled` | 128 |
| registerFunction | `getIsEnteredForInput` | 129 |
| registerFunction | `getControllerName` | 130 |
| registerFunction | `getActiveCamera` | 131 |
| registerFunction | `getVehicleCharacter` | 132 |
| registerFunction | `getAllowCharacterVisibilityUpdate` | 133 |
| registerFunction | `getDisableVehicleCharacterOnLeave` | 134 |
| registerFunction | `loadCamerasFromXML` | 135 |
| registerFunction | `loadAdditionalCharacterFromXML` | 136 |
| registerFunction | `getIsAdditionalCharacterActive` | 137 |
| registerFunction | `getCanLeave` | 138 |
| registerFunction | `getCanLeaveVehicle` | 139 |
| registerFunction | `getCanLeaveRideable` | 140 |
| registerFunction | `getIsLeavingAllowed` | 141 |
| registerFunction | `setIsLeavingAllowed` | 142 |
| registerFunction | `onEnterableMirrorSettingChanged` | 143 |
| registerOverwrittenFunction | `getIsActive` | 149 |
| registerOverwrittenFunction | `getIsActiveForInput` | 150 |
| registerOverwrittenFunction | `getDistanceToNode` | 151 |
| registerOverwrittenFunction | `getInteractionHelp` | 152 |
| registerOverwrittenFunction | `interact` | 153 |
| registerOverwrittenFunction | `getIsInteractive` | 154 |
| registerOverwrittenFunction | `getCanToggleSelectable` | 155 |
| registerOverwrittenFunction | `getCanToggleAttach` | 156 |
| registerOverwrittenFunction | `getActiveFarm` | 157 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 158 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 159 |
| registerOverwrittenFunction | `mountDynamic` | 160 |
| registerOverwrittenFunction | `getIsInUse` | 161 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 162 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 163 |
| registerOverwrittenFunction | `getIsMapHotspotVisible` | 164 |
| registerEventListener | `onLoad` | 170 |
| registerEventListener | `onPostLoad` | 171 |
| registerEventListener | `onLoadFinished` | 172 |
| registerEventListener | `onRegisterDashboardValueTypes` | 173 |
| registerEventListener | `onDelete` | 174 |
| registerEventListener | `onReadStream` | 175 |
| registerEventListener | `onWriteStream` | 176 |
| registerEventListener | `onPreUpdate` | 177 |
| registerEventListener | `onUpdate` | 178 |
| registerEventListener | `onPostUpdate` | 179 |
| registerEventListener | `onDrawUIInfo` | 180 |
| registerEventListener | `onPreRegisterActionEvents` | 181 |
| registerEventListener | `onRegisterActionEvents` | 182 |
| registerEventListener | `onSetBroken` | 183 |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.367)
- subscribes `MessageType.INPUT_BINDINGS_CHANGED` (l.987)
- subscribes `MessageType.PLAYER_STYLE_CHANGED` (l.1274)
