# vehicles/specializations/Combine.lua

*[English version](../../../../scripts/vehicles/specializations/Combine.md)*

Source: `dataS/scripts/vehicles/specializations/Combine.lua` — FS25 1.25.1.0

✍ Spécialisation des moissonneuses-batteuses (et ensileuses à tampon) : reçoit les récoltes calculées par les Cutter attachés (addCutterArea), les stocke dans la fill unit, gère un tampon d'entrée (processing.inputBuffer, en créneaux temporisés) qui alimente la paille/le déchiquetage, et pilote les effets visuels côté client. EFFETS (tous via g_effectManager:loadEffect, EffectManager absent du dump : rendu interne NON VÉRIFIÉ) : « chopperEffect » (déchiquetage, clé vehicle.combine.chopperEffect), « strawEffect » (dépôt d'andain), « fillEffect » (remplissage/éjection) et « effect » (effets généraux allumés à l'allumage), plus animationNodes, chopperAnimationNodes, strawDropAnimationNodes et fillingAnimationNodes. Conditions : chopper et paille sont activés par des minuteries serveur (isChopperEffectEnabled / isStrawEffectEnabled, mises à 500 ms quand processCombineChopperArea ou processCombineSwathArea travaille réellement, puis décrémentées dans onUpdateTick) ; le fillEffect suit isFilling (délai spec.processing.toggleTime après les dernières surfaces coupées, fillTimeThreshold sans coupe). Le type de remplissage (setEffectTypeInfo) est getCombineLastValidFillType ; la densité d'effet (g_effectManager:setDensity) vaut cutterLoad x strawRatio x 0.8 + 0.2 (calculée dans addCutterArea, valeur par défaut 0.2). Aucun vent, aucune poussière dédiée n'est piloté ici : la poussière de coupe visible vient des effets XML (cutter.effect et effets ci-dessus) et reste un effet binaire + densité. DONNÉES MÉTÉO : une seule lecture, getIsThreshingDuringRain, qui interroge weather:getRainFallScale() et weather:getTimeSinceLastRain() (seuils : pluie >= 0.1, ou >= 0.02 en mode « alerte précoce », et temps depuis la dernière pluie < 20 ; unités de Weather NON VÉRIFIÉES). Si vrai (et hors mission sur la position, et allowThreshingDuringRain faux), le rendement ajouté dans addCutterArea est multiplié par (1 - Combine.RAIN_YIELD_REDUCTION) (constante non définie dans le dump : NON VÉRIFIÉE) et onDraw affiche l'avertissement « la pluie réduit le rendement ». Pas d'effet visuel lié à la pluie ici. RÉSEAU : le serveur calcule ; les états isFilling, chopperPSenabled, strawPSenabled, effectDensity (5 bits), type de remplissage et fruit sont envoyés via effectDirtyFlag dans onWriteUpdateStream et appliqués côté client par setChopperPSEnabled / setStrawPSEnabled / setCombineIsFilling ; le dirtyFlag sépare le fruit et les hectares travaillés ; onWriteStream/onReadStream envoient l'état complet à la connexion (densité fixée à 1) ; setIsSwathActive passe par CombineStrawEnableEvent. Sur un client, processCombineChopperArea et processCombineSwathArea ne travaillent que si currentUpdateDistance <= Combine.CLIENT_DM_UPDATE_RADIUS (valeur NON VÉRIFIÉE). Points d'extension : événements enregistrés onStartThreshing et onStopThreshing (registerEvents) ; fonctions enregistrées setChopperPSEnabled, setStrawPSEnabled, setCombineIsFilling, setIsSwathActive, getIsThreshingDuringRain, getCombineLastValidFillType, getCombineLoadPercentage, addCutterArea, verifyCombine, processCombineChopperArea/SwathArea, loadCombineEffects ; surcharges (getCanBeTurnedOn, getIsFoldAllowed, getDirtMultiplier, getWearMultiplier, getIsTurnedOnAnimationActive...). Les setters d'effets sont les points d'accroche les plus propres pour observer ou compléter les émissions sans toucher à la logique de récolte. Sauvegarde : isSwathActive, workedHectars, numAttachedCutters.

- **Combine** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Combine.initSpecialization()` | 20 | ✍ Enregistre dans le schéma XML toutes les clés de vehicle.combine (avertissements, tampon, andain/swath, déchiquetage, échelle, échelle d'échelle repliable, additifs, inclinaison automatique, repli, effets chopperEffect / strawEffect / fillEffect / effect, animationNodes, sons, tableaux de bord) et les attributs de sauvegarde isSwathActive, workedHectars et numAttachedCutters. Non relu clé par clé. |
| `Combine.prerequisitesPresent(specializations: any)` | 128 | ✍ Exige WorkArea, FillUnit, AnimatedVehicle, TurnOnVehicle et (Drivable ou Attachable). |
| `Combine.registerEvents(vehicleType: any)` | 138 | ✍ Déclare les événements onStartThreshing et onStopThreshing. |
| `Combine.registerFunctions(vehicleType: any)` | 145 | ✍ Expose au type de véhicule les fonctions de chargement (loadCombineSetup, loadCombineEffects, loadCombineRotationNodes, loadCombineSamples), de gestion d'effets (setChopperPSEnabled, setStrawPSEnabled, setCombineIsFilling), de traitement (processCombineChopperArea, processCombineSwathArea, setIsSwathActive, startThreshing, stopThreshing, addCutterArea, addCutterToCombine, removeCutterFromCombine, setWorkedHectars) et d'interrogation (getIsThreshingDuringRain, verifyCombine, getFillLevelDependentSpeed, getIsCutterCompatible, getCombineLastValidFillType, getCombineFillLevelPercentage, getCombineLoadPercentage). |
| `Combine.registerOverwrittenFunctions(vehicleType: any)` | 173 | ✍ Surcharge getCanBeTurnedOn, getTurnedOnNotAllowedWarning, getAreControlledActionsAllowed, getIsFoldAllowed, getCanBeSelected, loadWorkAreaFromXML, getDirtMultiplier, getWearMultiplier, loadTurnedOnAnimationFromXML, getIsTurnedOnAnimationActive, loadRandomlyMovingPartFromXML, getIsRandomlyMovingPartActive, getDischargeFillType et getImplementAllowAutomaticSteering. |
| `Combine.registerEventListeners(vehicleType: any)` | 192 | ✍ Écoute notamment onLoad, onPostLoad, onDelete, les événements de flux réseau, onUpdate, onUpdateTick, onDraw, onRegisterActionEvents, onStart/EndWorkAreaProcessing, onChangedFillType, onDeactivate, attache/détache d'implément, onTurnedOn/Off, onEnter/LeaveVehicle, onFoldStateChanged et onFillUnitFillLevelChanged. |
| `Combine:onLoad(savegame: any)` | 221 | ✍ Charge la configuration (loadCombineSetup, effets, nœuds de rotation, sons) et initialise l'état : cutters attachés, textes d'avertissement (dont « la pluie réduit le rendement »), dernier type de fruit/remplissage, threshingScale (1 par défaut), paramètres de zone de travail (effectDensity 0.2, minuteries d'effets à 0) et deux dirty flags (dirtyFlag, effectDirtyFlag). |
| `Combine:onPostLoad(savegame: table)` | 283 | ✍ Après chargement : restaure l'état d'andain (isSwathActive) et les hectares travaillés depuis la sauvegarde, détecte une moissonneuse à tampon (capacité infinie), lie les fill units pour l'HUD, positionne l'échelle selon le repli et émet des avertissements XML sur une capacité nulle. |
| `Combine:onRegisterDashboardValueTypes()` | 348 | ✍ Déclare les valeurs de tableau de bord de la moissonneuse (hectares travaillés, session, etc.). Détail non relu. |
| `Combine:onDelete()` | 364 | ✍ Supprime les effets (généraux, remplissage, paille, déchiquetage), animations et sons. |
| `Combine:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 382 | ✍ Sauvegarde isSwathActive (si disponible), workedHectars et numAttachedCutters. |
| `Combine:onReadStream(streamId: integer, connection: Connection)` | 397 | ✍ Côté client à la connexion : lit fruit, états isFilling / chopper / paille, type de remplissage, andain et hectares, puis applique les effets (densité 1). |
| `Combine:onWriteStream(streamId: integer, connection: Connection)` | 421 | ✍ Côté serveur à la connexion : écrit le fruit valide, isFilling, chopperPSenabled, strawPSenabled, le type de remplissage valide, isSwathActive et workedHectars. |
| `Combine:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 439 | ✍ Côté client : lit, selon deux indicateurs, (1) le fruit valide et les hectares travaillés, (2) isFilling, états chopper/paille, densité d'effet sur 5 bits et type de remplissage ; applique setCombineIsFilling, setChopperPSEnabled et setStrawPSEnabled en mode synchronisé. |
| `Combine:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 470 | ✍ Côté serveur : écrit le premier bloc si dirtyFlag est levé et le second si effectDirtyFlag est levé (états d'effets, densité x 31, type de remplissage). |
| `Combine:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 496 | ✍ Par frame : côté serveur, désactive l'andain si le fruit n'a pas d'andain ou le réactive (et vide le tampon d'entrée) si possible, met à jour lastDischargeTime quand la cuve est vide, et pilote l'inclinaison automatique de la table de coupe d'après le Cutter (rotation de nœuds, animation dépendante, repositionnement de l'attelage). |
| `Combine:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 591 | ✍ Par tick, côté serveur : fait avancer le tampon d'entrée par créneaux, active/désactive isFilling après les délais toggleTime, décrémente les minuteries d'effets, appelle setChopperPSEnabled et setStrawPSEnabled avec la densité courante (et raiseActive tant qu'ils sont actifs), compte le temps de battage (statistiques), vide le tampon intermédiaire, gère les créneaux de chargement différé et lève effectDirtyFlag quand l'état ou la densité (écart > 0.05) a changé. |
| `Combine:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 704 | ✍ Affiche une fois par épisode l'avertissement de rendement réduit si l'outil est allumé et getIsThreshingDuringRain(false) est vrai ; affiche l'avertissement de remorque si showTrailerWarning. |
| `Combine:loadCombineSetup(xmlFile: any, baseKey: any, entry: any)` | 728 | ✍ Lit la configuration de base de vehicle.combine : allowThreshingDuringRain (false par défaut), fill units, tampon, délais, andain (swath), déchiquetage (chopper), échelle, additifs, inclinaison automatique, repli, durées de basculement, animation de démarrage. Détail non relu ligne à ligne. |
| `Combine:loadCombineEffects(xmlFile: any, baseKey: any, entry: any)` | 865 | ✍ Côté client, charge les groupes d'effets chopperEffect, strawEffect, fillEffect et effect, et initialise leurs états (désactivés, type inconnu). |
| `Combine:loadCombineRotationNodes(xmlFile: any, baseKey: any, entry: any)` | 890 | ✍ Charge les animationNodes de la moissonneuse (général, déchiquetage, dépôt de paille, remplissage) avec le paramètre d'inversion selon le niveau de remplissage. |
| `Combine:loadCombineSamples(xmlFile: any, key: any, entry: any)` | 903 | ✍ Charge les échantillons sonores de la moissonneuse (démarrage, arrêt, travail, déchiquetage, paille, remplissage...). |
| `Combine:setIsSwathActive(isSwathActive: boolean, noEventSend: boolean, force: boolean)` | 926 | ✍ Bascule entre dépôt d'andain et déchiquetage : envoie CombineStrawEnableEvent, joue l'animation du déflecteur, vide les créneaux d'écoulement, et, si allumée côté client, bascule animations et sons correspondants. |
| `Combine:processCombineChopperArea(workArea: any)` | 979 | ✍ Zone de travail de déchiquetage (andain inactif) : si de la paille est à déposer (litersToDrop > 0) et strawRatio > 0.5, écrit dans les cartes de densité (haulm de culture ou type de sol de paille via setGroundTypeLayerArea, effacement des traces de pneus, niveau de chaume haché), puis arme isChopperEffectEnabled à 500 ms. Ignoré au-delà de CLIENT_DM_UPDATE_RADIUS sur un client. |
| `Combine:processCombineSwathArea(workArea: any)` | 1029 | ✍ Zone de travail d'andain : dépose un andain de paille sur une ligne (DensityMapHeightUtil.tipToGroundAroundLine) avec le type d'andain du fruit ; si des litres sont déposés, arme isStrawEffectEnabled à 500 ms ; le surplus non déposable est perdu plutôt que mis en tampon. |
| `Combine:setChopperPSEnabled(chopperPSenabled: boolean, fruitTypeChanged: boolean, density: number, isSynchronized: boolean)` | 1073 | ✍ Active/désactive l'effet de déchiquetage (g_effectManager start/stop avec le type de remplissage) et le son chopStraw ; applique la densité reçue. En serveur synchronisé, mémorise l'état envoyé. Côté client seulement pour les effets. |
| `Combine:setStrawPSEnabled(strawPSenabled: boolean, fruitTypeChanged: boolean, density: number, isSynchronized: boolean)` | 1113 | ✍ Même principe pour l'effet de dépôt de paille et le son dropStraw ; remet strawToDrop à 0 à l'arrêt. |
| `Combine:setCombineIsFilling(isFilling: boolean, fruitTypeChanged: boolean, isSynchronized: boolean)` | 1155 | ✍ Active/désactive l'état de remplissage : animations de remplissage, type de remplissage des effets généraux, fillEffect (start/stop) et son de remplissage. Côté client. |
| `Combine:startThreshing()` | 1199 | ✍ Si des cutters sont attachés : les allume, joue l'animation de démarrage et les sons, lève onStartThreshing. |
| `Combine:stopThreshing()` | 1224 | ✍ Joue le son d'arrêt, coupe isFilling, si la cuve est pleine coupe le régulateur de vitesse et relève/replie les cutters, éteint les cutters et lève onStopThreshing. |
| `Combine:setWorkedHectars(hectars: number, isInitial: any)` | 1269 | ✍ Met à jour les hectares travaillés, synchronise via dirtyFlag si l'écart dépasse 0.01 (serveur) et rafraîchit le tableau de bord (client). |
| `Combine:addCutterToCombine(cutter: any)` | 1295 | ✍ Enregistre un cutter attaché et déplie l'échelle si configurée. |
| `Combine:removeCutterFromCombine(cutter: any)` | 1313 | ✍ Retire un cutter : si c'était le dernier, éteint la machine et vide le tampon invisible d'une moissonneuse à tampon ; replie l'échelle ; relance les actions contrôlées si l'AVC est actif. |
| `Combine:addCutterArea(area: any, liters: any, inputFruitType: any, outputFillType: any, strawRatio: any, farmId: any, cutterLoad: any)` | 1357 | ✍ Point d'entrée de la récolte : reçoit surface, litres, fruit d'entrée, type de sortie, rapport de paille et charge du cutter. Applique threshingScale, la réduction de rendement par la pluie (si getIsThreshingDuringRain et hors mission) et celle des dégâts, alimente le tampon d'entrée avec la paille (type de sol de chaume ou haulm, effectDensity = charge x ratio x 0.8 + 0.2), programme isFilling, consomme les additifs (+5 % de rendement), met à jour les hectares et ajoute les litres à la cuve (avec tampon, délai de chargement). Renvoie les litres appliqués. |
| `Combine:getIsThreshingDuringRain(earlyWarning: boolean) → boolean` | 1495 | ✍ Vrai si le battage pendant la pluie est interdit pour ce modèle et que getRainFallScale() atteint 0.1 (0.02 en alerte précoce) alors que getTimeSinceLastRain() est inférieur à 20. Seule dépendance météo du fichier. |
| `Combine:verifyCombine(fruitType: any, outputFillType: any)` | 1517 | ✍ Vérifie que la moissonneuse peut recevoir un fruit/type de sortie : refuse si un autre type remplit déjà la cuve au-delà du seuil (ou vide le tampon d'une moissonneuse à tampon) et si la capacité libre est insuffisante ; renvoie la moissonneuse ou nil et une alternative. |
| `Combine:getFillLevelDependentSpeed()` | 1547 | ✍ Renvoie -1 si le niveau de remplissage dépasse le seuil d'inversion des animationNodes, sinon 1. |
| `Combine:getIsCutterCompatible(fillTypes: table) → boolean` | 1565 | ✍ Vrai si l'un des types de remplissage de sortie du cutter est accepté par la fill unit. |
| `Combine:getCombineLastValidFillType() → integer` | 1584 | ✍ Dernier type de remplissage valide : tampon, cuve, créneaux de chargement différé, puis dernier type d'entrée. |
| `Combine:getCombineFillLevelPercentage() → number` | 1617 | ✍ Pourcentage de remplissage réel (borné à 1), y compris les créneaux de chargement différé. |
| `Combine:getCombineLoadPercentage()` | 1635 | ✍ Moyenne des charges (getCutterLoad) des cutters attachés. |
| `Combine:getCanBeTurnedOn(superFunc: any) → boolean` | 1658 | ✍ Refuse l'allumage sans cutter attaché ou si un cutter refuse d'être allumé. |
| `Combine:getTurnedOnNotAllowedWarning(superFunc: any) → string` | 1679 | ✍ Retourne l'avertissement approprié (aucun cutter, ou celui d'un cutter). |
| `Combine:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 1707 | ✍ Refuse les actions contrôlées sans cutter attaché. |
| `Combine:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any) → boolean` | 1721 | ✍ Interdit le repli pendant le battage (selon allowFoldWhileThreshing) ou cuve remplie au-delà du seuil. |
| `Combine:getCanBeSelected(superFunc: any)` | 1738 | ✍ Renvoie toujours true. |
| `Combine:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 1744 | ✍ Charge une zone de travail et lit les paramètres propres au déchiquetage/andain (suite non relue en détail). |
| `Combine:getDirtMultiplier(superFunc: any)` | 1765 | ✍ Ajoute le multiplicateur de salissure de travail x (vitesse / limite du cutter) si un cutter attaché travaille. |
| `Combine:getWearMultiplier(superFunc: any)` | 1781 | ✍ Même principe pour l'usure, multipliée par le facteur de pierres du cutter. |
| `Combine:loadTurnedOnAnimationFromXML(superFunc: any, xmlFile: any, key: any, turnedOnAnimation: any)` | 1798 | ✍ Ajoute les options activeChopper, activeStrawDrop (true par défaut) et waitForStraw aux animations d'allumage. |
| `Combine:getIsTurnedOnAnimationActive(superFunc: any, turnedOnAnimation: any)` | 1809 | ✍ Désactive l'animation selon le mode andain/déchiquetage ; avec waitForStraw, reste active tant que l'effet de déchiquetage est armé. |
| `Combine:loadRandomlyMovingPartFromXML(superFunc: any, part: any, xmlFile: any, key: any)` | 1825 | ✍ Ajoute l'option moveOnlyIfCut aux pièces à mouvement aléatoire. |
| `Combine:getIsRandomlyMovingPartActive(superFunc: any, part: any)` | 1835 | ✍ Avec moveOnlyIfCut, n'active la pièce que si un cutter a coupé durant les 150 dernières ms. |
| `Combine:getDischargeFillType(superFunc: any, dischargeNode: any)` | 1854 | ✍ Si la fill unit est vide, utilise le type de remplissage des créneaux de chargement différé pour la décharge. |
| `Combine:getImplementAllowAutomaticSteering(superFunc: any)` | 1886 | ✍ Renvoie toujours true. |
| `Combine:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1892 | ✍ Côté client, enregistre l'action TOGGLE_CHOPPER (andain/déchiquetage) si les deux modes existent. |
| `Combine:onStartWorkAreaProcessing(dt: any)` | 1913 | ✍ Avant les zones de travail : prépare litersToDrop (créneau courant du tampon), minLitersToDrop, strawRatio, type de sol de chaume, effectDensity et dropFillType. |
| `Combine:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 1954 | ✍ Après les zones : retire du créneau les litres effectivement déposés. |
| `Combine:onChangedFillType(fillUnitIndex: any, fillTypeIndex: any)` | 1964 | ✍ Quand le type de remplissage change, relance les effets actifs (déchiquetage, paille, remplissage) avec le nouveau type. |
| `Combine:onDeactivate()` | 1987 | ✍ Coupe les effets de déchiquetage, de paille et de remplissage et annule les minuteries. |
| `Combine:onPostAttachImplement(attachable: table, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 2000 | ✍ Si l'implément attaché est de type cutter, l'ajoute à la moissonneuse. |
| `Combine:onPostDetachImplement(implementIndex: integer)` | 2012 | ✍ Si l'implément détaché est de type cutter, le retire. |
| `Combine:onTurnedOn()` | 2027 | ✍ Lance le battage (startThreshing), les animations adaptées (andain ou déchiquetage), les sons et les effets généraux avec le type de remplissage (côté client) ; côté serveur, éteint si turnOffWhenFull et cuve pleine. |
| `Combine:onTurnedOff()` | 2060 | ✍ Arrête le battage, animations, effets généraux et son de déchiquetage (côté client). |
| `Combine:onEnterVehicle()` | 2079 | ✍ Replie l'échelle à l'entrée dans le véhicule, sauf conditions de repli ou cutter attaché. |
| `Combine:onLeaveVehicle()` | 2104 | ✍ Déplie l'échelle à la sortie du véhicule, sous les mêmes conditions. |
| `Combine:onFoldStateChanged(direction: any, moveToMiddle: any)` | 2129 | ✍ Joue l'animation d'échelle selon la direction de repli. |
| `Combine:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 2147 | ✍ Mémorise l'heure de la dernière décharge quand le niveau baisse ; côté serveur, éteint la machine si turnOffWhenFull et cuve pleine. |
| `Combine.actionEventToggleChopper(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2167 | ✍ Rappel de l'action TOGGLE_CHOPPER : bascule l'andain si le fruit a un andain, sinon affiche l'avertissement « impossible de basculer ». |
| `Combine.updateToggleStrawText(self: any)` | 2188 | ✍ Met à jour le texte de l'action selon que l'andain est actif ou non. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onStartThreshing` | 139 |
| registerEvent | `onStopThreshing` | 140 |
| registerFunction | `loadCombineSetup` | 146 |
| registerFunction | `loadCombineEffects` | 147 |
| registerFunction | `loadCombineRotationNodes` | 148 |
| registerFunction | `loadCombineSamples` | 149 |
| registerFunction | `setIsSwathActive` | 150 |
| registerFunction | `processCombineChopperArea` | 151 |
| registerFunction | `processCombineSwathArea` | 152 |
| registerFunction | `setChopperPSEnabled` | 153 |
| registerFunction | `setStrawPSEnabled` | 154 |
| registerFunction | `setCombineIsFilling` | 155 |
| registerFunction | `startThreshing` | 156 |
| registerFunction | `stopThreshing` | 157 |
| registerFunction | `setWorkedHectars` | 158 |
| registerFunction | `addCutterToCombine` | 159 |
| registerFunction | `removeCutterFromCombine` | 160 |
| registerFunction | `addCutterArea` | 161 |
| registerFunction | `getIsThreshingDuringRain` | 162 |
| registerFunction | `verifyCombine` | 163 |
| registerFunction | `getFillLevelDependentSpeed` | 164 |
| registerFunction | `getCombineLastValidFillType` | 165 |
| registerFunction | `getCombineFillLevelPercentage` | 166 |
| registerFunction | `getCombineLoadPercentage` | 167 |
| registerFunction | `getIsCutterCompatible` | 168 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 174 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 175 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 176 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 177 |
| registerOverwrittenFunction | `getCanBeSelected` | 178 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 179 |
| registerOverwrittenFunction | `getDirtMultiplier` | 180 |
| registerOverwrittenFunction | `getWearMultiplier` | 181 |
| registerOverwrittenFunction | `loadTurnedOnAnimationFromXML` | 182 |
| registerOverwrittenFunction | `getIsTurnedOnAnimationActive` | 183 |
| registerOverwrittenFunction | `loadRandomlyMovingPartFromXML` | 184 |
| registerOverwrittenFunction | `getIsRandomlyMovingPartActive` | 185 |
| registerOverwrittenFunction | `getDischargeFillType` | 186 |
| registerOverwrittenFunction | `getImplementAllowAutomaticSteering` | 187 |
| registerEventListener | `onLoad` | 193 |
| registerEventListener | `onPostLoad` | 194 |
| registerEventListener | `onRegisterDashboardValueTypes` | 195 |
| registerEventListener | `onDelete` | 196 |
| registerEventListener | `onReadStream` | 197 |
| registerEventListener | `onWriteStream` | 198 |
| registerEventListener | `onReadUpdateStream` | 199 |
| registerEventListener | `onWriteUpdateStream` | 200 |
| registerEventListener | `onUpdate` | 201 |
| registerEventListener | `onUpdateTick` | 202 |
| registerEventListener | `onDraw` | 203 |
| registerEventListener | `onRegisterActionEvents` | 204 |
| registerEventListener | `onStartWorkAreaProcessing` | 205 |
| registerEventListener | `onEndWorkAreaProcessing` | 206 |
| registerEventListener | `onChangedFillType` | 207 |
| registerEventListener | `onDeactivate` | 208 |
| registerEventListener | `onPostAttachImplement` | 209 |
| registerEventListener | `onPostDetachImplement` | 210 |
| registerEventListener | `onTurnedOn` | 211 |
| registerEventListener | `onTurnedOff` | 212 |
| registerEventListener | `onEnterVehicle` | 213 |
| registerEventListener | `onLeaveVehicle` | 214 |
| registerEventListener | `onFoldStateChanged` | 215 |
| registerEventListener | `onFillUnitFillLevelChanged` | 216 |
