# handTools/specializations/HandToolMotorized.lua

*[English version](../../../../scripts/handTools/specializations/HandToolMotorized.md)*

Source: `dataS/scripts/handTools/specializations/HandToolMotorized.lua` — FS25 1.25.1.0

✍ Spécialisation d'outil à main pour tout outil motorisé (comme la tronçonneuse) : elle simule un régime qui monte ou descend vers une cible à des vitesses configurables, une charge, les sons de démarrage, de ralenti et d'arrêt, des effets d'échappement et une vibration optionnelle d'un nœud. Le régime et la charge sont synchronisés dans le flux de mise à jour, et la vibration peut se combiner avec HandToolBob. Les clés XML sont sous `handTool.motorized`. À noter : `startTime` est lu mais n'est pas utilisé dans ce fichier.

- **HandToolMotorized** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolMotorized.registerXMLPaths(xmlSchema: any)` | 16 | ✍ Enregistre les attributs du moteur (régime min/max, vitesses de gain et de perte, variabilité), le nœud et l'amplitude de vibration, les sons de démarrage/arrêt/ralenti et les effets d'échappement. |
| `HandToolMotorized.registerFunctions(handToolType: any)` | 42 | ✍ Enregistre sur le type d'outil à main les fonctions de régime, de charge, de régime cible, de son et de vibration. |
| `HandToolMotorized.registerOverwrittenFunctions(handToolType: any)` | 67 | ✍ Surcharge `updateBobNode` pour appliquer la vibration en plus du balancement (voir HandToolBob). |
| `HandToolMotorized.registerEventListeners(handToolType: any)` | 73 | ✍ Abonne la spécialisation au chargement, post-chargement, suppression, mise à jour, lecture/écriture du flux de mise à jour, début/fin de prise en main et affichage de debug. |
| `HandToolMotorized.prerequisitesPresent(specializations: any)` | 87 | ✍ Renvoie toujours true : aucun prérequis. |
| `HandToolMotorized:onLoad(xmlFile: any, baseDirectory: any)` | 93 | ✍ Lit le régime min (10 par défaut), le régime max (100), les vitesses de gain et de perte (max moins min par seconde par défaut), la variabilité et la vibration. Démarre au régime min avec une charge nulle. Sur les clients, charge les sons et effets d'échappement ; les sons utilisent le chemin `sounds.motorized.sounds`, différent de `handTool.motorized.sounds` enregistré (NON VÉRIFIÉ lequel est voulu). |
| `HandToolMotorized:onPostLoad(savegame: any)` | 130 | ✍ Détecte si un nœud de balancement de HandToolBob est le même que le nœud de vibration, et l'enregistre pour que `updateVibrations` l'ignore. |
| `HandToolMotorized:onDelete()` | 149 | ✍ Sur les clients, libère les échantillons et tente de supprimer `fillEffects`, que ce fichier ne définit jamais ; les effets d'échappement ne sont pas supprimés ici. À noter : probable nom résiduel. |
| `HandToolMotorized:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 159 | ✍ Écrit, quand l'indicateur de modification est actif, le régime en fraction entre min et max et la charge, chacun compressé sur 8 bits. |
| `HandToolMotorized:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 169 | ✍ Lit le régime et la charge. Les applique sur le serveur, ou sur un client lorsque le joueur porteur n'est pas le propriétaire. |
| `HandToolMotorized:onHeldStart()` | 185 | ✍ Sur les clients, joue le son de démarrage puis la boucle de ralenti (si elle ne joue pas déjà), arrête le son d'arrêt et démarre les effets d'échappement. |
| `HandToolMotorized:onHeldEnd()` | 200 | ✍ Sur les clients, arrête les sons de démarrage et de ralenti, joue le son d'arrêt et arrête les effets d'échappement. |
| `HandToolMotorized:onUpdate(dt: any)` | 213 | ✍ Met à jour le régime à chaque image et, sur les clients, les paramètres sonores et les vibrations. |
| `HandToolMotorized:updateRPM(dt: any)` | 224 | ✍ Fait évoluer le régime courant vers la cible à la vitesse de gain ou de perte par seconde. Avec la variabilité activée, la cible est abaissée d'un décalage pseudo-aléatoire dépendant du temps et croissant avec la charge. |
| `HandToolMotorized:updateSounds(dt: any)` | 249 | ✍ Fournit à la boucle sonore de ralenti la fraction de régime et la charge courante. |
| `HandToolMotorized:updateVibrations(dt: any)` | 257 | ✍ Place le nœud de vibration sur un décalage aléatoire, sauf si la spécialisation de balancement pilote ce même nœud. |
| `HandToolMotorized:getVibrationOffset() → number, number, number` | 278 | ✍ Renvoie un décalage aléatoire X, Y, Z en mètres dans l'amplitude configurée, plus fort à bas régime (maximal au ralenti) et réduit par la charge. |
| `HandToolMotorized:updateBobNode(superFunc: function, bobNode: table, dt: number, isActive: boolean, speed: number)` | 300 | ✍ Fonction surchargée : appelle l'originale puis, sur les clients, ajoute la vibration au nœud de balancement s'il s'agit du nœud de vibration. |
| `HandToolMotorized:getTimeToReachRPM(rpm: number) → number` | 318 | ✍ Renvoie les secondes nécessaires pour atteindre le régime donné depuis le régime courant, avec la vitesse de gain en montée et de perte en descente ; 0 si égal. |
| `HandToolMotorized:getRPMGainPerSecond()` | 338 | ✍ Renvoie la vitesse de gain de régime par seconde. |
| `HandToolMotorized:setRPMGainPerSecond(rpmGainPerSecond: any)` | 344 | ✍ Définit la vitesse de gain de régime par seconde. |
| `HandToolMotorized:getRPMLossPerSecond()` | 350 | ✍ Renvoie la vitesse de perte de régime par seconde. |
| `HandToolMotorized:setRPMLossPerSecond(rpmLossPerSecond: any)` | 356 | ✍ Définit la vitesse de perte de régime par seconde. |
| `HandToolMotorized:getCurrentLoad()` | 362 | ✍ Renvoie la charge courante, de 0 à 1. |
| `HandToolMotorized:setCurrentLoad(currentLoad: any)` | 368 | ✍ Borne la charge à 0..1 et la stocke. Si elle change de plus de 0,01, signale une mise à jour réseau (serveur ou joueur propriétaire). |
| `HandToolMotorized:getCurrentRPM()` | 384 | ✍ Renvoie le régime courant. |
| `HandToolMotorized:setCurrentRPM(currentRPM: any)` | 390 | ✍ Borne le régime entre min et max et le stocke. S'il change de plus de 1, signale une mise à jour réseau (serveur ou joueur propriétaire). |
| `HandToolMotorized:getTargetRPM()` | 407 | ✍ Renvoie le régime cible. |
| `HandToolMotorized:getMaxRPM()` | 413 | ✍ Renvoie le régime maximal. |
| `HandToolMotorized:getMinRPM()` | 419 | ✍ Renvoie le régime minimal (ralenti). |
| `HandToolMotorized:setTargetRPM(targetRPM: any)` | 425 | ✍ Définit le régime cible, borné entre min et max. |
| `HandToolMotorized:setTargetRPMToIdle()` | 433 | ✍ Place le régime cible au minimum. |
| `HandToolMotorized:setTargetRPMToMax()` | 439 | ✍ Place le régime cible au maximum. |
| `HandToolMotorized:onDebugDraw(x: any, y: any, textSize: any)` | 445 | ✍ Ajoute des lignes de debug pour le régime courant, le régime cible, la charge et le pourcentage de vibration ; renvoie la position y mise à jour. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getTimeToReachRPM` | 43 |
| registerFunction | `getRPMGainPerSecond` | 44 |
| registerFunction | `setRPMGainPerSecond` | 45 |
| registerFunction | `getRPMLossPerSecond` | 46 |
| registerFunction | `setRPMLossPerSecond` | 47 |
| registerFunction | `getCurrentLoad` | 48 |
| registerFunction | `setCurrentLoad` | 49 |
| registerFunction | `getCurrentRPM` | 50 |
| registerFunction | `setCurrentRPM` | 51 |
| registerFunction | `getMinRPM` | 52 |
| registerFunction | `getTargetRPM` | 53 |
| registerFunction | `getMaxRPM` | 54 |
| registerFunction | `setTargetRPM` | 55 |
| registerFunction | `setTargetRPMToIdle` | 56 |
| registerFunction | `setTargetRPMToMax` | 57 |
| registerFunction | `updateRPM` | 59 |
| registerFunction | `updateSounds` | 60 |
| registerFunction | `updateVibrations` | 61 |
| registerFunction | `getVibrationOffset` | 62 |
| registerOverwrittenFunction | `updateBobNode` | 68 |
| registerEventListener | `onDelete` | 74 |
| registerEventListener | `onLoad` | 75 |
| registerEventListener | `onPostLoad` | 76 |
| registerEventListener | `onUpdate` | 77 |
| registerEventListener | `onWriteUpdateStream` | 78 |
| registerEventListener | `onReadUpdateStream` | 79 |
| registerEventListener | `onHeldStart` | 80 |
| registerEventListener | `onHeldEnd` | 81 |
| registerEventListener | `onDebugDraw` | 82 |
