---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SowingMachine.lua (generated stub, FS25 Lua Atlas)

--- Spécialisation des semoirs et planteuses (semis classique, semis direct, semis en eau, semis sur billons). Prérequis : FillUnit, WorkArea, TurnOnVehicle. EFFETS (client) : deux groupes chargés par g_effectManager:loadEffect : effects (vehicle.sowingMachine.effects : graines au sol, pilotés en continu) et fillEffects (vehicle.sowingMachine.fillEffects : effet de remplissage), plus animationNodes et sons (soufflerie airBlower à l'allumage, son de travail). Classes d'effets absentes du dump : rendu NON VÉRIFIÉ. DÉCLENCHEMENT : onUpdate (client uniquement : l'abonnement est retiré hors client) démarre les effects avec le type de matière forcée de l'unité de remplissage (getFillUnitForcedMaterialFillType, donc le type de graine affiché, pas le fruit) tant que spec.isProcessing est vrai, sinon les arrête, à chaque image. isProcessing est posé dans processSowingMachineArea, après toutes les gardes : vitesse > 0.5 (isWorking), semoir allumé (ou activation non requise), graines disponibles (ou IA qui achète les graines), fruit plantable (type possédant une carte de terrain ET période de plantation valide, sauf getCanPlantOutsideSeason), semis en eau cohérent avec l'eau (isInWater), et distance client <= SowingMachine.CLIENT_DM_UPDATE_RADIUS (constante non définie ici : NON VÉRIFIÉ). Un client ne reçoit AUCUN état d'effet par le réseau : il recalcule isProcessing localement, donc les effets de semis d'un client dépendent de sa propre exécution de processSowingMachineArea, et un semoir éloigné n'émet pas (retour anticipé avant isProcessing). Les fillEffects sont pilotés par onFillUnitFillLevelChanged (client) : démarrés si l'unité contient quelque chose, avec le type forcé ou le type reçu, arrêtés si vide. Aucun stade de croissance ni largeur n'est transmis aux effets. TERRAIN : FSDensityMapUtil.updateSowingArea (semis classique) ou updateDirectSowingArea (semis direct) avec fruit, type de sol de champ cible, option billons et angle de rangée (angle de la direction de l'outil, arrondi à directionSnapAngle du fruit s'il est non nul) ; corps absents du dump : conséquences NON VÉRIFIÉES. eraseTireTrack est appelé après les gardes. Contrôle de culture : fruitTypeDesc.seedRequiredFieldType (riz) comparé à FSDensityMapUtil.getFieldTypeAtWorldPos. SAISON : getIsPlantableInPeriod(growthMode, environment.currentPeriod) (période du calendrier), AUCUNE lecture de météo, de pluie ni d'humidité du sol. CONSOMMATION : serveur, en fin de passe, seedUsagePerSqm * surface * seedUsageScale (majoré par les dégâts du véhicule) soustrait de l'unité de remplissage ou du consommable, ou facturé à l'IA si les graines sont achetées. dt : seulement pour le temps semé (statistique sownTime). RÉSEAU : seul l'indice de graine est synchronisé (flux initial, SetSeedIndexEvent) ; les effets ne le sont pas. Avertissement : onStateChange teste `... or VehicleStateChange.FILLTYPE_CHANGE`, expression toujours vraie (SowingMachine.lua:1131) : la mise à jour des sources de graines s'exécute donc à chaque changement d'état (non vérifié en jeu). Le `updateCultivatorEnabledState` appelé par ce fichier est discuté dans Cultivator. POINTS D'EXTENSION : fonctions setSeedIndex, changeSeedIndex, setSeedFruitType, getIsSeedChangeAllowed, getSowingMachineFillUnitIndex, getSowingMachineSeedFillTypeIndex, getCurrentSeedTypeIcon, processSowingMachineArea, updateMissionSowingWarning, getUseSowingMachineAIRequirements, setFillTypeSourceDisplayFillType, getCanPlantOutsideSeason, getSowingMachineCanConsume, getAllowFillFromAir, getDirectionSnapAngle ; surcharges addFillUnitFillLevel, getFillUnitAllowsFillType, getCanBeTurnedOn, getCanToggleTurnedOn, doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML (type SOWINGMACHINE), getCanAIImplementContinueWork ; événements onTurnedOn/Off, onStart/EndWorkAreaProcessing, onFillUnitFillLevelChanged, onChangedFillType, onStateChange. Vitesse limite par défaut : 15.
---@class SowingMachine
SowingMachine = {}

--- Déclare le type de zone sowingMachine et le schéma XML : effets, fillEffects, animationNodes, graines (catégories ou types), semis direct/eau/billons, unité de remplissage, consommable, usage. Non relu clé par clé.
function SowingMachine.initSpecialization() end

--- Exige FillUnit, WorkArea et TurnOnVehicle.
---@param specializations any
function SowingMachine.prerequisitesPresent(specializations) end

--- Enregistre les fonctions de gestion des graines, de traitement de zone, d'avertissement de mission, de besoins IA et de consommation (liste non relue ligne à ligne).
---@param vehicleType any
function SowingMachine.registerFunctions(vehicleType) end

--- Surcharge addFillUnitFillLevel, getFillUnitAllowsFillType, getCanBeTurnedOn, getCanToggleTurnedOn, doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getCanAIImplementContinueWork et d'autres (liste non relue ligne à ligne).
---@param vehicleType any
function SowingMachine.registerOverwrittenFunctions(vehicleType) end

--- S'abonne à onLoad, onPostLoad, onDelete, flux initial, onUpdate, onUpdateTick, onRegisterActionEvents, onTurnedOn/Off, onStart/EndWorkAreaProcessing, onDeactivate, onStateChange, onChangedFillType, onFillUnitFillLevelChanged et onAIFieldCourseSettingsInitialized.
---@param vehicleType any
function SowingMachine.registerEventListeners(vehicleType) end

--- Charge sons, animations et effets (client), lit les fruits semables, le type de graine, l'activation requise (faux par défaut), le semis direct/eau/billons, l'unité de remplissage, le consommable et l'échelle d'usage ; sélectionne la graine par défaut ou celle de la sauvegarde ; retire onUpdate/onUpdateTick hors client ; active needWaterInfo.
---@param savegame any
function SowingMachine:onLoad(savegame) end

--- Calcule les paramètres IA initiaux.
---@param savegame any
function SowingMachine:onPostLoad(savegame) end

--- Libère sons, animations et effets (client : sons, effects, fillEffects, animations).
function SowingMachine:onDelete() end

--- Sauvegarde la graine sélectionnée et l'autorisation de changer de graine.
---@param xmlFile any
---@param key any
---@param usedModNames any
function SowingMachine:saveToXMLFile(xmlFile, key, usedModNames) end

--- Lit l'indice de graine à la connexion et l'applique sans renvoi d'événement.
---@param streamId any
---@param connection any
function SowingMachine:onReadStream(streamId, connection) end

--- Écrit l'indice de graine courant.
---@param streamId any
---@param connection any
function SowingMachine:onWriteStream(streamId, connection) end

--- Client : démarre les effets de semis avec le type de matière forcée de l'unité de remplissage tant que isProcessing est vrai (si ce type est connu), sinon les arrête. Exécuté à chaque image, sans temporisation.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function SowingMachine:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client : active/désactive l'action de changement de graine et affiche les avertissements clignotants (fruit non plantable, mauvaise graine de mission, mauvaise période, eau requise/interdite, type de champ).
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function SowingMachine:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Choisit la graine (bornée), envoie SetSeedIndexEvent, met à jour le type affiché de l'unité de remplissage et des sources, les besoins IA et le texte de l'action.
---@param seedIndex any
---@param noEventSend any
function SowingMachine:setSeedIndex(seedIndex, noEventSend) end

--- Passe à la graine suivante ou précédente de façon circulaire.
---@param increment any
function SowingMachine:changeSeedIndex(increment) end

--- Sélectionne la graine correspondant à un indice de fruit.
---@param fruitType any
---@param noEventSend any
function SowingMachine:setSeedFruitType(fruitType, noEventSend) end

--- Renvoie allowsSeedChanging.
function SowingMachine:getIsSeedChangeAllowed() end

--- Renvoie l'indice de l'unité de remplissage des graines.
function SowingMachine:getSowingMachineFillUnitIndex() end

--- Renvoie le type de remplissage correspondant à la graine courante.
function SowingMachine:getSowingMachineSeedFillTypeIndex() end

--- Renvoie le fichier d'icône HUD du type de remplissage de la graine courante (nil si inconnu).
function SowingMachine:getCurrentSeedTypeIcon() end

--- Cœur du semis : applique les gardes (eau, activation, graines, fruit plantable, type de champ), efface les traces de pneus, pose isProcessing (pilote les effets) et appelle le semis classique ou direct dans la carte de densité ; lit la présence de pierres et prépare l'avertissement de mission. Renvoie surface modifiée et totale.
---@param workArea any
---@param dt any
function SowingMachine:processSowingMachineArea(workArea, dt) end

--- Signale un mauvais fruit si le semoir travaille sur un champ de mission de semis non loué.
---@param x any
---@param z any
function SowingMachine:updateMissionSowingWarning(x, z) end

--- Vrai si l'IA doit allumer le semoir ou si celui-ci est allumé.
function SowingMachine:getUseSowingMachineAIRequirements() end

--- Met à jour le type de remplissage affiché sur les véhicules sources de graines (remorques) pour la graine sélectionnée.
---@param fillType any
function SowingMachine:setFillTypeSourceDisplayFillType(fillType) end

--- Demande d'afficher « remplir d'abord » quand le semoir est sélectionné et vide.
---@param superFunc any
function SowingMachine:getDrawFirstFillText(superFunc) end

--- Interdit les actions contrôlées tant qu'un semoir à remplissage obligatoire est vide.
---@param superFunc any
---@return boolean
---@return string
function SowingMachine:getAreControlledActionsAllowed(superFunc) end

--- Accepte le type de graine configuré ou le type déjà présent dans l'unité.
---@param superFunc any
---@param fillUnitIndex any
---@param fillType any
function SowingMachine:getFillUnitAllowsFillType(superFunc, fillUnitIndex, fillType) end

--- Refuse l'allumage si needsActivation est faux.
---@param superFunc any
function SowingMachine:getCanBeTurnedOn(superFunc) end

--- Refuse le basculement manuel si needsActivation est faux.
---@param superFunc any
function SowingMachine:getCanToggleTurnedOn(superFunc) end

--- Renvoie faux ; point de surcharge pour ignorer la période de plantation.
function SowingMachine:getCanPlantOutsideSeason() end

--- Dit si le semoir a de quoi consommer (consommable disponible ou niveau > 0).
function SowingMachine:getSowingMachineCanConsume() end

--- Interdit le remplissage depuis l'air quand allumé si l'option allowFillFromAirWhileTurnedOn est fausse.
---@param superFunc any
function SowingMachine:getAllowFillFromAir(superFunc) end

--- Prend le plus grand de l'angle d'accrochage du fruit courant et du parent.
---@param superFunc any
function SowingMachine:getDirectionSnapAngle(superFunc) end

--- Force le type de graine de l'unité de remplissage (matière forcée) avant d'ajouter la quantité ; c'est ce type forcé que lit onUpdate pour les effets.
---@param superFunc any
---@param farmId any
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillInfo any
function SowingMachine:addFillUnitFillLevel(superFunc, farmId, fillUnitIndex, fillLevelDelta, fillType, toolType, fillInfo) end

--- Applique la limite de vitesse quand la chaîne d'outils est abaissée et, si activation requise, quand l'outil est allumé.
---@param superFunc any
function SowingMachine:doCheckSpeedLimit(superFunc) end

--- Ajoute la salissure de travail (marche avant, isWorking, allumé si requis) pondérée par la vitesse.
---@param superFunc any
function SowingMachine:getDirtMultiplier(superFunc) end

--- Idem pour l'usure, avec facteur de pierres.
---@param superFunc any
---@return number
function SowingMachine:getWearMultiplier(superFunc) end

--- Force le type de zone SOWINGMACHINE si DEFAULT.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function SowingMachine:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Renvoie vrai : l'outil est sélectionnable.
---@param superFunc any
function SowingMachine:getCanBeSelected(superFunc) end

--- L'IA s'arrête si la graine n'est pas plantable à la période courante (sauf plantation hors saison autorisée).
---@param superFunc any
---@param isTurning any
function SowingMachine:getCanAIImplementContinueWork(superFunc, isTurning) end

--- Enregistre les actions de changement de graine (suivante/précédente) s'il y a plusieurs graines.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function SowingMachine:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Met à jour le texte de l'action de choix de graine avec le nom du type de remplissage courant.
---@param self any
function SowingMachine.updateChooseSeedActionEvent(self) end

--- Client : lance la soufflerie et les animations ; serveur : allume les véhicules sources de graines ; recalcule les besoins IA.
function SowingMachine:onTurnedOn() end

--- Symétrique : arrête soufflerie et animations, éteint les sources, recalcule les besoins IA.
function SowingMachine:onTurnedOff() end

--- Avant la passe : isWorking/isProcessing = faux ; choisit le véhicule source de graines, calcule l'angle de rangée, le fruit plantable, la période de plantation (calendrier) et les avertissements, et remplit workAreaParameters.
---@param dt any
function SowingMachine:onStartWorkAreaProcessing(dt) end

--- Serveur : calcule la consommation de graines (ou la facture IA), met à jour statistiques et surface ; client : démarre/arrête le son de travail selon isWorking.
---@param dt any
---@param hasProcessed any
function SowingMachine:onEndWorkAreaProcessing(dt, hasProcessed) end

--- Coupe les sons de travail et de soufflerie.
function SowingMachine:onDeactivate() end

--- Reconstruit les sources de graines et le type affiché à chaque changement d'état (condition toujours vraie, voir module).
---@param state any
---@param data any
function SowingMachine:onStateChange(state, data) end

--- Transmet le nouveau type de remplissage aux animations.
---@param fillUnitIndex any
---@param fillTypeIndex any
---@param oldFillTypeIndex any
function SowingMachine:onChangedFillType(fillUnitIndex, fillTypeIndex, oldFillTypeIndex) end

--- Client : démarre les fillEffects (avec le type forcé ou reçu) si l'unité contient quelque chose, sinon les arrête.
---@param fillUnitIndex integer
---@param fillLevelDelta number
---@param fillTypeIndex integer
---@param toolType integer
---@param fillPositionData table?
---@param appliedDelta number
function SowingMachine:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

--- Pour un semis en type PLANTED : bordures d'abord et segment initial travaillé.
---@param fieldCourseSettings any
function SowingMachine:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Recalcule les besoins IA (types de sol requis ou exclus, cultures) selon la graine, la présence d'une source et l'état allumé (lignes 1192-1270 non relues en détail).
---@param self any
function SowingMachine.updateAiParameters(self) end

--- Limite de vitesse par défaut : 15.
function SowingMachine.getDefaultSpeedLimit() end

--- Callback d'entrée : graine suivante.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function SowingMachine.actionEventToggleSeedType(self, actionName, inputValue, callbackState, isAnalog) end

--- Callback d'entrée : graine précédente.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function SowingMachine.actionEventToggleSeedTypeBack(self, actionName, inputValue, callbackState, isAnalog) end

--- Lit pour la boutique les types de graines d'un semoir depuis son XML.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function SowingMachine.loadSpecValueSeedFillTypes(xmlFile, customEnvironment, baseDir) end

--- Formate pour la boutique la liste des types de graines.
---@param storeItem any
---@param realItem any
function SowingMachine.getSpecValueSeedFillTypes(storeItem, realItem) end
