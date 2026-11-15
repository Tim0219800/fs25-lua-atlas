---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Plow.lua (stub généré, atlas Lua FS25)

--- Spécialisation des charrues (réversibles ou non, repliables). AUCUN effet, particule ni animationNode d'effet : la seule animation gérée est la rotation de la charrue (turnAnimation) et les pièces tournantes (speedRotatingParts) ; le son de travail et de retournement est géré côté client. La terre soulevée par une charrue vient de WorkParticles (WorkParticles.lua:238 : actif si getDoGroundManipulation() et sur champ ; Plow ne surcharge pas getDoGroundManipulation, donc valeur par défaut vrai, WorkParticles.lua:311, indépendante de l'état de travail de ce script). TRAVAIL : processPlowArea (zone PLOW) efface les traces de pneus (aussi sur client lointain), puis, sauf client plus loin que Plow.CLIENT_DM_UPDATE_RADIUS (constante non définie ici : NON VÉRIFIÉ), appelle FSDensityMapUtil.updatePlowArea (avec angle, limitToField, limitFruitDestructionToField) et updateVineCultivatorArea, mais seulement si self.tailwaterDepth < 0.1 (pas de labour sous plus de 0.1 de profondeur d'eau, unité non précisée dans ce fichier) ; isWorking = vitesse > 0.5, même si rien n'est labouré. Les corps FSDensityMapUtil sont absents du dump : effet exact sur le terrain NON VÉRIFIÉ. CONDITIONS de zone : inactive pendant 2000 ms après l'attelage, et, par défaut, si l'outil n'est pas abaissé (onlyActiveWhenLowered). L'allumage n'existe pas pour une charrue. LIMITE AU CHAMP : l'option limitToField (basculable par action IMPLEMENT_EXTRA3, synchronisée par PlowLimitToFieldEvent) est forcée à vrai sans la permission createFields ou sur les plateformes qui interdisent la création de champs ; remise à vrai au dételage. ROTATION : setRotationMax/setRotationCenter pilotent l'animation et envoient PlowRotationEvent / PlowRotationCenterEvent ; l'état (rotationMax, temps d'animation) est sauvegardé (saveToXMLFile) et envoyé au flux initial. La rotation est refusée si le pliage, la hauteur, l'alimentation (getIsPowered) ou l'état de levage ne le permettent pas ; les tournages IA se font en bout de ligne (onAIImplement*). MÉTÉO/HUMIDITÉ : aucune lecture. RÉSEAU : seulement flux initial (rotation) et événements de rotation/limite ; aucun effet synchronisé. dt : non utilisé hors signature (statistiques de temps : dt/60000 min, plowedTime). Statistiques serveur : plowedHectares, plowedTime. POINTS D'EXTENSION : fonctions setRotationMax, setRotationCenter, setPlowLimitToField, getIsPlowRotationAllowed, getCanTogglePlowRotation, getPlowLimitToField, getPlowForceLimitToField, setPlowAIRequirements, processPlowArea ; nombreuses surcharges (pliage, détachement, abaissement, IA, pièces tournantes, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML type PLOW, getIsWorkAreaActive). Vitesse limite par défaut : 15. Initialisation et enregistrement XML (initSpecialization, registerXMLPaths) non relus clé par clé.
---@class Plow
Plow = {}

--- Déclare le type de zone plow, la configuration de charrue et le schéma XML. Non relu clé par clé.
function Plow.initSpecialization() end

--- Enregistre les clés XML de vehicle.plow : rotationPart (animation, limites de pliage/détachement), directionNode, onlyActiveWhenLowered, paramètres IA, sons. Non relu clé par clé.
---@param schema any
---@param basePath any
function Plow.registerXMLPaths(schema, basePath) end

--- Exige la spécialisation WorkArea.
---@param specializations any
function Plow.prerequisitesPresent(specializations) end

--- Enregistre les fonctions de rotation, de limite au champ, de besoins IA et processPlowArea.
---@param vehicleType any
function Plow.registerFunctions(vehicleType) end

--- Surcharge pliage, détachement, abaissement, IA, pièces tournantes, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getIsWorkAreaActive, doCheckSpeedLimit et getCanBeSelected (liste non relue ligne à ligne).
---@param vehicleType any
function Plow.registerOverwrittenFunctions(vehicleType) end

--- S'abonne notamment à onLoad, onPostLoad, onDelete, flux initial, onUpdate, onRegisterActionEvents, aux événements de traitement de zone, onPostAttach, onPreDetach, onDeactivate, aux événements IA, d'animation, de pliage et onRootVehicleChanged.
---@param vehicleType any
function Plow.registerEventListeners(vehicleType) end

--- Lit la configuration de charrue : parties tournantes, limites d'animation, noeud de direction, paramètres IA, textes, sons ; initialise rotationMax, limitToField, délai d'activation et les paramètres de passe (lecture détaillée non relue).
---@param savegame any
function Plow:onLoad(savegame) end

--- Restaure depuis la sauvegarde l'orientation de la charrue (rotationMax, temps d'animation) si la rotation est permise.
---@param savegame any
function Plow:onPostLoad(savegame) end

--- Libère les sons de travail et de retournement.
function Plow:onDelete() end

--- Sauvegarde rotationMax et le temps d'animation de rotation.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Plow:saveToXMLFile(xmlFile, key, usedModNames) end

--- Lit orientation et temps d'animation envoyés à la connexion et les applique.
---@param streamId any
---@param connection any
function Plow:onReadStream(streamId, connection) end

--- Écrit l'orientation et le temps d'animation.
---@param streamId any
---@param connection any
function Plow:onWriteStream(streamId, connection) end

--- Client : met à jour le texte/l'activation des actions de limite au champ (selon permission) et de rotation (selon getCanTogglePlowRotation). Aucun effet visuel.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Plow:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Efface les traces de pneus, laboure la zone dans la carte de densité (hors client lointain et si l'eau est assez basse), cumule les surfaces et met isWorking (vitesse > 0.5). Renvoie surface modifiée et totale.
---@param workArea any
---@param dt any
function Plow:processPlowArea(workArea, dt) end

