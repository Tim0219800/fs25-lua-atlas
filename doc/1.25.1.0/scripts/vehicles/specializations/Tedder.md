# vehicles/specializations/Tedder.lua

Source: `dataS/scripts/vehicles/specializations/Tedder.lua` — FS25 1.25.1.0

✍ Spécialisation des faneuses : ramasse l'andain/le fourrage sous la zone de travail (carte de hauteur, DensityMapHeightUtil) et le redépose étalé dans une zone de dépôt, en convertissant le type de remplissage (fillTypeConverter : par ex. herbe vers foin sec, noms non relus). Prérequis : WorkArea et TurnOnVehicle. EFFETS (client) : animationNodes (vehicle.tedder.animationNodes, démarrés à l'allumage, arrêtés à l'extinction) et une liste d'effets vehicle.tedder.effects.effect(?) chargés par g_effectManager:loadEffect, chacun lié à une zone par workAreaIndex, fenêtre d'activité de 250 ms. Classes d'effets absentes du dump : rendu NON VÉRIFIÉ. DÉCLENCHEMENT (serveur) : dans processTedderArea, si des litres ont été effectivement redéposés (dropped > 0) et que la vitesse (getLastSpeed(true)) est > 0.5, les effets de la zone sont armés (activeTime = temps + 250 ms), démarrés au besoin et recalés sur le type de remplissage déposé (setEffectTypeInfo au démarrage ou quand le type change). La densité d'effet est réglée à max(vitesse / limite de vitesse, 0.6) sur l'hôte-joueur (g_effectManager:setDensity) ; sur un client distant, le flux réseau ne transporte que le type et l'état actif : la densité n'est pas réglée (onReadUpdateStream applique setEffectTypeInfo et startEffects, puis gère les sons), donc l'effet y tourne à la densité par défaut de la définition XML (NON VÉRIFIÉ : comportement de EffectManager absent). Autrement dit, la poussière/le fourrage projeté ne part que si de la matière est réellement ramassée ET redéposée, pas à vide. Les effets reçoivent donc le type de remplissage converti (cible), jamais de stade de culture. ARRÊT : onUpdateTick (serveur seulement, l'abonnement est retiré sinon) coupe les effets expirés et lève effectDirtyFlag. MÉTÉO/HUMIDITÉ : aucune donnée lue. RÉSEAU : tableau des types de remplissage par zone (fillTypesDirtyFlag, SEND_NUM_BITS) et booléen d'effet actif par effet (effectDirtyFlag) ; le client applique type + démarrage/arrêt à la réception ; le client ne recalcule pas l'effet. CONDITIONS : active selon le type de zone TEDDER (aucun test d'allumage dans getIsWorkAreaActive : non surchargé ici, la logique d'activation vient d'ailleurs, NON VÉRIFIÉ) ; doCheckSpeedLimit s'applique si allumé et chaîne d'outils abaissée. isWorking = litres déposés dans la passe > 0 (onEndWorkAreaProcessing). Ramassage : tipToGroundAroundLine avec -infini sur chaque type d'entrée ; traitement sauté pour un client éloigné (> Tedder.CLIENT_DM_UPDATE_RADIUS, constante non définie ici, NON VÉRIFIÉ). dt : fenêtres de 250 ms en temps de jeu (g_currentMission.time). À noter : onPostLoad, pour un workAreaIndex invalide, appelle table.insert(spec.effects, i) au lieu de table.remove (Tedder.lua:166), ce qui semble une faute (non vérifié en jeu). La table tedderWorkAreaFillTypes est initialisée avec FruitType.UNKNOWN alors qu'elle contient des types de remplissage. POINTS D'EXTENSION : fonctions registerFunctions (preprocessTedderArea, processTedderArea, processDropArea) ; surcharges loadWorkAreaFromXML (ajoute dropWindrowWorkAreaIndex et les champs d'effet de zone), getDirtMultiplier, getWearMultiplier, doCheckSpeedLimit ; événements onLoad, onPostLoad, flux, onUpdateTick, onTurnedOn/Off, onStart/EndWorkAreaProcessing, onDeactivate. Vitesse limite par défaut : 15.

- **Tedder** (l.12)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Tedder.initSpecialization()` | 18 | ✍ Déclare le type de zone tedder et le schéma XML : effets (vehicle.tedder.effects.effect(?)), animationNodes, converter de types, sons. Non relu clé par clé. |
| `Tedder.prerequisitesPresent(specializations: any)` | 40 | ✍ Exige WorkArea et TurnOnVehicle. |
| `Tedder.registerFunctions(vehicleType: any)` | 46 | ✍ Enregistre preprocessTedderArea, processTedderArea et processDropArea. |
| `Tedder.registerOverwrittenFunctions(vehicleType: any)` | 54 | ✍ Surcharge loadWorkAreaFromXML, getDirtMultiplier, getWearMultiplier et doCheckSpeedLimit (liste non relue ligne à ligne). |
| `Tedder.registerEventListeners(vehicleType: any)` | 63 | ✍ S'abonne à onLoad, onPostLoad, onDelete, aux quatre événements de flux, onUpdateTick, onStart/EndWorkAreaProcessing, onTurnedOn/Off, onAIFieldCourseSettingsInitialized et onDeactivate (liste non relue ligne à ligne). |
| `Tedder:onLoad(savegame: any)` | 82 | ✍ Charge le convertisseur de types (avertit s'il manque), les animations et effets (client), initialise litres déposés, multiplicateur d'usure de pierres (type TEDDER) et drapeaux réseau ; déclare à l'IA l'exigence d'un andain d'herbe. |
| `Tedder:onPostLoad(savegame: any)` | 152 | ✍ Rattache chaque effet à sa zone (workAreaToEffects) et à l'indice de type de remplissage de la zone ; retire l'abonnement onUpdateTick hors serveur. À noter : insertion au lieu de suppression pour un indice invalide. |
| `Tedder:onDelete()` | 177 | ✍ Libère les effets et les animations. |
| `Tedder:onReadStream(streamId: any, connection: any)` | 199 | ✍ Lit les types de remplissage par zone puis l'état de chaque effet, et démarre/arrête les effets avec le type de la zone. |
| `Tedder:onWriteStream(streamId: any, connection: any)` | 218 | ✍ Écrit les types de remplissage par zone puis l'état envoyé de chaque effet. |
| `Tedder:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 230 | ✍ Côté client : lit si présents les types par zone et l'état de chaque effet, applique type et démarrage/arrêt puis pilote les sons de travail ; ne règle pas la densité. |
| `Tedder:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 272 | ✍ Côté serveur : écrit types (fillTypesDirtyFlag) et états d'effets (effectDirtyFlag). |
| `Tedder:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 292 | ✍ Serveur : coupe les effets dont la fenêtre de 250 ms a expiré, met à jour isActiveSent et les drapeaux ; sur l'hôte-joueur, appelle stopEffects. |
| `Tedder:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 323 | ✍ Force le type TEDDER si DEFAULT ; pour une zone TEDDER, lit la zone de dépôt (dropWindrowWorkAreaIndex) et initialise litres à déposer, type du dernier dépôt et drapeaux de particules, et réserve un emplacement dans tedderWorkAreaFillTypes. |
| `Tedder:getDirtMultiplier(superFunc: any)` | 352 | ✍ Ajoute la salissure de travail pondérée vitesse/limite quand isWorking. |
| `Tedder:getWearMultiplier(superFunc: any)` | 366 | ✍ Ajoute l'usure de travail pondérée vitesse/limite et par le multiplicateur de pierres. |
| `Tedder:doCheckSpeedLimit(superFunc: any)` | 385 | ✍ Applique la limite de vitesse si l'outil est allumé et la chaîne d'outils abaissée. |
| `Tedder:preprocessTedderArea(workArea: any)` | 391 | ✍ Remet à zéro litres ramassés et déposés de la zone avant le traitement. |
| `Tedder:processTedderArea(workArea: any, dt: any)` | 398 | ✍ Ramasse sur la ligne de la zone chaque type d'entrée du convertisseur, ajoute les litres à déposer, les redépose via processDropArea et, côté serveur à vitesse > 0.5, met à jour type par zone, arme et démarre les effets (avec densité). Lit aussi la présence de pierres si l'outil roule. Renvoie la surface (largeur de ligne * distance parcourue) deux fois. |
| `Tedder:processDropArea(dropArea: any, fillType: any, litersToDrop: any)` | 501 | ✍ Dépose les litres convertis sur la ligne de la zone de dépôt (tipToGroundAroundLine) et mémorise le décalage de ligne ; renvoie les litres réellement déposés (0, 0 pour un client éloigné : valeur de retour non homogène). |
| `Tedder:onStartWorkAreaProcessing(dt: any)` | 515 | ✍ Remet à zéro spec.lastDroppedLiters avant la passe. |
| `Tedder:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 523 | ✍ isWorking devient vrai si des litres ont été déposés pendant la passe. |
| `Tedder:onTurnedOn()` | 532 | ✍ Client : démarre les animationNodes. |
| `Tedder:onTurnedOff()` | 542 | ✍ Client : arrête les animations et coupe tous les effets. |
| `Tedder:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 554 | ✍ Paramètres de parcours IA : bordures d'abord, segment initial travaillé. |
| `Tedder:onDeactivate()` | 561 | ✍ Client : coupe tous les effets. |
| `Tedder.getDefaultSpeedLimit()` | 572 | ✍ Limite de vitesse par défaut : 15. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `preprocessTedderArea` | 47 |
| registerFunction | `processTedderArea` | 48 |
| registerFunction | `processDropArea` | 49 |
| registerOverwrittenFunction | `getDirtMultiplier` | 55 |
| registerOverwrittenFunction | `getWearMultiplier` | 56 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 57 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 58 |
| registerEventListener | `onLoad` | 64 |
| registerEventListener | `onPostLoad` | 65 |
| registerEventListener | `onDelete` | 66 |
| registerEventListener | `onReadStream` | 67 |
| registerEventListener | `onWriteStream` | 68 |
| registerEventListener | `onReadUpdateStream` | 69 |
| registerEventListener | `onWriteUpdateStream` | 70 |
| registerEventListener | `onUpdateTick` | 71 |
| registerEventListener | `onStartWorkAreaProcessing` | 72 |
| registerEventListener | `onEndWorkAreaProcessing` | 73 |
| registerEventListener | `onDeactivate` | 74 |
| registerEventListener | `onTurnedOn` | 75 |
| registerEventListener | `onTurnedOff` | 76 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 77 |
