# vehicles/VehicleMotor.lua

*[English version](../../../scripts/vehicles/VehicleMotor.md)*

Source: `dataS/scripts/vehicles/VehicleMotor.lua` — FS25 1.25.1.0

✍ Modèle de moteur et de transmission par véhicule, utilisé par la spécialisation Motorized. Il contient la courbe de couple, la plage de régime, les limites de vitesse, les rapports avant/arrière, d'éventuels groupes de rapports et les modes d'inversion, et chaque mise à jour lit du moteur la vitesse de rotation et le couple. Il calcule la charge lissée, choisit les rapports de démarrage et les passages automatiques, gère le passage manuel avec ou sans embrayage et lève des événements véhicule comme `onGearChanged`. L'état des rapports est synchronisé par les fonctions de flux ; les constantes de réglage (`VehicleMotor.*`, `MODULATION_*`) sont définies hors des fonctions montrées (NON VÉRIFIÉ).

- **VehicleMotor** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleMotor.new(vehicle: integer, minRpm: integer, maxRpm: integer, maxForwardSpeed: number, maxBackwardSpeed: number, torqueCurve: table, brakeForce: number, forwardGears: number, backwardGears: number, minForwardGearRatio: number, maxForwardGearRatio: number, minBackwardGearRatio: number, maxBackwardGearRatio: number, ptoMotorRpmRatio: integer, minSpeed: any) → table` | 66 | ✍ Crée le moteur d'un véhicule à partir de la plage de régime, des limites de vitesse, de la courbe de couple, de la force de freinage, des tables de rapports et des plages de rapports. Il initialise tous les minuteurs et limites, déduit couple et puissance maximums de la courbe et lit les modes d'inversion et de passage de rapports dans les réglages du jeu. |
| `VehicleMotor:postLoad(savegame: table)` | 317 | ✍ Étape après chargement : si des groupes de rapports existent, lève `onGearGroupChanged` pour le groupe actif afin que les écouteurs reçoivent l'état initial. L'argument de sauvegarde est inutilisé. |
| `VehicleMotor:delete()` | 325 | ✍ Désabonne le moteur de tous ses abonnements au centre de messages. |
| `VehicleMotor:setGearGroups(gearGroups: table, groupType: any, groupChangeTime: any)` | 332 | ✍ Définit les groupes de rapports, leur type de transmission et leur temps de changement, puis choisit comme groupe actif le groupe par défaut (premier à ratio positif, remplacé par un groupe marqué par défaut). |
| `VehicleMotor:setDirectionChange(directionChangeUseGear: table, directionChangeGearIndex: any, directionChangeUseGroup: any, directionChangeGroupIndex: any, directionChangeTime: any)` | 364 | ✍ Configure le fonctionnement du changement de sens : via un rapport arrière, via un groupe, ou par inversion des rapports avant, ainsi que le temps de changement. |
| `VehicleMotor:setManualShift(manualShiftGears: boolean, manualShiftGroups: boolean)` | 377 | ✍ Définit si les rapports et les groupes de rapports se changent manuellement. |
| `VehicleMotor:setStartGearThreshold(startGearThreshold: number)` | 386 | ✍ Définit le seuil de facteur utilisé pour choisir un rapport de démarrage adapté. |
| `VehicleMotor:setLowBrakeForce(lowBrakeForceScale: number, lowBrakeForceSpeedLimit: number)` | 394 | ✍ Définit l'échelle de force de freinage et la limite de vitesse sous laquelle s'applique le freinage automatique à basse vitesse. |
| `VehicleMotor:getMaxClutchTorque() → number` | 402 | ✍ Retourne le couple maximal transmissible par l'embrayage (5 par défaut). |
| `VehicleMotor:getRotInertia() → number` | 409 | ✍ Retourne l'inertie de rotation du moteur. |
| `VehicleMotor:setRotInertia(rotInertia: number)` | 416 | ✍ Définit l'inertie de rotation du moteur. |
| `VehicleMotor:getDampingRateFullThrottle() → number` | 423 | ✍ Retourne le taux d'amortissement du moteur à pleine charge. |
| `VehicleMotor:getDampingRateZeroThrottleClutchEngaged() → number` | 430 | ✍ Retourne le taux d'amortissement à accélérateur nul, embrayage engagé. |
| `VehicleMotor:getDampingRateZeroThrottleClutchDisengaged() → number` | 437 | ✍ Retourne le taux d'amortissement à accélérateur nul, embrayage débrayé. |
| `VehicleMotor:setDampingRateScale(dampingRateScale: number)` | 444 | ✍ Met à l'échelle les trois taux d'amortissement par rapport à leurs constantes par défaut. |
| `VehicleMotor:setGearChangeTime(gearChangeTime: number)` | 453 | ✍ Définit la durée de changement de rapport. Un temps de 0 marque la transmission comme powershift, toute autre valeur comme standard. |
| `VehicleMotor:setAutoGearChangeTime(autoGearChangeTime: number)` | 464 | ✍ Définit le délai minimal entre deux changements de rapport automatiques et limite le minuteur en cours à cette valeur. |
| `VehicleMotor:getPeakTorque() → number` | 472 | ✍ Retourne le couple maximal de la courbe de couple. |
| `VehicleMotor:getBrakeForce() → number` | 479 | ✍ Retourne la force de freinage configurée. |
| `VehicleMotor:getMinRpm() → number` | 486 | ✍ Retourne le régime minimal (ralenti). |
| `VehicleMotor:getMaxRpm() → number` | 493 | ✍ Retourne le régime maximal. |
| `VehicleMotor:getRequiredMotorRpmRange() → number, number` | 501 | ✍ Retourne les régimes min et max que doit tenir le moteur : la borne basse est relevée au régime imposé par la prise de force si un consommateur l'exige, sinon c'est le ralenti. |
| `VehicleMotor:getLastMotorRpm() → number` | 512 | ✍ Retourne le régime moteur lissé mémorisé en dernier par `setLastRpm`. |
| `VehicleMotor:getLastModulatedMotorRpm() → number` | 519 | ✍ Retourne le régime lissé plus une oscillation dépendant de la charge et moins une chute après hausse de charge. Destiné à un usage cosmétique comme le son ; retourne 0 si le régime est 0. |
| `VehicleMotor:getLastRealMotorRpm() → number` | 543 | ✍ Retourne le régime non lissé donné en dernier à `setLastRpm`. |
| `VehicleMotor:getSmoothLoadPercentage() → number` | 550 | ✍ Retourne la charge moteur lissée avec un léger décalage de modulation (variation cosmétique). |
| `VehicleMotor:getClutchPedal() → number` | 558 | ✍ Retourne la valeur de la pédale d'embrayage : la valeur manuelle côté client ou en mode embrayage manuel, sinon une estimation d'après l'écart entre vitesse d'embrayage et de moteur (0 à 1, tolérance de 50 tr/min). |
| `VehicleMotor:getSmoothedClutchPedal() → number` | 574 | ✍ Retourne la valeur lissée de la pédale d'embrayage. |
| `VehicleMotor:getManualClutchPedal() → number` | 581 | ✍ Retourne la valeur d'embrayage manuel en mode embrayage manuel, sinon 0. |
| `VehicleMotor:getGearToDisplay(isDashboard: any) → string` | 592 | ✍ Retourne le libellé du rapport pour l'interface ou le tableau de bord (nom du rapport, nom en marche arrière ou N). Sans tables de rapports, retourne D ou R selon le sens de conduite. |
| `VehicleMotor:getGearInfoToDisplay() → string, boolean, boolean, string, string, string, string, boolean` | 630 | ✍ Retourne le nom du rapport actuel, si l'affichage des rapports est disponible, si la transmission est automatique, les noms des deux rapports précédents et suivants, et si un changement de rapport est en cours. |
| `VehicleMotor:getDrivingDirection()` | 694 | ✍ Retourne le sens de conduite (1, -1 ou 0) : d'après le sens sélectionné dans les cas manuels, sinon d'après le sens de déplacement du véhicule au-delà de 0,95 km/h, sinon 0. |
| `VehicleMotor:getGearGroupToDisplay(isDashboard: any) → string, boolean` | 710 | ✍ Retourne le libellé du groupe de rapports actif et si l'affichage des groupes est disponible (N et false sans groupes). |
| `VehicleMotor:readGearDataFromStream(streamId: any)` | 734 | ✍ Lit dans un flux réseau le sens, le rapport cible, l'indicateur de changement, la table de rapports et le groupe. Lève `onGearChanged` et `onGearGroupChanged` quand les valeurs diffèrent de l'état local. |
| `VehicleMotor:writeGearDataToStream(streamId: any)` | 774 | ✍ Écrit dans un flux réseau le sens, le rapport cible, l'indicateur de changement, le choix de table avant/arrière et le groupe actif, en miroir de `readGearDataFromStream`. |
| `VehicleMotor:setLastRpm(lastRpm: number)` | 792 | ✍ Mémorise le régime réel, le lisse en régime affiché, met à jour l'échelle de turbo et l'état de la soupape de décharge (lève `onMotorBlowOffValveChanged` à chaque bascule) ainsi que la charge de régime constant. |
| `VehicleMotor:getMotorAppliedTorque() → number` | 828 | ✍ Retourne le couple réellement appliqué cette image, y compris la part consommée en externe. |
| `VehicleMotor:getMotorExternalTorque() → number` | 835 | ✍ Retourne le couple prélevé sur le moteur mais non envoyé aux roues, par exemple par les prises de force. |
| `VehicleMotor:getMotorAvailableTorque() → number` | 842 | ✍ Retourne le couple disponible pour la simulation physique. |
| `VehicleMotor:getEqualizedMotorRpm() → number` | 849 | ✍ Retourne le régime moteur égalisé. |
| `VehicleMotor:setEqualizedMotorRpm(rpm: number)` | 856 | ✍ Mémorise le régime égalisé et le transmet aussi à `setLastRpm`. |
| `VehicleMotor:getPtoMotorRpmRatio() → number` | 864 | ✍ Retourne le rapport entre régime moteur et régime de prise de force. |
| `VehicleMotor:setExternalTorqueVirtualMultiplicator(externalTorqueVirtualMultiplicator: any) → number` | 871 | ✍ Définit un multiplicateur virtuel appliqué au couple externe (1 par défaut si nil). |
| `VehicleMotor:getNonClampedMotorRpm() → number` | 878 | ✍ Retourne le régime moteur converti depuis la vitesse de rotation, sans limitation min/max. |
| `VehicleMotor:getMotorRotSpeed() → number` | 885 | ✍ Retourne la vitesse de rotation du moteur en rad/s. |
| `VehicleMotor:getClutchRpm() → number` | 892 | ✍ Retourne le régime côté roues de l'embrayage (vitesse du différentiel fois rapport). |
| `VehicleMotor:getClutchRotSpeed() → number` | 899 | ✍ Retourne la vitesse de rotation de l'embrayage en rad/s (vitesse du différentiel fois rapport). |
| `VehicleMotor:getTorqueCurve() → table` | 906 | ✍ Retourne l'objet de la courbe de couple. |
| `VehicleMotor:getTorque(acceleration: number) → number` | 914 | ✍ Retourne le couple pour la vitesse moteur actuelle (limitée entre min et max) multiplié par la valeur absolue de l'accélération. |
| `VehicleMotor:getTorqueCurveValue(rpm: number) → number` | 925 | ✍ Retourne le couple de la courbe à un régime, réduit par les dégâts du véhicule via `VehicleMotor.DAMAGE_TORQUE_REDUCTION`. |
| `VehicleMotor:getTorqueAndSpeedValues()` | 932 | ✍ Retourne deux tableaux construits à partir des points de la courbe de couple : couples ajustés aux dégâts et vitesses de rotation en rad/s. |
| `VehicleMotor:getMaximumForwardSpeed() → number` | 946 | ✍ Retourne la vitesse maximale avant en m/s. |
| `VehicleMotor:getMaximumBackwardSpeed() → number` | 953 | ✍ Retourne la vitesse maximale arrière en m/s. |
| `VehicleMotor:calculatePhysicalMaximumForwardSpeed() → number` | 960 | ✍ Calcule la vitesse maximale théorique avant à partir du rapport minimal avant ou des rapports et du régime max. |
| `VehicleMotor:calculatePhysicalMaximumBackwardSpeed() → number` | 967 | ✍ Calcule la vitesse maximale théorique arrière à partir des rapports arrière, ou des rapports avant s'il n'y en a pas. |
| `VehicleMotor.calculatePhysicalMaximumSpeed(minGearRatio: number, gears: table, maxRpm: integer) → number` | 977 | ✍ Aide statique : vitesse maximale en m/s à partir du régime max et du plus petit rapport. Affiche la pile d'appels et retourne 0 si ni rapport ni rapports ne sont donnés. |
| `VehicleMotor:update(dt: number)` | 997 | ✍ Mise à jour principale par image : lit du moteur de jeu la vitesse de rotation, le couple et le rapport, suit le patinage d'embrayage, le régime de prise de force et le pourcentage de charge (côté serveur), puis met à jour charge lissée, valeurs de rapport de démarrage et modulation. Sans nœud motorisé, il déduit les vitesses des roues. |
| `VehicleMotor:updateSmoothLoadPercentage(dt: number, rawLoadPercentage: number)` | 1174 | ✍ Filtre la charge brute avec un facteur dépendant de la vitesse (plus lent quand la charge baisse) et accumule la charge de variation utilisée pour les effets de chute de régime. |
| `VehicleMotor:updateStartGearValues(dt: table) → integer` | 1219 | ✍ Recalcule les données qui évaluent les rapports de démarrage : masse totale, effort demandé par les outils, masse au sol, différence de direction des outils attelés, puissance disponible après prise de force et pente. Bloque aussi brièvement les changements de rapport à l'arrêt quand la masse varie. |
| `VehicleMotor:getBestStartGear(gears: table) → integer` | 1324 | ✍ Choisit le meilleur rapport de démarrage (et le groupe s'il y en a) en évaluant chacun avec `getStartInGearFactor` face au seuil de démarrage. Retourne le rapport et l'indice de groupe. |
| `VehicleMotor:getRequiredRpmAtSpeedLimit(ratio: number) → number` | 1391 | ✍ Retourne le régime nécessaire pour atteindre la limite de vitesse actuelle (limite véhicule, régulateur et vitesse max moteur) avec un rapport donné. |
| `VehicleMotor:getStartInGearFactor(ratio: number) → number` | 1407 | ✍ Retourne un facteur de difficulté pour démarrer avec un rapport, selon masse, pente, puissance disponible et rapport ; math.huge si le rapport n'atteint pas un régime utile à la limite de vitesse. Plus bas est meilleur. |
| `VehicleMotor:getBestGearRatio(wheelSpeedRpm: number, minRatio: number, maxRatio: number, accSafeMotorRpm: number, requiredMotorPower: number, requiredMotorRpm: number) → number` | 1433 | ✍ Pour les plages de rapports continues (type CVT), retourne le rapport donnant la meilleure puissance à la vitesse de roue, ou celui correspondant à un régime moteur requis s'il est fourni, limité à la plage autorisée. |
| `VehicleMotor:getBestGear(acceleration: number, wheelSpeedRpm: number, accSafeMotorRpm: number, requiredMotorPower: number, requiredMotorRpm: number) → number, number` | 1478 | ✍ Retourne le sens (1 ou -1) et le rapport à utiliser pour l'accélération demandée, selon la plage de rapports ou le premier rapport suivant le type de transmission. |
| `VehicleMotor:findGearChangeTargetGearPrediction(curGear: any, gears: any, gearSign: any, gearChangeTimer: any, acceleratorPedal: any, dt: any)` | 1510 | ✍ Prédit la vitesse après un changement de rapport et note chaque rapport valide sur la puissance, la préférence de régime et la pénalité de changement, puis retourne le meilleur rapport cible. Il écrit des valeurs de debug dans les tables de rapports en mode debug transmission. |
| `VehicleMotor:applyTargetGear()` | 1769 | ✍ Fait du rapport cible le rapport actif, fixe les rapports min/max à partir de lui (hors mode embrayage manuel), réinitialise le temps de changement et lève `onGearChanged`. |
| `VehicleMotor:updateGear(acceleratorPedal: number, brakePedal: any, dt: any) → number` | 1793 | ✍ Logique de rapports appelée à chaque mise à jour physique : fait avancer les minuteurs de changement, gère le choix automatique du rapport de démarrage et des passages ainsi que les groupes, le rapport en embrayage manuel et le calage (arrête le moteur), et retourne les pédales d'accélérateur et de frein ajustées. |
| `VehicleMotor:shiftGear(up: any)` | 2065 | ✍ Passe manuellement un rapport au-dessus ou en dessous dans le sens courant, limité à la table de rapports. Peut inverser le sens en dessous du premier rapport, puis appelle `setGear` ; lève `onClutchCreaking` si l'embrayage l'interdit. |
| `VehicleMotor:selectGear(gearIndex: any, activation: any)` | 2109 | ✍ Sélectionne directement un rapport (style levier en H). À l'activation, applique le rapport s'il est autorisé et existe, sinon lève `onClutchCreaking` ; au relâchement, passe au point mort. |
| `VehicleMotor:setGear(gearIndex: any, isLocked: any)` | 2130 | ✍ Définit le rapport cible, lance le minuteur de changement (ou applique directement en mode embrayage manuel) et lève `onGearChanged`. Sans effet si le rapport est inchangé. |
| `VehicleMotor:shiftGroup(up: any)` | 2160 | ✍ Change manuellement le groupe de rapports vers le haut ou le bas, limité aux groupes existants, si c'est autorisé ; lève `onClutchCreaking` si l'embrayage l'interdit. |
| `VehicleMotor:selectGroup(groupIndex: any, activation: any)` | 2181 | ✍ Sélectionne directement un groupe de rapports s'il est autorisé et existe, sinon lève `onClutchCreaking` ; au relâchement, passe au groupe 0 (neutre). |
| `VehicleMotor:setGearGroup(groupIndex: any, isLocked: any)` | 2202 | ✍ Applique un nouveau groupe actif : ajuste le sens quand les groupes codent le sens, lance le minuteur de changement ou applique le rapport aussitôt pour les groupes powershift, et lève `onGearGroupChanged`. |
| `VehicleMotor:changeDirection(direction: any, force: any)` | 2238 | ✍ Change le sens de conduite (bascule si nil, ou forcé). Selon la configuration, il utilise un rapport arrière, un groupe ou des rapports inversés, lance le minuteur de sens, et lève `onGearDirectionChanged`, `onGearChanged` et éventuellement `onGearGroupChanged`. |
| `VehicleMotor:onManualClutchChanged(clutchValue: number)` | 2318 | ✍ Mémorise la valeur de la pédale d'embrayage manuel (0 à 1). |
| `VehicleMotor:getIsGearChangeAllowed() → boolean` | 2325 | ✍ Indique si un changement de rapport manuel est autorisé : en mode embrayage manuel sur une boîte non powershift l'embrayage doit dépasser 0,5, sinon toujours true. |
| `VehicleMotor:getIsGearGroupChangeAllowed() → boolean` | 2338 | ✍ Même règle que pour les rapports mais pour les groupes ; retourne false s'il n'y a pas de groupes. |
| `VehicleMotor:setTransmissionDirection(direction: integer)` | 2355 | ✍ Définit le sens de la transmission ; une valeur négative échange vitesses et plages de rapports avant/arrière avec leurs valeurs d'origine mémorisées. |
| `VehicleMotor:getMinMaxGearRatio() → number, number` | 2381 | ✍ Retourne les rapports minimal et maximal en vigueur, ajustés selon le patinage d'embrayage (élargit le maximum ou interpole vers le rapport de patinage). |
| `VehicleMotor:getGearRatio()` | 2401 | ✍ Retourne le rapport lu en dernier depuis le moteur de jeu. |
| `VehicleMotor:getGearRatioMultiplier() → number` | 2408 | ✍ Retourne le facteur de groupe et de sens multiplié aux rapports (0 si le groupe est neutre). |
| `VehicleMotor:getIsInNeutral()` | 2426 | ✍ Retourne true quand une table de rapports existe et que le rapport actuel et le rapport cible valent 0. |
| `VehicleMotor:getCanMotorRun()` | 2438 | ✍ En mode embrayage manuel, moteur arrêté et rapport engagé, retourne false et `REASON_CLUTCH_NOT_ENGAGED` quand l'embrayage le ferait caler ; sinon true. |
| `VehicleMotor:getCurMaxRpm() → integer` | 2464 | ✍ Retourne le régime maximal autorisé actuellement : le maximum du moteur, abaissé par la limite de vitesse via le rapport courant et par la limite de régime. |
| `VehicleMotor:setSpeedLimit(limit: number)` | 2487 | ✍ Définit la limite de vitesse en km/h, jamais en dessous de la vitesse minimale du moteur. |
| `VehicleMotor:getSpeedLimit()` | 2493 | ✍ Retourne la limite de vitesse en km/h. |
| `VehicleMotor:setAccelerationLimit(accelerationLimit: any)` | 2499 | ✍ Définit la limite d'accélération en m/s^2. |
| `VehicleMotor:getAccelerationLimit()` | 2505 | ✍ Retourne la limite d'accélération en m/s^2. |
| `VehicleMotor:setRpmLimit(rpmLimit: number)` | 2512 | ✍ Définit une limite supérieure de régime. |
| `VehicleMotor:setMotorRotationAccelerationLimit(limit: any)` | 2519 | ✍ Définit la limite d'accélération de rotation du moteur en rad/s^2. |
| `VehicleMotor:getMotorRotationAccelerationLimit()` | 2525 | ✍ Retourne la limite d'accélération de rotation du moteur en rad/s^2. |
| `VehicleMotor:setDirectionChangeMode(directionChangeMode: any)` | 2531 | ✍ Définit le mode de changement de sens (manuel ou automatique). |
| `VehicleMotor:setGearShiftMode(gearShiftMode: any)` | 2537 | ✍ Définit le mode de passage des rapports. Le mode embrayage manuel est ramené au mode manuel simple sur les boîtes powershift. |
| `VehicleMotor:getUseAutomaticGearShifting()` | 2550 | ✍ True en mode automatique, ou quand le véhicule n'a pas de passage de rapports manuel. |
| `VehicleMotor:getUseAutomaticGroupShifting()` | 2564 | ✍ True en mode automatique, ou quand le véhicule n'a pas de changement de groupe manuel. |
