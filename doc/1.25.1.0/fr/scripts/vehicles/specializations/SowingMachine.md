# vehicles/specializations/SowingMachine.lua

*[English version](../../../../scripts/vehicles/specializations/SowingMachine.md)*

Source: `dataS/scripts/vehicles/specializations/SowingMachine.lua` — FS25 1.25.1.0

✍ Spécialisation des semoirs et planteuses (semis classique, semis direct, semis en eau, semis sur billons). Prérequis : FillUnit, WorkArea, TurnOnVehicle. EFFETS (client) : deux groupes chargés par g_effectManager:loadEffect : effects (vehicle.sowingMachine.effects : graines au sol, pilotés en continu) et fillEffects (vehicle.sowingMachine.fillEffects : effet de remplissage), plus animationNodes et sons (soufflerie airBlower à l'allumage, son de travail). Classes d'effets absentes du dump : rendu NON VÉRIFIÉ. DÉCLENCHEMENT : onUpdate (client uniquement : l'abonnement est retiré hors client) démarre les effects avec le type de matière forcée de l'unité de remplissage (getFillUnitForcedMaterialFillType, donc le type de graine affiché, pas le fruit) tant que spec.isProcessing est vrai, sinon les arrête, à chaque image. isProcessing est posé dans processSowingMachineArea, après toutes les gardes : vitesse > 0.5 (isWorking), semoir allumé (ou activation non requise), graines disponibles (ou IA qui achète les graines), fruit plantable (type possédant une carte de terrain ET période de plantation valide, sauf getCanPlantOutsideSeason), semis en eau cohérent avec l'eau (isInWater), et distance client <= SowingMachine.CLIENT_DM_UPDATE_RADIUS (constante non définie ici : NON VÉRIFIÉ). Un client ne reçoit AUCUN état d'effet par le réseau : il recalcule isProcessing localement, donc les effets de semis d'un client dépendent de sa propre exécution de processSowingMachineArea, et un semoir éloigné n'émet pas (retour anticipé avant isProcessing). Les fillEffects sont pilotés par onFillUnitFillLevelChanged (client) : démarrés si l'unité contient quelque chose, avec le type forcé ou le type reçu, arrêtés si vide. Aucun stade de croissance ni largeur n'est transmis aux effets. TERRAIN : FSDensityMapUtil.updateSowingArea (semis classique) ou updateDirectSowingArea (semis direct) avec fruit, type de sol de champ cible, option billons et angle de rangée (angle de la direction de l'outil, arrondi à directionSnapAngle du fruit s'il est non nul) ; corps absents du dump : conséquences NON VÉRIFIÉES. eraseTireTrack est appelé après les gardes. Contrôle de culture : fruitTypeDesc.seedRequiredFieldType (riz) comparé à FSDensityMapUtil.getFieldTypeAtWorldPos. SAISON : getIsPlantableInPeriod(growthMode, environment.currentPeriod) (période du calendrier), AUCUNE lecture de météo, de pluie ni d'humidité du sol. CONSOMMATION : serveur, en fin de passe, seedUsagePerSqm * surface * seedUsageScale (majoré par les dégâts du véhicule) soustrait de l'unité de remplissage ou du consommable, ou facturé à l'IA si les graines sont achetées. dt : seulement pour le temps semé (statistique sownTime). RÉSEAU : seul l'indice de graine est synchronisé (flux initial, SetSeedIndexEvent) ; les effets ne le sont pas. Avertissement : onStateChange teste `... or VehicleStateChange.FILLTYPE_CHANGE`, expression toujours vraie (SowingMachine.lua:1131) : la mise à jour des sources de graines s'exécute donc à chaque changement d'état (non vérifié en jeu). Le `updateCultivatorEnabledState` appelé par ce fichier est discuté dans Cultivator. POINTS D'EXTENSION : fonctions setSeedIndex, changeSeedIndex, setSeedFruitType, getIsSeedChangeAllowed, getSowingMachineFillUnitIndex, getSowingMachineSeedFillTypeIndex, getCurrentSeedTypeIcon, processSowingMachineArea, updateMissionSowingWarning, getUseSowingMachineAIRequirements, setFillTypeSourceDisplayFillType, getCanPlantOutsideSeason, getSowingMachineCanConsume, getAllowFillFromAir, getDirectionSnapAngle ; surcharges addFillUnitFillLevel, getFillUnitAllowsFillType, getCanBeTurnedOn, getCanToggleTurnedOn, doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML (type SOWINGMACHINE), getCanAIImplementContinueWork ; événements onTurnedOn/Off, onStart/EndWorkAreaProcessing, onFillUnitFillLevelChanged, onChangedFillType, onStateChange. Vitesse limite par défaut : 15.

- **SowingMachine** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SowingMachine.initSpecialization()` | 38 | ✍ Déclare le type de zone sowingMachine et le schéma XML : effets, fillEffects, animationNodes, graines (catégories ou types), semis direct/eau/billons, unité de remplissage, consommable, usage. Non relu clé par clé. |
| `SowingMachine.prerequisitesPresent(specializations: any)` | 86 | ✍ Exige FillUnit, WorkArea et TurnOnVehicle. |
| `SowingMachine.registerFunctions(vehicleType: any)` | 94 | ✍ Enregistre les fonctions de gestion des graines, de traitement de zone, d'avertissement de mission, de besoins IA et de consommation (liste non relue ligne à ligne). |
| `SowingMachine.registerOverwrittenFunctions(vehicleType: any)` | 113 | ✍ Surcharge addFillUnitFillLevel, getFillUnitAllowsFillType, getCanBeTurnedOn, getCanToggleTurnedOn, doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getCanAIImplementContinueWork et d'autres (liste non relue ligne à ligne). |
| `SowingMachine.registerEventListeners(vehicleType: any)` | 132 | ✍ S'abonne à onLoad, onPostLoad, onDelete, flux initial, onUpdate, onUpdateTick, onRegisterActionEvents, onTurnedOn/Off, onStart/EndWorkAreaProcessing, onDeactivate, onStateChange, onChangedFillType, onFillUnitFillLevelChanged et onAIFieldCourseSettingsInitialized. |
| `SowingMachine:onLoad(savegame: any)` | 154 | ✍ Charge sons, animations et effets (client), lit les fruits semables, le type de graine, l'activation requise (faux par défaut), le semis direct/eau/billons, l'unité de remplissage, le consommable et l'échelle d'usage ; sélectionne la graine par défaut ou celle de la sauvegarde ; retire onUpdate/onUpdateTick hors client ; active needWaterInfo. |
| `SowingMachine:onPostLoad(savegame: any)` | 305 | ✍ Calcule les paramètres IA initiaux. |
| `SowingMachine:onDelete()` | 312 | ✍ Libère sons, animations et effets (client : sons, effects, fillEffects, animations). |
| `SowingMachine:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 328 | ✍ Sauvegarde la graine sélectionnée et l'autorisation de changer de graine. |
| `SowingMachine:onReadStream(streamId: any, connection: any)` | 345 | ✍ Lit l'indice de graine à la connexion et l'applique sans renvoi d'événement. |
| `SowingMachine:onWriteStream(streamId: any, connection: any)` | 352 | ✍ Écrit l'indice de graine courant. |
| `SowingMachine:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 359 | ✍ Client : démarre les effets de semis avec le type de matière forcée de l'unité de remplissage tant que isProcessing est vrai (si ce type est connu), sinon les arrête. Exécuté à chaque image, sans temporisation. |
| `SowingMachine:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 374 | ✍ Client : active/désactive l'action de changement de graine et affiche les avertissements clignotants (fruit non plantable, mauvaise graine de mission, mauvaise période, eau requise/interdite, type de champ). |
| `SowingMachine:setSeedIndex(seedIndex: any, noEventSend: any)` | 402 | ✍ Choisit la graine (bornée), envoie SetSeedIndexEvent, met à jour le type affiché de l'unité de remplissage et des sources, les besoins IA et le texte de l'action. |
| `SowingMachine:changeSeedIndex(increment: any)` | 422 | ✍ Passe à la graine suivante ou précédente de façon circulaire. |
| `SowingMachine:setSeedFruitType(fruitType: any, noEventSend: any)` | 436 | ✍ Sélectionne la graine correspondant à un indice de fruit. |
| `SowingMachine:getIsSeedChangeAllowed()` | 454 | ✍ Renvoie allowsSeedChanging. |
| `SowingMachine:getSowingMachineFillUnitIndex()` | 460 | ✍ Renvoie l'indice de l'unité de remplissage des graines. |
| `SowingMachine:getSowingMachineSeedFillTypeIndex()` | 466 | ✍ Renvoie le type de remplissage correspondant à la graine courante. |
| `SowingMachine:getCurrentSeedTypeIcon()` | 473 | ✍ Renvoie le fichier d'icône HUD du type de remplissage de la graine courante (nil si inconnu). |
| `SowingMachine:processSowingMachineArea(workArea: any, dt: any)` | 485 | ✍ Cœur du semis : applique les gardes (eau, activation, graines, fruit plantable, type de champ), efface les traces de pneus, pose isProcessing (pilote les effets) et appelle le semis classique ou direct dans la carte de densité ; lit la présence de pierres et prépare l'avertissement de mission. Renvoie surface modifiée et totale. |
| `SowingMachine:updateMissionSowingWarning(x: any, z: any)` | 584 | ✍ Signale un mauvais fruit si le semoir travaille sur un champ de mission de semis non loué. |
| `SowingMachine:getUseSowingMachineAIRequirements()` | 602 | ✍ Vrai si l'IA doit allumer le semoir ou si celui-ci est allumé. |
| `SowingMachine:setFillTypeSourceDisplayFillType(fillType: any)` | 608 | ✍ Met à jour le type de remplissage affiché sur les véhicules sources de graines (remorques) pour la graine sélectionnée. |
| `SowingMachine:getDrawFirstFillText(superFunc: any)` | 639 | ✍ Demande d'afficher « remplir d'abord » quand le semoir est sélectionné et vide. |
| `SowingMachine:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 663 | ✍ Interdit les actions contrôlées tant qu'un semoir à remplissage obligatoire est vide. |
| `SowingMachine:getFillUnitAllowsFillType(superFunc: any, fillUnitIndex: any, fillType: any)` | 683 | ✍ Accepte le type de graine configuré ou le type déjà présent dans l'unité. |
| `SowingMachine:getCanBeTurnedOn(superFunc: any)` | 703 | ✍ Refuse l'allumage si needsActivation est faux. |
| `SowingMachine:getCanToggleTurnedOn(superFunc: any)` | 714 | ✍ Refuse le basculement manuel si needsActivation est faux. |
| `SowingMachine:getCanPlantOutsideSeason()` | 725 | ✍ Renvoie faux ; point de surcharge pour ignorer la période de plantation. |
| `SowingMachine:getSowingMachineCanConsume()` | 731 | ✍ Dit si le semoir a de quoi consommer (consommable disponible ou niveau > 0). |
| `SowingMachine:getAllowFillFromAir(superFunc: any)` | 744 | ✍ Interdit le remplissage depuis l'air quand allumé si l'option allowFillFromAirWhileTurnedOn est fausse. |
| `SowingMachine:getDirectionSnapAngle(superFunc: any)` | 754 | ✍ Prend le plus grand de l'angle d'accrochage du fruit courant et du parent. |
| `SowingMachine:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillInfo: any)` | 767 | ✍ Force le type de graine de l'unité de remplissage (matière forcée) avant d'ajouter la quantité ; c'est ce type forcé que lit onUpdate pour les effets. |
| `SowingMachine:doCheckSpeedLimit(superFunc: any)` | 794 | ✍ Applique la limite de vitesse quand la chaîne d'outils est abaissée et, si activation requise, quand l'outil est allumé. |
| `SowingMachine:getDirtMultiplier(superFunc: any)` | 801 | ✍ Ajoute la salissure de travail (marche avant, isWorking, allumé si requis) pondérée par la vitesse. |
| `SowingMachine:getWearMultiplier(superFunc: any) → number` | 815 | ✍ Idem pour l'usure, avec facteur de pierres. |
| `SowingMachine:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 833 | ✍ Force le type de zone SOWINGMACHINE si DEFAULT. |
| `SowingMachine:getCanBeSelected(superFunc: any)` | 845 | ✍ Renvoie vrai : l'outil est sélectionnable. |
| `SowingMachine:getCanAIImplementContinueWork(superFunc: any, isTurning: any)` | 851 | ✍ L'IA s'arrête si la graine n'est pas plantable à la période courante (sauf plantation hors saison autorisée). |
| `SowingMachine:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 872 | ✍ Enregistre les actions de changement de graine (suivante/précédente) s'il y a plusieurs graines. |
| `SowingMachine.updateChooseSeedActionEvent(self: any)` | 891 | ✍ Met à jour le texte de l'action de choix de graine avec le nom du type de remplissage courant. |
| `SowingMachine:onTurnedOn()` | 909 | ✍ Client : lance la soufflerie et les animations ; serveur : allume les véhicules sources de graines ; recalcule les besoins IA. |
| `SowingMachine:onTurnedOff()` | 932 | ✍ Symétrique : arrête soufflerie et animations, éteint les sources, recalcule les besoins IA. |
| `SowingMachine:onStartWorkAreaProcessing(dt: any)` | 955 | ✍ Avant la passe : isWorking/isProcessing = faux ; choisit le véhicule source de graines, calcule l'angle de rangée, le fruit plantable, la période de plantation (calendrier) et les avertissements, et remplit workAreaParameters. |
| `SowingMachine:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 1054 | ✍ Serveur : calcule la consommation de graines (ou la facture IA), met à jour statistiques et surface ; client : démarre/arrête le son de travail selon isWorking. |
| `SowingMachine:onDeactivate()` | 1119 | ✍ Coupe les sons de travail et de soufflerie. |
| `SowingMachine:onStateChange(state: any, data: any)` | 1130 | ✍ Reconstruit les sources de graines et le type affiché à chaque changement d'état (condition toujours vraie, voir module). |
| `SowingMachine:onChangedFillType(fillUnitIndex: any, fillTypeIndex: any, oldFillTypeIndex: any)` | 1152 | ✍ Transmet le nouveau type de remplissage aux animations. |
| `SowingMachine:onFillUnitFillLevelChanged(fillUnitIndex: integer, fillLevelDelta: number, fillTypeIndex: integer, toolType: integer, fillPositionData: table?, appliedDelta: number)` | 1167 | ✍ Client : démarre les fillEffects (avec le type forcé ou reçu) si l'unité contient quelque chose, sinon les arrête. |
| `SowingMachine:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 1182 | ✍ Pour un semis en type PLANTED : bordures d'abord et segment initial travaillé. |
| `SowingMachine.updateAiParameters(self: any)` | 1192 | ✍ Recalcule les besoins IA (types de sol requis ou exclus, cultures) selon la graine, la présence d'une source et l'état allumé (lignes 1192-1270 non relues en détail). |
| `SowingMachine.getDefaultSpeedLimit()` | 1271 | ✍ Limite de vitesse par défaut : 15. |
| `SowingMachine.actionEventToggleSeedType(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1277 | ✍ Callback d'entrée : graine suivante. |
| `SowingMachine.actionEventToggleSeedTypeBack(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1285 | ✍ Callback d'entrée : graine précédente. |
| `SowingMachine.loadSpecValueSeedFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 1293 | ✍ Lit pour la boutique les types de graines d'un semoir depuis son XML. |
| `SowingMachine.getSpecValueSeedFillTypes(storeItem: any, realItem: any)` | 1302 | ✍ Formate pour la boutique la liste des types de graines. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setSeedFruitType` | 95 |
| registerFunction | `setSeedIndex` | 96 |
| registerFunction | `changeSeedIndex` | 97 |
| registerFunction | `getIsSeedChangeAllowed` | 98 |
| registerFunction | `setIsSeedChangeAllowed` | 99 |
| registerFunction | `getSowingMachineFillUnitIndex` | 100 |
| registerFunction | `getSowingMachineSeedFillTypeIndex` | 101 |
| registerFunction | `getCurrentSeedTypeIcon` | 102 |
| registerFunction | `processSowingMachineArea` | 103 |
| registerFunction | `getUseSowingMachineAIRequirements` | 104 |
| registerFunction | `setFillTypeSourceDisplayFillType` | 105 |
| registerFunction | `updateMissionSowingWarning` | 106 |
| registerFunction | `getCanPlantOutsideSeason` | 107 |
| registerFunction | `getSowingMachineCanConsume` | 108 |
| registerOverwrittenFunction | `getDrawFirstFillText` | 114 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 115 |
| registerOverwrittenFunction | `getFillUnitAllowsFillType` | 116 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 117 |
| registerOverwrittenFunction | `getCanToggleTurnedOn` | 118 |
| registerOverwrittenFunction | `getAllowFillFromAir` | 119 |
| registerOverwrittenFunction | `getDirectionSnapAngle` | 120 |
| registerOverwrittenFunction | `addFillUnitFillLevel` | 121 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 122 |
| registerOverwrittenFunction | `getDirtMultiplier` | 123 |
| registerOverwrittenFunction | `getWearMultiplier` | 124 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 125 |
| registerOverwrittenFunction | `getCanBeSelected` | 126 |
| registerOverwrittenFunction | `getCanAIImplementContinueWork` | 127 |
| registerEventListener | `onLoad` | 133 |
| registerEventListener | `onPostLoad` | 134 |
| registerEventListener | `onDelete` | 135 |
| registerEventListener | `onReadStream` | 136 |
| registerEventListener | `onWriteStream` | 137 |
| registerEventListener | `onUpdate` | 138 |
| registerEventListener | `onUpdateTick` | 139 |
| registerEventListener | `onRegisterActionEvents` | 140 |
| registerEventListener | `onTurnedOn` | 141 |
| registerEventListener | `onTurnedOff` | 142 |
| registerEventListener | `onStartWorkAreaProcessing` | 143 |
| registerEventListener | `onEndWorkAreaProcessing` | 144 |
| registerEventListener | `onDeactivate` | 145 |
| registerEventListener | `onStateChange` | 146 |
| registerEventListener | `onChangedFillType` | 147 |
| registerEventListener | `onFillUnitFillLevelChanged` | 148 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 149 |
