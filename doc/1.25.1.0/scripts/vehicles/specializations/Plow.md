# vehicles/specializations/Plow.lua

Source : `dataS/scripts/vehicles/specializations/Plow.lua` — FS25 1.25.1.0

✍ Spécialisation des charrues (réversibles ou non, repliables). AUCUN effet, particule ni animationNode d'effet : la seule animation gérée est la rotation de la charrue (turnAnimation) et les pièces tournantes (speedRotatingParts) ; le son de travail et de retournement est géré côté client. La terre soulevée par une charrue vient de WorkParticles (WorkParticles.lua:238 : actif si getDoGroundManipulation() et sur champ ; Plow ne surcharge pas getDoGroundManipulation, donc valeur par défaut vrai, WorkParticles.lua:311, indépendante de l'état de travail de ce script). TRAVAIL : processPlowArea (zone PLOW) efface les traces de pneus (aussi sur client lointain), puis, sauf client plus loin que Plow.CLIENT_DM_UPDATE_RADIUS (constante non définie ici : NON VÉRIFIÉ), appelle FSDensityMapUtil.updatePlowArea (avec angle, limitToField, limitFruitDestructionToField) et updateVineCultivatorArea, mais seulement si self.tailwaterDepth < 0.1 (pas de labour sous plus de 0.1 de profondeur d'eau, unité non précisée dans ce fichier) ; isWorking = vitesse > 0.5, même si rien n'est labouré. Les corps FSDensityMapUtil sont absents du dump : effet exact sur le terrain NON VÉRIFIÉ. CONDITIONS de zone : inactive pendant 2000 ms après l'attelage, et, par défaut, si l'outil n'est pas abaissé (onlyActiveWhenLowered). L'allumage n'existe pas pour une charrue. LIMITE AU CHAMP : l'option limitToField (basculable par action IMPLEMENT_EXTRA3, synchronisée par PlowLimitToFieldEvent) est forcée à vrai sans la permission createFields ou sur les plateformes qui interdisent la création de champs ; remise à vrai au dételage. ROTATION : setRotationMax/setRotationCenter pilotent l'animation et envoient PlowRotationEvent / PlowRotationCenterEvent ; l'état (rotationMax, temps d'animation) est sauvegardé (saveToXMLFile) et envoyé au flux initial. La rotation est refusée si le pliage, la hauteur, l'alimentation (getIsPowered) ou l'état de levage ne le permettent pas ; les tournages IA se font en bout de ligne (onAIImplement*). MÉTÉO/HUMIDITÉ : aucune lecture. RÉSEAU : seulement flux initial (rotation) et événements de rotation/limite ; aucun effet synchronisé. dt : non utilisé hors signature (statistiques de temps : dt/60000 min, plowedTime). Statistiques serveur : plowedHectares, plowedTime. POINTS D'EXTENSION : fonctions setRotationMax, setRotationCenter, setPlowLimitToField, getIsPlowRotationAllowed, getCanTogglePlowRotation, getPlowLimitToField, getPlowForceLimitToField, setPlowAIRequirements, processPlowArea ; nombreuses surcharges (pliage, détachement, abaissement, IA, pièces tournantes, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML type PLOW, getIsWorkAreaActive). Vitesse limite par défaut : 15. Initialisation et enregistrement XML (initSpecialization, registerXMLPaths) non relus clé par clé.

- **Plow** (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Plow.initSpecialization()` | 38 | ✍ Déclare le type de zone plow, la configuration de charrue et le schéma XML. Non relu clé par clé. |
| `Plow.registerXMLPaths(schema: any, basePath: any)` | 63 | ✍ Enregistre les clés XML de vehicle.plow : rotationPart (animation, limites de pliage/détachement), directionNode, onlyActiveWhenLowered, paramètres IA, sons. Non relu clé par clé. |
| `Plow.prerequisitesPresent(specializations: any)` | 95 | ✍ Exige la spécialisation WorkArea. |
| `Plow.registerFunctions(vehicleType: any)` | 101 | ✍ Enregistre les fonctions de rotation, de limite au champ, de besoins IA et processPlowArea. |
| `Plow.registerOverwrittenFunctions(vehicleType: any)` | 116 | ✍ Surcharge pliage, détachement, abaissement, IA, pièces tournantes, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getIsWorkAreaActive, doCheckSpeedLimit et getCanBeSelected (liste non relue ligne à ligne). |
| `Plow.registerEventListeners(vehicleType: any)` | 138 | ✍ S'abonne notamment à onLoad, onPostLoad, onDelete, flux initial, onUpdate, onRegisterActionEvents, aux événements de traitement de zone, onPostAttach, onPreDetach, onDeactivate, aux événements IA, d'animation, de pliage et onRootVehicleChanged. |
| `Plow:onLoad(savegame: any)` | 165 | ✍ Lit la configuration de charrue : parties tournantes, limites d'animation, noeud de direction, paramètres IA, textes, sons ; initialise rotationMax, limitToField, délai d'activation et les paramètres de passe (lecture détaillée non relue). |
| `Plow:onPostLoad(savegame: any)` | 254 | ✍ Restaure depuis la sauvegarde l'orientation de la charrue (rotationMax, temps d'animation) si la rotation est permise. |
| `Plow:onDelete()` | 272 | ✍ Libère les sons de travail et de retournement. |
| `Plow:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 282 | ✍ Sauvegarde rotationMax et le temps d'animation de rotation. |
| `Plow:onReadStream(streamId: any, connection: any)` | 293 | ✍ Lit orientation et temps d'animation envoyés à la connexion et les applique. |
| `Plow:onWriteStream(streamId: any, connection: any)` | 311 | ✍ Écrit l'orientation et le temps d'animation. |
| `Plow:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 323 | ✍ Client : met à jour le texte/l'activation des actions de limite au champ (selon permission) et de rotation (selon getCanTogglePlowRotation). Aucun effet visuel. |
| `Plow:processPlowArea(workArea: any, dt: any)` | 353 | ✍ Efface les traces de pneus, laboure la zone dans la carte de densité (hors client lointain et si l'eau est assez basse), cumule les surfaces et met isWorking (vitesse > 0.5). Renvoie surface modifiée et totale. |
| `Plow:setRotationMax(rotationMax: any, noEventSend: any, turnAnimationTime: any)` | 402 | ✍ Fixe le côté de la charrue, envoie PlowRotationEvent et lance l'animation de rotation (ou la place directement à un temps donné). |
| `Plow:setRotationCenter(noEventSend: any)` | 425 | ✍ Amène l'animation vers la position centrale IA et envoie PlowRotationCenterEvent. |
| `Plow:setPlowLimitToField(plowLimitToField: any, noEventSend: any)` | 446 | ✍ Change l'option limitToField, la diffuse (serveur : à tous ; client : au serveur) et met à jour le texte de l'action. |
| `Plow:getIsPlowRotationAllowed()` | 474 | ✍ Vrai si l'état de pliage permet la rotation (limites rotationFoldMin/Max). |
| `Plow:getCanTogglePlowRotation()` | 489 | ✍ Vrai si la rotation est permise par le pliage, si l'outil n'est pas abaissé quand rotationAllowedIfLowered est faux, et si le véhicule est alimenté (getIsPowered). |
| `Plow:getPlowLimitToField() → boolean` | 510 | ✍ Renvoie l'option limitToField. |
| `Plow:getPlowForceLimitToField() → boolean` | 517 | ✍ Vrai si la limite est imposée (forceLimitToField ou plateforme sans création de champs). |
| `Plow:setPlowAIRequirements(excludedGroundTypes: table)` | 524 | ✍ Définit les types de sol exigés par l'IA (avec exclusions éventuelles) et active le décalage latéral variable. |
| `Plow:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 540 | ✍ Interdit le pliage si la charrue est retournée dans une position non permise ou abaissée selon la configuration. |
| `Plow:getIsFoldMiddleAllowed(superFunc: any)` | 563 | ✍ Idem pour la position de pliage intermédiaire. |
| `Plow:getDirtMultiplier(superFunc: any)` | 580 | ✍ Ajoute la salissure de travail pondérée vitesse/limite quand isWorking. |
| `Plow:getWearMultiplier(superFunc: any) → number` | 594 | ✍ Ajoute l'usure de travail pondérée vitesse/limite quand isWorking. |
| `Plow:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 607 | ✍ Lit les options de pièces tournantes liées au retournement (disableOnTurn, turnAnimLimit, turnAnimLimitSide, invertDirectionOnRotation). |
| `Plow:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 622 | ✍ Désactive une pièce tournante pendant le retournement selon le temps d'animation et ses limites. |
| `Plow:getSpeedRotatingPartDirection(superFunc: any, speedRotatingPart: any)` | 647 | ✍ Inverse le sens de rotation d'une pièce quand la charrue est retournée (temps d'animation > 0.5). |
| `Plow:doCheckSpeedLimit(superFunc: any)` | 662 | ✍ Applique la limite de vitesse si onlyActiveWhenLowered et la chaîne d'outils est abaissée. |
| `Plow:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 668 | ✍ Force le type de zone PLOW si DEFAULT. |
| `Plow.getDefaultSpeedLimit()` | 680 | ✍ Limite de vitesse par défaut : 15. |
| `Plow:getIsWorkAreaActive(superFunc: any, workArea: any)` | 686 | ✍ Pour PLOW : inactive pendant le délai post-attelage et, si exigé, tant que l'outil n'est pas abaissé. |
| `Plow:getCanAIImplementContinueWork(superFunc: any, isTurning: any)` | 705 | ✍ L'IA ne continue pas pendant que l'animation de rotation joue (sauf paramètre stopDuringTurn). |
| `Plow:getAIInvertMarkersOnTurn(superFunc: any, turnLeft: any)` | 721 | ✍ Indique si les marqueurs IA sont inversés dans un virage selon le côté de la charrue. |
| `Plow:getCanBeSelected(superFunc: any)` | 736 | ✍ Renvoie vrai : l'outil est sélectionnable. |
| `Plow:isDetachAllowed(superFunc: any) → boolean` | 743 | ✍ Refuse le dételage pendant la rotation ou hors des limites d'animation de détachement (avec avertissement). |
| `Plow:getAllowsLowering(superFunc: any) → boolean` | 762 | ✍ Refuse l'abaissement pendant la rotation. |
| `Plow:getIsAIReadyToDrive(superFunc: any)` | 773 | ✍ Pas prête pour l'IA si rotationMax est vrai ou si la rotation est en cours. |
| `Plow:getIsAIPreparingToDrive(superFunc: any)` | 784 | ✍ Vrai pendant la rotation. |
| `Plow:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 795 | ✍ Enregistre les actions de rotation (si animation) et de limite au champ (IMPLEMENT_EXTRA3). |
| `Plow:onStartWorkAreaProcessing(dt: any)` | 815 | ✍ Avant la passe : isWorking = faux ; calcule limitToField (forcé sans permission createFields) et l'angle de la carte de densité ; remet les surfaces à zéro. |
| `Plow:onEndWorkAreaProcessing(dt: any)` | 840 | ✍ Serveur : statistiques plowedHectares/plowedTime et surface travaillée. Client : démarre/arrête le son de travail selon isWorking. |
| `Plow:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 878 | ✍ Arme le délai d'activation (2000 ms) et reprend une animation de rotation interrompue au dételage. |
| `Plow:onPreDetach(attacherVehicle: table, implement: table)` | 896 | ✍ Remet limitToField à vrai et stoppe une rotation en cours (mémorisée pour reprise). |
| `Plow:onDeactivate()` | 908 | ✍ Coupe les sons de travail et de retournement. |
| `Plow:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 919 | ✍ Paramètres de parcours IA : recouvrement total et angle de découpe de 25 degrés. |
| `Plow:onAIImplementStartTurn(isLeft: any)` | 927 | ✍ Réinitialise la position de tête de champ de l'IA. |
| `Plow:onAIImplementTurnProgress(progress: any, isLeft: any, movingDirection: any)` | 933 | ✍ Pendant un virage IA : passe la charrue au centre puis la retourne complètement aux positions de progression configurées. |
| `Plow:onAIImplementEndTurn(isLeft: any)` | 949 | ✍ Retourne la charrue du côté du virage à la fin du virage IA. |
| `Plow:onAIImplementSideOffsetChanged(isLeft: any, isInitial: any)` | 956 | ✍ Applique le côté initial de la charrue (immédiatement ou dès que la rotation sera permise). |
| `Plow:onAIImplementEnd()` | 969 | ✍ Efface la rotation différée IA. |
| `Plow:onStartAnimation(animName: any)` | 975 | ✍ Joue le son de retournement au début de l'animation de rotation. |
| `Plow:onFinishAnimation(animName: any)` | 984 | ✍ Coupe le son de retournement à la fin de l'animation de rotation. |
| `Plow:onFoldTimeChanged(foldAnimTime: any)` | 993 | ✍ Serveur : applique une rotation IA différée dès qu'elle devient permise. |
| `Plow:onRootVehicleChanged(rootVehicle: table)` | 1008 | ✍ Enregistre/met à jour auprès de l'actionController les actions « rotatePlow » et « rotateBackPlow » (retournement, lié à l'IA). |
| `Plow.actionEventTurn(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1053 | ✍ Callback d'entrée : bascule le côté de la charrue si permis. |
| `Plow.actionEventLimitToField(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1064 | ✍ Callback d'entrée : bascule limitToField si non imposée. |
| `Plow.actionControllerRotateBackEvent(self: any, direction: any, isAIEvent: any)` | 1073 | ✍ Callback d'actionController : ramène la charrue à l'état non retourné sur événement IA. |
| `Plow.actionControllerRotateEvent(self: any, direction: any, isAIEvent: any)` | 1092 | ✍ Callback d'actionController : retourne la charrue ou termine l'animation interrompue. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `processPlowArea` | 102 |
| registerFunction | `processPlowShareArea` | 103 |
| registerFunction | `setRotationMax` | 104 |
| registerFunction | `setRotationCenter` | 105 |
| registerFunction | `setPlowLimitToField` | 106 |
| registerFunction | `getIsPlowRotationAllowed` | 107 |
| registerFunction | `getCanTogglePlowRotation` | 108 |
| registerFunction | `getPlowLimitToField` | 109 |
| registerFunction | `getPlowForceLimitToField` | 110 |
| registerFunction | `setPlowAIRequirements` | 111 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 117 |
| registerOverwrittenFunction | `getIsFoldMiddleAllowed` | 118 |
| registerOverwrittenFunction | `getDirtMultiplier` | 119 |
| registerOverwrittenFunction | `getWearMultiplier` | 120 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 121 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 122 |
| registerOverwrittenFunction | `getSpeedRotatingPartDirection` | 123 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 124 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 125 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 126 |
| registerOverwrittenFunction | `getCanAIImplementContinueWork` | 127 |
| registerOverwrittenFunction | `getAIInvertMarkersOnTurn` | 128 |
| registerOverwrittenFunction | `getCanBeSelected` | 129 |
| registerOverwrittenFunction | `isDetachAllowed` | 130 |
| registerOverwrittenFunction | `getAllowsLowering` | 131 |
| registerOverwrittenFunction | `getIsAIReadyToDrive` | 132 |
| registerOverwrittenFunction | `getIsAIPreparingToDrive` | 133 |
| registerEventListener | `onLoad` | 139 |
| registerEventListener | `onPostLoad` | 140 |
| registerEventListener | `onDelete` | 141 |
| registerEventListener | `onReadStream` | 142 |
| registerEventListener | `onWriteStream` | 143 |
| registerEventListener | `onUpdate` | 144 |
| registerEventListener | `onRegisterActionEvents` | 145 |
| registerEventListener | `onStartWorkAreaProcessing` | 146 |
| registerEventListener | `onEndWorkAreaProcessing` | 147 |
| registerEventListener | `onPostAttach` | 148 |
| registerEventListener | `onPreDetach` | 149 |
| registerEventListener | `onDeactivate` | 150 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 151 |
| registerEventListener | `onAIImplementStartTurn` | 152 |
| registerEventListener | `onAIImplementTurnProgress` | 153 |
| registerEventListener | `onAIImplementEndTurn` | 154 |
| registerEventListener | `onAIImplementSideOffsetChanged` | 155 |
| registerEventListener | `onAIImplementEnd` | 156 |
| registerEventListener | `onStartAnimation` | 157 |
| registerEventListener | `onFinishAnimation` | 158 |
| registerEventListener | `onFoldTimeChanged` | 159 |
| registerEventListener | `onRootVehicleChanged` | 160 |
