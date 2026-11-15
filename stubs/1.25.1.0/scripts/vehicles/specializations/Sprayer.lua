---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Sprayer.lua (stub généré, atlas Lua FS25)

--- Spécialisation des pulvérisateurs, épandeurs de fumier et tonnes à lisier (prérequis : FillUnit, WorkArea, TurnOnVehicle). Elle fait deux choses : (a) côté serveur (et côté client proche), le traitement agronomique : processSprayerArea appelle FSDensityMapUtil.updateSprayArea sur la zone de travail, onEndWorkAreaProcessing consomme le liquide (addFillUnitFillLevel) et met à jour les statistiques de la ferme ; (b) côté client, les effets visuels et sonores. EFFETS : spec.effects (clé XML vehicle.sprayer.effects) et, pour chaque « sprayType » (vehicle.sprayer.sprayTypes.sprayType(?), choisi selon le type de remplissage), des effets, animationNodes, sons et animations propres, tous chargés par g_effectManager:loadEffect (EffectManager absent du dump : comportement interne NON VÉRIFIÉ). Condition d'allumage : getAreEffectsVisible, vrai tant que workAreaParameters.lastSprayTime + 100 ms > g_time ; lastSprayTime n'est mis à jour que dans processSprayerArea, donc quand une zone de travail traite réellement avec un niveau de remplissage > 0 (sur un client, seulement si currentUpdateDistance <= Sprayer.CLIENT_DM_UPDATE_RADIUS, constante non définie dans ce fichier : valeur NON VÉRIFIÉE). updateSprayerEffects (appelé par onTurnedOn, onTurnedOff, onEndWorkAreaProcessing, changement de sprayType et de section de largeur variable) démarre ou arrête les effets en transmettant le type de remplissage via setEffectTypeInfo ; c'est une bascule binaire, sans modulation d'intensité, de largeur de rampe ni de vent dans ce fichier. DONNÉES MÉTÉO/HUMIDITÉ : aucune (ni vent, ni pluie, ni humidité ne sont lus). Autres données utilisées : fillType du réservoir, vitesse (isWorking si getLastSpeed() > 1), état allumé/abaissé, largeur de travail (usageScales). Réseau : le serveur décide de la consommation ; l'état « quantité doublée » est synchronisé par SprayerDoubledAmountEvent ; l'allumage passe par TurnOnVehicle ; il n'y a ni dirty flag ni lecture de flux dans ce fichier. Points d'extension pour un moddeur : fonctions enregistrées getAreEffectsVisible, updateSprayerEffects, getSprayerUsage, getActiveSprayType, getIsSprayTypeActive, getSprayerFillUnitIndex, getExternalFill, getIsSprayerExternallyFilled, setSprayerDoubledAmountActive, getSprayerDoubledAmountActive, processSprayerArea, loadSprayTypeFromXML ; événement enregistré onSprayTypeChange ; fonctions surchargées (via registerOverwrittenFunction) getEffectByNode, getRawSpeedLimit, doCheckSpeedLimit, getCanBeTurnedOn, getIsWorkAreaActive, getDirtMultiplier, getWearMultiplier, getFillVolumeUVScrollSpeed, getVariableWorkWidthUsage, etc. Surcharger getAreEffectsVisible est le moyen le plus direct de piloter l'allumage des effets vanilla sans toucher à la logique de pulvérisation. Vitesse limite par défaut : 15 (Sprayer.getDefaultSpeedLimit).
---@class Sprayer
Sprayer = {}

--- Enregistre dans le schéma XML du véhicule toutes les clés de vehicle.sprayer (usageScales, sprayTypes avec fillTypes, effets, animations, sons, usageScales propres et objectChanges, doubledAmount, turnedAnimation, fillUnitIndex, fillVolumeIndex, effects, animationNodes, sounds) ainsi que l'attribut #sprayType des zones de travail. Détail non relu clé par clé.
function Sprayer.initSpecialization() end

--- Exige FillUnit, WorkArea et TurnOnVehicle.
---@param specializations any
function Sprayer.prerequisitesPresent(specializations) end

--- Déclare l'événement onSprayTypeChange.
---@param vehicleType any
function Sprayer.registerEvents(vehicleType) end

--- Expose au type de véhicule processSprayerArea, getIsSprayerExternallyFilled, getExternalFill, getAreEffectsVisible, updateSprayerEffects, getSprayerUsage, getUseSprayerAIRequirements, setSprayerAITerrainDetailProhibitedRange, getSprayerFillUnitIndex, loadSprayTypeFromXML, getActiveSprayType, getIsSprayTypeActive, setSprayerDoubledAmountActive et getSprayerDoubledAmountActive.
---@param vehicleType any
function Sprayer.registerFunctions(vehicleType) end

