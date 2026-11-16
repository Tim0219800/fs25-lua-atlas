# vehicles/specializations/AnimatedVehicle.lua

*[English version](../../../../scripts/vehicles/specializations/AnimatedVehicle.md)*

Source: `dataS/scripts/vehicles/specializations/AnimatedVehicle.lua` — FS25 1.25.1.0

✍ Spécialisation qui donne à tout véhicule des animations nommées, pilotées par le temps, définies dans vehicle.animations (et dans animationConfigurations selon la configuration). Chaque animation est une liste de parties temporisées, ou un jeu de keyframes, qui agit sur la rotation, la translation, l'échelle, la visibilité, les paramètres de shader, les clips d'animation, les splines, les rolling gates, d'autres animations et, côté serveur, les limites d'articulations, les masses, centres de masse et frictions. La lecture et l'arrêt sont synchronisés par AnimatedVehicleStartEvent et AnimatedVehicleStopEvent. Elle surcharge aussi les chargeurs de pièces tournantes selon la vitesse, de zones de travail, d'outils mobiles et de pièces mobiles pour les conditionner à une plage de temps d'animation. D'autres spécialisations enregistrent des types de valeurs supplémentaires via l'événement onRegisterAnimationValueTypes.

- **AnimatedVehicle** (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AnimatedVehicle.prerequisitesPresent(specializations: table) → boolean` | 25 | ✍ Renvoie toujours vrai : aucune spécialisation prérequise. |
| `AnimatedVehicle.initSpecialization()` | 31 | ✍ Ajoute le type de configuration de boutique 'animation', déclare les chemins XML d'animation (simples et par configuration), les attributs animName/limites pour les pièces tournantes et zones de travail, et les attributs requiredAnimation pour les outils et pièces mobiles de Cylindered. |
| `AnimatedVehicle.registerAnimationXMLPaths(schema: any, basePath: any)` | 70 | ✍ Déclare toutes les clés XML d'une animation : nom, looping, resetOnStart, startAnimTime, indicateur keyframe, tous les attributs de part (rot/trans/scale, limites, ressort, masse, shader, clip, spline, rolling gate, conditions) et les entrées sonores. |
| `AnimatedVehicle.registerEvents(vehicleType: any)` | 176 | ✍ Enregistre onRegisterAnimationValueTypes, onPlayAnimation, onStartAnimation, onUpdateAnimation, onFinishAnimation, onStopAnimation et onAnimationPartChanged. |
| `AnimatedVehicle.registerFunctions(vehicleType: any)` | 188 | ✍ Enregistre sur le type de véhicule l'API publique d'animation (chargement, lecture, arrêt, accesseurs de temps et de vitesse, réinitialisation, nombre d'animations actives). |
| `AnimatedVehicle.registerOverwrittenFunctions(vehicleType: any)` | 218 | ✍ Surcharge les fonctions de chargement et d'activité des pièces tournantes, zones de travail, outils mobiles et pièces mobiles afin de les conditionner à une animation. |
| `AnimatedVehicle.registerEventListeners(vehicleType: any)` | 231 | ✍ Abonne la spécialisation à onPreLoad, onLoad, onPostLoad, onDelete, onUpdate et onRegisterAnimationValueTypes. |
| `AnimatedVehicle:onPreLoad(savegame: table)` | 245 | ✍ Crée la table des types de valeurs d'animation et déclenche onRegisterAnimationValueTypes pour que chaque spécialisation enregistre ses propres types avant le chargement des animations. |
| `AnimatedVehicle:onLoad(savegame: table)` | 255 | ✍ Charge toutes les entrées vehicle.animations.animation, puis celles de la configuration d'animation choisie, dans spec.animations indexé par nom. Un même nom dans la configuration remplace celui de base. |
| `AnimatedVehicle:onPostLoad(savegame: table)` | 287 | ✍ Pour les animations avec resetOnStart, les place au temps de départ configuré par une mise à jour instantanée forcée. Retire l'écouteur onUpdate si le véhicule n'a aucune animation. |
| `AnimatedVehicle:onDelete()` | 305 | ✍ Sur les clients, supprime tous les échantillons sonores d'animation, y compris ceux des événements de temps d'arrêt. |
| `AnimatedVehicle:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 323 | ✍ Fait avancer toutes les animations actives de dt, gère le court délai servant à arrêter les échantillons non bouclés après une mise à jour à temps fixe, et maintient le véhicule actif tant qu'une animation tourne. |
| `AnimatedVehicle:registerAnimationValueType(name: any, startName: any, endName: any, initialUpdate: any, classObject: any, load: any, get: any, set: any)` | 356 | ✍ Enregistre un type de valeur (nom, noms des attributs XML de début/fin, classe, rappels load/get/set) utilisé par les parts d'animation. Ignoré si le nom existe déjà. À appeler depuis onRegisterAnimationValueTypes. |
| `AnimatedVehicle:loadAnimation(xmlFile: any, key: any, animation: any, components: any)` | 377 | ✍ Charge une animation depuis le XML dans la table fournie : indicateurs, parts triées (ou courbes de keyframes), durée calculée en ms, temps de départ et échantillons sonores. Renvoie vrai si un nom est trouvé, faux sinon. |
| `AnimatedVehicle:loadAnimationPart(xmlFile: any, partKey: any, part: any, animation: any, components: any)` | 504 | ✍ Charge une part temporisée : crée un objet valeur pour chaque type enregistré utilisé par la part XML, stocke les conditions (plage d'une autre animation, configuration) et les temps en ms. Renvoie faux si aucune valeur ne s'applique ou si le timing manque. |
| `AnimatedVehicle:loadStaticAnimationPart(xmlFile: any, partKey: any, part: any, animation: any, components: any)` | 569 | ✍ Variante keyframe : ajoute des keyframes de translation/rotation/échelle d'un nœud dans son AnimCurve, à partir d'un attribut time ou de temps de début/fin. Renvoie vrai si le nœud est résolu. |
| `AnimatedVehicle:loadStaticAnimationPartValues(xmlFile: any, partKey: any, curve: any, node: any, transName: any, rotName: any, scaleName: any, time: any, animation: any)` | 628 | ✍ Lit translation, rotation et échelle d'une keyframe, en utilisant la transformation actuelle du nœud pour les valeurs absentes, avertit si les jeux d'attributs d'un nœud sont incohérents, et ajoute la keyframe à la courbe. |
| `AnimatedVehicle:initializeAnimationParts(animation: table)` | 672 | ✍ Initialise toutes les parts d'une animation en deux passes : init pour toutes, puis postInit pour toutes. |
| `AnimatedVehicle:initializeAnimationPart(animation: table, part: table, i: any, numParts: any)` | 687 | ✍ Appelle init sur chaque objet valeur de la part, en lui passant l'indice de la part et leur nombre. |
| `AnimatedVehicle:postInitializeAnimationPart(animation: table, part: table, i: any, numParts: any)` | 696 | ✍ Appelle postInit sur chaque objet valeur de la part, normalement pour compléter les valeurs de départ manquantes à partir des valeurs de fin de la part précédente. |
| `AnimatedVehicle:playAnimation(name: string, speed: number, animTime: number, noEventSend: boolean, allowSounds: any)` | 709 | ✍ Démarre ou reprend une animation à la vitesse donnée (négative : lecture inversée, 0 ou nil sans vitesse mémorisée : ignoré) et au temps de départ (0-1). Sauf noEventSend, diffuse un AnimatedVehicleStartEvent. Déclenche onPlayAnimation et onStartAnimation. |
| `AnimatedVehicle:stopAnimation(name: string, noEventSend: boolean)` | 759 | ✍ Arrête une animation, efface son temps d'arrêt, coupe ses sons non bouclés et déclenche onStopAnimation et onFinishAnimation. Sauf noEventSend, envoie un AnimatedVehicleStopEvent même si le nom est inconnu. |
| `AnimatedVehicle:getAnimationExists(name: string) → boolean` | 795 | ✍ Renvoie vrai si une animation de ce nom est définie sur le véhicule. |
| `AnimatedVehicle:getAnimationByName(name: string) → table` | 805 | ✍ Renvoie la table interne de l'animation portant ce nom, ou nil. |
| `AnimatedVehicle:getIsAnimationPlaying(name: string) → boolean` | 814 | ✍ Renvoie vrai si l'animation figure actuellement dans la liste des animations actives. |
| `AnimatedVehicle:getRealAnimationTime(name: string) → number` | 824 | ✍ Renvoie le temps courant de l'animation en millisecondes, ou 0 pour une animation inconnue. |
| `AnimatedVehicle:setRealAnimationTime(name: string, animTime: number, update: boolean, playSounds: any)` | 839 | ✍ Place une animation à un temps en ms. Par défaut (update vrai), applique immédiatement toutes les valeurs des parts, avec sons optionnels. Avec update faux, ne fait que mémoriser le temps. |
| `AnimatedVehicle:getAnimationTime(name: string) → number` | 866 | ✍ Renvoie le temps normalisé de l'animation (0 à 1), ou 0 si elle est inconnue ou de durée nulle. |
| `AnimatedVehicle:setAnimationTime(name: string, animTime: number, update: boolean, playSounds: any)` | 882 | ✍ Définit le temps normalisé (0 à 1) via setRealAnimationTime, en appliquant éventuellement les valeurs immédiatement. |
| `AnimatedVehicle:getAnimationDuration(name: string) → number` | 899 | ✍ Renvoie la durée de l'animation en ms, ou 1 si elle n'existe pas. |
| `AnimatedVehicle:setAnimationSpeed(name: string, speed: number)` | 913 | ✍ Définit le facteur de vitesse de lecture. Si une animation en cours change de sens, les valeurs de ses parts sont réinitialisées. |
| `AnimatedVehicle:getAnimationSpeed(name: string) → number` | 933 | ✍ Renvoie le facteur de vitesse courant de l'animation, ou 0 si elle est inconnue. |
| `AnimatedVehicle:setAnimationStopTime(name: string, stopTime: number)` | 948 | ✍ Définit un temps normalisé (0 à 1) auquel l'animation s'arrêtera d'elle-même. |
| `AnimatedVehicle:resetAnimationValues(animation: table)` | 960 | ✍ Recalcule l'indice de la part courante et réinitialise les objets valeur de toutes les parts de l'animation. |
| `AnimatedVehicle:resetAnimationPartValues(part: table)` | 970 | ✍ Réinitialise chaque objet valeur d'une part d'animation. |
| `AnimatedVehicle:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 978 | ✍ Surcharge : si le chargeur parent réussit, lit animName, animOuterRange, animMinLimit et animMaxLimit. Renvoie faux si le parent échoue. |
| `AnimatedVehicle:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 993 | ✍ Surcharge : avec animName défini, la pièce est inactive hors de la plage de temps min/max de l'animation (ou dedans avec animOuterRange) ; sinon délègue au parent. À noter : le test de plage extérieure utilise un 'or', donc avec les limites par défaut 0 et 1 la pièce est presque toujours inactive. |
| `AnimatedVehicle:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 1012 | ✍ Surcharge : lit animName, animMinLimit et animMaxLimit sur la zone de travail, puis appelle le chargeur parent. |
| `AnimatedVehicle:getIsWorkAreaActive(superFunc: any, workArea: any)` | 1022 | ✍ Surcharge : la zone de travail est inactive tant que le temps de son animation liée est hors des limites min/max ; sinon le parent décide. |
| `AnimatedVehicle:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1035 | ✍ Surcharge : si le chargeur parent réussit, lit requiredAnimation et ses temps min/max (0 et 1 par défaut). Renvoie faux si le parent échoue. |
| `AnimatedVehicle:getIsMovingToolActive(superFunc: any, movingTool: any)` | 1051 | ✍ Surcharge : l'outil mobile est inactif tant que le temps de l'animation requise est hors de la plage autorisée ; sinon le parent décide. |
| `AnimatedVehicle:loadMovingPartFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1064 | ✍ Surcharge : si le chargeur parent réussit, lit requiredAnimation et ses temps min/max (0 et 1 par défaut). Renvoie faux si le parent échoue. |
| `AnimatedVehicle:getIsMovingPartActive(superFunc: any, movingPart: any)` | 1080 | ✍ Surcharge : la pièce mobile est inactive tant que le temps de l'animation requise est hors de la plage autorisée ; sinon le parent décide. |
| `AnimatedVehicle.initializeAnimationPartAttribute(self: any, animation: any, part: any, i: any, numParts: any, nextName: any, prevName: any, startName: any, endName: any, warningName: any, startName2: any, endName2: any, additionalCompareParam: any)` | 1093 | ✍ Aide utilisée par les types de valeurs : relie chaque part à la suivante sur le même nœud et le même sens, copie les valeurs de fin dans les valeurs de début manquantes de la suivante et avertit en cas de chevauchement. Les parts à plages ou configurations requises différentes ne sont pas reliées. |
| `AnimatedVehicle.animPartSorter(a: table, b: table) → boolean` | 1153 | ✍ Comparateur de tri : ordonne les parts par temps de début, puis par durée croissante. |
| `AnimatedVehicle.animPartSorterReverse(a: table, b: table) → boolean` | 1167 | ✍ Comparateur de tri pour la lecture inversée : ordonne les parts par temps de fin le plus tardif d'abord, puis par temps de début le plus tardif. |
| `AnimatedVehicle.getMovedLimitedValue(currentValue: number, destValue: number, speed: number, dt: number) → number` | 1185 | ✍ Déplace une valeur vers une cible de vitesse multipliée par dt (ms) sans jamais dépasser la cible. Renvoie la nouvelle valeur. |
| `AnimatedVehicle.setMovedLimitedValuesN(n: integer, currentValues: table, destValues: table, speeds: table, dt: number)` | 1202 | ✍ Applique getMovedLimitedValue aux n premières entrées d'une table, en place. Renvoie vrai si une valeur a changé. |
| `AnimatedVehicle.setMovedLimitedValues3(currentValues: table, destValues: table, speeds: table, dt: number)` | 1220 | ✍ Raccourci de setMovedLimitedValuesN pour 3 valeurs (par exemple un vecteur x/y/z). Renvoie vrai si une valeur a changé. |
| `AnimatedVehicle.setMovedLimitedValues4(currentValues: table, destValues: table, speeds: table, dt: number)` | 1230 | ✍ Raccourci de setMovedLimitedValuesN pour 4 valeurs. Renvoie vrai si une valeur a changé. |
| `AnimatedVehicle.findCurrentPartIndex(animation: table) → integer` | 1238 | ✍ Trouve l'indice de la part jouée au temps courant, en utilisant l'ordre direct ou inversé des parts selon le signe de la vitesse. Le stocke dans animation.currentPartIndex. |
| `AnimatedVehicle.getDurationToEndOfPart(part: table, anim: table) → number` | 1265 | ✍ Renvoie le temps en ms entre le temps courant de l'animation et la fin de la part dans le sens de lecture. |
| `AnimatedVehicle.getNextPartIsPlaying(nextPart: table, prevPart: table, anim: table, default: boolean) → boolean` | 1280 | ✍ Indique si la part suivante (dans le sens de lecture) a déjà dépassé son début, ou renvoie la valeur par défaut s'il n'y en a pas. |
| `AnimatedVehicle.updateAnimations(self: number, dt: number, fixedTimeUpdate: any)` | 1296 | ✍ Met à jour chaque animation active pour dt, en parcourant la liste à l'envers afin de pouvoir retirer sans risque les animations terminées. |
| `AnimatedVehicle.updateAnimationByName(self: string, animName: string, dt: number, fixedTimeUpdate: any)` | 1311 | ✍ Met à jour une animation nommée pour dt, en respectant son temps d'arrêt. Sans effet si le nom est inconnu. |
| `AnimatedVehicle.updateAnimationCurrentTime(self: table, anim: table, dt: number, stopTime: number) → number, boolean` | 1328 | ✍ Avance l'horloge de l'animation de dt multiplié par la vitesse, la limite au temps d'arrêt s'il est atteint, et renvoie le dt effectif et l'indication d'arrêt. |
| `AnimatedVehicle.updateAnimation(self: table, anim: table, dtToUse: number, stopAnim: boolean, fixedTimeUpdate: boolean, playSounds: playSounds)` | 1360 | ✍ Étape centrale : met à jour les parts concernées (ou évalue les courbes de keyframes), pilote les sons selon temps de début/fin, sens et hauteur, déclenche onUpdateAnimation et termine l'animation (événements, sons d'arrêt, bouclage éventuel). Une mise à jour à temps fixe ignore sons et bouclage. |
| `AnimatedVehicle:updateAnimationPart(animation: table, part: table, durationToEnd: number, dtToUse: number, realDt: number, fixedTimeUpdate: any)` | 1592 | ✍ Met à jour tous les objets valeur d'une part et renvoie vrai si l'un d'eux a changé. |
| `AnimatedVehicle:getNumOfActiveAnimations()` | 1605 | ✍ Renvoie le nombre d'animations actuellement en cours de lecture sur le véhicule. |
| `AnimatedVehicle:onRegisterAnimationValueTypes()` | 1611 | ✍ Enregistre les types de valeurs intégrés : rotation, translation, scale, shaderParameter, visibility, visibilityInter, animationClip, dependentAnimation, spline et rollingGate pour tous, plus rotLimit, transLimit, rotationLimitSpring, componentMass, centerOfMass et frictionVelocity uniquement côté serveur. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onRegisterAnimationValueTypes` | 177 |
| registerEvent | `onPlayAnimation` | 178 |
| registerEvent | `onStartAnimation` | 179 |
| registerEvent | `onUpdateAnimation` | 180 |
| registerEvent | `onFinishAnimation` | 181 |
| registerEvent | `onStopAnimation` | 182 |
| registerEvent | `onAnimationPartChanged` | 183 |
| registerFunction | `registerAnimationValueType` | 189 |
| registerFunction | `loadAnimation` | 190 |
| registerFunction | `loadAnimationPart` | 191 |
| registerFunction | `loadStaticAnimationPart` | 192 |
| registerFunction | `loadStaticAnimationPartValues` | 193 |
| registerFunction | `initializeAnimationParts` | 194 |
| registerFunction | `initializeAnimationPart` | 195 |
| registerFunction | `postInitializeAnimationPart` | 196 |
| registerFunction | `playAnimation` | 197 |
| registerFunction | `stopAnimation` | 198 |
| registerFunction | `getAnimationExists` | 199 |
| registerFunction | `getAnimationByName` | 200 |
| registerFunction | `getIsAnimationPlaying` | 201 |
| registerFunction | `getRealAnimationTime` | 202 |
| registerFunction | `setRealAnimationTime` | 203 |
| registerFunction | `getAnimationTime` | 204 |
| registerFunction | `setAnimationTime` | 205 |
| registerFunction | `getAnimationDuration` | 206 |
| registerFunction | `setAnimationSpeed` | 207 |
| registerFunction | `getAnimationSpeed` | 208 |
| registerFunction | `setAnimationStopTime` | 209 |
| registerFunction | `resetAnimationValues` | 210 |
| registerFunction | `resetAnimationPartValues` | 211 |
| registerFunction | `updateAnimationPart` | 212 |
| registerFunction | `getNumOfActiveAnimations` | 213 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 219 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 220 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 221 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 222 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 223 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 224 |
| registerOverwrittenFunction | `loadMovingPartFromXML` | 225 |
| registerOverwrittenFunction | `getIsMovingPartActive` | 226 |
| registerEventListener | `onPreLoad` | 232 |
| registerEventListener | `onLoad` | 233 |
| registerEventListener | `onPostLoad` | 234 |
| registerEventListener | `onDelete` | 235 |
| registerEventListener | `onUpdate` | 236 |
| registerEventListener | `onRegisterAnimationValueTypes` | 237 |
