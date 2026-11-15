# vehicles/specializations/Mower.lua

Source : `dataS/scripts/vehicles/specializations/Mower.lua` — FS25 1.25.1.0

✍ Spécialisation des faucheuses (barre de coupe, disques, faucheuse-conditionneuse) : coupe l'herbe/les cultures fourragères de la carte de densité (updateMowerArea, corps absent du dump) et dépose le fourrage soit dans la zone de dépôt (andain), soit dans une unité de remplissage. Prérequis : WorkArea, TurnOnVehicle, FruitExtraObjects. EFFETS (deux familles) : (1) cutterEffects (vehicle.mower.cutterEffects), effet de coupe piloté dans onUpdate ; (2) dropEffects (vehicle.mower.dropEffects.dropEffect(?)), effets de dépôt d'andain, liés à une zone de travail (workAreaIndex) et à une zone de dépôt (dropAreaIndex), fenêtre d'activité 750 ms. Classes d'effets absentes du dump : rendu NON VÉRIFIÉ. CUTTER EFFECTS : onUpdate (écouteur retiré s'il n'y a pas d'effet de coupe) ne fait rien tant que l'outil n'est pas allumé ET que getLastSpeed() <= 0.5 ; sinon, côté serveur, il lit la dernière culture coupée (workAreaParameters.lastInputFruitType et stade de croissance) si une coupe réelle a eu lieu dans les 500 derniers ms (g_time), sinon culture inconnue ; l'effet est actif si la culture est connue et que la zone de test n'est pas réinitialisée. Il appelle alors g_effectManager:setEffectTypeInfo(effets, nil, culture, stade) puis setMinMaxWidth avec la largeur courante de la zone de test de la zone n°1 (getTestAreaWidthByWorkAreaIndex(1), bornes inversées en marche avant) et startEffects. Les effets reçoivent donc culture, stade de croissance (défaut 3 si rien de récent) et largeur réellement coupée. L'état est diffusé (effectDirtyFlag : effectsAreRunning, stade sur 4 bits, culture sur FruitTypeManager.SEND_NUM_BITS) ; le client reconstruit les mêmes appels à partir de ces valeurs et de ses propres zones de test (setTestAreaRequirements). Arrêt : onUpdate si plus de coupe, onTurnedOff, ou réception de effectsAreRunning faux. DROP EFFECTS : côté serveur, onEndWorkAreaProcessing active l'effet quand la zone liée a ramassé des litres (pickedUpLiters > 0) sur la zone de dépôt voulue ; si plus de coupe, un minuteur décroissant en dt (750 ms) prolonge l'effet ; onStartWorkAreaProcessing du tick suivant diffuse le changement via dirtyFlag et appelle setDropEffectEnabled (démarrage/arrêt effectif, côté client). Le type transmis est le type de remplissage de la zone de dépôt (dropArea.fillType, issu du fruitTypeConverter : herbe vers andain, etc.). DÉPÔT : processDropArea (fin de passe, serveur ou client proche) dépose les litres accumulés sur une ligne tirée au hasard entre les bords de la zone de dépôt (math.random, y compris dans la physique de dépôt : non déterministe d'une exécution à l'autre ; à noter, le calcul du point d'arrivée mélange coordonnées de largeur et de hauteur, Mower.lua:552-553, forme apparemment inhabituelle, non vérifié en jeu) ; lastDropTime sert à isCutting (500 ms) pour le son de coupe. LITRES : fruitTypeAreaLiters * multiplicateur de récolte (getHarvestScaleMultiplier avec facteurs de pulvérisation, labour, chaux, mauvaises herbes, chaume, rouleau, abeilles : valeurs lues dans la carte) * facteur de conversion. MÉTÉO/HUMIDITÉ : aucune lecture dans ce fichier. RÉSEAU : flux initial (option de dépôt d'andain), flux de mise à jour (types et états des dropEffects, isCutting si pas d'effets de dépôt ; effets de coupe). Traitement de zone sauté pour un client éloigné (> Mower.CLIENT_DM_UPDATE_RADIUS, constante non définie ici : NON VÉRIFIÉ). dt : minuteur de dropEffect en ms de temps de jeu, mais avec une logique différente de celle des autres outils (compte à rebours en dt, alors que Tedder/Windrower comparent à g_currentMission.time). POINTS D'EXTENSION : fonctions processMowerArea, processDropArea, getDropArea, setDropEffectEnabled, setCutSoundEnabled, setUseMowerWindrowDropAreas ; surcharges doCheckSpeedLimit, getCanBeSelected, getDirtMultiplier, getWearMultiplier, getFruitExtraObjectTypeData, loadWorkAreaFromXML (clés mower#dropWindrow, #dropAreaIndex) ; événements onLoad, onPostLoad, flux, onUpdate, onTurnedOn/Off, onStart/EndWorkAreaProcessing, onAIFieldCourseSettingsInitialized ; événement réseau MowerToggleWindrowDropEvent. Vitesse limite par défaut : 20.

- **Mower** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Mower.initSpecialization()` | 19 | ✍ Déclare le type de zone mower et le schéma XML : effets de dépôt et de coupe, convertisseur de cultures, unité de remplissage, bascule d'andain (textes, animation, état initial), sons de coupe, clés dropWindrow/dropAreaIndex des zones. Non relu clé par clé. |
| `Mower.prerequisitesPresent(specializations: table) → boolean` | 59 | ✍ Exige WorkArea, TurnOnVehicle et FruitExtraObjects. |
| `Mower.registerFunctions(vehicleType: any)` | 65 | ✍ Enregistre processMowerArea, processDropArea, getDropArea, setDropEffectEnabled, setCutSoundEnabled et setUseMowerWindrowDropAreas. |
| `Mower.registerOverwrittenFunctions(vehicleType: any)` | 76 | ✍ Surcharge doCheckSpeedLimit, getCanBeSelected, getDirtMultiplier, getWearMultiplier, getFruitExtraObjectTypeData et loadWorkAreaFromXML (liste non relue ligne à ligne). |
| `Mower.registerEventListeners(vehicleType: any)` | 87 | ✍ S'abonne à onLoad, onPostLoad, onDelete, aux quatre événements de flux, onUpdate, onRegisterActionEvents, onTurnedOn/Off, onStart/EndWorkAreaProcessing et onAIFieldCourseSettingsInitialized (liste non relue ligne à ligne). |
| `Mower:onLoad(savegame: table)` | 108 | ✍ Charge animations et sons, effets de dépôt (valide les indices de zone et de dépôt, fenêtre 750 ms) et effets de coupe, le convertisseur de cultures, l'unité de remplissage, l'état de la bascule d'andain, les paramètres de passe et les exigences IA ; retire onUpdate s'il n'y a pas d'effet de coupe. |
| `Mower:onPostLoad(savegame: table)` | 239 | ✍ Mémorise les zones MOWER et attache à chacune ses dropEffects. |
| `Mower:onDelete()` | 255 | ✍ Libère animations, sons, effets de dépôt et de coupe. |
| `Mower:onReadStream(streamId: integer, connection: Connection)` | 279 | ✍ Lit l'état de l'option d'andain à la connexion (si textes de bascule définis). |
| `Mower:onWriteStream(streamId: integer, connection: Connection)` | 291 | ✍ Écrit l'option d'andain. |
| `Mower:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 303 | ✍ Côté client : lit types et états des dropEffects (ou isCutting), puis l'état des effets de coupe (stade, culture) et coupe les effets si effectsAreRunning est faux ; réinstalle les zones de test de la culture reçue. |
| `Mower:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 348 | ✍ Côté serveur : écrit types et états des dropEffects (dirtyFlag) et l'état des effets de coupe (effectDirtyFlag : actif, stade sur 4 bits, culture). |
| `Mower:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 378 | ✍ Pilote les effets de coupe (voir module) : actif seulement si allumé et vitesse > 0.5 ; calcule la largeur coupée depuis la zone de test n°1, détermine culture et stade (serveur) ou les relit (client), appelle setEffectTypeInfo, setMinMaxWidth et startEffects, ou les arrête et lève le drapeau réseau. |
| `Mower:processMowerArea(workArea: any, dt: any)` | 453 | ✍ Pour chaque culture convertible, appelle updateMowerArea (surface changée, facteurs de rendement, stade) ; convertit en litres, les ajoute à la zone de dépôt (jusqu'à 1000 l) ou, sans dépôt, directement à l'unité de remplissage (serveur) ; pour l'herbe fraîche, aspire l'andain de foin sec existant ; mémorise culture, stade et heure de coupe, règle la zone de test. Met isWorking si vitesse > 1 et lit la présence de pierres. |
| `Mower:processDropArea(dropArea: any, dt: any)` | 535 | ✍ Dépose les litres accumulés d'une zone de dépôt sur une ligne choisie au hasard entre ses bords, si le seuil minimal de la carte de hauteur est dépassé ; mémorise lastDropTime et décalage de ligne. |
| `Mower:getDropArea(workArea: any)` | 569 | ✍ Renvoie la zone auxiliaire (type AUXILIARY) de dépôt liée à une zone de coupe, ou nil si le dépôt d'andain est désactivé ou l'indice invalide (avec avertissement). |
| `Mower:setDropEffectEnabled(dropEffect: table, isActive: boolean)` | 595 | ✍ Mémorise l'état actif d'un effet de dépôt et, côté client, applique le type de remplissage puis le démarre ou l'arrête. |
| `Mower:setCutSoundEnabled(isActive: boolean)` | 610 | ✍ Client : lance ou arrête les sons de coupe. |
| `Mower:setUseMowerWindrowDropAreas(useMowerWindrowDropAreas: boolean, noEventSend: boolean)` | 635 | ✍ Active/désactive le dépôt d'andain : envoie l'événement réseau, mémorise l'option et joue l'animation de bascule. |
| `Mower:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: XMLFile, key: string) → boolean` | 657 | ✍ Force le type MOWER si DEFAULT ; pour MOWER lit dropWindrow (vrai) et dropAreaIndex (1) ; pour AUXILIARY enregistre la zone comme zone de dépôt avec litres à déposer à zéro. |
| `Mower:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 685 | ✍ Enregistre, si les textes sont définis, l'action de bascule du dépôt d'andain (IMPLEMENT_EXTRA3). |
| `Mower:doCheckSpeedLimit(superFunc: any) → boolean` | 703 | ✍ Applique la limite de vitesse si l'outil est allumé et abaissé (ou sans notion d'abaissement). |
| `Mower:getCanBeSelected(superFunc: any)` | 709 | ✍ Renvoie vrai : l'outil est sélectionnable. |
| `Mower:getDirtMultiplier(superFunc: any)` | 715 | ✍ Ajoute la salissure de travail pondérée vitesse/limite quand isWorking. |
| `Mower:getWearMultiplier(superFunc: any)` | 729 | ✍ Ajoute l'usure de travail pondérée vitesse/limite et par le multiplicateur de pierres. |
| `Mower:getFruitExtraObjectTypeData(superFunc: any)` | 748 | ✍ Renvoie la dernière culture coupée pour les objets supplémentaires (FruitExtraObjects). |
| `Mower:onTurnedOn()` | 755 | ✍ Client : démarre les animationNodes. |
| `Mower:onTurnedOff()` | 765 | ✍ Client : coupe les effets de dépôt et arrête les animations ; dans tous les cas coupe les effets de coupe et remet effectsAreRunning à faux. |
| `Mower:onStartWorkAreaProcessing(dt: any)` | 782 | ✍ Serveur : diffuse et applique les changements d'état des dropEffects puis les remet à inactif ; remet à zéro litres ramassés par zone, surfaces et isWorking. |
| `Mower:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 813 | ✍ Dépose les litres (processDropArea sur chaque zone de dépôt), arme les dropEffects selon pickedUpLiters (minuteur 750 ms en dt) ; serveur : statistiques (threshedHectares), état isCutting avec drapeau et son de coupe ; recalcule toutes les 500 ms le pourcentage d'utilisation des zones. |
| `Mower:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 871 | ✍ Paramètres de parcours IA : bordures d'abord, segment initial travaillé, découpe de coins autorisée. |
| `Mower:getMowerLoadPercentage()` | 879 | ✍ Renvoie la part de zones ayant coupé durant la dernière fenêtre de 500 ms (0 sans spécialisation). |
| `Mower.getDefaultSpeedLimit() → number` | 891 | ✍ Limite de vitesse par défaut : 20. |
| `Mower.actionEventToggleDrop(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 897 | ✍ Callback d'entrée : bascule le dépôt d'andain. |
| `Mower.updateActionEventToggleDrop(self: any)` | 904 | ✍ Met à jour le texte de l'action selon l'état du dépôt d'andain. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `processMowerArea` | 66 |
| registerFunction | `processDropArea` | 67 |
| registerFunction | `getDropArea` | 68 |
| registerFunction | `setDropEffectEnabled` | 69 |
| registerFunction | `setCutSoundEnabled` | 70 |
| registerFunction | `setUseMowerWindrowDropAreas` | 71 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 77 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 78 |
| registerOverwrittenFunction | `getCanBeSelected` | 79 |
| registerOverwrittenFunction | `getDirtMultiplier` | 80 |
| registerOverwrittenFunction | `getWearMultiplier` | 81 |
| registerOverwrittenFunction | `getFruitExtraObjectTypeData` | 82 |
| registerEventListener | `onLoad` | 88 |
| registerEventListener | `onPostLoad` | 89 |
| registerEventListener | `onDelete` | 90 |
| registerEventListener | `onReadStream` | 91 |
| registerEventListener | `onWriteStream` | 92 |
| registerEventListener | `onReadUpdateStream` | 93 |
| registerEventListener | `onWriteUpdateStream` | 94 |
| registerEventListener | `onUpdate` | 95 |
| registerEventListener | `onRegisterActionEvents` | 96 |
| registerEventListener | `onTurnedOn` | 97 |
| registerEventListener | `onTurnedOff` | 98 |
| registerEventListener | `onStartWorkAreaProcessing` | 99 |
| registerEventListener | `onEndWorkAreaProcessing` | 100 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 101 |
