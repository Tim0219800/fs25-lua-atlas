---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Cutter.lua (stub généré, atlas Lua FS25)

--- Spécialisation des tables de coupe et ramasseurs (moissonneuse, ensileuse, andaineuse-ramasseuse) : détermine, dans les cartes de densité, la culture coupée (processCutterArea), le ramassage d'andains (processPickupCutterArea) et le dépôt de haulm (processHaulmDropArea), puis transmet litres et surfaces au Combine via addCutterArea (appelé dans onEndWorkAreaProcessing, côté serveur). EFFETS : deux groupes, chargés côté client par g_effectManager:loadEffect : cutterEffects (clé vehicle.cutter.effect, effet de coupe de la culture) et fillEffects (vehicle.cutter.fillEffect, flux de matière) plus animationNodes ; EffectManager étant absent du dump, leur rendu est NON VÉRIFIÉ. Conditions d'allumage dans onUpdateTick (client et serveur) : outil allumé, movingDirection égal à celui configuré (vehicle.cutter#movingDirection), getLastSpeed() > 0.5, outil abaissé (sauf allowCuttingWhileRaised) et un Combine valide trouvé (workAreaParameters.combineVehicle). Le fillEffect démarre si un type de remplissage est connu et que l'outil a coupé durant les 300 dernières ms (lastAreaBiggerZeroTime) ; le cutterEffect démarre si un fruit d'entrée valide est connu et que la zone de test n'est pas réinitialisée. L'effet reçoit : type de remplissage, fruit, stade de croissance (setEffectTypeInfo) et la largeur couverte par le test (setMinMaxWidth, bornes min/max et alphas normalisés par rapport à la zone de test), ce qui permet de limiter l'effet à la largeur réellement coupée. Un cutterLoad (charge lissée 0..1, 0.95/0.05 ou décroissance 0.9) sert de densité au Combine et au HUD. DONNÉES MÉTÉO/HUMIDITÉ : aucune lue (ni pluie, ni vent, ni humidité) ; la pluie n'agit que dans Combine.addCutterArea. Donnée de culture utilisée pour le rendu : stade de croissance (growthState) lu dans la carte de densité. RÉSEAU : les états d'effet (stade, fruit d'entrée, type de remplissage, windrow) sont envoyés via effectDirtyFlag (writeCutterToStream / readCutterFromStream, 4 bits pour le stade) et lastAreaBiggerZero à chaque mise à jour ; le client rétablit les zones de test (setTestAreaRequirements) pour pouvoir piloter l'effet localement. Sur un client, les trois fonctions process* ne travaillent que si currentUpdateDistance <= Cutter.CLIENT_DM_UPDATE_RADIUS (constante non définie dans ce fichier : valeur NON VÉRIFIÉE). Points d'extension : fonctions enregistrées getCombine, getCutterLoad, getCutterStoneMultiplier, processCutterArea, processPickupCutterArea, processHaulmDropArea, setCutterCutHeight, getCutterTilt* ; surcharges getIsWorkAreaActive, doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, isAttachAllowed, getConsumingLoad, getIsGroundReferenceNodeThreshold, loadInputAttacherJoint, getFruitExtraObjectTypeData ; vitesse par défaut Cutter.getDefaultSpeedLimit. Pour un mod de poussière de récolte, onUpdateTick est le seul endroit qui connaît à la fois la largeur coupée, la culture et son stade.
---@class Cutter
Cutter = {}

--- Enregistre dans le schéma XML les clés vehicle.cutter (fruitTypes, fruitTypeCategories, fruitTypeConverter, fillTypeConverter, supportsPickupAI, effet de coupe, fillEffect, allowsForageGrowthState, allowCuttingWhileRaised, movingDirection, strawRatio, haulmDrop, tambours à dents, sons, inclinaison) et vehicles.vehicle(?).cutter#cutHeight pour la sauvegarde. Non relu clé par clé.
function Cutter.initSpecialization() end

--- Exige WorkArea et TestAreas (la liste continue sur la même ligne, non relue en entier).
---@param specializations any
function Cutter.prerequisitesPresent(specializations) end

--- Expose getCombine, getAllowCutterAIFruitRequirements, processCutterArea, processPickupCutterArea, processHaulmDropArea, getCutterLoad, getCutterStoneMultiplier, loadCutterTiltFromXML, getCutterTiltIsAvailable, getCutterTiltIsActive, getCutterTiltDelta, les rappels de raycast d'inclinaison, setCutterCutHeight, ainsi que le chargement/état des pièces à rotation par vitesse et à mouvement aléatoire.
---@param vehicleType any
function Cutter.registerFunctions(vehicleType) end

--- Surcharge getIsWorkAreaActive, doCheckSpeedLimit, loadWorkAreaFromXML, getDirtMultiplier, getWearMultiplier, isAttachAllowed, getConsumingLoad, getIsGroundReferenceNodeThreshold, getDefaultAllowComponentMassReduction, loadInputAttacherJoint, getFruitExtraObjectTypeData et les fonctions de pièces tournantes/mobiles.
---@param vehicleType any
function Cutter.registerOverwrittenFunctions(vehicleType) end

--- Écoute onLoad, onPostLoad, onDelete, les flux réseau, onUpdate, onUpdateTick, onStart/EndWorkAreaProcessing, onTurnedOn/Off, onAIImplementStart et onAIFieldCourseSettingsInitialized.
---@param vehicleType any
function Cutter.registerEventListeners(vehicleType) end

--- Charge les cultures supportées (liste, catégories), les convertisseurs de culture et de type de remplissage, les types de sortie, la hauteur de coupe initiale, les effets (cutterEffects et fillEffects, côté client), les animations et sons, l'inclinaison automatique, la rangée de zones de test et l'état interne (cutterLoad, dernier fruit, windrow, dirty flag effectDirtyFlag).
---@param savegame any
function Cutter:onLoad(savegame) end

--- Après chargement : restaure la hauteur de coupe depuis la sauvegarde.
---@param savegame any
function Cutter:onPostLoad(savegame) end

--- Supprime les effets, animations et sons du cutter.
function Cutter:onDelete() end

--- Côté client à la connexion : lit l'état de coupe synchronisé (via readCutterFromStream).
---@param streamId any
---@param connection any
function Cutter:onReadStream(streamId, connection) end

--- Côté serveur à la connexion : écrit l'état de coupe via writeCutterToStream.
---@param streamId any
---@param connection any
function Cutter:onWriteStream(streamId, connection) end

--- Côté client : si un indicateur est vrai, lit l'état de coupe ; lit lastAreaBiggerZero (met à jour lastAreaBiggerZeroTime) puis rétablit les exigences des zones de test selon le fruit courant.
---@param streamId any
---@param timestamp any
---@param connection any
function Cutter:onReadUpdateStream(streamId, timestamp, connection) end

--- Côté serveur : écrit l'état de coupe si effectDirtyFlag est levé, puis lastAreaBiggerZeroSent.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Cutter:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Lit stade de croissance (4 bits), fruit d'entrée, indicateur de validité, mode andain (windrow) et type de remplissage d'entrée ; recalcule le type de sortie et le facteur de conversion à partir des convertisseurs.
---@param streamId any
---@param connection any
function Cutter:readCutterFromStream(streamId, connection) end

--- Écrit stade de croissance, fruit d'entrée, si ce fruit est le dernier valide, mode andain et type de remplissage d'entrée (si andain).
---@param streamId any
---@param connection any
function Cutter:writeCutterToStream(streamId, connection) end

--- Sauvegarde la hauteur de coupe courante (#cutHeight).
---@param xmlFile any
---@param key any
---@param usedModNames any
function Cutter:saveToXMLFile(xmlFile, key, usedModNames) end

--- Par frame : applique l'inclinaison automatique de la table (rotation de nœuds selon le delta calculé par raycast) et, côté client, repositionne les dents des tambours (spikedDrums) le long de leur spline selon la rotation du tambour.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Cutter:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Par tick : calcule isEffectActive (allumé, sens de marche, vitesse > 0.5, abaissé, Combine présent). Si actif : lisse cutterLoad, convertit la zone de test en bornes min/max normalisées (inversées selon le sens), vérifie que le fruit d'entrée est celui que le Combine peut traiter (sinon pas d'effet), et, côté client, démarre/arrête fillEffects et cutterEffects (type de remplissage, fruit, stade, largeur) et le son de coupe. Si inactif : arrête effets et son et fait décroître cutterLoad (x0.9). Détermine aussi, toutes les 500 ms, le type de sortie prioritaire pour éviter les changements rapides en bordure de champ, et lance les raycasts asynchrones d'inclinaison. Aucune donnée météo.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Cutter:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Trouve le Combine qui accepte le fruit/type de sortie : par verifyCombine propre ou du véhicule porteur.
---@param fruitTypeIndex any
---@param outputFillTypeIndex any
function Cutter:getCombine(fruitTypeIndex, outputFillTypeIndex) end

--- Renvoie true : l'IA applique les exigences de culture du cutter.
function Cutter:getAllowCutterAIFruitRequirements() end

--- Pour chaque culture utilisable : lit la zone dans la carte de densité (récolte, facteurs de pulvérisation, labour, chaux, mauvaises herbes, chaume, rouleau, bonus d'abeilles, stade de croissance), met à jour fruit/type de sortie/stade courants (serveur), calcule le multiplicateur de récolte (g_currentMission:getHarvestScaleMultiplier), cumule aires et aires pondérées, dépose le sol de paille ou le haulm dans la zone de chaume, relève l'état des pierres et marque isWorking. Ignoré sur client trop éloigné.
---@param workArea any
---@param dt any
function Cutter:processCutterArea(workArea, dt) end

--- Ramassage d'andain : reprend, le long d'une ligne, les litres du type d'entrée via tipToGroundAroundLine, applique la conversion de type et le rendement des andains coupés (getCutWindrowHarvestFillLevel), active useWindrow. Côté client, déduit l'état du dernier ramassage connu.
---@param workArea any
---@param dt any
function Cutter:processPickupCutterArea(workArea, dt) end

--- Dépose du haulm sur la zone tant que la coupe est active (dernière coupe il y a moins de 150 ms, ou lissage valueDelay), efface les traces de pneus.
---@param workArea any
---@param dt any
function Cutter:processHaulmDropArea(workArea, dt) end

--- Avant le traitement : recherche le Combine, remet à zéro les cumuls et choisit la liste de cultures à tester, éventuellement restreinte au type requis par le Combine.
---@param dt any
function Cutter:onStartWorkAreaProcessing(dt) end

--- Côté serveur : convertit surfaces en litres, applique la conversion de type, tient les statistiques par type de sortie, appelle Combine:addCutterArea, met à jour les statistiques (hectares battus), l'exigence de culture de l'IA, les dirty flags d'effet et lastAreaBiggerZeroTime.
---@param dt any
---@param hasProcessed any
function Cutter:onEndWorkAreaProcessing(dt, hasProcessed) end

--- Charge de la table : cutterLoad x (0.25 + 0.75 x vitesse / limite de vitesse bornée à 0..1).
function Cutter:getCutterLoad() end

--- Facteur d'usure dû aux pierres selon l'état de pierre relevé (1 par défaut).
function Cutter:getCutterStoneMultiplier() end

--- Charge les nœuds, limites et raycasts de l'inclinaison automatique de la table.
---@param xmlFile table
---@param key string
---@param target any
---@return boolean
function Cutter:loadCutterTiltFromXML(xmlFile, key, target) end

--- Indique si l'inclinaison automatique est disponible.
---@return boolean
function Cutter:getCutterTiltIsAvailable() end

--- Indique si l'inclinaison automatique est active (conditions selon l'état de la table et les réglages).
---@param automaticTilt any
---@return boolean
---@return boolean
function Cutter:getCutterTiltIsActive(automaticTilt) end

--- Renvoie le delta d'inclinaison calculé, un indicateur d'activité et un indicateur de retour au neutre.
---@return number
---@return boolean
---@return boolean
function Cutter:getCutterTiltDelta() end

--- Rappel du raycast gauche : mémorise la hauteur du sol détecté pour l'inclinaison.
---@param hitObjectId any
---@param x any
---@param y any
---@param z any
---@param distance any
---@param nx any
---@param ny any
---@param nz any
---@param subShapeIndex any
---@param hitShapeId any
---@param isLast any
function Cutter:tiltRaycastDetectionCallbackLeft(hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, hitShapeId, isLast) end

--- Rappel du raycast droit : idem côté droit.
---@param hitObjectId any
---@param x any
---@param y any
---@param z any
---@param distance any
---@param nx any
---@param ny any
---@param nz any
---@param subShapeIndex any
---@param hitShapeId any
---@param isLast any
function Cutter:tiltRaycastDetectionCallbackRight(hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, hitShapeId, isLast) end

--- Mémorise la hauteur de coupe et l'applique à la distance au sol d'abaissement de l'attelage (lowerDistanceToGround) des joints de type cutter.
---@param cutHeight any
---@return number
function Cutter:setCutterCutHeight(cutHeight) end

--- Ajoute aux pièces à rotation par vitesse l'option #rotateIfTurnedOn (false par défaut).
---@param superFunc any
---@param speedRotatingPart any
---@param xmlFile any
---@param key any
function Cutter:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

--- Avec rotateIfTurnedOn, la pièce n'est active que si le cutter est allumé.
---@param superFunc any
---@param speedRotatingPart any
function Cutter:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

--- Charge l'option de mouvement aléatoire conditionné à la coupe.
---@param superFunc any
---@param part any
---@param xmlFile any
---@param key any
function Cutter:loadRandomlyMovingPartFromXML(superFunc, part, xmlFile, key) end

--- Avec moveOnlyIfCut, n'active la pièce que si le cutter a coupé durant les 150 dernières ms.
---@param superFunc any
---@param part any
function Cutter:getIsRandomlyMovingPartActive(superFunc, part) end

--- Une zone de type CUTTER n'est active que si la table est abaissée (sauf allowCuttingWhileRaised).
---@param superFunc any
---@param workArea any
function Cutter:getIsWorkAreaActive(superFunc, workArea) end

--- La limite de vitesse s'applique aussi quand le cutter est allumé et abaissé.
---@param superFunc any
function Cutter:doCheckSpeedLimit(superFunc) end

--- Lit l'index de zone de déchiquetage (chopperArea#index) d'une zone de travail.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function Cutter:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Ajoute le multiplicateur de salissure de travail x (vitesse / limite) tant que isWorking.
---@param superFunc any
function Cutter:getDirtMultiplier(superFunc) end

--- Même principe pour l'usure, multipliée par le facteur de pierres.
---@param superFunc any
function Cutter:getWearMultiplier(superFunc) end

--- Refuse l'attelage à un Combine dont les types de remplissage ne sont pas compatibles avec la sortie du cutter.
---@param superFunc integer
---@param farmId integer
---@param attacherVehicle table
---@return boolean
---@return string
function Cutter:isAttachAllowed(superFunc, farmId, attacherVehicle) end

--- Ajoute la charge de la table à la charge consommatrice du moteur.
---@param superFunc any
function Cutter:getConsumingLoad(superFunc) end

--- Ajoute la hauteur de coupe courante au seuil de contact des nœuds de référence au sol.
---@param superFunc any
---@param groundReferenceNode any
function Cutter:getIsGroundReferenceNodeThreshold(superFunc, groundReferenceNode) end

--- Renvoie true.
function Cutter:getDefaultAllowComponentMassReduction() end

--- Lit l'option #useFruitCutHeight (true par défaut) des joints d'attelage.
---@param superFunc table
---@param xmlFile any
---@param key any
---@param inputAttacherJoint any
---@param i any
function Cutter:loadInputAttacherJoint(superFunc, xmlFile, key, inputAttacherJoint, i) end

--- Renvoie le dernier fruit d'entrée valide pour les objets additionnels dépendant du fruit.
---@param superFunc any
function Cutter:getFruitExtraObjectTypeData(superFunc) end

--- Côté client, démarre les animationNodes.
function Cutter:onTurnedOn() end

--- Côté client, arrête les animationNodes ; réinitialise dans tous les cas les fruits et types de remplissage courants (entrée, sortie, IA).
function Cutter:onTurnedOff() end

--- Au démarrage de l'IA, réinitialise les exigences de culture puis exige les cultures supportées que le Combine peut recevoir.
function Cutter:onAIImplementStart() end

--- Force pour l'IA : bordures d'abord, travail du segment initial et coupe des coins prise en charge.
---@param fieldCourseSettings any
function Cutter:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Limite de vitesse par défaut : 10.
function Cutter.getDefaultSpeedLimit() end

--- Ajoute à l'affichage de débogage le type de sortie prioritaire, la hauteur de coupe et la répartition du tampon par type de remplissage.
---@param values any
function Cutter:updateDebugValues(values) end
