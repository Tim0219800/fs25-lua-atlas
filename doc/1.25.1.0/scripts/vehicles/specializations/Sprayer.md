# vehicles/specializations/Sprayer.lua

Source: `dataS/scripts/vehicles/specializations/Sprayer.lua` — FS25 1.25.1.0

✍ Spécialisation des pulvérisateurs, épandeurs de fumier et tonnes à lisier (prérequis : FillUnit, WorkArea, TurnOnVehicle). Elle fait deux choses : (a) côté serveur (et côté client proche), le traitement agronomique : processSprayerArea appelle FSDensityMapUtil.updateSprayArea sur la zone de travail, onEndWorkAreaProcessing consomme le liquide (addFillUnitFillLevel) et met à jour les statistiques de la ferme ; (b) côté client, les effets visuels et sonores. EFFETS : spec.effects (clé XML vehicle.sprayer.effects) et, pour chaque « sprayType » (vehicle.sprayer.sprayTypes.sprayType(?), choisi selon le type de remplissage), des effets, animationNodes, sons et animations propres, tous chargés par g_effectManager:loadEffect (EffectManager absent du dump : comportement interne NON VÉRIFIÉ). Condition d'allumage : getAreEffectsVisible, vrai tant que workAreaParameters.lastSprayTime + 100 ms > g_time ; lastSprayTime n'est mis à jour que dans processSprayerArea, donc quand une zone de travail traite réellement avec un niveau de remplissage > 0 (sur un client, seulement si currentUpdateDistance <= Sprayer.CLIENT_DM_UPDATE_RADIUS, constante non définie dans ce fichier : valeur NON VÉRIFIÉE). updateSprayerEffects (appelé par onTurnedOn, onTurnedOff, onEndWorkAreaProcessing, changement de sprayType et de section de largeur variable) démarre ou arrête les effets en transmettant le type de remplissage via setEffectTypeInfo ; c'est une bascule binaire, sans modulation d'intensité, de largeur de rampe ni de vent dans ce fichier. DONNÉES MÉTÉO/HUMIDITÉ : aucune (ni vent, ni pluie, ni humidité ne sont lus). Autres données utilisées : fillType du réservoir, vitesse (isWorking si getLastSpeed() > 1), état allumé/abaissé, largeur de travail (usageScales). Réseau : le serveur décide de la consommation ; l'état « quantité doublée » est synchronisé par SprayerDoubledAmountEvent ; l'allumage passe par TurnOnVehicle ; il n'y a ni dirty flag ni lecture de flux dans ce fichier. Points d'extension pour un moddeur : fonctions enregistrées getAreEffectsVisible, updateSprayerEffects, getSprayerUsage, getActiveSprayType, getIsSprayTypeActive, getSprayerFillUnitIndex, getExternalFill, getIsSprayerExternallyFilled, setSprayerDoubledAmountActive, getSprayerDoubledAmountActive, processSprayerArea, loadSprayTypeFromXML ; événement enregistré onSprayTypeChange ; fonctions surchargées (via registerOverwrittenFunction) getEffectByNode, getRawSpeedLimit, doCheckSpeedLimit, getCanBeTurnedOn, getIsWorkAreaActive, getDirtMultiplier, getWearMultiplier, getFillVolumeUVScrollSpeed, getVariableWorkWidthUsage, etc. Surcharger getAreEffectsVisible est le moyen le plus direct de piloter l'allumage des effets vanilla sans toucher à la logique de pulvérisation. Vitesse limite par défaut : 15 (Sprayer.getDefaultSpeedLimit).