--- Surcharge getDrawFirstFillText, getAreControlledActionsAllowed, getCanToggleTurnedOn, getCanBeTurnedOn, loadWorkAreaFromXML, getIsWorkAreaActive, doCheckSpeedLimit, getRawSpeedLimit, getFillVolumeUVScrollSpeed, getAIRequiresTurnOffOnHeadland, getDirtMultiplier, getWearMultiplier, getEffectByNode, getVariableWorkWidthUsage et getAIImplementUseVineSegment.
---@param vehicleType any
function Sprayer.registerOverwrittenFunctions(vehicleType) end

--- Écoute onLoad, onDelete, onUpdateTick, onRegisterActionEvents, onTurnedOn, onTurnedOff, onPreDetach, onStartWorkAreaProcessing, onEndWorkAreaProcessing, onStateChange, onSetLowered, onFillUnitFillLevelChanged, onSprayTypeChange, onAIImplementEnd et onVariableWorkWidthSectionChanged.
---@param vehicleType any
function Sprayer.registerEventListeners(vehicleType) end

--- Lit les paramètres de base (allowsSpraying, activateOnLowering, activateTankOnLowering, usageScales par type de remplissage, largeur de travail par défaut 12 m, sprayTypes, doubledAmount avec vitesse réduite ou facteur 0.5, animations, index de fill unit/volume). Sur le client, charge les effets (vehicle.sprayer.effects), sons et animationNodes. Détermine le profil : tonne à lisier/digestat, épandeur de fumier ou pulvérisateur d'engrais. Échoue (état de chargement ERROR) si la fill unit est absente. Initialise workAreaParameters. Retire l'action « quantité doublée » si aucune zone de travail.
---@param savegame any
function Sprayer:onLoad(savegame) end

--- Supprime les effets, animations et échantillons sonores du pulvérisateur et de chacun de ses sprayTypes.
function Sprayer:onDelete() end

--- Détecte un changement de sprayType actif : arrête les effets de l'ancien, lève onSprayTypeChange et force updateSprayerEffects(true). Côté client, met à jour le texte et l'activation de l'action « quantité doublée ». Côté serveur, active l'outil si une activation était en attente après abaissement.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Sprayer:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Côté client, enregistre l'action d'entrée de quantité doublée (par défaut InputAction.DOUBLED_SPRAY_AMOUNT) quand le véhicule est actif pour la saisie.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Sprayer:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Rappel de l'action d'entrée : inverse l'état « quantité doublée ».
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Sprayer.actionEventDoubledAmount(self, actionName, inputValue, callbackState, isAnalog) end

--- Traitement d'une zone de travail : sort sans rien faire si le réservoir est vide, si l'IA n'a pas de type de remplissage (elle arrête alors son travail) ou si, sur un client, le véhicule est au-delà de CLIENT_DM_UPDATE_RADIUS. Sinon appelle FSDensityMapUtil.updateSprayArea (coin start/width/height de la zone, type de pulvérisation, facteur 1 ou 2), cumule les aires, met à jour lastSprayTime (ce qui allume les effets) et passe isWorking à true si la vitesse dépasse 1.
---@param workArea any
---@param dt any
function Sprayer:processSprayerArea(workArea, dt) end