--- Fixe le côté de la charrue, envoie PlowRotationEvent et lance l'animation de rotation (ou la place directement à un temps donné).
---@param rotationMax any
---@param noEventSend any
---@param turnAnimationTime any
function Plow:setRotationMax(rotationMax, noEventSend, turnAnimationTime) end

--- Amène l'animation vers la position centrale IA et envoie PlowRotationCenterEvent.
---@param noEventSend any
function Plow:setRotationCenter(noEventSend) end

--- Change l'option limitToField, la diffuse (serveur : à tous ; client : au serveur) et met à jour le texte de l'action.
---@param plowLimitToField any
---@param noEventSend any
function Plow:setPlowLimitToField(plowLimitToField, noEventSend) end

--- Vrai si l'état de pliage permet la rotation (limites rotationFoldMin/Max).
function Plow:getIsPlowRotationAllowed() end

--- Vrai si la rotation est permise par le pliage, si l'outil n'est pas abaissé quand rotationAllowedIfLowered est faux, et si le véhicule est alimenté (getIsPowered).
function Plow:getCanTogglePlowRotation() end

--- Renvoie l'option limitToField.
---@return boolean
function Plow:getPlowLimitToField() end

--- Vrai si la limite est imposée (forceLimitToField ou plateforme sans création de champs).
---@return boolean
function Plow:getPlowForceLimitToField() end

--- Définit les types de sol exigés par l'IA (avec exclusions éventuelles) et active le décalage latéral variable.
---@param excludedGroundTypes table
function Plow:setPlowAIRequirements(excludedGroundTypes) end

--- Interdit le pliage si la charrue est retournée dans une position non permise ou abaissée selon la configuration.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function Plow:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Idem pour la position de pliage intermédiaire.
---@param superFunc any
function Plow:getIsFoldMiddleAllowed(superFunc) end

--- Ajoute la salissure de travail pondérée vitesse/limite quand isWorking.
---@param superFunc any
function Plow:getDirtMultiplier(superFunc) end

--- Ajoute l'usure de travail pondérée vitesse/limite quand isWorking.
---@param superFunc any
---@return number
function Plow:getWearMultiplier(superFunc) end

--- Lit les options de pièces tournantes liées au retournement (disableOnTurn, turnAnimLimit, turnAnimLimitSide, invertDirectionOnRotation).
---@param superFunc any
---@param speedRotatingPart any
---@param xmlFile any
---@param key any
function Plow:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

--- Désactive une pièce tournante pendant le retournement selon le temps d'animation et ses limites.
---@param superFunc any
---@param speedRotatingPart any
function Plow:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

--- Inverse le sens de rotation d'une pièce quand la charrue est retournée (temps d'animation > 0.5).
---@param superFunc any
---@param speedRotatingPart any
function Plow:getSpeedRotatingPartDirection(superFunc, speedRotatingPart) end

--- Applique la limite de vitesse si onlyActiveWhenLowered et la chaîne d'outils est abaissée.
---@param superFunc any
function Plow:doCheckSpeedLimit(superFunc) end

--- Force le type de zone PLOW si DEFAULT.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function Plow:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Limite de vitesse par défaut : 15.
function Plow.getDefaultSpeedLimit() end

--- Pour PLOW : inactive pendant le délai post-attelage et, si exigé, tant que l'outil n'est pas abaissé.
---@param superFunc any
---@param workArea any
function Plow:getIsWorkAreaActive(superFunc, workArea) end