- **Sprayer** (l.13)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Sprayer.initSpecialization()` | 37 | ✍ Enregistre dans le schéma XML du véhicule toutes les clés de vehicle.sprayer (usageScales, sprayTypes avec fillTypes, effets, animations, sons, usageScales propres et objectChanges, doubledAmount, turnedAnimation, fillUnitIndex, fillVolumeIndex, effects, animationNodes, sounds) ainsi que l'attribut #sprayType des zones de travail. Détail non relu clé par clé. |
| `Sprayer.prerequisitesPresent(specializations: any)` | 109 | ✍ Exige FillUnit, WorkArea et TurnOnVehicle. |
| `Sprayer.registerEvents(vehicleType: any)` | 117 | ✍ Déclare l'événement onSprayTypeChange. |
| `Sprayer.registerFunctions(vehicleType: any)` | 123 | ✍ Expose au type de véhicule processSprayerArea, getIsSprayerExternallyFilled, getExternalFill, getAreEffectsVisible, updateSprayerEffects, getSprayerUsage, getUseSprayerAIRequirements, setSprayerAITerrainDetailProhibitedRange, getSprayerFillUnitIndex, loadSprayTypeFromXML, getActiveSprayType, getIsSprayTypeActive, setSprayerDoubledAmountActive et getSprayerDoubledAmountActive. |
| `Sprayer.registerOverwrittenFunctions(vehicleType: any)` | 142 | ✍ Surcharge getDrawFirstFillText, getAreControlledActionsAllowed, getCanToggleTurnedOn, getCanBeTurnedOn, loadWorkAreaFromXML, getIsWorkAreaActive, doCheckSpeedLimit, getRawSpeedLimit, getFillVolumeUVScrollSpeed, getAIRequiresTurnOffOnHeadland, getDirtMultiplier, getWearMultiplier, getEffectByNode, getVariableWorkWidthUsage et getAIImplementUseVineSegment. |
| `Sprayer.registerEventListeners(vehicleType: any)` | 162 | ✍ Écoute onLoad, onDelete, onUpdateTick, onRegisterActionEvents, onTurnedOn, onTurnedOff, onPreDetach, onStartWorkAreaProcessing, onEndWorkAreaProcessing, onStateChange, onSetLowered, onFillUnitFillLevelChanged, onSprayTypeChange, onAIImplementEnd et onVariableWorkWidthSectionChanged. |
| `Sprayer:onLoad(savegame: any)` | 182 | ✍ Lit les paramètres de base (allowsSpraying, activateOnLowering, activateTankOnLowering, usageScales par type de remplissage, largeur de travail par défaut 12 m, sprayTypes, doubledAmount avec vitesse réduite ou facteur 0.5, animations, index de fill unit/volume). Sur le client, charge les effets (vehicle.sprayer.effects), sons et animationNodes. Détermine le profil : tonne à lisier/digestat, épandeur de fumier ou pulvérisateur d'engrais. Échoue (état de chargement ERROR) si la fill unit est absente. Initialise workAreaParameters. Retire l'action « quantité doublée » si aucune zone de travail. |
| `Sprayer:onDelete()` | 319 | ✍ Supprime les effets, animations et échantillons sonores du pulvérisateur et de chacun de ses sprayTypes. |
| `Sprayer:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 344 | ✍ Détecte un changement de sprayType actif : arrête les effets de l'ancien, lève onSprayTypeChange et force updateSprayerEffects(true). Côté client, met à jour le texte et l'activation de l'action « quantité doublée ». Côté serveur, active l'outil si une activation était en attente après abaissement. |
| `Sprayer:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 393 | ✍ Côté client, enregistre l'action d'entrée de quantité doublée (par défaut InputAction.DOUBLED_SPRAY_AMOUNT) quand le véhicule est actif pour la saisie. |
| `Sprayer.actionEventDoubledAmount(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 406 | ✍ Rappel de l'action d'entrée : inverse l'état « quantité doublée ». |
| `Sprayer:processSprayerArea(workArea: any, dt: any)` | 412 | ✍ Traitement d'une zone de travail : sort sans rien faire si le réservoir est vide, si l'IA n'a pas de type de remplissage (elle arrête alors son travail) ou si, sur un client, le véhicule est au-delà de CLIENT_DM_UPDATE_RADIUS. Sinon appelle FSDensityMapUtil.updateSprayArea (coin start/width/height de la zone, type de pulvérisation, facteur 1 ou 2), cumule les aires, met à jour lastSprayTime (ce qui allume les effets) et passe isWorking à true si la vitesse dépasse 1. |
| `Sprayer:getIsSprayerExternallyFilled()` | 454 | ✍ Renvoie vrai uniquement quand l'IA est active en travail de champ avec une source externe autorisée par les réglages d'aide (lisier, fumier, achat d'engrais) ; renvoie false hors IA. |
| `Sprayer:getExternalFill(fillType: any, dt: any)` | 488 | ✍ Détermine, pour l'IA, le type de remplissage et la consommation fournis par l'achat ou par une station de chargement selon les réglages missionInfo (helperSlurrySource, helperManureSource, helperBuyFertilizer) ; côté serveur, débite le compte ou la station (prix x 1.5) et les statistiques de dépenses. Renvoie (FillType.UNKNOWN, 0) si rien n'est trouvé. |
| `Sprayer:getAreEffectsVisible()` | 593 | ✍ Vrai si lastSprayTime + 100 ms > g_time : c'est la condition qui allume les effets de pulvérisation. Fonction clé pour un mod qui voudrait remplacer ou compléter l'émission. |
| `Sprayer:updateSprayerEffects(force: any)` | 599 | ✍ Compare l'état d'effets voulu (getAreEffectsVisible) à l'état précédent (ou force). À l'allumage : détermine le fillType (dernier valide du réservoir, à défaut le premier supporté), l'envoie à g_effectManager:setEffectTypeInfo puis startEffects pour les effets de base et ceux du sprayType actif, lance sons et animations. À l'arrêt : arrête les effets, animations et sons de base et de tous les sprayTypes. Aucune donnée de vent ou de météo. |
| `Sprayer:getSprayerUsage(fillType: any, dt: any)` | 648 | ✍ Consommation sur dt (ms) : échelle (par type de remplissage ou par défaut) x litersPerSecond du type de pulvérisation (1 par défaut) x self.speedLimit x largeur de travail (zone de travail ou valeur par défaut) x dt x 0.001. Utilise donc la limite de vitesse et non la vitesse réelle. |
| `Sprayer:getUseSprayerAIRequirements()` | 681 | ✍ Renvoie true : l'IA applique les exigences de terrain du pulvérisateur. |
| `Sprayer.updateAiParameters(self: any)` | 687 | ✍ Met à jour les restrictions de terrain de l'IA : selon le type de remplissage actif, appelle setSprayerAITerrainDetailProhibitedRange, sinon rétablit les exigences par défaut (Sprayer.AI_REQUIRED_GROUND_TYPES). |
| `Sprayer:setSprayerAITerrainDetailProhibitedRange(fillType: any)` | 709 | ✍ Reconstruit les exigences et interdictions de l'IA (cartes de densité) selon le type de pulvérisation : herbicide (cibler les mauvaises herbes), engrais (interdire les pixels déjà au niveau maximal ou du même type) ou chaux (interdire le même type), et interdit les cultures arrivées à maturité (sauf herbe). |
| `Sprayer:getSprayerFillUnitIndex()` | 778 | ✍ Index de la fill unit : celle du sprayType actif s'il existe, sinon celle de la spécialisation. |
| `Sprayer:loadSprayTypeFromXML(xmlFile: any, key: any, sprayType: any)` | 789 | ✍ Charge un sprayType : fill unit, volume, support de largeur variable, sons, effets (g_effectManager:loadEffect), animationNodes, animation de rotation, liste de fillTypes déclencheurs, objectChanges, échelles d'usage et réglages IA. |
| `Sprayer:getActiveSprayType()` | 838 | ✍ Renvoie le premier sprayType dont getIsSprayTypeActive est vrai, sinon nil. |
| `Sprayer:getIsSprayTypeActive(sprayType: any)` | 851 | ✍ Vrai si le sprayType n'a pas de liste de fillTypes, ou si le type de remplissage actuel de sa fill unit figure dans cette liste. |
| `Sprayer:setSprayerDoubledAmountActive(isActive: any, noEventSend: any)` | 872 | ✍ Change l'état « quantité doublée » et envoie SprayerDoubledAmountEvent (synchronisation réseau) si l'état change. |
| `Sprayer:getSprayerDoubledAmountActive(sprayTypeIndex: any)` | 883 | ✍ Renvoie (actif, autorisé). Autorisé seulement pour le fumier, le lisier et le digestat (ou un type de pulvérisation d'engrais) ; jamais pour un pulvérisateur d'engrais (isFertilizerSprayer). |
| `Sprayer:getDrawFirstFillText(superFunc: any)` | 906 | ✍ Affiche l'invite « remplissez d'abord l'outil » quand le pulvérisateur est sélectionné, vide et ne peut pas être allumé. |
| `Sprayer:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 926 | ✍ Refuse les actions contrôlées (AVC) si le réservoir est vide (avec message info_firstFillTheTool). |
| `Sprayer:getCanToggleTurnedOn(superFunc: any)` | 940 | ✍ Côté client, interdit le basculement si l'outil ne peut pas être allumé et n'a pas de réservoir. |
| `Sprayer:getCanBeTurnedOn(superFunc: any)` | 955 | ✍ Refuse l'allumage si allowsSpraying est faux ou si ni le réservoir ni une source de remplissage atteignable ne contient de liquide (hors IA). |
| `Sprayer:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 986 | ✍ Après la fonction d'origine, convertit un type de zone par défaut en WorkAreaType.SPRAYER et lit #sprayType de la zone. |
| `Sprayer:getIsWorkAreaActive(superFunc: any, workArea: any)` | 1000 | ✍ Désactive la zone de travail si elle est rattachée à un sprayType non actif. |
| `Sprayer:doCheckSpeedLimit(superFunc: any)` | 1014 | ✍ La limite de vitesse s'applique aussi lorsque l'outil est allumé (useSpeedLimit). |
| `Sprayer:getRawSpeedLimit(superFunc: any)` | 1020 | ✍ Quand la quantité doublée est active et l'outil allumé, renvoie la vitesse limite réduite doubledAmountSpeed. |
| `Sprayer:getFillVolumeUVScrollSpeed(superFunc: any, fillVolumeIndex: any)` | 1036 | ✍ Fait défiler les UV du volume de remplissage (effet de vidange dans la cuve) quand l'outil est allumé et non alimenté de l'extérieur. |
| `Sprayer:getAIRequiresTurnOffOnHeadland(superFunc: any)` | 1058 | ✍ Renvoie toujours true : l'IA éteint l'outil en bout de champ. |
| `Sprayer:getDirtMultiplier(superFunc: any)` | 1064 | ✍ Ajoute à la salissure le multiplicateur de travail x (vitesse / limite de vitesse) tant que isWorking est vrai. |
| `Sprayer:getWearMultiplier(superFunc: any)` | 1076 | ✍ Ajoute à l'usure le multiplicateur de travail x (vitesse / limite de vitesse) tant que isWorking est vrai. |
| `Sprayer:getEffectByNode(superFunc: integer, node: integer)` | 1089 | ✍ Cherche l'effet correspondant à un nœud dans les effets de base puis dans ceux des sprayTypes, sinon délègue à la fonction d'origine. |
| `Sprayer:getVariableWorkWidthUsage(superFunc: any) → number` | 1115 | ✍ Retourne la consommation par minute (usagePerMin) quand la fonction d'origine n'en donne pas et que l'outil est allumé, sinon 0. |
| `Sprayer:getAIImplementUseVineSegment(superFunc: any, placeable: any, segment: any, segmentSide: any)` | 1130 | ✍ Pour l'IA en vignes : vrai si plus de 10 % de l'aire du côté de segment est couverte par l'outil. |
| `Sprayer:onTurnedOn()` | 1143 | ✍ Côté client : met à jour les effets, joue l'animation d'outil et les sons de travail, et les animations « turned » du sprayType et de base (sauf alimentation externe si configuré). |
| `Sprayer:onTurnedOff()` | 1171 | ✍ Côté client : met à jour les effets, arrête l'animation et les sons de travail, et joue les animations d'arrêt. |
| `Sprayer:onPreDetach(attacherVehicle: any, jointDescIndex: any)` | 1195 | ✍ Avant détachement, éteint le véhicule porteur s'il est allumé. |
| `Sprayer:onStartWorkAreaProcessing(dt: any)` | 1203 | ✍ Avant le traitement des zones : choisit la source de liquide (propre réservoir ou une source rattachée), calcule fillType, consommation et niveau disponible, applique l'alimentation externe de l'IA, synchronise les animations, et remplit workAreaParameters (sprayType, sprayFillType, sprayFillLevel, usage, usagePerMin). Remet isWorking à false. |
| `Sprayer:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 1312 | ✍ Côté serveur, si une zone a travaillé : débite la source (addFillUnitFillLevel), met à jour sprayedHectares, sprayedTime, sprayUsage et la dernière aire travaillée. Dans tous les cas (client compris) appelle ensuite updateSprayerEffects. |
| `Sprayer:onStateChange(state: any, data: any)` | 1348 | ✍ Sur attache, détachement ou changement de type de remplissage : reconstruit la liste des types supportés et des sources de remplissage (FillUnit.addFillTypeSources depuis le véhicule racine). |
| `Sprayer:onSetLowered(isLowered: any)` | 1372 | ✍ Côté serveur, active l'outil à l'abaissement si activateOnLowering (ou met l'activation en attente). Active/désactive aussi les réservoirs sources si activateTankOnLowering. |
| `Sprayer:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 1410 | ✍ Si le réservoir tombe à 0 pendant que l'outil est allumé (hors IA) et qu'aucune source valide du même type n'existe, éteint l'outil et rejoue les actions contrôlées si l'AVC est disponible. |
| `Sprayer:onSprayTypeChange(activeSprayType: any)` | 1444 | ✍ Applique les objectChanges du sprayType actif et règle l'activation de la largeur de travail variable. |
| `Sprayer:onAIImplementEnd()` | 1457 | ✍ À la fin du travail IA, éteint toutes les sources de remplissage allumées. |
| `Sprayer:onVariableWorkWidthSectionChanged()` | 1474 | ✍ Force la mise à jour des effets quand une section de largeur variable change. |
| `Sprayer.getDefaultSpeedLimit()` | 1480 | ✍ Limite de vitesse par défaut : 15. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onSprayTypeChange` | 118 |
| registerFunction | `processSprayerArea` | 124 |
| registerFunction | `getIsSprayerExternallyFilled` | 125 |
| registerFunction | `getExternalFill` | 126 |
| registerFunction | `getAreEffectsVisible` | 127 |
| registerFunction | `updateSprayerEffects` | 128 |
| registerFunction | `getSprayerUsage` | 129 |
| registerFunction | `getUseSprayerAIRequirements` | 130 |
| registerFunction | `setSprayerAITerrainDetailProhibitedRange` | 131 |
| registerFunction | `getSprayerFillUnitIndex` | 132 |
| registerFunction | `loadSprayTypeFromXML` | 133 |
| registerFunction | `getActiveSprayType` | 134 |
| registerFunction | `getIsSprayTypeActive` | 135 |
| registerFunction | `setSprayerDoubledAmountActive` | 136 |
| registerFunction | `getSprayerDoubledAmountActive` | 137 |
| registerOverwrittenFunction | `getDrawFirstFillText` | 143 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 144 |
| registerOverwrittenFunction | `getCanToggleTurnedOn` | 145 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 146 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 147 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 148 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 149 |
| registerOverwrittenFunction | `getRawSpeedLimit` | 150 |
| registerOverwrittenFunction | `getFillVolumeUVScrollSpeed` | 151 |
| registerOverwrittenFunction | `getAIRequiresTurnOffOnHeadland` | 152 |
| registerOverwrittenFunction | `getDirtMultiplier` | 153 |
| registerOverwrittenFunction | `getWearMultiplier` | 154 |
| registerOverwrittenFunction | `getEffectByNode` | 155 |
| registerOverwrittenFunction | `getVariableWorkWidthUsage` | 156 |
| registerOverwrittenFunction | `getAIImplementUseVineSegment` | 157 |
| registerEventListener | `onLoad` | 163 |
| registerEventListener | `onDelete` | 164 |
| registerEventListener | `onUpdateTick` | 165 |
| registerEventListener | `onRegisterActionEvents` | 166 |
| registerEventListener | `onTurnedOn` | 167 |
| registerEventListener | `onTurnedOff` | 168 |
| registerEventListener | `onPreDetach` | 169 |
| registerEventListener | `onStartWorkAreaProcessing` | 170 |
| registerEventListener | `onEndWorkAreaProcessing` | 171 |
| registerEventListener | `onStateChange` | 172 |
| registerEventListener | `onSetLowered` | 173 |
| registerEventListener | `onFillUnitFillLevelChanged` | 174 |
| registerEventListener | `onSprayTypeChange` | 175 |
| registerEventListener | `onAIImplementEnd` | 176 |
| registerEventListener | `onVariableWorkWidthSectionChanged` | 177 |