--- Renvoie vrai uniquement quand l'IA est active en travail de champ avec une source externe autorisée par les réglages d'aide (lisier, fumier, achat d'engrais) ; renvoie false hors IA.
function Sprayer:getIsSprayerExternallyFilled() end

--- Détermine, pour l'IA, le type de remplissage et la consommation fournis par l'achat ou par une station de chargement selon les réglages missionInfo (helperSlurrySource, helperManureSource, helperBuyFertilizer) ; côté serveur, débite le compte ou la station (prix x 1.5) et les statistiques de dépenses. Renvoie (FillType.UNKNOWN, 0) si rien n'est trouvé.
---@param fillType any
---@param dt any
function Sprayer:getExternalFill(fillType, dt) end

--- Vrai si lastSprayTime + 100 ms > g_time : c'est la condition qui allume les effets de pulvérisation. Fonction clé pour un mod qui voudrait remplacer ou compléter l'émission.
function Sprayer:getAreEffectsVisible() end

--- Compare l'état d'effets voulu (getAreEffectsVisible) à l'état précédent (ou force). À l'allumage : détermine le fillType (dernier valide du réservoir, à défaut le premier supporté), l'envoie à g_effectManager:setEffectTypeInfo puis startEffects pour les effets de base et ceux du sprayType actif, lance sons et animations. À l'arrêt : arrête les effets, animations et sons de base et de tous les sprayTypes. Aucune donnée de vent ou de météo.
---@param force any
function Sprayer:updateSprayerEffects(force) end

--- Consommation sur dt (ms) : échelle (par type de remplissage ou par défaut) x litersPerSecond du type de pulvérisation (1 par défaut) x self.speedLimit x largeur de travail (zone de travail ou valeur par défaut) x dt x 0.001. Utilise donc la limite de vitesse et non la vitesse réelle.
---@param fillType any
---@param dt any
function Sprayer:getSprayerUsage(fillType, dt) end

--- Renvoie true : l'IA applique les exigences de terrain du pulvérisateur.
function Sprayer:getUseSprayerAIRequirements() end

--- Met à jour les restrictions de terrain de l'IA : selon le type de remplissage actif, appelle setSprayerAITerrainDetailProhibitedRange, sinon rétablit les exigences par défaut (Sprayer.AI_REQUIRED_GROUND_TYPES).
---@param self any
function Sprayer.updateAiParameters(self) end

--- Reconstruit les exigences et interdictions de l'IA (cartes de densité) selon le type de pulvérisation : herbicide (cibler les mauvaises herbes), engrais (interdire les pixels déjà au niveau maximal ou du même type) ou chaux (interdire le même type), et interdit les cultures arrivées à maturité (sauf herbe).
---@param fillType any
function Sprayer:setSprayerAITerrainDetailProhibitedRange(fillType) end

--- Index de la fill unit : celle du sprayType actif s'il existe, sinon celle de la spécialisation.
function Sprayer:getSprayerFillUnitIndex() end

--- Charge un sprayType : fill unit, volume, support de largeur variable, sons, effets (g_effectManager:loadEffect), animationNodes, animation de rotation, liste de fillTypes déclencheurs, objectChanges, échelles d'usage et réglages IA.
---@param xmlFile any
---@param key any
---@param sprayType any
function Sprayer:loadSprayTypeFromXML(xmlFile, key, sprayType) end

--- Renvoie le premier sprayType dont getIsSprayTypeActive est vrai, sinon nil.
function Sprayer:getActiveSprayType() end

--- Vrai si le sprayType n'a pas de liste de fillTypes, ou si le type de remplissage actuel de sa fill unit figure dans cette liste.
---@param sprayType any
function Sprayer:getIsSprayTypeActive(sprayType) end

--- Change l'état « quantité doublée » et envoie SprayerDoubledAmountEvent (synchronisation réseau) si l'état change.
---@param isActive any
---@param noEventSend any
function Sprayer:setSprayerDoubledAmountActive(isActive, noEventSend) end

--- Renvoie (actif, autorisé). Autorisé seulement pour le fumier, le lisier et le digestat (ou un type de pulvérisation d'engrais) ; jamais pour un pulvérisateur d'engrais (isFertilizerSprayer).
---@param sprayTypeIndex any
function Sprayer:getSprayerDoubledAmountActive(sprayTypeIndex) end

--- Affiche l'invite « remplissez d'abord l'outil » quand le pulvérisateur est sélectionné, vide et ne peut pas être allumé.
---@param superFunc any
function Sprayer:getDrawFirstFillText(superFunc) end

--- Refuse les actions contrôlées (AVC) si le réservoir est vide (avec message info_firstFillTheTool).
---@param superFunc any
---@return boolean
---@return string
function Sprayer:getAreControlledActionsAllowed(superFunc) end

--- Côté client, interdit le basculement si l'outil ne peut pas être allumé et n'a pas de réservoir.
---@param superFunc any
function Sprayer:getCanToggleTurnedOn(superFunc) end

--- Refuse l'allumage si allowsSpraying est faux ou si ni le réservoir ni une source de remplissage atteignable ne contient de liquide (hors IA).
---@param superFunc any
function Sprayer:getCanBeTurnedOn(superFunc) end

--- Après la fonction d'origine, convertit un type de zone par défaut en WorkAreaType.SPRAYER et lit #sprayType de la zone.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function Sprayer:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Désactive la zone de travail si elle est rattachée à un sprayType non actif.
---@param superFunc any
---@param workArea any
function Sprayer:getIsWorkAreaActive(superFunc, workArea) end

--- La limite de vitesse s'applique aussi lorsque l'outil est allumé (useSpeedLimit).
---@param superFunc any
function Sprayer:doCheckSpeedLimit(superFunc) end

--- Quand la quantité doublée est active et l'outil allumé, renvoie la vitesse limite réduite doubledAmountSpeed.
---@param superFunc any
function Sprayer:getRawSpeedLimit(superFunc) end

--- Fait défiler les UV du volume de remplissage (effet de vidange dans la cuve) quand l'outil est allumé et non alimenté de l'extérieur.
---@param superFunc any
---@param fillVolumeIndex any
function Sprayer:getFillVolumeUVScrollSpeed(superFunc, fillVolumeIndex) end

--- Renvoie toujours true : l'IA éteint l'outil en bout de champ.
---@param superFunc any
function Sprayer:getAIRequiresTurnOffOnHeadland(superFunc) end

--- Ajoute à la salissure le multiplicateur de travail x (vitesse / limite de vitesse) tant que isWorking est vrai.
---@param superFunc any
function Sprayer:getDirtMultiplier(superFunc) end

--- Ajoute à l'usure le multiplicateur de travail x (vitesse / limite de vitesse) tant que isWorking est vrai.
---@param superFunc any
function Sprayer:getWearMultiplier(superFunc) end

--- Cherche l'effet correspondant à un nœud dans les effets de base puis dans ceux des sprayTypes, sinon délègue à la fonction d'origine.
---@param superFunc integer
---@param node integer
function Sprayer:getEffectByNode(superFunc, node) end

--- Retourne la consommation par minute (usagePerMin) quand la fonction d'origine n'en donne pas et que l'outil est allumé, sinon 0.
---@param superFunc any
---@return number
function Sprayer:getVariableWorkWidthUsage(superFunc) end

--- Pour l'IA en vignes : vrai si plus de 10 % de l'aire du côté de segment est couverte par l'outil.
---@param superFunc any
---@param placeable any
---@param segment any
---@param segmentSide any
function Sprayer:getAIImplementUseVineSegment(superFunc, placeable, segment, segmentSide) end

--- Côté client : met à jour les effets, joue l'animation d'outil et les sons de travail, et les animations « turned » du sprayType et de base (sauf alimentation externe si configuré).
function Sprayer:onTurnedOn() end

--- Côté client : met à jour les effets, arrête l'animation et les sons de travail, et joue les animations d'arrêt.
function Sprayer:onTurnedOff() end

--- Avant détachement, éteint le véhicule porteur s'il est allumé.
---@param attacherVehicle any
---@param jointDescIndex any
function Sprayer:onPreDetach(attacherVehicle, jointDescIndex) end

--- Avant le traitement des zones : choisit la source de liquide (propre réservoir ou une source rattachée), calcule fillType, consommation et niveau disponible, applique l'alimentation externe de l'IA, synchronise les animations, et remplit workAreaParameters (sprayType, sprayFillType, sprayFillLevel, usage, usagePerMin). Remet isWorking à false.
---@param dt any
function Sprayer:onStartWorkAreaProcessing(dt) end

--- Côté serveur, si une zone a travaillé : débite la source (addFillUnitFillLevel), met à jour sprayedHectares, sprayedTime, sprayUsage et la dernière aire travaillée. Dans tous les cas (client compris) appelle ensuite updateSprayerEffects.
---@param dt any
---@param hasProcessed any
function Sprayer:onEndWorkAreaProcessing(dt, hasProcessed) end

--- Sur attache, détachement ou changement de type de remplissage : reconstruit la liste des types supportés et des sources de remplissage (FillUnit.addFillTypeSources depuis le véhicule racine).
---@param state any
---@param data any
function Sprayer:onStateChange(state, data) end

--- Côté serveur, active l'outil à l'abaissement si activateOnLowering (ou met l'activation en attente). Active/désactive aussi les réservoirs sources si activateTankOnLowering.
---@param isLowered any
function Sprayer:onSetLowered(isLowered) end

--- Si le réservoir tombe à 0 pendant que l'outil est allumé (hors IA) et qu'aucune source valide du même type n'existe, éteint l'outil et rejoue les actions contrôlées si l'AVC est disponible.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Sprayer:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

--- Applique les objectChanges du sprayType actif et règle l'activation de la largeur de travail variable.
---@param activeSprayType any
function Sprayer:onSprayTypeChange(activeSprayType) end

--- À la fin du travail IA, éteint toutes les sources de remplissage allumées.
function Sprayer:onAIImplementEnd() end

--- Force la mise à jour des effets quand une section de largeur variable change.
function Sprayer:onVariableWorkWidthSectionChanged() end

--- Limite de vitesse par défaut : 15.
function Sprayer.getDefaultSpeedLimit() end