--- L'IA ne continue pas pendant que l'animation de rotation joue (sauf paramètre stopDuringTurn).
---@param superFunc any
---@param isTurning any
function Plow:getCanAIImplementContinueWork(superFunc, isTurning) end

--- Indique si les marqueurs IA sont inversés dans un virage selon le côté de la charrue.
---@param superFunc any
---@param turnLeft any
function Plow:getAIInvertMarkersOnTurn(superFunc, turnLeft) end

--- Renvoie vrai : l'outil est sélectionnable.
---@param superFunc any
function Plow:getCanBeSelected(superFunc) end

--- Refuse le dételage pendant la rotation ou hors des limites d'animation de détachement (avec avertissement).
---@param superFunc any
---@return boolean
function Plow:isDetachAllowed(superFunc) end

--- Refuse l'abaissement pendant la rotation.
---@param superFunc any
---@return boolean
function Plow:getAllowsLowering(superFunc) end

--- Pas prête pour l'IA si rotationMax est vrai ou si la rotation est en cours.
---@param superFunc any
function Plow:getIsAIReadyToDrive(superFunc) end

--- Vrai pendant la rotation.
---@param superFunc any
function Plow:getIsAIPreparingToDrive(superFunc) end

--- Enregistre les actions de rotation (si animation) et de limite au champ (IMPLEMENT_EXTRA3).
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Plow:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Avant la passe : isWorking = faux ; calcule limitToField (forcé sans permission createFields) et l'angle de la carte de densité ; remet les surfaces à zéro.
---@param dt any
function Plow:onStartWorkAreaProcessing(dt) end

--- Serveur : statistiques plowedHectares/plowedTime et surface travaillée. Client : démarre/arrête le son de travail selon isWorking.
---@param dt any
function Plow:onEndWorkAreaProcessing(dt) end

--- Arme le délai d'activation (2000 ms) et reprend une animation de rotation interrompue au dételage.
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function Plow:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Remet limitToField à vrai et stoppe une rotation en cours (mémorisée pour reprise).
---@param attacherVehicle table
---@param implement table
function Plow:onPreDetach(attacherVehicle, implement) end

--- Coupe les sons de travail et de retournement.
function Plow:onDeactivate() end

--- Paramètres de parcours IA : recouvrement total et angle de découpe de 25 degrés.
---@param fieldCourseSettings any
function Plow:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Réinitialise la position de tête de champ de l'IA.
---@param isLeft any
function Plow:onAIImplementStartTurn(isLeft) end

--- Pendant un virage IA : passe la charrue au centre puis la retourne complètement aux positions de progression configurées.
---@param progress any
---@param isLeft any
---@param movingDirection any
function Plow:onAIImplementTurnProgress(progress, isLeft, movingDirection) end

--- Retourne la charrue du côté du virage à la fin du virage IA.
---@param isLeft any
function Plow:onAIImplementEndTurn(isLeft) end

--- Applique le côté initial de la charrue (immédiatement ou dès que la rotation sera permise).
---@param isLeft any
---@param isInitial any
function Plow:onAIImplementSideOffsetChanged(isLeft, isInitial) end

--- Efface la rotation différée IA.
function Plow:onAIImplementEnd() end

--- Joue le son de retournement au début de l'animation de rotation.
---@param animName any
function Plow:onStartAnimation(animName) end

--- Coupe le son de retournement à la fin de l'animation de rotation.
---@param animName any
function Plow:onFinishAnimation(animName) end

--- Serveur : applique une rotation IA différée dès qu'elle devient permise.
---@param foldAnimTime any
function Plow:onFoldTimeChanged(foldAnimTime) end

--- Enregistre/met à jour auprès de l'actionController les actions « rotatePlow » et « rotateBackPlow » (retournement, lié à l'IA).
---@param rootVehicle table
function Plow:onRootVehicleChanged(rootVehicle) end

--- Callback d'entrée : bascule le côté de la charrue si permis.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Plow.actionEventTurn(self, actionName, inputValue, callbackState, isAnalog) end

--- Callback d'entrée : bascule limitToField si non imposée.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Plow.actionEventLimitToField(self, actionName, inputValue, callbackState, isAnalog) end

--- Callback d'actionController : ramène la charrue à l'état non retourné sur événement IA.
---@param self any
---@param direction any
---@param isAIEvent any
function Plow.actionControllerRotateBackEvent(self, direction, isAIEvent) end

--- Callback d'actionController : retourne la charrue ou termine l'animation interrompue.
---@param self any
---@param direction any
---@param isAIEvent any
function Plow.actionControllerRotateEvent(self, direction, isAIEvent) end
