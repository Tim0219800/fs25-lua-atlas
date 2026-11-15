# vehicles/specializations/Cutter.lua

Source : `dataS/scripts/vehicles/specializations/Cutter.lua` — FS25 1.25.1.0

✍ Spécialisation des tables de coupe et ramasseurs (moissonneuse, ensileuse, andaineuse-ramasseuse) : détermine, dans les cartes de densité, la culture coupée (processCutterArea), le ramassage d'andains (processPickupCutterArea) et le dépôt de haulm (processHaulmDropArea), puis transmet litres et surfaces au Combine via addCutterArea (appelé dans onEndWorkAreaProcessing, côté serveur). EFFETS : deux groupes, chargés côté client par g_effectManager:loadEffect : cutterEffects (clé vehicle.cutter.effect, effet de coupe de la culture) et fillEffects (vehicle.cutter.fillEffect, flux de matière) plus animationNodes ; EffectManager étant absent du dump, leur rendu est NON VÉRIFIÉ. Conditions d'allumage dans onUpdateTick (client et serveur) : outil allumé, movingDirection égal à celui configuré (vehicle.cutter#movingDirection), getLastSpeed() > 0.5, outil abaissé (sauf allowCuttingWhileRaised) et un Combine valide trouvé (workAreaParameters.combineVehicle). Le fillEffect démarre si un type de remplissage est connu et que l'outil a coupé durant les 300 dernières ms (lastAreaBiggerZeroTime) ; le cutterEffect démarre si un fruit d'entrée valide est connu et que la zone de test n'est pas réinitialisée. L'effet reçoit : type de remplissage, fruit, stade de croissance (setEffectTypeInfo) et la largeur couverte par le test (setMinMaxWidth, bornes min/max et alphas normalisés par rapport à la zone de test), ce qui permet de limiter l'effet à la largeur réellement coupée. Un cutterLoad (charge lissée 0..1, 0.95/0.05 ou décroissance 0.9) sert de densité au Combine et au HUD. DONNÉES MÉTÉO/HUMIDITÉ : aucune lue (ni pluie, ni vent, ni humidité) ; la pluie n'agit que dans Combine.addCutterArea. Donnée de culture utilisée pour le rendu : stade de croissance (growthState) lu dans la carte de densité. RÉSEAU : les états d'effet (stade, fruit d'entrée, type de remplissage, windrow) sont envoyés via effectDirtyFlag (writeCutterToStream / readCutterFromStream, 4 bits pour le stade) et lastAreaBiggerZero à chaque mise à jour ; le client rétablit les zones de test (setTestAreaRequirements) pour pouvoir piloter l'effet localement. Sur un client, les trois fonctions process* ne travaillent que si currentUpdateDistance <= Cutter.CLIENT_DM_UPDATE_RADIUS (constante non définie dans ce fichier : valeur NON VÉRIFIÉE). Points d'extension : fonctions enregistrées getCombine, getCutterLoad, getCutterStoneMultiplier, processCutterArea, processPickupCutterArea, processHaulmDropArea, setCutterCutHeight, getCutterTilt* ; surcharges getIsWorkAreaActive, doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, isAttachAllowed, getConsumingLoad, getIsGroundReferenceNodeThreshold, loadInputAttacherJoint, getFruitExtraObjectTypeData ; vitesse par défaut Cutter.getDefaultSpeedLimit. Pour un mod de poussière de récolte, onUpdateTick est le seul endroit qui connaît à la fois la largeur coupée, la culture et son stade.

- **Cutter** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Cutter.initSpecialization()` | 18 | ✍ Enregistre dans le schéma XML les clés vehicle.cutter (fruitTypes, fruitTypeCategories, fruitTypeConverter, fillTypeConverter, supportsPickupAI, effet de coupe, fillEffect, allowsForageGrowthState, allowCuttingWhileRaised, movingDirection, strawRatio, haulmDrop, tambours à dents, sons, inclinaison) et vehicles.vehicle(?).cutter#cutHeight pour la sauvegarde. Non relu clé par clé. |
| `Cutter.prerequisitesPresent(specializations: any)` | 71 | ✍ Exige WorkArea et TestAreas (la liste continue sur la même ligne, non relue en entier). |
| `Cutter.registerFunctions(vehicleType: any)` | 77 | ✍ Expose getCombine, getAllowCutterAIFruitRequirements, processCutterArea, processPickupCutterArea, processHaulmDropArea, getCutterLoad, getCutterStoneMultiplier, loadCutterTiltFromXML, getCutterTiltIsAvailable, getCutterTiltIsActive, getCutterTiltDelta, les rappels de raycast d'inclinaison, setCutterCutHeight, ainsi que le chargement/état des pièces à rotation par vitesse et à mouvement aléatoire. |
| `Cutter.registerOverwrittenFunctions(vehicleType: any)` | 98 | ✍ Surcharge getIsWorkAreaActive, doCheckSpeedLimit, loadWorkAreaFromXML, getDirtMultiplier, getWearMultiplier, isAttachAllowed, getConsumingLoad, getIsGroundReferenceNodeThreshold, getDefaultAllowComponentMassReduction, loadInputAttacherJoint, getFruitExtraObjectTypeData et les fonctions de pièces tournantes/mobiles. |
| `Cutter.registerEventListeners(vehicleType: any)` | 118 | ✍ Écoute onLoad, onPostLoad, onDelete, les flux réseau, onUpdate, onUpdateTick, onStart/EndWorkAreaProcessing, onTurnedOn/Off, onAIImplementStart et onAIFieldCourseSettingsInitialized. |
| `Cutter:onLoad(savegame: any)` | 138 | ✍ Charge les cultures supportées (liste, catégories), les convertisseurs de culture et de type de remplissage, les types de sortie, la hauteur de coupe initiale, les effets (cutterEffects et fillEffects, côté client), les animations et sons, l'inclinaison automatique, la rangée de zones de test et l'état interne (cutterLoad, dernier fruit, windrow, dirty flag effectDirtyFlag). |
| `Cutter:onPostLoad(savegame: any)` | 397 | ✍ Après chargement : restaure la hauteur de coupe depuis la sauvegarde. |
| `Cutter:onDelete()` | 407 | ✍ Supprime les effets, animations et sons du cutter. |
| `Cutter:onReadStream(streamId: any, connection: any)` | 417 | ✍ Côté client à la connexion : lit l'état de coupe synchronisé (via readCutterFromStream). |
| `Cutter:onWriteStream(streamId: any, connection: any)` | 431 | ✍ Côté serveur à la connexion : écrit l'état de coupe via writeCutterToStream. |
| `Cutter:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 440 | ✍ Côté client : si un indicateur est vrai, lit l'état de coupe ; lit lastAreaBiggerZero (met à jour lastAreaBiggerZeroTime) puis rétablit les exigences des zones de test selon le fruit courant. |
| `Cutter:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 459 | ✍ Côté serveur : écrit l'état de coupe si effectDirtyFlag est levé, puis lastAreaBiggerZeroSent. |
| `Cutter:readCutterFromStream(streamId: any, connection: any)` | 473 | ✍ Lit stade de croissance (4 bits), fruit d'entrée, indicateur de validité, mode andain (windrow) et type de remplissage d'entrée ; recalcule le type de sortie et le facteur de conversion à partir des convertisseurs. |
| `Cutter:writeCutterToStream(streamId: any, connection: any)` | 501 | ✍ Écrit stade de croissance, fruit d'entrée, si ce fruit est le dernier valide, mode andain et type de remplissage d'entrée (si andain). |
| `Cutter:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 515 | ✍ Sauvegarde la hauteur de coupe courante (#cutHeight). |
| `Cutter:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 522 | ✍ Par frame : applique l'inclinaison automatique de la table (rotation de nœuds selon le delta calculé par raycast) et, côté client, repositionne les dents des tambours (spikedDrums) le long de leur spline selon la rotation du tambour. |
| `Cutter:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 578 | ✍ Par tick : calcule isEffectActive (allumé, sens de marche, vitesse > 0.5, abaissé, Combine présent). Si actif : lisse cutterLoad, convertit la zone de test en bornes min/max normalisées (inversées selon le sens), vérifie que le fruit d'entrée est celui que le Combine peut traiter (sinon pas d'effet), et, côté client, démarre/arrête fillEffects et cutterEffects (type de remplissage, fruit, stade, largeur) et le son de coupe. Si inactif : arrête effets et son et fait décroître cutterLoad (x0.9). Détermine aussi, toutes les 500 ms, le type de sortie prioritaire pour éviter les changements rapides en bordure de champ, et lance les raycasts asynchrones d'inclinaison. Aucune donnée météo. |
| `Cutter:getCombine(fruitTypeIndex: any, outputFillTypeIndex: any)` | 738 | ✍ Trouve le Combine qui accepte le fruit/type de sortie : par verifyCombine propre ou du véhicule porteur. |
| `Cutter:getAllowCutterAIFruitRequirements()` | 759 | ✍ Renvoie true : l'IA applique les exigences de culture du cutter. |
| `Cutter:processCutterArea(workArea: any, dt: any)` | 765 | ✍ Pour chaque culture utilisable : lit la zone dans la carte de densité (récolte, facteurs de pulvérisation, labour, chaux, mauvaises herbes, chaume, rouleau, bonus d'abeilles, stade de croissance), met à jour fruit/type de sortie/stade courants (serveur), calcule le multiplicateur de récolte (g_currentMission:getHarvestScaleMultiplier), cumule aires et aires pondérées, dépose le sol de paille ou le haulm dans la zone de chaume, relève l'état des pierres et marque isWorking. Ignoré sur client trop éloigné. |
| `Cutter:processPickupCutterArea(workArea: any, dt: any)` | 880 | ✍ Ramassage d'andain : reprend, le long d'une ligne, les litres du type d'entrée via tipToGroundAroundLine, applique la conversion de type et le rendement des andains coupés (getCutWindrowHarvestFillLevel), active useWindrow. Côté client, déduit l'état du dernier ramassage connu. |
| `Cutter:processHaulmDropArea(workArea: any, dt: any)` | 946 | ✍ Dépose du haulm sur la zone tant que la coupe est active (dernière coupe il y a moins de 150 ms, ou lissage valueDelay), efface les traces de pneus. |
| `Cutter:onStartWorkAreaProcessing(dt: any)` | 986 | ✍ Avant le traitement : recherche le Combine, remet à zéro les cumuls et choisit la liste de cultures à tester, éventuellement restreinte au type requis par le Combine. |
| `Cutter:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 1041 | ✍ Côté serveur : convertit surfaces en litres, applique la conversion de type, tient les statistiques par type de sortie, appelle Combine:addCutterArea, met à jour les statistiques (hectares battus), l'exigence de culture de l'IA, les dirty flags d'effet et lastAreaBiggerZeroTime. |
| `Cutter:getCutterLoad()` | 1141 | ✍ Charge de la table : cutterLoad x (0.25 + 0.75 x vitesse / limite de vitesse bornée à 0..1). |
| `Cutter:getCutterStoneMultiplier()` | 1148 | ✍ Facteur d'usure dû aux pierres selon l'état de pierre relevé (1 par défaut). |
| `Cutter:loadCutterTiltFromXML(xmlFile: table, key: string, target: any) → boolean` | 1163 | ✍ Charge les nœuds, limites et raycasts de l'inclinaison automatique de la table. |
| `Cutter:getCutterTiltIsAvailable() → boolean` | 1198 | ✍ Indique si l'inclinaison automatique est disponible. |
| `Cutter:getCutterTiltIsActive(automaticTilt: any) → boolean, boolean` | 1206 | ✍ Indique si l'inclinaison automatique est active (conditions selon l'état de la table et les réglages). |
| `Cutter:getCutterTiltDelta() → number, boolean, boolean` | 1223 | ✍ Renvoie le delta d'inclinaison calculé, un indicateur d'activité et un indicateur de retour au neutre. |
| `Cutter:tiltRaycastDetectionCallbackLeft(hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, hitShapeId: any, isLast: any)` | 1231 | ✍ Rappel du raycast gauche : mémorise la hauteur du sol détecté pour l'inclinaison. |
| `Cutter:tiltRaycastDetectionCallbackRight(hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, hitShapeId: any, isLast: any)` | 1246 | ✍ Rappel du raycast droit : idem côté droit. |
| `Cutter:setCutterCutHeight(cutHeight: any) → number` | 1300 | ✍ Mémorise la hauteur de coupe et l'applique à la distance au sol d'abaissement de l'attelage (lowerDistanceToGround) des joints de type cutter. |
| `Cutter:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 1329 | ✍ Ajoute aux pièces à rotation par vitesse l'option #rotateIfTurnedOn (false par défaut). |
| `Cutter:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 1341 | ✍ Avec rotateIfTurnedOn, la pièce n'est active que si le cutter est allumé. |
| `Cutter:loadRandomlyMovingPartFromXML(superFunc: any, part: any, xmlFile: any, key: any)` | 1351 | ✍ Charge l'option de mouvement aléatoire conditionné à la coupe. |
| `Cutter:getIsRandomlyMovingPartActive(superFunc: any, part: any)` | 1361 | ✍ Avec moveOnlyIfCut, n'active la pièce que si le cutter a coupé durant les 150 dernières ms. |
| `Cutter:getIsWorkAreaActive(superFunc: any, workArea: any)` | 1373 | ✍ Une zone de type CUTTER n'est active que si la table est abaissée (sauf allowCuttingWhileRaised). |
| `Cutter:doCheckSpeedLimit(superFunc: any)` | 1388 | ✍ La limite de vitesse s'applique aussi quand le cutter est allumé et abaissé. |
| `Cutter:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 1394 | ✍ Lit l'index de zone de déchiquetage (chopperArea#index) d'une zone de travail. |
| `Cutter:getDirtMultiplier(superFunc: any)` | 1404 | ✍ Ajoute le multiplicateur de salissure de travail x (vitesse / limite) tant que isWorking. |
| `Cutter:getWearMultiplier(superFunc: any)` | 1416 | ✍ Même principe pour l'usure, multipliée par le facteur de pierres. |
| `Cutter:isAttachAllowed(superFunc: integer, farmId: integer, attacherVehicle: table) → boolean, string` | 1437 | ✍ Refuse l'attelage à un Combine dont les types de remplissage ne sont pas compatibles avec la sortie du cutter. |
| `Cutter:getConsumingLoad(superFunc: any)` | 1451 | ✍ Ajoute la charge de la table à la charge consommatrice du moteur. |
| `Cutter:getIsGroundReferenceNodeThreshold(superFunc: any, groundReferenceNode: any)` | 1461 | ✍ Ajoute la hauteur de coupe courante au seuil de contact des nœuds de référence au sol. |
| `Cutter:getDefaultAllowComponentMassReduction()` | 1471 | ✍ Renvoie true. |
| `Cutter:loadInputAttacherJoint(superFunc: table, xmlFile: any, key: any, inputAttacherJoint: any, i: any)` | 1478 | ✍ Lit l'option #useFruitCutHeight (true par défaut) des joints d'attelage. |
| `Cutter:getFruitExtraObjectTypeData(superFunc: any)` | 1490 | ✍ Renvoie le dernier fruit d'entrée valide pour les objets additionnels dépendant du fruit. |
| `Cutter:onTurnedOn()` | 1496 | ✍ Côté client, démarre les animationNodes. |
| `Cutter:onTurnedOff()` | 1505 | ✍ Côté client, arrête les animationNodes ; réinitialise dans tous les cas les fruits et types de remplissage courants (entrée, sortie, IA). |
| `Cutter:onAIImplementStart()` | 1520 | ✍ Au démarrage de l'IA, réinitialise les exigences de culture puis exige les cultures supportées que le Combine peut recevoir. |
| `Cutter:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 1547 | ✍ Force pour l'IA : bordures d'abord, travail du segment initial et coupe des coins prise en charge. |
| `Cutter.getDefaultSpeedLimit()` | 1555 | ✍ Limite de vitesse par défaut : 10. |
| `Cutter:updateDebugValues(values: any)` | 1561 | ✍ Ajoute à l'affichage de débogage le type de sortie prioritaire, la hauteur de coupe et la répartition du tampon par type de remplissage. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `readCutterFromStream` | 78 |
| registerFunction | `writeCutterToStream` | 79 |
| registerFunction | `getCombine` | 80 |
| registerFunction | `getAllowCutterAIFruitRequirements` | 81 |
| registerFunction | `processCutterArea` | 82 |
| registerFunction | `processPickupCutterArea` | 83 |
| registerFunction | `processHaulmDropArea` | 84 |
| registerFunction | `getCutterLoad` | 85 |
| registerFunction | `getCutterStoneMultiplier` | 86 |
| registerFunction | `loadCutterTiltFromXML` | 87 |
| registerFunction | `getCutterTiltIsAvailable` | 88 |
| registerFunction | `getCutterTiltIsActive` | 89 |
| registerFunction | `getCutterTiltDelta` | 90 |
| registerFunction | `tiltRaycastDetectionCallbackLeft` | 91 |
| registerFunction | `tiltRaycastDetectionCallbackRight` | 92 |
| registerFunction | `setCutterCutHeight` | 93 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 99 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 100 |
| registerOverwrittenFunction | `loadRandomlyMovingPartFromXML` | 101 |
| registerOverwrittenFunction | `getIsRandomlyMovingPartActive` | 102 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 103 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 104 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 105 |
| registerOverwrittenFunction | `getDirtMultiplier` | 106 |
| registerOverwrittenFunction | `getWearMultiplier` | 107 |
| registerOverwrittenFunction | `isAttachAllowed` | 108 |
| registerOverwrittenFunction | `getConsumingLoad` | 109 |
| registerOverwrittenFunction | `getIsGroundReferenceNodeThreshold` | 110 |
| registerOverwrittenFunction | `getDefaultAllowComponentMassReduction` | 111 |
| registerOverwrittenFunction | `loadInputAttacherJoint` | 112 |
| registerOverwrittenFunction | `getFruitExtraObjectTypeData` | 113 |
| registerEventListener | `onLoad` | 119 |
| registerEventListener | `onPostLoad` | 120 |
| registerEventListener | `onDelete` | 121 |
| registerEventListener | `onReadStream` | 122 |
| registerEventListener | `onWriteStream` | 123 |
| registerEventListener | `onReadUpdateStream` | 124 |
| registerEventListener | `onWriteUpdateStream` | 125 |
| registerEventListener | `onUpdate` | 126 |
| registerEventListener | `onUpdateTick` | 127 |
| registerEventListener | `onStartWorkAreaProcessing` | 128 |
| registerEventListener | `onEndWorkAreaProcessing` | 129 |
| registerEventListener | `onTurnedOn` | 130 |
| registerEventListener | `onTurnedOff` | 131 |
| registerEventListener | `onAIImplementStart` | 132 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 133 |
